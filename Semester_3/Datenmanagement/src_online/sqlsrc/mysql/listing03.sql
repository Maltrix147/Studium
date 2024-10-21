-- Ausführen der vorherigen Befehle
SOURCE listing02.sql

SELECT 'Start listing03.sql //////////////////////////////////////////';

-- Seite 95
SHOW INDEX FROM kunde\G

-- Anlegen der Indizes nach Liste auf Seite 97
SELECT 'CREATE INDEX idx_kunde_nachname_vorname';
CREATE INDEX idx_kunde_nachname_vorname
  ON kunde (nachname, vorname)
;

SELECT 'CREATE INDEX idx_bank_bankname';
CREATE INDEX idx_bank_bankname
  ON bank (bankname)
;

SELECT 'CREATE INDEX idx_bankverbindung_bankid_kontonummer';
CREATE INDEX idx_bankverbindung_bankid_kontonummer
  ON bankverbindung (bank_id, kontonummer)
;

SELECT 'CREATE UNIQUE INDEX idx_bankverbindung_iban';
CREATE UNIQUE INDEX idx_bankverbindung_iban
  ON bankverbindung (iban)
;

SELECT 'CREATE INDEX idx_artikel_bezeichnung';
CREATE INDEX idx_artikel_bezeichnung
  ON artikel (bezeichnung)
;

SELECT 'CREATE INDEX idx_warengruppe_bezeichnung';
CREATE INDEX idx_warengruppe_bezeichnung
  ON warengruppe (bezeichnung)
;

SELECT 'CREATE INDEX idx_lieferant_firmenname';
CREATE INDEX idx_lieferant_firmenname
  ON lieferant (firmenname)
;

SELECT 'CREATE INDEX idx_bestellung_kundeid_datum';
CREATE INDEX idx_bestellung_kundeid_datum
  ON bestellung (kunde_id, datum)
;


SELECT 'CREATE UNIQUE INDEX idx_adresse_dublette (Seite 100)';
CREATE UNIQUE INDEX idx_adresse_dublette
  ON adresse (strasse(100), hnr(100), plz);

-- Start Selektivität
SELECT 'Indexselektivität (Seite 103)';
SELECT 'CREATE TEMPORARY TABLE testdaten_bank';
DROP TABLE IF EXISTS testdaten_bank;
CREATE TEMPORARY TABLE testdaten_bank
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

 SELECT 'LOAD DATA';
 SET GLOBAL local_infile = 1;
 -- Hier Dateiname und Pfad einfuegen
 LOAD DATA LOCAL INFILE 'blz_20120305.csv'
  INTO TABLE testdaten_bank
  FIELDS TERMINATED BY ';'
  LINES TERMINATED BY '\n'
 ;

CREATE INDEX idx_testdaten_bank_bezeichnung
  ON testdaten_bank (bezeichnung(30))
;
SHOW INDEX FROM testdaten_bank\G

-- Ende Selektivitaet

-- ENABLE / DISABLE
-- SELECT 'DISABLE/ENABLE KEYS: Erwarte zwei Warnungen!';
-- ALTER TABLE bankverbindung DISABLE KEYS; SHOW WARNINGS\G
-- ALTER TABLE bankverbindung ENABLE KEYS;  SHOW WARNINGS\G

SELECT 'Ende listing03.sql //////////////////////////////////////////';

