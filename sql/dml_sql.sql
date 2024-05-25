INSERT INTO PARTIDO (cod_partido, nome) VALUES (1, 'Partido da Justiça');
INSERT INTO PARTIDO (cod_partido, nome) VALUES (2, 'Partido do Trabalho');
INSERT INTO PARTIDO (cod_partido, nome) VALUES (3, 'Partido Liberal');
INSERT INTO PARTIDO (cod_partido, nome) VALUES (4, 'Partido Verde');
INSERT INTO PARTIDO (cod_partido, nome) VALUES (5, 'Partido Conservador');
INSERT INTO PARTIDO (cod_partido, nome) VALUES (6, 'Partido Socialista');
INSERT INTO PARTIDO (cod_partido, nome) VALUES (7, 'Partido Democrático');

INSERT INTO programasDePartido (cod_partido, programa) VALUES (1, 'Promover a justiça social e a igualdade');
INSERT INTO programasDePartido (cod_partido, programa) VALUES (2, 'Defender os direitos dos trabalhadores');
INSERT INTO programasDePartido (cod_partido, programa) VALUES (3, 'Reduzir os impostos e promover a liberdade econômica');
INSERT INTO programasDePartido (cod_partido, programa) VALUES (4, 'Proteger o meio ambiente e promover a sustentabilidade');
INSERT INTO programasDePartido (cod_partido, programa) VALUES (5, 'Defender os valores tradicionais e a ordem');
INSERT INTO programasDePartido (cod_partido, programa) VALUES (6, 'Promover a justiça social e os direitos humanos');
INSERT INTO programasDePartido (cod_partido, programa) VALUES (7, 'Defender a democracia e os direitos civis');

INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (1, 'João Silva', 1, 'Limpa');
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (2, 'Maria Souza', 2, 'Limpa');
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (3, 'Pedro Santos', 3, 'Suja');
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (4, 'Ana Lima', 4, 'Limpa');
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (5, 'Carlos Oliveira', 5, 'Limpa');
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (6, 'Beatriz Costa', 6, 'Suja');
INSERT INTO Candidato (Cod_Candidato, nome, Partido, Estado_Ficha) VALUES (7, 'Fernando Almeida', 7, 'Limpa');

INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (1, 'Presidente', 'Nacional', 1);
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (2, 'Governador', 'Estadual', 27);
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (3, 'Prefeito', 'Municipal', 5570);
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (4, 'Senador', 'Nacional', 81);
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (5, 'Deputado Federal', 'Nacional', 513);
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (6, 'Deputado Estadual', 'Estadual', 1059);
INSERT INTO Cargo (Cod_Cargo, nome, Localidade, Qtd_Eleitos) VALUES (7, 'Vereador', 'Municipal', 57000);

INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (1, 150000000);
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (2, 120000000);
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (3, 100000000);
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (4, 80000000);
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (5, 70000000);
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (6, 50000000);
INSERT INTO Pleito (Cod_Pleito, Qtd_Votos) VALUES (7, 30000000);

INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (1, 1, 1, 2022, 1, NULL, TRUE);
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (2, 2, 2, 2022, 2, NULL, TRUE);
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (3, 3, 3, 2020, 3, NULL, FALSE);
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (4, 4, 4, 2022, 4, NULL, TRUE);
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (5, 5, 5, 2018, 5, NULL, TRUE);
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (6, 6, 6, 2018, 6, NULL, FALSE);
INSERT INTO Candidatura (Cod_Candidatura, Cod_Candidato, Cod_Cargo, Ano, Pleito, Cod_Candidatura_Vice, Eleito) VALUES (7, 7, 7, 2020, 7, NULL, TRUE);

INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (1, 'Equipe Alpha');
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (2, 'Equipe Beta');
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (3, 'Equipe Gamma');
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (4, 'Equipe Delta');
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (5, 'Equipe Epsilon');
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (6, 'Equipe Zeta');
INSERT INTO EquipeApoio (Cod_Equipe, nomeEquipe) VALUES (7, 'Equipe Eta');

INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (1, 1, 'Limpa');
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (2, 2, 'Limpa');
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (3, 3, 'Suja');
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (4, 4, 'Limpa');
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (5, 5, 'Limpa');
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (6, 6, 'Suja');
INSERT INTO ParticipanteEquipeApoio (Cod_Participante, Cod_Equipe, Estado_Ficha) VALUES (7, 7, 'Limpa');

INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (1, 'Limpa', 'Físico');
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (2, 'Limpa', 'Jurídico');
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (3, 'Suja', 'Físico');
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (4, 'Limpa', 'Jurídico');
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (5, 'Limpa', 'Físico');
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (6, 'Suja', 'Jurídico');
INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES (7, 'Limpa', 'Físico');

INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (1, 1, '2022-01-15', 'Procedente');
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (2, 2, '2022-02-20', 'Improcedente');
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (3, 3, '2022-03-10', 'Procedente');
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (4, 4, '2022-04-25', 'Improcedente');
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (5, 5, '2022-05-30', 'Procedente');
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (6, 6, '2022-06-15', 'Improcedente');
INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES (7, 7, '2022-07-20', 'Procedente');

INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES (1, '12345678901');
INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES (3, '23456789012');
INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES (5, '34567890123');
INSERT INTO DoadorFisico (Cod_Doador, CPF) VALUES (7, '45678901234');

INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES (2, '12345678000191');
INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES (4, '23456789000101');
INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES (6, '34567890000112');

INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (1, 1, 500.00, 1);
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (2, 2, 1000.00, 2);
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (3, 3, 300.00, 1);
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (4, 4, 2000.00, 4);
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (5, 5, 150.00, 1);
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (6, 6, 2500.00, 5);
INSERT INTO Doa (cod_doador, cod_candidatura, valor, quantDoacoes) VALUES (7, 7, 300.00, 1);



