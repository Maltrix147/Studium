-- Ausführen der vorherigen Befehle
:r listing01.sql

-- Hinweise: T-SQL kennt nicht:
--  UNSIGNED 
--  ENUM
SELECT 'Start listing02.sql //////////////////////////////////////////';
GO
-- Erspare mir ein wenig Tipparbeit
USE oshop; -- Seite 75
GO
-- adresse
SELECT 'Tabelle adresse anlegen (Seite 82)';
GO
CREATE TABLE adresse (
 adresse_id            INT IDENTITY (1,1),
 strasse               NVARCHAR(255) NOT NULL DEFAULT '',
 hnr                   NVARCHAR(255) NOT NULL DEFAULT '',
 lkz                   NCHAR(2) NOT NULL DEFAULT '',
 plz                   NCHAR(9) NOT NULL DEFAULT '',
 ort                   NVARCHAR(255) NOT NULL DEFAULT '',
 deleted               TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(adresse_id)
);

-- kunde
SELECT 'Tabelle kunde mit Fremdschluessel anlegen (Seite 86)';
GO
CREATE TABLE kunde (
 kunde_id              INT IDENTITY (1,1),
 nachname              NVARCHAR(255) NOT NULL DEFAULT '',
 vorname               NVARCHAR(255) NOT NULL DEFAULT '',
 rechnung_adresse_id   INT,
 liefer_adresse_id     INT,
 bezahlart             INT NOT NULL DEFAULT 0,
 art                   INT NOT NULL DEFAULT 0,
 deleted               TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id),
 FOREIGN KEY (rechnung_adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE CASCADE
   ON DELETE NO ACTION,
 FOREIGN KEY (liefer_adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- bank
SELECT 'Tabelle bank anlegen (Seite 76)';
GO

CREATE TABLE bank (
 bank_id               NCHAR(12),
 bankname              NVARCHAR(255) NOT NULL DEFAULT '',
 lkz                   NCHAR(2) NOT NULL DEFAULT 'DE',
 deleted               TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(bank_id)
);
GO

-- bankverbindung
SELECT 'Tabelle bankverbindung mit Fremdschluessel anlegen (Seite 76)';
CREATE TABLE bankverbindung (
 kunde_id              INT,
 bankverbindung_nr     INT,
 bank_id               NCHAR(12) NOT NULL,
 kontonummer           NCHAR(25) NOT NULL DEFAULT '',
 iban                  NCHAR(34) NOT NULL DEFAULT '',
 deleted               TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id,bankverbindung_nr),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (bank_id)
   REFERENCES bank(bank_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- artikel
SELECT 'Tabelle artikel anlegen';
CREATE TABLE artikel (
 artikel_id           INT IDENTITY (1,1),
 bezeichnung          NVARCHAR(255) NOT NULL DEFAULT '',
 einzelpreis          DECIMAL(14,6) NOT NULL DEFAULT 0.0, -- Wegen des SQL-Kompatibilitaet wird nicht MONEY verwendet.
 waehrung             NCHAR(3) DEFAULT 'EUR',
 deleted              TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(artikel_id)
);
GO

-- warengruppe
SELECT 'Tabelle warengruppe anlegen';
CREATE TABLE warengruppe (
 warengruppe_id       INT IDENTITY (1,1),
 bezeichnung          NVARCHAR(255) NOT NULL DEFAULT '',
 deleted              TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(warengruppe_id)
);
GO

-- lieferant
SELECT 'Tabelle lieferant  mit Fremdschluessel anlegen';
CREATE TABLE lieferant ( 
 lieferant_id        INT IDENTITY (1,1),
 firmenname          NVARCHAR(255) NOT NULL DEFAULT '',
 adresse_id          INT NOT NULL DEFAULT 0,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(lieferant_id),
 FOREIGN KEY (adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- Hilfstabelle artikel zu warengruppe
SELECT 'Hilfstabelle artikel_nm_warengruppe anlegen';
CREATE TABLE artikel_nm_warengruppe (
 warengruppe_id       INT,
 artikel_id           INT,
 PRIMARY KEY(warengruppe_id, artikel_id),
 FOREIGN KEY (warengruppe_id)
   REFERENCES warengruppe(warengruppe_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- Hilfstabelle artikel zu lieferant
SELECT 'Hilfstabelle artikel_nm_lieferant anlegen';
CREATE TABLE artikel_nm_lieferant (
 lieferant_id         INT,
 artikel_id           INT,
 PRIMARY KEY(lieferant_id, artikel_id),
 FOREIGN KEY (lieferant_id)
   REFERENCES lieferant(lieferant_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- bestellung
SELECT 'Tabelle bestellung mit Fremdschluessel anlegen';
CREATE TABLE bestellung (
 bestellung_id       INT IDENTITY (1,1),
 kunde_id            INT NOT NULL DEFAULT 0,
 adresse_id          INT NOT NULL DEFAULT 0,
 datum               DATETIME NOT NULL DEFAULT 0,
 status              INT NOT NULL DEFAULT 0,
 deleted             TINYINT  NOT NULL DEFAULT 0,
 PRIMARY KEY(bestellung_id),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- position der bestellung
SELECT 'Tabelle bestellung_position mit Fremdschluessel anlegen';
CREATE TABLE bestellung_position (
 bestellung_id       INT,  
 position_nr         INT,
 artikel_id          INT NOT NULL DEFAULT 0,
 menge               DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(bestellung_id, position_nr),
 FOREIGN KEY (bestellung_id)
   REFERENCES bestellung(bestellung_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- rechnung
SELECT 'Tabelle rechnung mit Fremdschluessel anlegen';
CREATE TABLE rechnung (
 rechnung_id         INT IDENTITY (1,1),
 kunde_id            INT NOT NULL DEFAULT 0,
 bestellung_id       INT NOT NULL DEFAULT 0,
 adresse_id          INT NOT NULL DEFAULT 0,
 bezahlart           INT NOT NULL DEFAULT 0,
 datum               DATETIME NOT NULL DEFAULT 0,
 status              INT NOT NULL DEFAULT 0,
 rabatt              DECIMAL(6,2) NOT NULL DEFAULT 0.0,
 skonto              DECIMAL(6,2) NOT NULL DEFAULT 0.0,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(rechnung_id),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- position der rechnung
SELECT 'Tabelle rechnung_position mit Fremdschluessel anlegen';
CREATE TABLE rechnung_position (
 rechnung_id         INT,
 position_nr         INT,
 artikel_id          INT  NOT NULL DEFAULT 0,
 steuer              DECIMAL(14,6) NOT NULL DEFAULT 19.0,
 menge               DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(rechnung_id, position_nr),
 FOREIGN KEY (rechnung_id)
   REFERENCES rechnung(rechnung_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

-- Zeige mir das Ergebnis
-- SHOW TABLES;
SELECT LEFT(name, 20) AS 'tabname', crdate FROM oshop.dbo.sysobjects WHERE xtype='U' ORDER BY tabname
GO
SELECT 'Ende listing02.sql //////////////////////////////////////////';
GO