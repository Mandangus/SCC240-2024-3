import psycopg2
from psycopg2 import sql, Error
from flask import Flask, request, jsonify, render_template
from dotenv import load_dotenv
from os import getenv

app = Flask(__name__)
load_dotenv()

# Função para conexão ao banco de dados
def get_db_connection():
    try:
        conn = psycopg2.connect(
            dbname=getenv("DB_NAME"),
            user=getenv("USER"),
            password=getenv("PSSWD"),
            host=getenv("HOST"),
            port=getenv("PORT")
        )
        return conn
    except Error as e:
        print(f"Error connecting to the database: {e}")
        return None

# Rota principal
@app.route('/')
def index():
    return render_template('index.html')

# Rota para obter candidatos eleitos
@app.route('/candidaturas/eleitos', methods=['GET'])
def get_eleitos():
    query = """
    SELECT Candidatura.*, Partido.Nome AS Partido, Cargo.Localidade, Vice.Cod_Candidato AS Vice_Candidato
    FROM Candidatura
        JOIN Individuo ON Candidatura.Cod_Candidato = Individuo.CPF
        JOIN Partido ON Candidatura.Cod_Partido = Partido.Cod_Partido
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
            'Cod_Pleito': candidatura[4],
            'Cod_Candidatura_Vice': candidatura[5],
            'Eleito': candidatura[6],
            'Partido': candidatura[7],
            'Localidade': candidatura[8],
            'Vice_Candidato': candidatura[9]
        })
    return render_template('eleitos.html', candidaturas=result)

# Rota para obter candidaturas com filtros
@app.route('/candidaturas', methods=['GET'])
def get_candidaturas():
    ano = request.args.get('ano')
    nome_candidato = request.args.get('nome_candidato')
    cargo = request.args.get('cargo')
    order_by = request.args.get('order_by', 'Ano')
    order_dir = request.args.get('order_dir', 'ASC')

    query = """
    SELECT Candidatura.*, Partido.Nome AS Partido, Cargo.Localidade 
    FROM Candidatura 
    JOIN Individuo ON Candidatura.Cod_Candidato = Individuo.CPF 
    JOIN Partido ON Candidatura.Cod_Partido = Partido.Cod_Partido 
    JOIN Cargo ON Candidatura.Cod_Cargo = Cargo.Cod_Cargo
    """
    filters = []
    params = []

    if ano:
        filters.append("Candidatura.Ano = %s")
        params.append(ano)
    if nome_candidato:
        filters.append("Individuo.Nome ILIKE %s")
        params.append(f"%{nome_candidato}%")
    if cargo:
        filters.append("Cargo.Localidade ILIKE %s")
        params.append(f"%{cargo}%")

    if filters:
        query += " WHERE " + " AND ".join(filters)

    query += f" ORDER BY {order_by} {order_dir}"

    conn = get_db_connection()
    if conn is None:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        cursor = conn.cursor()
        cursor.execute(query, tuple(params))
        candidaturas = cursor.fetchall()
        cursor.close()
        conn.close()
    except Error as e:
        if conn:
            conn.close()
        return jsonify({'error': str(e)}), 500

    result = []
    for candidatura in candidaturas:
        result.append({
            'Cod_Candidatura': candidatura[0],
            'Cod_Candidato': candidatura[1],
            'Cod_Cargo': candidatura[2],
            'Ano': candidatura[3],
            'Cod_Pleito': candidatura[4],
            'Cod_Candidatura_Vice': candidatura[5],
            'Eleito': candidatura[6],
            'Partido': candidatura[7],
            'Localidade': candidatura[8]
        })
    return render_template('candidaturas.html', candidaturas=result)

# Rota para obter candidatos com ficha limpa
@app.route('/candidatos/ficha-limpa', methods=['GET'])
def get_ficha_limpa():
    query = "SELECT * FROM Individuo WHERE Ficha_Limpa = TRUE"
    
    conn = get_db_connection()
    if conn is None:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        cursor = conn.cursor()
        cursor.execute(query)
        candidatos = cursor.fetchall()
        cursor.close()
        conn.close()
    except Error as e:
        if conn:
            conn.close()
        return jsonify({'error': str(e)}), 500

    result = []
    for candidato in candidatos:
        result.append({
            'CPF': candidato[0],
            'Nome': candidato[1],
            'Ficha_Limpa': candidato[2]
        })
    return render_template('ficha_limpa.html', candidatos=result)

# Rota para excluir uma entidade
@app.route('/delete', methods=['GET', 'POST'])
def delete_entity():
    if request.method == 'POST':
        entity = request.form['entity']
        id = request.form['id']

        table_mapping = {
            'pleito': 'pleito',
            'candidatura': 'candidatura',
            'cargo': 'cargo',
            'individuo': 'individuo',
            'equipeapoio': 'equipeapoio',
            'doadoresf': 'doacaopf',
            'doadoresj': 'doadorpj',
            'processojudicial': 'processojudicial'
        }

        id_column_mapping = {
            'pleito': 'cod_pleito',
            'candidatura': 'cod_candidatura',
            'individuo': 'cpf',
            'cargo': 'cod_cargo',
            'equipeapoio': 'cod_equipe',
            'doadoresf': 'cod_nota',
            'doadoresj': 'cod_candidatura',  # Alterado para corresponder à tabela DoadorPJ
            'processojudicial': 'cod_processo'
        }

        id_column = id_column_mapping.get(entity.lower())
        table = table_mapping.get(entity.lower())
        query = sql.SQL("DELETE FROM {table} WHERE {id_column} = %s").format(
            table=sql.Identifier(table),
            id_column=sql.Identifier(id_column)
        )
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(query, (id,))
        conn.commit()
        cursor.close()
        conn.close()

        message = f"{entity.capitalize()} com ID {id} removido com sucesso."

        return render_template('delete.html', message=message)

    return render_template('delete.html')

# Rota para inserir dados
@app.route('/inserir', methods=['GET', 'POST'])
def inserir():
    if request.method == 'POST':
        entity = request.form['entity']
        conn = get_db_connection()

        cursor = conn.cursor()
        
        if entity == 'pleito':
            cod_pleito = request.form['Cod_Pleito']
            qtd_votos = request.form['qtdVotos']
            query = "INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (%s, %s)"
            cursor.execute(query, (cod_pleito, qtd_votos))

        elif entity == 'partido':
            cod_partido = request.form['cod_partido']
            nome = request.form['nome']
            cod_programa = request.form['cod_programa']
            query = "INSERT INTO Partido (Cod_Partido, Nome, Cod_Programa) VALUES (%s, %s, %s)"
            cursor.execute(query, (cod_partido, nome, cod_programa))
        
        elif entity == 'programapartido':
            cod_programa = request.form['cod_programapartido']
            descricao = request.form['descricao']
            query = "INSERT INTO ProgramaPartido (Cod_Programa, Descricao) VALUES (%s, %s)"
            cursor.execute(query, (cod_programa, descricao))
        
        elif entity == 'candidatura':
            codigo_candidatura = request.form['cod_candidatura']
            codigo_candidato = request.form['cod_individuo']
            codigo_cargo = request.form['cod_cargo']
            cod_partido = request.form['cod_Partido']
            ano = request.form['ano']
            cod_pleito = request.form['pleito']
            cod_candidatura_vice = request.form['cod_candidatura_vice']
            eleito = request.form.get('eleito', 'FALSE')
            total_doacoes = request.form.get('total_doacoes', 0)
            
            query = """
                INSERT INTO Candidatura 
                (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Cod_Partido, Ano, Cod_Pleito, Cod_Candidatura_Vice, Eleito, Total_Doacoes) 
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (codigo_candidatura, codigo_candidato, codigo_cargo, cod_partido, ano, cod_pleito, cod_candidatura_vice, eleito, total_doacoes))
        
        elif entity == 'individuo':
            cpf = request.form['cpf']
            nome = request.form['nome_ind']
            ficha_limpa = request.form.get('ficha_limpa', 'TRUE')
            cod_equipe = request.form['partido']
            query = "INSERT INTO Individuo (CPF, Nome, Ficha_Limpa, Cod_Equipe) VALUES (%s, %s, %s, %s)"
            cursor.execute(query, (cpf, nome, ficha_limpa, cod_equipe))
        
        elif  entity == 'cargo':
            codigo_cargo = request.form['cod_Cargo']
            descricao = request.form['descricao']
            localidade = request.form['localidade']
            qtd_eleitos = request.form['qtd_Eleitos']
            pais = request.form['pais']
            estado = request.form.get('estado', None)
            cidade = request.form.get('cidade', None)
            
            query = """
                INSERT INTO Cargo (Cod_Cargo, Descricao, Localidade, Qtd_Eleitos, Pais, Estado, Cidade) 
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (codigo_cargo, descricao, localidade, qtd_eleitos, pais, estado, cidade))
                
        elif entity == 'equipeapoio':
            cod_equipe = request.form['cod_equipe']
            nome_equipe = request.form['nomeEquipe']
            query = "INSERT INTO EquipeApoio (Cod_Equipe, Nome) VALUES (%s, %s)"
            cursor.execute(query, (cod_equipe, nome_equipe))

        elif entity == 'processojudicial':
            codigo_processo = request.form['codigo_processo']
            codigo_individuo = request.form['codigo_individuo']
            data_inicio = request.form['data_Inicio']
            julgado = request.form.get('julgado', 'FALSE')
            data_termino = request.form['data_termino'] if 'data_termino' in request.form else None
            procedente = request.form.get('procedente', 'FALSE')
            
            query = """
                INSERT INTO ProcessoJudicial 
                (Cod_Processo, Cod_Individuo, Data_Inicio, Julgado, Data_Termino, Procedente) 
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (codigo_processo, codigo_individuo, data_inicio, julgado, data_termino, procedente))

        conn.commit()
        cursor.close()
        conn.close()
        
        message = "Dados inseridos com sucesso!"
        return render_template('inserir.html', message=message)
    
    return render_template('inserir.html')

@app.route('/doacoes', methods=['GET', 'POST'])
def doacoes():
    message = ""
    if request.method == 'POST':
        conn = get_db_connection()
        cursor = conn.cursor()
        doador_tipo = request.form['doador_tipo']
        
        try:
            if doador_tipo == "Físico":
                nf_doacao = request.form['nota_doacao']
                cod_doador = request.form['cod_doador_pf']
                valor = request.form['valor_pf']
                data_doacao = request.form['data_doacao_pf']
                query_check = "SELECT 1 FROM DoacaoPF WHERE Cod_Nota = %s"
                cursor.execute(query_check, (nf_doacao,))
                exists = cursor.fetchone()
                
                if exists:
                    # Atualiza apenas a tabela Candidatura se a nota já existir
                    query_update_candidatura = """
                        UPDATE Candidatura
                        SET Total_Doacoes = Total_Doacoes + %s
                        WHERE Cod_Candidatura = (
                            SELECT Cod_Candidatura FROM Candidatura WHERE Cod_Candidato = %s
                        )
                    """
                    cursor.execute(query_update_candidatura, (valor, cod_doador))
                else:
                    # Atualiza a tabela Candidatura e permite a inserção na tabela DoacaoPF se a nota não existir
                    query_update_candidatura = """
                        UPDATE Candidatura
                        SET Total_Doacoes = Total_Doacoes + %s
                        WHERE Cod_Candidatura = (
                            SELECT Cod_Candidatura FROM Candidatura WHERE Cod_Candidato = %s
                        )
                    """
                    cursor.execute(query_update_candidatura, (valor, cod_doador))

                    # Inserção na tabela DoacaoPF
                    query_insert_doacaopf = """
                        INSERT INTO DoacaoPF (Cod_Nota, Cod_Individuo, Valor, data_doacao)
                        VALUES (%s, %s, %s, %s)
                    """
                    cursor.execute(query_insert_doacaopf, (nf_doacao, cod_doador, valor, data_doacao))
                
                conn.commit()
                message = "Dados inseridos com sucesso!"
            elif doador_tipo == "Jurídico":
                cod_doador = request.form['cod_doador_pj']
                cod_candidatura = request.form['cod_candidatura_pj']
                valor = request.form['valor_pj']
                data_doacao = request.form['data_doacao_pj']
                query = "INSERT INTO DoadorPJ (Cod_Empresa, Cod_Candidatura, Valor, data_doacao) VALUES (%s, %s, %s, %s)"
                cursor.execute(query, (cod_doador, cod_candidatura, valor, data_doacao))
            else:
                raise ValueError("Tipo de doador inválido.")
            
            conn.commit()
            message = "Dados inseridos com sucesso!"
        except Exception as e:
            conn.rollback()
            message = f"Erro ao registrar doação: {e}"
        finally:
            cursor.close()
            conn.close()
    
        return render_template('doacoes.html', message=message)

    return render_template('doacoes.html')

if __name__ == '__main__':
    app.run(debug=True)