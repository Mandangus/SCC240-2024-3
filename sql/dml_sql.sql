<<<<<<< HEAD
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES
(1, 100),
(2, 200),
(3, 150),
(4, 180),
(5, 120),
(6, 220);

-- Inserções para a tabela EquipeApoio
INSERT INTO EquipeApoio (Cod_Equipe, Nome) VALUES
(1, 'Equipe 1'),
(2, 'Equipe 2'),
(3, 'Equipe 3'),
(4, 'Equipe 4'),
(5, 'Equipe 5'),
(6, 'Equipe 6');

-- Inserções para a tabela Individuo
INSERT INTO Individuo (CPF, Nome, Ficha_Limpa, Cod_Equipe) VALUES
(11111111111, 'Individuo 1', TRUE, 1),
(22222222222, 'Individuo 2', TRUE, 2),
(33333333333, 'Individuo 3', TRUE, 3),
(44444444444, 'Individuo 4', TRUE, 4),
(55555555555, 'Individuo 5', TRUE, 5),
(66666666666, 'Individuo 6', TRUE, 6);

-- Inserções para a tabela Cargo
INSERT INTO Cargo (Cod_Cargo, Descricao, Localidade, Qtd_Eleitos, Pais, Estado, Cidade) VALUES
(1, 'Cargo 1', 'MUNICIPAL', 1, 'BRASIL', 'Estado 1', 'Cidade 1'),
(2, 'Cargo 2', 'ESTADUAL', 1, 'BRASIL', 'Estado 2', NULL),
(3, 'Cargo 3', 'FEDERAL', 1, 'BRASIL', NULL, NULL),
(4, 'Cargo 4', 'MUNICIPAL', 1, 'BRASIL', 'Estado 3', 'Cidade 3'),
(5, 'Cargo 5', 'ESTADUAL', 1, 'BRASIL', 'Estado 4', NULL),
(6, 'Cargo 6', 'FEDERAL', 1, 'BRASIL', NULL, NULL);

-- Inserções para a tabela ProgramaPartido
INSERT INTO ProgramaPartido (Cod_Programa, Descricao) VALUES
(1, 'Programa Partido 1'),
(2, 'Programa Partido 2'),
(3, 'Programa Partido 3'),
(4, 'Programa Partido 4'),
(5, 'Programa Partido 5'),
(6, 'Programa Partido 6');

-- Inserções para a tabela Partido
INSERT INTO Partido (Cod_Partido, Nome, Cod_Programa) VALUES
(1, 'Partido 1', 1),
(2, 'Partido 2', 2),
(3, 'Partido 3', 3),
(4, 'Partido 4', 4),
(5, 'Partido 5', 5),
(6, 'Partido 6', 6);

-- Inserções para a tabela Candidatura
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Cod_Partido, Ano, Cod_Pleito, Cod_Candidatura_Vice, Eleito, Total_Doacoes) VALUES
(1, 11111111111, 1, 1, 2024, 1, NULL, FALSE, 0),
(2, 22222222222, 2, 2, 2024, 2, NULL, FALSE, 0),
(3, 33333333333, 3, 3, 2024, 3, NULL, FALSE, 0),
(4, 44444444444, 4, 4, 2024, 4, NULL, FALSE, 0),
(5, 55555555555, 5, 5, 2024, 5, NULL, FALSE, 0),
(6, 66666666666, 6, 6, 2024, 6, NULL, FALSE, 0);

-- Inserções para a tabela ProcessoJudicial
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Inicio, Julgado, Data_Termino, Procedente) VALUES
(1, 11111111111, '2024-01-01', TRUE, '2024-02-01', TRUE),
(2, 22222222222, '2024-01-02', TRUE, '2024-02-02', FALSE),
(3, 33333333333, '2024-01-03', TRUE, '2024-02-03', TRUE),
(4, 44444444444, '2024-01-04', TRUE, '2024-02-04', FALSE),
(5, 55555555555, '2024-01-05', TRUE, '2024-02-05', TRUE),
(6, 66666666666, '2024-01-06', TRUE, '2024-02-06', FALSE);
=======
-- Inserções para a tabela PARTIDO
INSERT INTO PARTIDO (cod_partido, nome) VALUES
(1, 'Partido A'),
(2, 'Partido B'),
(3, 'Partido C'),
(4, 'Partido D'),
(5, 'Partido E'),
(6, 'Partido F');

-- Inserções para a tabela programasDePartido
INSERT INTO programasDePartido (cod_partido, programa) VALUES
(1, 'Programa do Partido A'),
(2, 'Programa do Partido B'),
(3, 'Programa do Partido C'),
(4, 'Programa do Partido D'),
(5, 'Programa do Partido E'),
(6, 'Programa do Partido F');

-- Inserções para a tabela Candidato
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES
(1, 'Candidato 1', 1, 'Limpa'),
(2, 'Candidato 2', 2, 'Suja'),
(3, 'Candidato 3', 3, 'Limpa'),
(4, 'Candidato 4', 4, 'Limpa'),
(5, 'Candidato 5', 5, 'Suja'),
(6, 'Candidato 6', 6, 'Limpa');

-- Inserções para a tabela Cargo
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES
(1, 'Cargo 1', 'Localidade 1', 3),
(2, 'Cargo 2', 'Localidade 2', 2),
(3, 'Cargo 3', 'Localidade 3', 4),
(4, 'Cargo 4', 'Localidade 4', 5),
(5, 'Cargo 5', 'Localidade 5', 2),
(6, 'Cargo 6', 'Localidade 6', 3);

-- Inserções para a tabela Pleito
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES
(1, 50000),
(2, 70000),
(3, 85000),
(4, 92000),
(5, 60000),
(6, 45000);

-- Inserções para a tabela Candidatura
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES
(1, 1, 1, 2024, 1, NULL, FALSE),
(2, 2, 2, 2024, 2, NULL, FALSE),
(3, 3, 3, 2024, 3, NULL, FALSE),
(4, 4, 4, 2024, 4, NULL, FALSE),
(5, 5, 5, 2024, 5, NULL, FALSE),
(6, 6, 6, 2024, 6, NULL, FALSE);

-- Inserções para a tabela EquipeApoio
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES
(1, 'Equipe A'),
(2, 'Equipe B'),
(3, 'Equipe C'),
(4, 'Equipe D'),
(5, 'Equipe E'),
(6, 'Equipe F');

-- Inserções para a tabela ParticipanteEquipeApoio
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES
(1, 1, 'LIMPA'),
(2, 2, 'LIMPA'),
(3, 3, 'LIMPA'),
(4, 4, 'LIMPA'),
(5, 5, 'LIMPA'),
(6, 6, 'LIMPA');

-- Inserções para a tabela DoadoresCampanha
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES
(1, 'LIMPA', 'FÍSICO'),
(2, 'LIMPA', 'FÍSICO'),
(3, 'LIMPA', 'FÍSICO'),
(4, 'LIMPA', 'FÍSICO'),
(5, 'LIMPA', 'FÍSICO'),
(6, 'LIMPA', 'FÍSICO'),

INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES
(7, 'LIMPA', 'JURÍDICO'),
(8, 'LIMPA', 'JURÍDICO'),
(9, 'LIMPA', 'JURÍDICO'),
(10, 'LIMPA', 'JURÍDICO'),
(11, 'LIMPA', 'JURÍDICO'),
(12, 'LIMPA', 'JURÍDICO');

-- Inserções para a tabela ProcessoJudicial
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Tipo_Individuo, Data_Termino, Procedencia) VALUES
(1, 1, 'CANDIDATO', '2024-12-31', 'PROCEDENTE'),
(2, 2, 'CANDIDATO', '2024-12-31', 'IMPROCEDENTE'),
(3, 3, 'CANDIDATO', '2024-12-31', 'PROCEDENTE'),
(4, 4, 'CANDIDATO', '2024-12-31', 'IMPROCEDENTE'),
(5, 5, 'CANDIDATO', '2024-12-31', 'PROCEDENTE'),
(6, 6, 'CANDIDATO', '2024-12-31', 'IMPROCEDENTE');

-- Inserções para a tabela DoadorFisico
INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES
(1, '11111111111'),
(2, '22222222222'),
(3, '33333333333'),
(4, '44444444444'),
(5, '55555555555'),
(6, '66666666666');

-- Inserções para a tabela DoadorJuridico
INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES
(7, '12345678901234'),
(8, '23456789012345'),
(9, '34567890123456'),
(10, '45678901234567'),
(11, '56789012345678'),
(12, '67890123456789');

-- Inserções para a tabela Doa
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES
(1, 1, 100.00, 7),
(2, 2, 200.00, 1),
(3, 3, 150.00, 1),
(4, 4, 180.00, 2),
(5, 5, 120.00, 3),
(6, 6, 220.00, 1);
>>>>>>> 3d6ffcef95849f50dd47b9e1f64feb5e7438851f

-- Inserções para a tabela Empresa
INSERT INTO Empresa (CNPJ, Nome) VALUES
(12345678901234, 'Empresa 1'),
(23456789012345, 'Empresa 2'),
(34567890123456, 'Empresa 3'),
(45678901234567, 'Empresa 4'),
(56789012345678, 'Empresa 5'),
(67890123456789, 'Empresa 6');

-- Inserções para a tabela DoacaoPF
INSERT INTO DoacaoPF (Cod_Nota, Cod_Individuo, Valor, data_doacao) VALUES
(1, 11111111111, 100.00, '2024-01-01'),
(2, 22222222222, 200.00, '2024-01-02'),
(3, 33333333333, 150.00, '2024-01-03'),
(4, 44444444444, 180.00, '2024-01-04'),
(5, 55555555555, 120.00, '2024-01-05'),
(6, 66666666666, 220.00, '2024-01-06');

-- Inserções para a tabela DoadorPJ
INSERT INTO DoadorPJ (Cod_Candidatura, Cod_Empresa, Valor, data_doacao) VALUES
(1, 12345678901234, 1000.00, '2024-01-01'),
(2, 23456789012345, 2000.00, '2024-01-02'),
(3, 34567890123456, 1500.00, '2024-01-03'),
(4, 45678901234567, 1800.00, '2024-01-04'),
(5, 56789012345678, 1200.00, '2024-01-05'),
(6, 67890123456789, 2200.00, '2024-01-06');