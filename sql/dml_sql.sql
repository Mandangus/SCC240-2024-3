INSERT INTO PARTIDO (cod_partido, nome) VALUES 
(1, 'Partido A'),
(2, 'Partido B'),
(3, 'Partido C'),
(4, 'Partido D'),
(5, 'Partido E'),
(6, 'Partido F'),
(7, 'Partido G');

INSERT INTO programasDePartido (cod_partido, programa) VALUES 
(1, 'Programa do Partido A'),
(2, 'Programa do Partido B'),
(3, 'Programa do Partido C'),
(4, 'Programa do Partido D'),
(5, 'Programa do Partido E'),
(6, 'Programa do Partido F'),
(7, 'Programa do Partido G');

INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES 
(1, 'Candidato 1', 1, 'LIMPA'),
(2, 'Candidato 2', 2, 'LIMPA'),
(3, 'Candidato 3', 3, 'LIMPA'),
(4, 'Candidato 4', 4, 'LIMPA'),
(5, 'Candidato 5', 5, 'LIMPA'),
(6, 'Candidato 6', 6, 'LIMPA'),
(7, 'Candidato 7', 7, 'LIMPA');

INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES 
(1, 1000),
(2, 2000),
(3, 3000),
(4, 4000),
(5, 5000),
(6, 6000),
(7, 7000);

INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES 
(1, 1, 1, 2022, 1, NULL, FALSE),
(2, 2, 2, 2022, 2, NULL, FALSE),
(3, 3, 3, 2022, 3, NULL, FALSE),
(4, 4, 4, 2022, 4, NULL, FALSE),
(5, 5, 5, 2022, 5, NULL, FALSE),
(6, 6, 6, 2022, 6, NULL, FALSE),
(7, 7, 7, 2022, 7, NULL, FALSE);

INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES 
(1, 'Equipe 1'),
(2, 'Equipe 2'),
(3, 'Equipe 3'),
(4, 'Equipe 4'),
(5, 'Equipe 5'),
(6, 'Equipe 6'),
(7, 'Equipe 7');

INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES 
(1, 1, 'LIMPA'),
(2, 2, 'LIMPA'),
(3, 3, 'LIMPA'),
(4, 4, 'LIMPA'),
(5, 5, 'LIMPA'),
(6, 6, 'LIMPA'),
(7, 7, 'LIMPA');

INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES 
(1, 'LIMPA', 'FÍSICO'),
(2, 'LIMPA', 'FÍSICO'),
(3, 'LIMPA', 'FÍSICO'),
(4, 'LIMPA', 'JURÍDICO'),
(5, 'LIMPA', 'JURÍDICO'),
(6, 'LIMPA', 'JURÍDICO'),
(7, 'LIMPA', 'FÍSICO');

INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES 
(1, '12345678901'),
(2, '23456789012'),
(3, '34567890123'),
(7, '45678901234'); 

INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES 
(1, 1, 500.00, 1),
(2, 2, 1000.00, 1),
(3, 3, 1500.00, 1),
(4, 4, 2000.00, 1),
(5, 5, 2500.00, 1),
(6, 6, 3000.00, 1),
(7, 7, 3500.00, 1);

INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Tipo_Individuo, Data_Termino, Procedencia) VALUES 
(1, 1, 'CANDIDATO', '2023-05-01', 'PROCEDENTE'),
(2, 2, 'PARTICIPANTE EA', '2023-05-02', 'PROCEDENTE'),
(3, 3, 'DOADOR', '2023-05-03', 'IMPROCEDENTE'),
(4, 4, 'CANDIDATO', '2023-05-04', 'PROCEDENTE'),
(5, 5, 'PARTICIPANTE EA', '2023-05-05', 'IMPROCEDENTE'),
(6, 6, 'DOADOR', '2023-05-06', 'PROCEDENTE'),
(7, 7, 'CANDIDATO', '2023-05-07', 'IMPROCEDENTE');


