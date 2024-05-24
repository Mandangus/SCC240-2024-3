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
    Pleito INTEGER,
    Cod_Candidatura_Vice INTEGER,
    Eleito BOOLEAN DEFAULT FALSE,

    CONSTRAINT ck_ano CHECK(Ano <= EXTRACT(YEAR FROM CURRENT_DATE) AND Ano >= 1900),
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
    Ano INTEGER,
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

    CONSTRAINT ck_processo CHECK(Cod_Processo > 0)
);

CREATE TABLE DoadorFisico (
    Cod_Doador INTEGER PRIMARY KEY,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    quantDoacoes INTEGER DEFAULT 0,
    FOREIGN KEY (Cod_Doador) REFERENCES DoadoresCampanha(Cod_Doador) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DoadorJuridico (
    Cod_Doador INTEGER PRIMARY KEY,
    CNPJ VARCHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (Cod_Doador) REFERENCES DoadoresCampanha(Cod_Doador) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Doa(
    cod_doador INTEGER PRIMARY KEY,
    valor NUMERIC(11, 2) DEFAULT 0,
    quantDoacoes INTEGER DEFAULT 1
);

CREATE OR REPLACE FUNCTION check_valid_candidatura() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Cod_Candidatura_Vice IS NOT NULL AND
       NOT EXISTS (SELECT 1 FROM Candidatura WHERE Cod_Candidatura = NEW.Cod_Candidatura_Vice) THEN
        RAISE EXCEPTION 'Invalid Vice Candidature';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_valid_candidatura
BEFORE INSERT OR UPDATE ON Candidatura
FOR EACH ROW EXECUTE FUNCTION check_valid_candidatura();

CREATE OR REPLACE FUNCTION check_donation_insert() RETURNS TRIGGER AS $$
DECLARE
    doador_tipo VARCHAR(50);
    doador_existe BOOLEAN;
BEGIN
    -- Verificar se o cod_doador existe na tabela DoadoresCampanha e obter o tipo_doador
    SELECT Tipo_Doador INTO doador_tipo
    FROM DoadoresCampanha
    WHERE Cod_Doador = NEW.cod_doador;

    -- Se o cod_doador não existir na tabela DoadoresCampanha, lançar exceção
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Doador com cod_doador % não existe em DoadoresCampanha', NEW.cod_doador;
    END IF;

    -- Verificar se o cod_doador existe na tabela Doa
    SELECT EXISTS (SELECT 1 FROM Doa WHERE cod_doador = NEW.cod_doador) INTO doador_existe;

    IF doador_existe THEN
        -- Se o doador for JURÍDICO e já estiver na tabela Doa, lançar exceção
        IF UPPER(doador_tipo) = 'JURÍDICO' THEN
            RAISE EXCEPTION 'Doador jurídico com cod_doador % já existe em Doa', NEW.cod_doador;
        END IF;
        
        -- Se o doador for FÍSICO, atualizar quantDoacoes e somar valor
        IF UPPER(doador_tipo) = 'FÍSICO' THEN
            UPDATE Doa
            SET quantDoacoes = quantDoacoes + NEW.quantDoacoes,
                valor = (valor + (NEW.valor*NEW.quantDoacoes))
            WHERE cod_doador = NEW.cod_doador;
            RETURN NULL; -- Impede a inserção original
        END IF;
    ELSE
        -- Se o doador não existir na tabela Doa, permitir a inserção
        RETURN NULL;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_donation_insert
BEFORE INSERT ON Doa
FOR EACH ROW EXECUTE FUNCTION check_donation_insert();