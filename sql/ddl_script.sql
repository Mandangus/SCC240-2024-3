-- VERIFICADAS

CREATE TABLE PARTIDO(
    cod_partido INTEGER PRIMARY KEY,
    nome VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE programasDePartido(
    cod_partido INTEGER PRIMARY KEY,
    programa VARCHAR(255) NOT NULL,

    CONSTRAINT cod_partido FOREIGN KEY(cod_partido) REFERENCES partido(cod_partido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Candidato (
    Cod_Candidato INTEGER,
    nome VARCHAR(60) UNIQUE NOT NULL,
    Partido INTEGER NOT NULL,
    Estado_Ficha VARCHAR(50) NOT NULL,

    CONSTRAINT ck_candidato CHECK(Cod_Candidato > 0),
    CONSTRAINT candidato_pk PRIMARY KEY(Cod_Candidato),
    CONSTRAINT candidato_fk FOREIGN KEY(Partido) REFERENCES Partido(cod_partido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cargo (
    Cod_Cargo INTEGER PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    Localidade VARCHAR(50),
    Qtd_Eleitos INTEGER NOT NULL DEFAULT 0

    CONSTRAINT ck_cargo_eleitos CHECK(Qtd_Eleitos >= 0),
    CONSTRAINT ck_cargo CHECK(Cod_Cargo > 0)
);

CREATE TABLE Pleito (
    Cod_Pleito INTEGER PRIMARY KEY,
    Qtd_Votos INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT ck_votos CHECK(Qtd_Votos >= 0)
);

CREATE TABLE Candidatura (
    Cod_Candidatura INTEGER PRIMARY KEY,
    Cod_Candidato INTEGER NOT NULL,
    Cod_Cargo INTEGER NOT NULL,
    Ano INTEGER NOT NULL,
    Pleito INTEGER NOT NULL,
    Cod_Candidatura_Vice INTEGER,
    Eleito BOOLEAN DEFAULT FALSE,

    CONSTRAINT ck_ano CHECK(Ano <= EXTRACT(YEAR FROM CURRENT_DATE) AND Ano >= 1894),
    CONSTRAINT candidato_fk FOREIGN KEY (Cod_Candidato) REFERENCES Candidato(Cod_Candidato) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT cargo_fk FOREIGN KEY (Cod_Cargo) REFERENCES Cargo(Cod_Cargo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT pleito_fk FOREIGN KEY (Pleito) REFERENCES Pleito(Cod_Pleito) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT vice_fk FOREIGN KEY (Cod_Candidatura_Vice) REFERENCES Candidatura(Cod_Candidatura) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE EquipeApoio (
    Cod_Equipe INTEGER PRIMARY KEY,
    nomeEquipe VARCHAR(60) UNIQUE NOT NULL,

    CONSTRAINT ck_equipe CHECK(Cod_Equipe > 0)
);

CREATE TABLE ParticipanteEquipeApoio (
    Cod_Participante INTEGER PRIMARY KEY,
    Cod_Equipe INTEGER NOT NULL,
    Estado_Ficha VARCHAR(50) NOT NULL,

    CONSTRAINT ck_participante CHECK(Cod_Participante > 0),
    CONSTRAINT equipe_fk FOREIGN KEY (Cod_Equipe) REFERENCES EquipeApoio(Cod_Equipe) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DoadoresCampanha (
    Cod_Doador INTEGER PRIMARY KEY,
    Estado_Ficha VARCHAR(50) NOT NULL,
    Tipo_Doador VARCHAR(50) NOT NULL CHECK (UPPER(Tipo_Doador) IN ('FÍSICO', 'JURÍDICO')),

    CONSTRAINT ck_doador CHECK(Cod_Doador > 0)
);

CREATE TABLE ProcessoJudicial (
    Cod_Processo INTEGER PRIMARY KEY,
    Cod_Individuo INTEGER NOT NULL,
    Data_Termino DATE,
    Procedencia VARCHAR(50),
    CONSTRAINT ck_processo CHECK(Cod_Processo > 0),
    CONSTRAINT Procedencia_ck CHECK(UPPER(Procedencia) IN('PROCEDENTE', 'IMPROCEDENTE'))
);

CREATE TABLE DoadorFisico (
    Cod_Doador INTEGER PRIMARY KEY,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    FOREIGN KEY (Cod_Doador) REFERENCES DoadoresCampanha(Cod_Doador) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DoadorJuridico (
    Cod_Doador INTEGER PRIMARY KEY,
    CNPJ VARCHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (Cod_Doador) REFERENCES DoadoresCampanha(Cod_Doador) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Doa(
    cod_doador INTEGER,
    cod_candidatura INTEGER,
    valor NUMERIC(11, 2) DEFAULT 0,
    quantDoacoes INTEGER DEFAULT 1,

    CONSTRAINT doa_pk PRIMARY KEY(cod_doador, cod_candidatura),
    CONSTRAINT doa_fk FOREIGN KEY(cod_candidatura) REFERENCES CANDIDATURA(cod_candidatura) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE FUNCTION check_valid_candidatura() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Cod_Candidatura_Vice IS NOT NULL AND
       NOT EXISTS (SELECT 1 FROM Candidatura WHERE Cod_Candidatura = NEW.Cod_Candidatura_Vice) THEN
        RAISE EXCEPTION 'Candidatura de vice é inválida';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_valid_vice
BEFORE INSERT OR UPDATE ON Candidatura
FOR EACH ROW EXECUTE FUNCTION check_valid_candidatura();

CREATE OR REPLACE FUNCTION check_ficha_candidato() RETURNS TRIGGER AS $$
DECLARE ficha VARCHAR(10);
BEGIN
    ficha := (SELECT estado_ficha FROM CANDIDATO WHERE cod_candidato = NEW.cod_candidato);
    IF UPPER(ficha) = 'SUJA' THEN
        RAISE EXCEPTION 'Candidatura inválida, candidato está com o nome sujo';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_valid_ficha
BEFORE INSERT ON Candidatura
FOR EACH ROW EXECUTE FUNCTION check_ficha_candidato();

CREATE OR REPLACE FUNCTION check_juridico_donation()
RETURNS TRIGGER AS $$
DECLARE
    tipo VARCHAR(50);
    ano_candidatura INTEGER;
BEGIN
    -- Obter o tipo de doador
    SELECT Tipo_Doador INTO tipo
    FROM DoadoresCampanha
    WHERE Cod_Doador = NEW.cod_doador;

    -- Obter o ano da candidatura
    SELECT Ano INTO ano_candidatura
    FROM Candidatura
    WHERE Cod_Candidatura = NEW.cod_candidatura;

    -- Verificar se o doador é do tipo JURÍDICO
    IF UPPER(tipo) = 'JURÍDICO' THEN
        -- Verificar se já existe uma doação para outra candidatura no mesmo ano
        IF EXISTS (
            SELECT 1
            FROM Doa d
            JOIN Candidatura c ON d.cod_candidatura = c.Cod_Candidatura
            WHERE d.cod_doador = NEW.cod_doador
            AND c.Ano = ano_candidatura
        ) THEN
            RAISE EXCEPTION 'Doadores do tipo JURÍDICO só podem doar para uma candidatura por ano';
		ELSIF NEW.quantDoacoes > 1 THEN
			RAISE EXCEPTION 'Doadores do tipo JURÍDICO só podem fazer uma única doação';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_juridico_donation_trigger
BEFORE INSERT ON Doa
FOR EACH ROW
EXECUTE FUNCTION check_juridico_donation();
