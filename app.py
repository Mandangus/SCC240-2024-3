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

if __name__ == '__main__':
    app.run(debug=True)
