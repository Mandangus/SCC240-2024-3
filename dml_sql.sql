INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES
(1, 200934), (2, 354200), (3, 100000), (4, 587410), (5, 245000),
(6, 985254), (7, 114254), (8, 421589), (9, 102325), (10, 104254);

INSERT INTO EquipeApoio (Nome) VALUES
('Equipe Alfa'), ('Equipe Beta'), ('Equipe Gama'), ('Equipe Delta'), ('Equipe Epsilon'),
('Equipe Zeta'), ('Equipe Eta'), ('Equipe Theta'), ('Equipe Iota'), ('Equipe Kappa');

INSERT INTO Individuo (CPF, Nome, Cod_Equipe) VALUES
(10000000026, 'Amanda Silva', 6), (10000000027, 'Bruno Carvalho', 7),
(10000000028, 'Cecilia Azevedo', 8), (10000000029, 'Diego Machado', 9), (10000000030, 'Elisa Barbosa', 10),
(10000000031, 'Felipe Sousa', 1), (10000000032, 'Gustavo Ferreira', 2), (10000000033, 'Heloisa Melo', 3),
(10000000034, 'Isabela Andrade', 4), (10000000035, 'João Moraes', 5), (10000000036, 'Karina Mendes', 6),
(10000000037, 'Leonardo Cardoso', 7), (10000000038, 'Marcelo Santos', 8), (10000000039, 'Natalia Lima', 9),
(10000000040, 'Oscar Freitas', 10), (10000000041, 'Patricia Mota', 1), (10000000042, 'Rafael Teixeira', 2),
(10000000043, 'Samuel Mendes', 3), (10000000044, 'Thiago Ribeiro', 4), (10000000045, 'Vera Alves', 5),
(10000000046, 'William Barros', 6), (10000000047, 'Ana Claudia Silva', 7), (10000000048, 'Bruno Lima', 8),
(10000000049, 'Catarina Souza', 9), (10000000050, 'Daniel Gomes', 10), (10000000051, 'Eduardo Martins', 1),
(10000000052, 'Fabiana Santos', 2), (10000000053, 'Gilberto Lima', 3), (10000000054, 'Hugo Gonçalves', 4),
(10000000055, 'Isabel Torres', 5), (10000000056, 'Joana Castro', 6), (10000000057, 'Kevin Dias', 7),
(10000000058, 'Lara Azevedo', 8), (10000000059, 'Marcos Ferreira', 9), (10000000060, 'Nadia Souza', 10),
(10000000061, 'Otavio Lima', 1), (10000000062, 'Priscila Mendes', 2), (10000000063, 'Renato Freitas', 3),
(10000000064, 'Sara Andrade', 4), (10000000065, 'Tatiana Costa', 5), (10000000066, 'Ulisses Pereira', 6),
(10000000067, 'Victor Barbosa', 7), (10000000068, 'Walter Nunes', 8), (10000000069, 'Xuxa Oliveira', 9),
(10000000070, 'Yuri Ribeiro', 10), (10000000071, 'Zilda Silva', 1), (10000000072, 'Alberto Mendes', 2),
(10000000073, 'Beatriz Carvalho', 3), (10000000074, 'Caio Oliveira', 4), (10000000075, 'Diana Souza', 5),
(10000000076, 'Emilio Lima', 6), (10000000077, 'Fernanda Ribeiro', 7), (10000000078, 'Gustavo Silva', 8),
(10000000079, 'Helena Mendes', 9), (10000000080, 'Isabela Sousa', 10), (10000000081, 'José Oliveira', 1),
(10000000082, 'Karla Silva', 2), (10000000083, 'Leonardo Pereira', 3), (10000000084, 'Marta Costa', 4),
(10000000085, 'Nicolas Nunes', 5), (10000000086, 'Olivia Martins', 6), (10000000087, 'Paulo Andrade', 7),
(10000000088, 'Quintino Lima', 8), (10000000089, 'Rita Souza', 9), (10000000090, 'Samuel Ferreira', 10),
(10000000091, 'Tereza Araujo', 1), (10000000092, 'Ursula Mendes', 2), (10000000093, 'Vicente Oliveira', 3),
(10000000094, 'Wesley Nunes', 4), (10000000095, 'Xander Lima', 5), (10000000096, 'Yara Souza', 6),
(10000000097, 'Zuleica Silva', 7), (10000000098, 'Anderson Araujo', 8), (10000000099, 'Beto Costa', 9),
(10100000000, 'Carla Lima', 10);

INSERT into Individuo(CPF, Nome) VALUES
(10000000001, 'Alice Silva'), (10000000002, 'Bruno Souza'), (10000000003, 'Carla Oliveira'),
(10000000004, 'Daniel Pereira'), (10000000005, 'Eduardo Costa'), (10000000006, 'Fernanda Lima'),
(10000000007, 'Gabriel Alves'), (10000000008, 'Helena Rocha'), (10000000009, 'Igor Ribeiro'),
(10000000010, 'Julia Santos'), (10000000011, 'Luis Martins'), (10000000012, 'Mariana Fernandes'),
(10000000013, 'Nicolas Ferreira'), (10000000014, 'Olivia Gonçalves'), (10000000015, 'Paulo Almeida'),
(10000000016, 'Quintino Barbosa'), (10000000017, 'Renata Araujo'), (10000000018, 'Sergio Castro'),
(10000000019, 'Tatiana Cunha'), (10000000020, 'Ulisses Dias'), (10000000021, 'Vanessa Nunes'),
(10000000022, 'Wagner Monteiro'), (10000000023, 'Xavier Pinto'), (10000000024, 'Yasmin Oliveira'),
(10000000025, 'Zeca Rodrigues');


INSERT INTO ProgramaPartido (Descricao) VALUES
('Programa de Desenvolvimento Econômico'), ('Programa de Saúde e Educação'),
('Programa de Infraestrutura'), ('Programa de Meio Ambiente');

INSERT INTO Partido (Nome, Cod_Programa) VALUES
('Partido Progressista', 1), ('Partido Social', 2), ('Partido Liberal', 3), ('Partido Verde', 4);

INSERT INTO Cargo (Descricao, Localidade, Qtd_Eleitos, Pais, Estado, Cidade) VALUES
('Presidente', 'FEDERAL', 1, 'BRASIL', NULL, NULL),
('Prefeito', 'MUNICIPAL', 1, 'BRASIL', 'São Paulo', 'São Paulo'),
('Prefeito', 'MUNICIPAL', 1, 'BRASIL', 'Rio de Janeiro', 'Rio de Janeiro'),
('Governador', 'ESTADUAL', 1, 'BRASIL', 'Rio de Janeiro', NULL),
('Deputado Federal', 'FEDERAL', 10, 'BRASIL', NULL, NULL),
('Deputado Estadual', 'ESTADUAL', 10, 'BRASIL', 'Minas Gerais', NULL),
('Senador', 'FEDERAL', 3, 'BRASIL', NULL, NULL),
('Prefeito', 'MUNICIPAL', 1, 'BRASIL', 'Minas Gerais', 'Belo Horizonte'),
('Prefeito', 'MUNICIPAL', 1, 'BRASIL', 'Minas Gerais', 'Uberlândia'),
('Prefeito', 'MUNICIPAL', 1, 'BRASIL', 'São Paulo', 'Campinas');

INSERT INTO Candidatura (Cod_Candidato, Cod_Cargo, Cod_Partido, Ano, Cod_Pleito, Cod_Candidatura_Vice) VALUES
(10000000001, 1, 1, 2024, 1, NULL), (10000000002, 2, 2, 2024, 2, NULL), 
(10000000003, 3, 3, 2024, 3, NULL), (10000000004, 4, 4, 2024, 4, NULL),
(10000000005, 5, 1, 2024, 5, NULL), (10000000006, 6, 2, 2024, 6, NULL),
(10000000007, 7, 3, 2024, 7, NULL), (10000000008, 8, 4, 2024, 8, NULL),
(10000000009, 9, 1, 2024, 9, NULL), (10000000010, 10, 2, 2024, 10, NULL),
(10000000011, 1, 1, 2024, 1, NULL), (10000000012, 2, 2, 2024, 2, NULL),
(10000000013, 3, 3, 2024, 3, NULL), (10000000014, 4, 4, 2024, 4, NULL),
(10000000015, 5, 1, 2024, 5, NULL), (10000000016, 6, 2, 2024, 6, NULL),
(10000000017, 7, 3, 2024, 7, NULL), (10000000018, 8, 4, 2024, 8, NULL),
(10000000019, 9, 1, 2024, 9, NULL), (10000000020, 10, 2, 2024, 10, NULL),
(10000000021, 1, 1, 2024, 1, NULL), (10000000022, 2, 2, 2024, 2, NULL),
(10000000023, 3, 3, 2024, 3, NULL), (10000000024, 4, 4, 2024, 4, NULL),
(10000000025, 5, 1, 2024, 5, NULL);

INSERT INTO ProcessoJudicial (Cod_Individuo, Data_Inicio, Julgado, Data_Termino, Procedente) VALUES
(10000000001, '2022-01-01', TRUE, '2023-01-01', TRUE), (10000000002, '2022-01-01', TRUE, '2023-01-01', FALSE),
(10000000003, '2022-01-01', FALSE, NULL, NULL), (10000000004, '2022-01-01', TRUE, '2023-01-01', TRUE),
(10000000005, '2022-01-01', TRUE, '2023-01-01', FALSE), (10000000006, '2022-01-01', FALSE, NULL, NULL),
(10000000007, '2022-01-01', TRUE, '2023-01-01', TRUE), (10000000008, '2022-01-01', TRUE, '2023-01-01', FALSE),
(10000000009, '2022-01-01', FALSE, NULL, NULL), (10000000010, '2022-01-01', TRUE, '2023-01-01', TRUE),
(10000000011, '2022-01-01', TRUE, '2023-01-01', TRUE), (10000000012, '2022-01-01', TRUE, '2023-01-01', FALSE),
(10000000013, '2022-01-01', FALSE, NULL, NULL), (10000000014, '2022-01-01', TRUE, '2023-01-01', TRUE),
(10000000015, '2022-01-01', TRUE, '2023-01-01', FALSE), (10000000016, '2022-01-01', FALSE, NULL, NULL),
(10000000017, '2022-01-01', TRUE, '2023-01-01', TRUE), (10000000018, '2022-01-01', TRUE, '2023-01-01', FALSE),
(10000000019, '2022-01-01', FALSE, NULL, NULL), (10000000020, '2022-01-01', TRUE, '2023-01-01', TRUE),
(10000000021, '2022-01-01', TRUE, '2023-01-01', TRUE), (10000000022, '2022-01-01', TRUE, '2023-01-01', FALSE),
(10000000023, '2022-01-01', FALSE, NULL, NULL), (10000000024, '2022-01-01', TRUE, '2023-01-01', TRUE),
(10000000025, '2022-01-01', TRUE, '2023-01-01', FALSE);

INSERT INTO Empresa (CNPJ, Nome) VALUES
(12345678000100, 'Tech Innovations'), (23456789000111, 'Global Enterprises'), 
(34567890000122, 'Green Solutions'), (45678901000133, 'Health First'),
(56789012000144, 'EduTech Corp'), (67890123000155, 'AgroFuture'),
(78901234000166, 'FinTech Leaders'), (89012345000177, 'Retail Giants'),
(90123456000188, 'Construction Masters'), (11234567000199, 'Auto World');

INSERT INTO DoacaoPF (Cod_Individuo, Valor, data_doacao) VALUES
(10000000026, 500.00, '2024-05-01'), (10000000027, 600.00, '2024-05-02'),
(10000000028, 700.00, '2024-05-03'), (10000000029, 800.00, '2024-05-04'),
(10000000030, 900.00, '2024-05-05'), (10000000031, 1000.00, '2024-05-06'),
(10000000032, 1100.00, '2024-05-07'), (10000000033, 1200.00, '2024-05-08'),
(10000000034, 1300.00, '2024-05-09'), (10000000035, 1400.00, '2024-05-10'),
(10000000036, 1500.00, '2024-05-11'), (10000000037, 1600.00, '2024-05-12'),
(10000000038, 1700.00, '2024-05-13'), (10000000039, 1800.00, '2024-05-14'),
(10000000040, 1900.00, '2024-05-15'), (10000000041, 2000.00, '2024-05-16'),
(10000000042, 2100.00, '2024-05-17'), (10000000043, 2200.00, '2024-05-18'),
(10000000044, 2300.00, '2024-05-19'), (10000000045, 2400.00, '2024-05-20');

INSERT INTO DoadorPJ (Cod_Candidatura, Cod_Empresa, Valor, data_doacao) VALUES
(1, 12345678000100, 5000.00, '2024-05-01'), (2, 23456789000111, 6000.00, '2024-05-02'),
(3, 34567890000122, 7000.00, '2024-05-03'), (4, 45678901000133, 8000.00, '2024-05-04'),
(5, 56789012000144, 9000.00, '2024-05-05'), (6, 67890123000155, 10000.00, '2024-05-06'),
(7, 78901234000166, 11000.00, '2024-05-07'), (8, 89012345000177, 12000.00, '2024-05-08'),
(9, 90123456000188, 13000.00, '2024-05-09'), (10, 11234567000199, 14000.00, '2024-05-10'),
(11, 12345678000100, 5000.00, '2024-05-11'), (12, 23456789000111, 6000.00, '2024-05-12'),
(13, 34567890000122, 7000.00, '2024-05-13'), (14, 45678901000133, 8000.00, '2024-05-14'),
(15, 56789012000144, 9000.00, '2024-05-15'), (16, 67890123000155, 10000.00, '2024-05-16'),
(17, 78901234000166, 11000.00, '2024-05-17'), (18, 89012345000177, 12000.00, '2024-05-18'),
(19, 90123456000188, 13000.00, '2024-05-19'), (20, 11234567000199, 14000.00, '2024-05-20');


