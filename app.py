import psycopg2
from flask import Flask, request, jsonify, render_template
from dotenv import load_dotenv
from os import getenv

app = Flask(__name__)
load_dotenv()

def get_db_connection():
    conn = psycopg2.connect(
        dbname=getenv("DB_NAME"),
        user=getenv("USER"),
        password=getenv("PSSWD"),
        host=getenv("HOST"),
        port=getenv("PORT")
    )
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/candidaturas', methods=['GET'])
def get_candidaturas():
    ano = request.args.get('ano')
    nome_candidato = request.args.get('nome_candidato')
    cargo = request.args.get('cargo')
    order_by = request.args.get('order_by', 'Ano')
    order_dir = request.args.get('order_dir', 'ASC')

    query = "SELECT Candidatura.*, Candidato.Partido, Cargo.Localidade FROM Candidatura " \
            "JOIN Candidato ON Candidatura.Cod_Candidato = Candidato.Cod_Candidato " \
            "JOIN Cargo ON Candidatura.Cod_Cargo = Cargo.Cod_Cargo"
    filters = []
    params = []

    if ano:
        filters.append("Candidatura.Ano = %s")
        params.append(ano)
    if nome_candidato:
        filters.append("Candidato.Partido ILIKE %s")
        params.append(f"%{nome_candidato}%")
    if cargo:
        filters.append("Cargo.Localidade ILIKE %s")
        params.append(f"%{cargo}%")

    if filters:
        query += " WHERE " + " AND ".join(filters)

    query += f" ORDER BY {order_by} {order_dir}"

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, tuple(params))
    candidaturas = cursor.fetchall()
    cursor.close()
    conn.close()

    result = []
    for candidatura in candidaturas:
        result.append({
            'Cod_Candidatura': candidatura[0],
            'Cod_Candidato': candidatura[1],
            'Cod_Cargo': candidatura[2],
            'Ano': candidatura[3],
            'Pleito': candidatura[4],
            'Cod_Candidatura_Vice': candidatura[5],
            'Eleito': candidatura[6],
            'Partido': candidatura[7],
            'Localidade': candidatura[8]
        })
    return render_template('candidaturas.html', candidaturas=result)

# Relatório de candidatos eleitos
@app.route('/candidaturas/eleitos', methods=['GET'])
def get_eleitos():
    query = """
    SELECT Candidatura.*, Candidato.Partido, Cargo.Localidade, Vice.Cod_Candidato AS Vice_Candidato
    FROM Candidatura
        JOIN Candidato ON Candidatura.Cod_Candidato = Candidato.Cod_Candidato
        JOIN Cargo ON Candidatura.Cod_Cargo = Cargo.Cod_Cargo
        LEFT JOIN Candidatura AS Vice ON Candidatura.Cod_Candidatura_Vice = Vice.Cod_Candidatura
    WHERE Candidatura.Eleito = TRUE
    """
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query)
    candidaturas = cursor.fetchall()
    cursor.close()
    conn.close()

    result = []
    for candidatura in candidaturas:
        result.append({
            'Cod_Candidatura': candidatura[0],
            'Cod_Candidato': candidatura[1],
            'Cod_Cargo': candidatura[2],
            'Ano': candidatura[3],
            'Pleito': candidatura[4],
            'Cod_Candidatura_Vice': candidatura[5],
            'Eleito': candidatura[6],
            'Partido': candidatura[7],
            'Localidade': candidatura[8],
            'Vice_Candidato': candidatura[9]
        })
    return render_template('eleitos.html', candidaturas=result)

@app.route('/candidatos/ficha-limpa', methods=['GET'])
def get_ficha_limpa():
    query = "SELECT * FROM Candidato WHERE Estado_Ficha = 'Limpa'"
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query)
    candidatos = cursor.fetchall()
    cursor.close()
    conn.close()

    result = []
    for candidato in candidatos:
        result.append({
            'Cod_Candidato': candidato[0],
            'Partido': candidato[1],
            'Estado_Ficha': candidato[2]
        })
    return render_template('ficha_limpa.html', candidatos=result)

# Remover entidade específica
@app.route('/delete', methods=['GET', 'POST'])
def delete_entity():
    if request.method == 'POST':
        entity = request.form['entity']
        id = request.form['id']

        table_mapping = {
            'pleito': 'Pleito',
            'candidatura': 'Candidatura',
            'candidato': 'Candidato',
            'cargo': 'Cargo',
            'equipeapoio': 'EquipeApoio',
            'participanteequipeapoio': 'ParticipanteEquipeApoio',
            'doadorescampanha': 'DoadoresCampanha',
            'processojudicial': 'ProcessoJudicial'
        }

        table = table_mapping.get(entity.lower())
        if not table:
            return jsonify({'error': 'Invalid entity'}), 400

        id_column_mapping = {
            'pleito': 'Cod_Pleito',
            'candidatura': 'Cod_Candidatura',
            'candidato': 'Cod_Candidato',
            'cargo': 'Cod_Cargo',
            'equipeapoio': 'Cod_Equipe',
            'participanteequipeapoio': 'Cod_Participante',
            'doadorescampanha': 'Cod_Doador',
            'processojudicial': 'Cod_Processo'
        }

        id_column = id_column_mapping.get(entity.lower())

        query = f"DELETE FROM {table} WHERE {id_column} = %s"
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(query, (id,))
        conn.commit()
        cursor.close()
        conn.close()

        return render_template('delete.html', message="Entity deleted successfully")
    return render_template('delete.html')

@app.route('/inserir', methods=['GET', 'POST'])
def inserir():
    if request.method == 'POST':
        entity = request.form['entity']
        conn = get_db_connection()
        cursor = conn.cursor()
        
        if entity == 'pleito':
            codigo_pleito = request.form['cod_Pleito']
            qtd_votos = request.form['qtd_votos']
            query = "INSERT INTO pleito (codigo_pleito, qtd_votos) VALUES (%s, %s)"
            cursor.execute(query, (codigo_pleito, qtd_votos))
        
        elif entity == 'candidatura':
            codigo_candidatura = request.form['codigo_candidatura']
            codigo_candidato = request.form['codigo_candidato']
            codigo_cargo = request.form['codigo_cargo']
            ano = request.form['ano']
            pleito = request.form['pleito']
            query = "INSERT INTO candidatura (codigo_candidatura, codigo_candidato, codigo_cargo, ano, pleito) VALUES (%s, %s, %s, %s, %s)"
            cursor.execute(query, (codigo_candidatura, codigo_candidato, codigo_cargo, ano, pleito))
        
        elif entity == 'candidato':
            codigo_candidato = request.form['codigo_candidato']
            nome = request.form['nome']
            partido = request.form['partido']
            estado_ficha = request.form['estado_ficha']
            query = "INSERT INTO candidato (codigo_candidato, nome, partido, estado_ficha) VALUES (%s, %s, %s, %s)"
            cursor.execute(query, (codigo_candidato, nome, partido, estado_ficha))
        
        elif entity == 'cargo':
            codigo_cargo = request.form['cod_Cargo']
            localizacao = request.form['localidade']
            qtd_eleitos = request.form['qtd_Eleitos']
            query = "INSERT INTO cargo (cod_cargo, localidade, qtd_eleitos) VALUES (%s, %s, %s)"
            cursor.execute(query, (codigo_cargo, localizacao, qtd_eleitos))
        
        elif entity == 'equipeapoio':
            codigo_equipe = request.form['codigo_equipe']
            nome = request.form['nome']
            funcao = request.form['funcao']
            query = "INSERT INTO equipeapoio (codigo_equipe, nome, funcao) VALUES (%s, %s, %s)"
            cursor.execute(query, (codigo_equipe, nome, funcao))
        
        elif entity == 'participanteequipeapoio':
            codigo_participante = request.form['codigo_participante']
            codigo_equipe = request.form['codigo_equipe']
            nome = request.form['nome']
            query = "INSERT INTO participanteequipeapoio (codigo_participante, codigo_equipe, nome) VALUES (%s, %s, %s)"
            cursor.execute(query, (codigo_participante, codigo_equipe, nome))
        
        elif entity == 'doadorescampanha':
            codigo_doador = request.form['codigo_doador']
            tipo_doador = request.form['tipo_doador']
            valor = request.form['valor']
            query = "INSERT INTO doadorescampanha (codigo_doador, tipo_doador, valor) VALUES (%s, %s, %s)"
            cursor.execute(query, (codigo_doador, tipo_doador, valor))
        
        elif entity == 'processojudicial':
            codigo_processo = request.form['codigo_processo']
            descricao = request.form['descricao']
            data_inicio = request.form['data_inicio']
            data_fim = request.form['data_fim']
            query = "INSERT INTO processojudicial (codigo_processo, descricao, data_inicio, data_fim) VALUES (%s, %s, %s, %s)"
            cursor.execute(query, (codigo_processo, descricao, data_inicio, data_fim))
        
        conn.commit()
        cursor.close()
        conn.close()
        
        message = "Dados inseridos com sucesso!"
        return render_template('inserir.html', message=message)
    
    return render_template('inserir.html')

@app.route('/doacoes', methods=['GET', 'POST'])
def doacoes():
    if request.method == 'POST':
        cod_doador = request.form['cod_doador']
        tipo_doador = request.form['tipo_doador']
        valor = request.form['valor']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        
        query = "INSERT INTO DoadoresCampanha (Cod_Doador, Tipo_Doador, Valor) VALUES (%s, %s, %s)"
        cursor.execute(query, (cod_doador, tipo_doador, valor))
        
        conn.commit()
        cursor.close()
        conn.close()
        
        message = "Doação registrada com sucesso!"
        return render_template('doacoes.html', message=message)
    
    return render_template('doacoes.html')

if __name__ == '__main__':
    app.run(debug=True)
