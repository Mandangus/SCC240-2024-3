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