-- Ausführen der vorherigen Befehle
SOURCE listing03.sql

SELECT 'Start listing04.sql //////////////////////////////////////////';
-- Seite 108
-- Alternativ: SET @@local_infile = 1;
SET GLOBAL local_infile = 1; 

SELECT 'Importieren von artikel01.csv (Seite 108)';
LOAD DATA LOCAL INFILE 'artikel01.csv'
 INTO TABLE oshop.artikel
 FIELDS
  TERMINATED BY ';'
 LINES
  TERMINATED BY '\n'
;

SELECT 'Löschen der schlecht importierten Daten (Seite 109)';
DELETE FROM oshop.artikel;

SELECT 'Importieren von artikel01.csv (Seite 109)';
LOAD DATA LOCAL INFILE 'artikel01.csv'
 INTO TABLE oshop.artikel
  FIELDS
   TERMINATED BY ';'
  LINES
   TERMINATED BY '\n'
  IGNORE 1 LINES
  (artikel_id, bezeichnung, einzelpreis, waehrung)
  SET deleted=0
;

-- Start REPLACE oder IGNORE
SELECT 'Beispiel artikel02.csv mit IGNORE (Seite 111)';
LOAD DATA LOCAL INFILE 'artikel02.csv' IGNORE
 INTO TABLE oshop.artikel
  FIELDS
   TERMINATED BY ';'
  LINES
   TERMINATED BY '\n'
  IGNORE 1 LINES
  (artikel_id, bezeichnung, einzelpreis, waehrung)
  SET deleted=0
;
SELECT * FROM artikel;

SELECT 'Beispiel artikel02.csv mit IGNORE (Seite 111)';
DELETE FROM artikel;

LOAD DATA LOCAL INFILE 'artikel01.csv'
 INTO TABLE oshop.artikel
  FIELDS
   TERMINATED BY ';'
  LINES
   TERMINATED BY '\n'
  IGNORE 1 LINES
  (artikel_id, bezeichnung, einzelpreis, waehrung)
  SET deleted=0
;

LOAD DATA LOCAL INFILE 'artikel02.csv' REPLACE
 INTO TABLE oshop.artikel
  FIELDS
   TERMINATED BY ';'
  LINES
   TERMINATED BY '\n'
  IGNORE 1 LINES
  (artikel_id, bezeichnung, einzelpreis, waehrung)
  SET deleted=0
;

SELECT * FROM artikel;

-- Ende REPLACE oder IGNORE

-- Start INSERT

SELECT 'Anlegen mit INSERT INTO ... VALUES (Seite 113)';
SELECT 'Warengruppen anlegen';
INSERT INTO warengruppe (warengruppe_id, bezeichnung)
 VALUES
   (1, 'Bürobedarf')
  ,(2, 'Pflanzen')
  ,(3, 'Gartenbedarf')
  ,(4, 'Werkzeug')
;
SELECT * FROM warengruppe;

SELECT 'Anlegen mit INSERT INTO ... SET (Seite 115)';
SELECT 'Warengruppen verbinden';
INSERT INTO artikel_nm_warengruppe
 SET
  artikel_id=3001
 ,warengruppe_id=1
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=3005
  ,warengruppe_id=1
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=3006
  ,warengruppe_id=1
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=3007
  ,warengruppe_id=1
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=3010
  ,warengruppe_id=1
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=7856
  ,warengruppe_id=2
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=7856
  ,warengruppe_id=3
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=7863
  ,warengruppe_id=2
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=7863
  ,warengruppe_id=3
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=9010
  ,warengruppe_id=3
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=9010
  ,warengruppe_id=4
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=9015
  ,warengruppe_id=3
;
INSERT INTO artikel_nm_warengruppe
 SET
   artikel_id=9015
  ,warengruppe_id=4
;
-- Ende INSERT

-- Start Kundendaten
SELECT 'Testdaten INSERT adresse';

-- adresse
INSERT INTO adresse (adresse_id, strasse, hnr, lkz, plz, ort)
 VALUES
   (1, 'Beutelhaldenweg', '5', 'AL', '67676', 'Hobbingen')
  ,(2, 'Beutelhaldenweg', '1', 'AL', '67676', 'Hobbingen')
  ,(3, 'Auf der Feste',   '1', 'GO', '54786', 'Minas Tirith')
  ,(4, 'Letztes Haus',    '4', 'ER', '87567', 'Bruchtal')
  ,(5, 'Baradur',         '1', 'MO', '62519', 'Lugburz')
  ,(10, 'Hochstrasse',    '4a','DE', '44879', 'Bochum')
  ,(11, 'Industriegebiet','8', 'DE', '44878', 'Bochum')
;

SELECT 'Testdaten INSERT kunde';
-- kunde
INSERT INTO kunde (kunde_id, rechnung_adresse_id, nachname, vorname, art)
 VALUES
   (1, 1, 'Gamdschie',   'Samweis', 'prv')
  ,(2, 2, 'Beutlin',     'Frodo',   'prv')
  ,(3, 2, 'Beutlin',     'Bilbo',   'prv')
  ,(4, 3, 'Telcontar',   'Elessar', 'prv')
  ,(5, 4, 'Earendilionn','Elrond',  'gsch')
;

SELECT 'Lieferadresse bei zwei Adressen aendern';
UPDATE kunde SET liefer_adresse_id = 2 WHERE kunde_id = 1;
UPDATE kunde SET liefer_adresse_id = 4 WHERE kunde_id = 3;
-- Ende Kundendaten

-- Start Aufbau von 2 Bestellungen
SELECT 'Aufbau von 2 Bestellungen: Bestelldaten';
INSERT INTO bestellung (kunde_id, adresse_id, datum)
 VALUES
   (1, 1, '2012-03-24 17:41:00')
  ,(2, 2, '2012-03-23 16:11:00')
;

SELECT 'Aufbau von 2 Bestellungen: Bestellpositionen';
INSERT INTO bestellung_position (bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (1, 1, 7856, 30)
  ,(1, 2, 7863, 50)
  ,(1, 3, 9015, 1)
  ,(2, 1, 7856, 10)
  ,(2, 2, 9010, 5)
 ;
-- Ende Aufbau Bestellung

-- SELECT 'Drei Fehlermeldung wegen Constraints (Seite 116)!';
SELECT bestellung_id, kunde_id, adresse_id, datum FROM bestellung;
-- INSERT INTO bestellung (datum) VALUES (NOW());
-- INSERT INTO bestellung (adresse_id, datum) VALUES (10, NOW());
-- INSERT INTO adresse (adresse_id, strasse) VALUES (10, 'Oberer Weg');

-- Bildttabelle
SELECT 'Bildtabelle anlegen (Seite 117)';
CREATE TABLE bild
(
  bild_id           INT          UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  bild              BLOB,
  dateiname         VARCHAR(255),
  dateityp          VARCHAR(255),
  dateigroesse      BIGINT       UNSIGNED,
  artikel_id        INT          UNSIGNED REFERENCES artikel(artikel_id)
);

SELECT 'Bild importieren (Seite 119)';
INSERT INTO bild
 SET
  bild = LOAD_FILE('/var/lib/mysql/interchange/spaten01.png'),
  dateiname = 'spaten01.png',
  dateityp = 'png',
  dateigroesse = 7168,
  artikel_id = 9015
;

INSERT INTO bild
 SET
  bild = LOAD_FILE('/var/lib/mysql/interchange/spaten02.png'),
  dateiname = 'spaten02.png',
  dateityp = 'png',
  dateigroesse = 6910,
  artikel_id = 9015
;

INSERT INTO bild
 SET
  bild = LOAD_FILE('/var/lib/mysql/interchange/spaten03.png'),
  dateiname = 'spaten03.png',
  dateityp = 'png',
  dateigroesse = 7095,
  artikel_id = 9015
;

SELECT 'Daten kopieren (Seite 121)';
DROP TABLE IF EXISTS kunde_beutlin;
CREATE TEMPORARY TABLE kunde_beutlin LIKE kunde;
INSERT INTO kunde_beutlin
 SELECT * FROM kunde WHERE nachname='Beutlin';
SELECT * FROM kunde_beutlin;

SELECT 'Daten kopieren (Seite 121)';
DROP TABLE IF EXISTS kunde_namen;
CREATE TEMPORARY TABLE kunde_namen LIKE kunde;
INSERT INTO kunde_namen (vorname, nachname)
 SELECT vorname, nachname FROM kunde;
SELECT * FROM kunde_namen;


-- Start DROP (auskommentiert)
-- SELECT * FROM warengruppe INTO OUTFILE 'bla.txt';
-- DROP DATABASE oshop;
-- SELECT 'Löschen Sie nun MySQL-Datenverzeichnis oshop/bla.txt!'
-- Ende DROP

SELECT 'Ende listing04.sql //////////////////////////////////////////';
