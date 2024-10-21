-- Ausführen der vorherigen Befehle
\i listing03.sql

\echo 'Start listing04.sql //////////////////////////////////////////'

SELECT 'Importieren von artikel01.csv (Seite 109)' Hinweis;
\copy artikel(artikel_id, bezeichnung, einzelpreis, waehrung) FROM './artikel02.csv' WITH DELIMITER ';' CSV HEADER

SELECT * FROM artikel;

-- Start INSERT
SELECT 'Anlegen mit INSERT INTO ... VALUES (Seite 111)' Hinweis;
SELECT 'Warengruppen anlegen' Hinweis;
INSERT INTO warengruppe (warengruppe_id, bezeichnung)
 VALUES
   (1, 'Bürobedarf')
  ,(2, 'Pflanzen')
  ,(3, 'Gartenbedarf')
  ,(4, 'Werkzeug')
;
SELECT * FROM warengruppe;

SELECT 'Anlegen mit INSERT INTO ... SET (Seite 113) geht in PostgreSQL nicht' Hinweis;
SELECT 'Warengruppen verbinden' Hinweis;
INSERT INTO artikel_nm_warengruppe (artikel_id, warengruppe_id)
 VALUES
  (3001,1),(3005,1),(3006,1),(3007,1),(3010,1), (7856,2),(7856,3),(7863,2),(7863,3),(9010,3),(9010,4),(9015,3),(9015,4)
 ;
-- Ende INSERT

-- Start Kundendaten
SELECT 'Testdaten INSERT adresse' Hinweis;

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

SELECT 'Testdaten INSERT kunde' Hinweis;
-- kunde
INSERT INTO kunde (kunde_id, rechnung_adresse_id, nachname, vorname, art)
 VALUES
   (1, 1, 'Gamdschie',   'Samweis', 'prv')
  ,(2, 2, 'Beutlin',     'Frodo',   'prv')
  ,(3, 2, 'Beutlin',     'Bilbo',   'prv')
  ,(4, 3, 'Telcontar',   'Elessar', 'prv')
  ,(5, 4, 'Earendilionn','Elrond',  'gsch')
;

SELECT 'Lieferadresse bei zwei Adressen aendern' Hinweis;
UPDATE kunde SET liefer_adresse_id = 2 WHERE kunde_id = 1;
UPDATE kunde SET liefer_adresse_id = 4 WHERE kunde_id = 3;
-- Ende Kundendaten

-- Start Aufbau von 2 Bestellungen
SELECT 'Aufbau von 2 Bestellungen: Bestelldaten' Hinweis;
INSERT INTO bestellung (kunde_id, adresse_id, datum)
 VALUES
   (1, 1, '2012-03-24 17:41:00')
  ,(2, 2, '2012-03-23 16:11:00')
;

SELECT 'Aufbau von 2 Bestellungen: Bestellpositionen' Hinweis;
INSERT INTO bestellung_position (bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (1, 1, 7856, 30)
  ,(1, 2, 7863, 50)
  ,(1, 3, 9015, 1)
  ,(2, 1, 7856, 10)
  ,(2, 2, 9010, 5)
 ;
-- Ende Aufbau Bestellung

-- SELECT 'Drei Fehlermeldung wegen Constraints (Seite 114)!';
-- SELECT bestellung_id, kunde_id, adresse_id, datum FROM bestellung;
-- INSERT INTO bestellung (datum) VALUES (NOW());
-- INSERT INTO bestellung (adresse_id, datum) VALUES (10, NOW());
-- INSERT INTO adresse (adresse_id, strasse) VALUES (10, 'Oberer Weg');

-- Bildttabelle
SELECT 'Bildtabelle anlegen (Seite 115)' Hinweis;
CREATE TABLE bild
(
  bild_id           SERIAL PRIMARY KEY,
  bild              BYTEA,
  dateiname         VARCHAR(255),
  dateityp          VARCHAR(255),
  dateigroesse      BIGINT,
  artikel_id        INT REFERENCES artikel(artikel_id)
);

SELECT 'Daten kopieren (Seite 119)' Hinweis;
DROP TABLE IF EXISTS kunde_beutlin;
CREATE TEMPORARY TABLE kunde_beutlin (LIKE kunde);
INSERT INTO kunde_beutlin
 SELECT * FROM kunde WHERE nachname='Beutlin';
SELECT * FROM kunde_beutlin;


-- SELECT DROP (auskommentiert)
-- SELECT * FROM warengruppe INTO OUTFILE 'bla.txt';
-- DROP DATABASE oshop;
-- SELECT 'Löschen Sie nun MySQL-Datenverzeichnis oshop/bla.txt!'
-- Ende DROP

\echo 'Ende listing04.sql //////////////////////////////////////////'
