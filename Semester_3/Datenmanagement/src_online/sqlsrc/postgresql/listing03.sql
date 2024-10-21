-- Ausführen der vorherigen Befehle
\i listing02.sql

\echo  'Start listing03.sql //////////////////////////////////////////'

-- Seite 93
\d kunde

-- Anlegen der Indizes nach Liste auf Seite 95
SELECT  'CREATE INDEX idx_kunde_nachname_vorname' Hinweis;
CREATE INDEX idx_kunde_nachname_vorname
  ON kunde (nachname, vorname)
;

SELECT  'CREATE INDEX idx_bank_bankname' Hinweis;
CREATE INDEX idx_bank_bankname
  ON bank (bankname)
;

SELECT  'CREATE INDEX idx_bankverbindung_bankid_kontonummer' Hinweis;
CREATE INDEX idx_bankverbindung_bankid_kontonummer
  ON bankverbindung (bank_id, kontonummer)
;

SELECT  'CREATE UNIQUE INDEX idx_bankverbindung_iban' Hinweis;
CREATE UNIQUE INDEX idx_bankverbindung_iban
  ON bankverbindung (iban)
;

SELECT  'CREATE INDEX idx_artikel_bezeichnung' Hinweis;
CREATE INDEX idx_artikel_bezeichnung
  ON artikel (bezeichnung)
;

SELECT  'CREATE INDEX idx_warengruppe_bezeichnung' Hinweis;
CREATE INDEX idx_warengruppe_bezeichnung
  ON warengruppe (bezeichnung)
;

SELECT  'CREATE INDEX idx_lieferant_firmenname' Hinweis;
CREATE INDEX idx_lieferant_firmenname
  ON lieferant (firmenname)
;

SELECT  'CREATE INDEX idx_bestellung_kundeid_datum' Hinweis;
CREATE INDEX idx_bestellung_kundeid_datum
  ON bestellung (kunde_id, datum)
;


SELECT  'CREATE UNIQUE INDEX idx_adresse_dublette (Seite 98)' Hinweis;
CREATE UNIQUE INDEX idx_adresse_dublette
  ON adresse (substring(strasse from 1 for 100), substring(hnr from 1 for 100), plz);

-- Start Selektivität
SELECT  'Indexselektivität (Seite 101)' Hinweis;
SELECT  'CREATE TEMPORARY TABLE testdaten_bank' Hinweis;
DROP TABLE IF EXISTS testdaten_bank;
CREATE  TABLE testdaten_bank
(
 blz         CHAR(8),
 merkmal     CHAR(1),
 bezeichnung VARCHAR(255),
 plz         CHAR(5),
 ort         VARCHAR(255),
 kurz        VARCHAR(255),
 pan         CHAR(5),
 bic         VARCHAR(255),
 sm          CHAR(2),
 ds          CHAR(6),
 kz          CHAR(1),
 blzl        CHAR(1),
 blzn        CHAR(8)
);

SELECT  'COPY' Hinweis;
 -- Hier Dateiname und Pfad einfuegen
 
\copy testdaten_bank FROM './blz_20120305.csv' WITH DELIMITER ';' CSV HEADER
SELECT  'CREATE INDEX' Hinweis;
CREATE INDEX idx_testdaten_bank_bezeichnung
  ON testdaten_bank (substring(bezeichnung from 1 for 30))
;
-- Ende Selektivitaet

\echo  'Ende listing03.sql //////////////////////////////////////////';

