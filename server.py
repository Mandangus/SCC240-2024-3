import psycopg2
from flask import Flask, request, jsonify

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        dbname="Sistema_eleitoral",
        user="postgres",
        password="teste",
        host="54321",
        port="1111"
    )
    return conn

@app.route('/candidaturas', methods=['GET'])
def get_candidaturas():
    ano = request.args.get('ano')
    nome_candidato = request.args.get('nome_candidato')
    cargo = request.args.get('cargo')

    query = "SELECT * FROM Candidatura"
    filters = []
    if ano:
        filters.append(f"Ano = {ano}")
    if nome_candidato:
        filters.append(f"Cod_Candidato IN (SELECT Cod_Candidato FROM Candidato WHERE Partido ILIKE '%{nome_candidato}%')")
    if cargo:
        filters.append(f"Cod_Cargo IN (SELECT Cod_Cargo FROM Cargo WHERE Localidade ILIKE '%{cargo}%')")

    if filters:
        query += " WHERE " + " AND ".join(filters)
    
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
            'Pleito': candidatura[4]
        })
    return jsonify(result)

@app.route('/candidaturas/eleitos', methods=['GET'])
def get_eleitos():
    query = "SELECT * FROM Candidatura WHERE Eleito = TRUE"
    
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
            'Pleito': candidatura[4]
        })
    return jsonify(result)

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
    return jsonify(result)

@app.route('/<entity>/<int:id>', methods=['DELETE'])
def delete_entity(entity, id):
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
    
    query = f"DELETE FROM {table} WHERE id = %s"
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, (id,))
    conn.commit()
    cursor.close()
    conn.close()
    
    return '', 204

if __name__ == '__main__':
    app.run(debug=True)
