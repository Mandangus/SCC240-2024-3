INSERT INTO PARTIDO (cod_partido, nome) VALUES 
(1, 'Partido da Democracia'),
(2, 'Partido da Justiça'),
(3, 'Partido do Progresso'),
(4, 'Partido Social'),
(5, 'Partido Liberal'),
(6, 'Partido Conservador');

INSERT INTO programasDePartido (cod_partido, programa) VALUES 
(1, 'Programa de Democracia para Todos'),
(2, 'Justiça para um Futuro Melhor'),
(3, 'Progresso e Desenvolvimento'),
(4, 'Inclusão e Equidade Social'),
(5, 'Liberalismo e Liberdade Econômica'),
(6, 'Tradição e Conservação dos Valores');

INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES 
(1, 'João Silva', 1, 'Limpa'),
(2, 'Maria Santos', 2, 'Limpa'),
(3, 'Carlos Pereira', 3, 'Limpa'),
(4, 'Ana Oliveira', 4, 'Limpa'),
(5, 'Lucas Martins', 5, 'Limpa'),
(6, 'Fernanda Costa', 6, 'Limpa');

INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES 
(1, 'Presidente', 'Nacional', 1),
(2, 'Governador', 'Estadual', 27),
(3, 'Prefeito', 'Municipal', 5000),
(4, 'Senador', 'Nacional', 81),
(5, 'Deputado Federal', 'Nacional', 513),
(6, 'Deputado Estadual', 'Estadual', 1059);

INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES 
(1, 1000000),
(2, 2000000),
(3, 3000000),
(4, 4000000),
(5, 5000000),
(6, 6000000);

INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES 
(1, 1, 1, 2022, 1, NULL, TRUE),
(2, 2, 2, 2022, 2, NULL, TRUE),
(3, 3, 3, 2022, 3, NULL, FALSE),
(4, 4, 4, 2022, 4, NULL, FALSE),
(5, 5, 5, 2022, 5, NULL, TRUE),
(6, 6, 6, 2022, 6, NULL, FALSE);

INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES 
(1, 'Equipe Alpha'),
(2, 'Equipe Beta'),
(3, 'Equipe Gamma'),
(4, 'Equipe Delta'),
(5, 'Equipe Epsilon'),
(6, 'Equipe Zeta');

INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Ano, Estado_Ficha) VALUES 
(1, 1, 2022, 'Limpa'),
(2, 2, 2022, 'Limpa'),
(3, 3, 2022, 'Limpa'),
(4, 4, 2022, 'Limpa'),
(5, 5, 2022, 'Limpa'),
(6, 6, 2022, 'Limpa');

INSERT INTO DoadoresCampanha (Cod_Doador, valor, Estado_Ficha, Tipo_Doador) VALUES 
(1, 1000.00, 'Limpa', 'Físico'),
(2, 2000.00, 'Limpa', 'Jurídico'),
(3, 1500.00, 'Limpa', 'Físico'),
(4, 2500.00, 'Limpa', 'Jurídico'),
(5, 3000.00, 'Limpa', 'Físico'),
(6, 3500.00, 'Limpa', 'Jurídico');

INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES 
(1, 1, '2022-12-31', 'Procedente'),
(2, 2, '2023-01-15', 'Improcedente'),
(3, 3, '2023-02-20', 'Procedente'),
(4, 4, '2023-03-10', 'Improcedente'),
(5, 5, '2023-04-25', 'Procedente'),
(6, 6, '2023-05-30', 'Improcedente');

INSERT INTO DoadorFisico (Cod_Doador, CPF, quantDoacoes) VALUES 
(1, '12345678901', 1),
(3, '23456789012', 1),
(5, '34567890123', 1);

INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES 
(2, '12345678000123'),
(4, '23456789000134'),
(6, '34567890000145');

INSERT INTO Doa (cod_doador, valor, quantDoacoes) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);
