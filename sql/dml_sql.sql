INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES
(1, 10000),
(2, 15000);

INSERT INTO Candidato (Cod_Candidato, Partido, Estado_Ficha) VALUES
(1, 'Partido A', 'Limpa'),
(2, 'Partido B', 'Suja'),
(3, 'Partido C', 'Limpa'),
(4, 'Partido D', 'Limpa'),
(5, 'Partido E', 'Suja'),
(6, 'Partido F', 'Limpa'),
(7, 'Partido G', 'Limpa'),
(8, 'Partido H', 'Suja');

INSERT INTO Cargo (Cod_Cargo, Localidade, Qtd_Eleitos) VALUES
(1, 'Localidade A', 1),
(2, 'Localidade B', 2),
(3, 'Localidade C', 1),
(4, 'Localidade D', 3),
(5, 'Localidade E', 2);

INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Eleito) VALUES
(1, 1, 1, 2024, 1, TRUE),
(2, 2, 1, 2024, 1, FALSE),
(3, 3, 2, 2024, 2, TRUE),
(4, 4, 2, 2024, 2, FALSE),
(5, 5, 3, 2024, 2, FALSE),
(6, 6, 3, 2024, 1, TRUE),
(7, 7, 4, 2024, 1, FALSE),
(8, 8, 5, 2024, 2, TRUE);

INSERT INTO EquipeApoio (Cod_Equipe) VALUES
(1),
(2),
(3),
(4),
(5);

INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Ano, Estado_Ficha) VALUES
(1, 1, 2024, 'Limpa'),
(2, 1, 2024, 'Limpa'),
(3, 2, 2024, 'Suja'),
(4, 2, 2024, 'Limpa'),
(5, 3, 2024, 'Suja'),
(6, 4, 2024, 'Limpa'),
(7, 4, 2024, 'Limpa'),
(8, 5, 2024, 'Suja');

INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES
(1, 'Limpa', 'Físico'),
(2, 'Limpa', 'Jurídico'),
(3, 'Suja', 'Físico'),
(4, 'Limpa', 'Jurídico'),
(5, 'Limpa', 'Físico'),
(6, 'Suja', 'Jurídico'),
(7, 'Limpa', 'Físico'),
(8, 'Limpa', 'Jurídico');

INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES
(1, 1, '2023-05-20', 'Procedente'),
(2, 2, '2023-05-21', 'Improcedente'),
(3, 3, '2023-05-22', 'Procedente'),
(4, 4, '2023-05-23', 'Improcedente'),
(5, 5, '2023-05-24', 'Procedente'),
(6, 6, '2023-05-25', 'Improcedente'),
(7, 7, '2023-05-26', 'Procedente'),
(8, 8, '2023-05-27', 'Improcedente');

INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES
(1, '12345678901'),
(3, '12345678902'),
(5, '12345678903'),
(7, '12345678904');

INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES
(2, '12345678000190'),
(4, '12345678000290'),
(6, '12345678000390'),
(8, '12345678000490');
