
CREATE TABLE Pleito (
    Cod_Pleito INT PRIMARY KEY,
    Qtd_Votos INT NOT NULL DEFAULT 0,

    CONSTRAINT ck_votos CHECK(Qtd_Votos >= 0)
);

CREATE TABLE Candidato (
    Cod_Candidato INT PRIMARY KEY,
    Partido VARCHAR(50),
    Estado_Ficha VARCHAR(50) NOT NULL,

    CONSTRAINT ck_candidato CHECK(Cod_Candidato > 0)
);

CREATE TABLE Cargo (
    Cod_Cargo INT PRIMARY KEY,
    Localidade VARCHAR(50),
    Qtd_Eleitos INT NOT NULL DEFAULT 0

    CONSTRAINT ck_cargo_eleitos CHECK(Qtd_Eleitos >= 0),
    CONSTRAINT ck_cargo CHECK(Cod_Cargo > 0)
);

CREATE TABLE Candidatura (
    Cod_Candidatura INT PRIMARY KEY,
    Cod_Candidato INT NOT NULL,
    Cod_Cargo INT NOT NULL,
    Ano INT NOT NULL,
    Pleito INT,
    Cod_Candidatura_Vice INT,
    Eleito BOOLEAN DEFAULT FALSE,

    CONSTRAINT ck_ano CHECK(Ano <= EXTRACT(YEAR FROM CURRENT_DATE) AND Ano >= 1900),
    CONSTRAINT candidato_fk FOREIGN KEY (Cod_Candidato) REFERENCES Candidato(Cod_Candidato) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT cargo_fk FOREIGN KEY (Cod_Cargo) REFERENCES Cargo(Cod_Cargo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT pleito_fk FOREIGN KEY (Pleito) REFERENCES Pleito(Cod_Pleito) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT vice_fk FOREIGN KEY (Cod_Candidatura_Vice) REFERENCES Candidatura(Cod_Candidatura) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE EquipeApoio (
    Cod_Equipe INT PRIMARY KEY

    CONSTRAINT ck_equipe CHECK(Cod_Equipe > 0)
);

CREATE TABLE ParticipanteEquipeApoio (
    Cod_Participante INT PRIMARY KEY,
    Cod_Equipe INT NOT NULL,
    Ano INT,
    Estado_Ficha VARCHAR(50) NOT NULL,

    CONSTRAINT ck_participante CHECK(Cod_Participante > 0),
    CONSTRAINT equipe_fk FOREIGN KEY (Cod_Equipe) REFERENCES EquipeApoio(Cod_Equipe) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DoadoresCampanha (
    Cod_Doador INT PRIMARY KEY,
    Estado_Ficha VARCHAR(50) NOT NULL,
    Tipo_Doador VARCHAR(50) NOT NULL CHECK (UPPER(Tipo_Doador) IN ('FÍSICO', 'JURÍDICO')),

    CONSTRAINT ck_doador CHECK(Cod_Doador > 0)
);

CREATE TABLE ProcessoJudicial (
    Cod_Processo INT PRIMARY KEY,
    Cod_Individuo INT NOT NULL,
    Data_Termino DATE,
    Procedencia VARCHAR(50),

    CONSTRAINT ck_processo CHECK(Cod_Processo > 0)
);

CREATE TABLE DoadorFisico (
    Cod_Doador INT PRIMARY KEY,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    FOREIGN KEY (Cod_Doador) REFERENCES DoadoresCampanha(Cod_Doador) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DoadorJuridico (
    Cod_Doador INT PRIMARY KEY,
    CNPJ VARCHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (Cod_Doador) REFERENCES DoadoresCampanha(Cod_Doador) ON DELETE CASCADE ON UPDATE CASCADE
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

CREATE OR REPLACE FUNCTION check_donation_type() RETURNS TRIGGER AS $$
BEGIN
    IF UPPER(NEW.Tipo_Doador) = 'JURÍDICO' AND
       (SELECT COUNT(*) FROM DoadoresCampanha WHERE Cod_Doador = NEW.Cod_Doador) > 1 THEN
        RAISE EXCEPTION 'Corporate donors can only donate once per candidatura';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_donation_type
BEFORE INSERT OR UPDATE ON DoadoresCampanha
FOR EACH ROW EXECUTE FUNCTION check_donation_type();
