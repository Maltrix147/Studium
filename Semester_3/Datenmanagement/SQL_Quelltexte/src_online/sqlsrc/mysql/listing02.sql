-- Ausführen der vorherigen Befehle
SOURCE listing01.sql

SELECT 'Start listing02.sql //////////////////////////////////////////';

-- Erspare mir ein wenig Tipparbeit
USE oshop; -- Seite 75

-- adresse
SELECT 'Tabelle adresse anlegen (Seite 82)';
CREATE TABLE adresse (
 adresse_id            INT UNSIGNED AUTO_INCREMENT,
 strasse               VARCHAR(255) NOT NULL DEFAULT '',
 hnr                   VARCHAR(255) NOT NULL DEFAULT '',
 lkz                   CHAR(2) NOT NULL DEFAULT '',
 plz                   CHAR(9) NOT NULL DEFAULT '',
 ort                   VARCHAR(255) NOT NULL DEFAULT '',
 deleted               TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(adresse_id)
) ENGINE=InnoDB;   -- Nicht wundern, die Engine ist XtraDB.

-- kunde
SELECT 'Tabelle kunde mit Fremdschlüssel anlegen (Seite 87)';
CREATE TABLE kunde (
 kunde_id              INT UNSIGNED AUTO_INCREMENT,
 nachname              VARCHAR(255) NOT NULL DEFAULT '',
 vorname               VARCHAR(255) NOT NULL DEFAULT '',
 rechnung_adresse_id   INT UNSIGNED,
 liefer_adresse_id     INT UNSIGNED,
 bezahlart             INT UNSIGNED NOT NULL DEFAULT 0,
 art                   ENUM('unb', 'prv', 'gsch') NOT NULL DEFAULT 'unb',
 deleted               TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id),
 FOREIGN KEY (rechnung_adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE CASCADE
   ON DELETE RESTRICT,
 FOREIGN KEY (liefer_adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE CASCADE
   ON DELETE SET NULL
) ENGINE=InnoDB;

-- bank
SELECT 'Tabelle bank anlegen (Seite 76)';
CREATE TABLE bank (
 bank_id               CHAR(12),
 bankname              VARCHAR(255) NOT NULL DEFAULT '',
 lkz                   CHAR(2) NOT NULL DEFAULT 'DE',
 deleted               TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(bank_id)
) ENGINE=InnoDB;

-- bankverbindung
SELECT 'Tabelle bankverbindung mit Fremdschlüssel anlegen (Seite 76)';
CREATE TABLE bankverbindung (
 kunde_id              INT UNSIGNED,
 bankverbindung_nr     INT UNSIGNED,
 bank_id               CHAR(12) NOT NULL,
 kontonummer           CHAR(25) NOT NULL DEFAULT '',
 iban                  CHAR(34) NOT NULL DEFAULT '',
 deleted               TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id,bankverbindung_nr),
 FOREIGN KEY (kunde_id)
  REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (bank_id)
  REFERENCES bank(bank_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;


-- artikel
SELECT 'Tabelle artikel anlegen';
CREATE TABLE artikel (
 artikel_id           INT UNSIGNED AUTO_INCREMENT,
 bezeichnung          VARCHAR(255) NOT NULL DEFAULT '',
 einzelpreis          DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 waehrung             CHAR(3) DEFAULT 'EUR',
 deleted              TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(artikel_id)
) ENGINE=InnoDB;


-- warengruppe
SELECT 'Tabelle warengruppe anlegen';
CREATE TABLE warengruppe (
 warengruppe_id       INT UNSIGNED AUTO_INCREMENT,
 bezeichnung          VARCHAR(255) NOT NULL DEFAULT '',
 deleted              TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(warengruppe_id)
) ENGINE=InnoDB;


-- lieferant
SELECT 'Tabelle lieferant  mit Fremdschlüssel anlegen';
CREATE TABLE lieferant ( 
 lieferant_id        INT UNSIGNED AUTO_INCREMENT,
 firmenname          VARCHAR(255) NOT NULL DEFAULT '',
 adresse_id          INT UNSIGNED NOT NULL DEFAULT 0,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(lieferant_id),
 FOREIGN KEY (adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;


-- Hilfstabelle artikel zu warengruppe
SELECT 'Hilfstabelle artikel_nm_warengruppe anlegen';
CREATE TABLE artikel_nm_warengruppe (
 warengruppe_id       INT UNSIGNED,
 artikel_id           INT UNSIGNED,
 PRIMARY KEY(warengruppe_id, artikel_id),
 FOREIGN KEY (warengruppe_id)
  REFERENCES warengruppe(warengruppe_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;


-- Hilfstabelle artikel zu lieferant
SELECT 'Hilfstabelle artikel_nm_lieferant anlegen';
CREATE TABLE artikel_nm_lieferant (
 lieferant_id         INT UNSIGNED,
 artikel_id           INT UNSIGNED,
 PRIMARY KEY(lieferant_id, artikel_id),
 FOREIGN KEY (lieferant_id)
  REFERENCES lieferant(lieferant_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;


-- bestellung
SELECT 'Tabelle bestellung mit Fremdschlüssel anlegen';
CREATE TABLE bestellung (
 bestellung_id       INT UNSIGNED AUTO_INCREMENT,
 kunde_id            INT UNSIGNED NOT NULL DEFAULT 0,
 adresse_id          INT UNSIGNED NOT NULL DEFAULT 0,
 datum               DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
 status              ENUM('offen', 'versendet', 'angekommen', 'retour', 'bezahlt') NOT NULL DEFAULT 'offen',
 deleted             TINYINT  UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(bestellung_id),
 FOREIGN KEY (kunde_id)
  REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (adresse_id)
  REFERENCES adresse(adresse_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;

-- position der bestellung
SELECT 'Tabelle bestellung_position mit Fremdschlüssel anlegen';
CREATE TABLE bestellung_position (
 bestellung_id       INT UNSIGNED,  
 position_nr         INT UNSIGNED,
 artikel_id          INT UNSIGNED NOT NULL DEFAULT 0,
 menge               DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(bestellung_id, position_nr),
 FOREIGN KEY (bestellung_id)
  REFERENCES bestellung(bestellung_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;


-- rechnung
SELECT 'Tabelle rechnung mit Fremdschlüssel anlegen';
CREATE TABLE rechnung (
 rechnung_id         INT UNSIGNED AUTO_INCREMENT,
 kunde_id            INT UNSIGNED NOT NULL DEFAULT 0,
 bestellung_id       INT UNSIGNED NOT NULL DEFAULT 0,
 adresse_id          INT UNSIGNED NOT NULL DEFAULT 0,
 bezahlart           ENUM('lastschrift', 'rechnung', 'kredit', 'bar') NOT NULL DEFAULT 'lastschrift',
 datum               DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
 status              ENUM('offen', 'gestellt', 'mahnung1', 'inkasso', 'storno', 'beglichen') NOT NULL DEFAULT 'offen',
 rabatt              DECIMAL(6,2) NOT NULL DEFAULT 0.0,
 skonto              DECIMAL(6,2) NOT NULL DEFAULT 0.0,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(rechnung_id),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (adresse_id)
   REFERENCES adresse(adresse_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;


-- position der rechnung
SELECT 'Tabelle rechnung_position mit Fremdschlüssel anlegen';
CREATE TABLE rechnung_position (
 rechnung_id         INT UNSIGNED,
 position_nr         INT UNSIGNED,
 artikel_id          INT UNSIGNED  NOT NULL DEFAULT 0,
 steuer              DECIMAL(14,6) NOT NULL DEFAULT 19.0,
 menge               DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(rechnung_id, position_nr),
 FOREIGN KEY (rechnung_id)
  REFERENCES rechnung(rechnung_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (artikel_id)
  REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;

SELECT 'Neue Tabelle mit Struktur einer alten anlegen (Seite 89)';
CREATE TABLE wurstbrot LIKE adresse;

SELECT 'Neue Tabelle sofort wieder löschen, da nicht mehr gebraucht';
DROP TABLE wurstbrot;

SELECT 'Temporäre Tabelle anlegen (89)';
CREATE TEMPORARY TABLE tmp_kunde LIKE kunde;

SHOW TABLES;
DROP TABLE tmp_kunde;
SELECT 'Ende listing02.sql //////////////////////////////////////////';
