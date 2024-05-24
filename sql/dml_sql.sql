INSERT INTO PARTIDO (cod_partido, nome) VALUES
(1, 'Partido do Futuro'),
(2, 'Partido da Justiça'),
(3, 'Partido Verde'),
(4, 'Partido Trabalhista'),
(5, 'Partido Social'),
(6, 'Partido Liberal');

INSERT INTO programasDePartido (cod_partido, programa) VALUES
(1, 'Programa de educação para todos'),
(2, 'Programa de combate à corrupção'),
(3, 'Programa de preservação ambiental'),
(4, 'Programa de direitos trabalhistas'),
(5, 'Programa de inclusão social'),
(6, 'Programa de economia de mercado');

INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES
(1, 5000),
(2, 7500),
(3, 10000),
(4, 15000),
(5, 20000),
(6, 25000);

INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES
(1, 'João Silva', 1, 'Apto'),
(2, 'Maria Souza', 2, 'Apto'),
(3, 'Pedro Costa', 3, 'Inapto'),
(4, 'Ana Lima', 4, 'Apto'),
(5, 'Carlos Mendes', 5, 'Apto'),
(6, 'Lucas Araújo', 6, 'Apto');

INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES
(1, 'Vereador', 'São Paulo', 5),
(2, 'Ministro', 'Rio de Janeiro', 3),
(3, 'Deputado', 'Minas Gerais', 4),
(4, 'Prefeito', 'Bahia', 2),
(5, 'Vice Prefeito', 'Paraná', 3),
(6, 'Suplente', 'Rio Grande do Sul', 1);

INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES
(1, 1, 1, 2020, 1, NULL, TRUE),
(2, 2, 2, 2020, 2, NULL, FALSE),
(3, 3, 3, 2018, 3, NULL, TRUE),
(4, 4, 4, 2018, 4, NULL, FALSE),
(5, 5, 5, 2016, 5, NULL, TRUE),
(6, 6, 6, 2016, 6, NULL, FALSE);

INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES
(1, 'Equipe A'),
(2, 'Equipe B'),
(3, 'Equipe C'),
(4, 'Equipe D'),
(5, 'Equipe E'),
(6, 'Equipe F');

INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Ano, Estado_Ficha) VALUES
(1, 1, 2020, 'Limpa'),
(2, 2, 2019, 'Limpa'),
(3, 3, 2018, 'Suja'),
(4, 4, 2017, 'Limpa'),
(5, 5, 2016, 'Limpa'),
(6, 6, 2015, 'Suja');

INSERT INTO DoadoresCampanha (Cod_Doador, valor, Estado_Ficha, Tipo_Doador) VALUES
(1, 1000.00, 'Limpa', 'FÍSICO'),
(2, 2000.00, 'Limpa', 'JURÍDICO'),
(3, 3000.00, 'Suja', 'FÍSICO'),
(4, 4000.00, 'Limpa', 'JURÍDICO'),
(5, 5000.00, 'Limpa', 'FÍSICO'),
(6, 6000.00, 'Suja', 'JURÍDICO');

INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES
(1, 1, '2021-05-20', 'Procedente'),
(2, 2, '2020-08-15', 'Improcedente'),
(3, 3, '2019-11-30', 'Procedente'),
(4, 4, '2018-04-25', 'Improcedente'),
(5, 5, '2017-07-10', 'Procedente'),
(6, 6, '2016-03-05', 'Improcedente');

INSERT INTO DoadorFisico (Cod_Doador, CPF, quantDoacoes) VALUES
(1, '12345678901',1),
(3, '23456789012',1),
(5, '34567890123',1);

INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES
(2, '12345678000101'),
(4, '23456789000102'),
(6, '34567890000103');
