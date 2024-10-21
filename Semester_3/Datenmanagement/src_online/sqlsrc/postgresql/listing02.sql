-- Ausführen der vorherigen Befehle
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
\i listing01.sql

\echo 'Start listing02.sql //////////////////////////////////////////'

-- Erspare mir ein wenig Tipparbeit (Seite 75)
\connect oshop

-- adresse
SELECT 'Tabelle adresse anlegen (Seite 82)' Hinweis;
CREATE TABLE adresse (
 adresse_id            SERIAL,
 strasse               VARCHAR(255) NOT NULL DEFAULT '',
 hnr                   VARCHAR(255) NOT NULL DEFAULT '',
 lkz                   CHAR(2) NOT NULL DEFAULT '',
 plz                   CHAR(9) NOT NULL DEFAULT '',
 ort                   VARCHAR(255) NOT NULL DEFAULT '',
 deleted               SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(adresse_id)
);

-- kunde
SELECT 'Tabelle kunde mit Fremdschlüssel anlegen (Seite 86)' Hinweis;
CREATE TYPE kundenart AS ENUM('unb', 'prv', 'gsch');
CREATE TABLE kunde (
 kunde_id              SERIAL,
 nachname              VARCHAR(255) NOT NULL DEFAULT '',
 vorname               VARCHAR(255) NOT NULL DEFAULT '',
 rechnung_adresse_id   INT,
 liefer_adresse_id     INT,
 bezahlart             INT NOT NULL DEFAULT 0,
 art                   kundenart NOT NULL DEFAULT 'unb',
 deleted               SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id),
 FOREIGN KEY (rechnung_adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE CASCADE
   ON DELETE RESTRICT,
 FOREIGN KEY (liefer_adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE CASCADE
   ON DELETE SET NULL
);

-- bank
SELECT 'Tabelle bank anlegen (Seite 76)' Hinweis;
CREATE TABLE bank (
 bank_id               CHAR(12),
 bankname              VARCHAR(255) NOT NULL DEFAULT '',
 lkz                   CHAR(2) NOT NULL DEFAULT 'DE',
 deleted               SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(bank_id)
);

-- bankverbindung
SELECT 'Tabelle bankverbindung mit Fremdschlüssel anlegen (Seite 76)' Hinweis;
CREATE TABLE bankverbindung (
 kunde_id              INT,
 bankverbindung_nr     INT,
 bank_id               CHAR(12) NOT NULL,
 kontonummer           CHAR(25) NOT NULL DEFAULT '',
 iban                  CHAR(34) NOT NULL DEFAULT '',
 deleted               SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id,bankverbindung_nr),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (bank_id)
   REFERENCES bank(bank_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);


-- artikel
SELECT 'Tabelle artikel anlegen' Hinweis;
CREATE TABLE artikel (
 artikel_id           SERIAL,
 bezeichnung          VARCHAR(255) NOT NULL DEFAULT '',
 einzelpreis          DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 waehrung             CHAR(3) DEFAULT 'EUR',
 deleted              SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(artikel_id)
);


-- warengruppe
SELECT 'Tabelle warengruppe anlegen' Hinweis;
CREATE TABLE warengruppe (
 warengruppe_id       SERIAL,
 bezeichnung          VARCHAR(255) NOT NULL DEFAULT '',
 deleted              SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(warengruppe_id)
);


-- lieferant
SELECT 'Tabelle lieferant  mit Fremdschlüssel anlegen' Hinweis;
CREATE TABLE lieferant ( 
 lieferant_id        SERIAL,
 firmenname          VARCHAR(255) NOT NULL DEFAULT '',
 adresse_id          INT NOT NULL DEFAULT 0,
 deleted             SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(lieferant_id),
 FOREIGN KEY (adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);


-- Hilfstabelle artikel zu warengruppe
SELECT 'Hilfstabelle artikel_nm_warengruppe anlegen' Hinweis;
CREATE TABLE artikel_nm_warengruppe (
 warengruppe_id       INT,
 artikel_id           INT,
 PRIMARY KEY(warengruppe_id, artikel_id),
 FOREIGN KEY (warengruppe_id)
  REFERENCES warengruppe(warengruppe_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);


-- Hilfstabelle artikel zu lieferant
SELECT 'Hilfstabelle artikel_nm_lieferant anlegen' Hinweis;
CREATE TABLE artikel_nm_lieferant (
 lieferant_id         INT,
 artikel_id           INT,
 PRIMARY KEY(lieferant_id, artikel_id),
 FOREIGN KEY (lieferant_id)
  REFERENCES lieferant(lieferant_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);


-- bestellung
SELECT 'Tabelle bestellung mit Fremdschlüssel anlegen ' Hinweis;
CREATE TYPE bestellstatus AS ENUM('offen', 'versendet', 'angekommen', 'retour', 'bezahlt');
CREATE TABLE bestellung (
 bestellung_id       SERIAL,
 kunde_id            INT NOT NULL DEFAULT 0,
 adresse_id          INT NOT NULL DEFAULT 0,
 datum               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 status              bestellstatus NOT NULL DEFAULT 'offen',
 deleted             SMALLINT  NOT NULL DEFAULT 0,
 PRIMARY KEY(bestellung_id),
 FOREIGN KEY (kunde_id)
  REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);

-- position der bestellung
SELECT 'Tabelle bestellung_position mit Fremdschlüssel anlegen' Hinweis;
CREATE TABLE bestellung_position (
 bestellung_id       INT,  
 position_nr         INT,
 artikel_id          INT NOT NULL DEFAULT 0,
 menge               DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(bestellung_id, position_nr),
 FOREIGN KEY (bestellung_id)
  REFERENCES bestellung(bestellung_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);


-- rechnung
SELECT 'Tabelle rechnung mit Fremdschlüssel anlegen' Hinweis;
CREATE TYPE bezahlarten AS ENUM('lastschrift', 'rechnung', 'kredit', 'bar');
CREATE TYPE rechnungstatus AS ENUM('offen', 'gestellt', 'mahnung1', 'inkasso', 'storno', 'beglichen');
CREATE TABLE rechnung (
 rechnung_id         SERIAL,
 kunde_id            INT  NOT NULL DEFAULT 0,
 bestellung_id       INT  NOT NULL DEFAULT 0,
 adresse_id          INT  NOT NULL DEFAULT 0,
 bezahlart           bezahlarten NOT NULL DEFAULT 'lastschrift',
 datum               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 status              rechnungstatus NOT NULL DEFAULT 'offen',
 rabatt              DECIMAL(6,2) NOT NULL DEFAULT 0.0,
 skonto              DECIMAL(6,2) NOT NULL DEFAULT 0.0,
 deleted             SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(rechnung_id),
 FOREIGN KEY (kunde_id)
  REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);


-- position der rechnung
SELECT 'Tabelle rechnung_position mit Fremdschlüssel anlegen' Hinweis;
CREATE TABLE rechnung_position (
 rechnung_id         INT,
 position_nr         INT,
 artikel_id          INT NOT NULL DEFAULT 0,
 steuer              DECIMAL(14,6) NOT NULL DEFAULT 19.0,
 menge               DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(rechnung_id, position_nr),
 FOREIGN KEY (rechnung_id)
  REFERENCES rechnung(rechnung_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);

SELECT 'Neue Tabelle mit Struktur einer alten anlegen (Seite 88)' Hinweis;
CREATE TABLE wurstbrot (LIKE adresse);

SELECT 'Neue Tabelle sofort wieder löschen, da nicht mehr gebraucht' Hinweis;
DROP TABLE wurstbrot;

-- Zeige mir das Ergebnis
\dt
\echo 'Ende listing02.sql //////////////////////////////////////////'
