-- Ausführen der vorherigen Befehle
\include listing12.sql

\echo 'Start listing13.sql //////////////////////////////////////////'

SELECT 'Meine erste Ansicht (Seite 272)' Hinweis;
CREATE VIEW
 view_kundenrechnungsadresse (id, nachname, vorname, strasse, ort)
 AS
  SELECT
   kunde_id, nachname, vorname,
   CONCAT_WS(' ', strasse, hnr),
   CONCAT_WS(' ', lkz, plz, ort)
   FROM
    kunde INNER JOIN adresse
     ON rechnung_adresse_id = adresse_id
  WHERE kunde.deleted = 0
;
SELECT * FROM view_kundenrechnungsadresse;
\dv

SELECT 'VIEW-Verarbeitung (Seite 275)' Hinweis;
CREATE VIEW view_artikel_aktiv
 AS
  SELECT * FROM artikel
   WHERE deleted = 0;
;
SELECT FLOOR(artikel_id / 1000) gruppe, AVG(einzelpreis)
  FROM view_artikel_aktiv
  GROUP BY gruppe
;
EXPLAIN SELECT FLOOR(artikel_id / 1000) gruppe, AVG(einzelpreis)
  FROM view_artikel_aktiv
  GROUP BY gruppe
;
SELECT artikel_id, bezeichnung FROM
 view_artikel_aktiv
 WHERE
  artikel_id BETWEEN 7000 AND 9000
;
EXPLAIN SELECT artikel_id, bezeichnung FROM
 view_artikel_aktiv
 WHERE
  artikel_id BETWEEN 7000 AND 9000
;
CREATE VIEW view_artikel_aktiv_tmp
 AS
  SELECT * FROM artikel
  WHERE deleted = 0
;
SELECT artikel_id, bezeichnung
 FROM view_artikel_aktiv_tmp
 WHERE artikel_id BETWEEN 7000 AND 8000
;
SELECT artikel_id, bezeichnung
 FROM view_artikel_aktiv_tmp
 WHERE artikel_id BETWEEN 3000 AND 4000
;
EXPLAIN SELECT artikel_id, bezeichnung
 FROM view_artikel_aktiv_tmp
 WHERE artikel_id BETWEEN 3000 AND 4000
;

-- Start DROP VIEW
SELECT 'Ansicht löschen (Seite 277)' Hinweis;
\dv
DROP VIEW view_artikel_aktiv_tmp;
\dv

DROP DATABASE IF EXISTS tmp1;
CREATE DATABASE tmp1;
\connect tmp1
CREATE TABLE a (i INT);
CREATE TABLE b (i INT);
CREATE VIEW ab
 AS
  SELECT * FROM a INNER JOIN b USING(i)
;
\dt
-- \dv
-- DROP TABLE a;
\dv
DROP TABLE a CASCADE;
\dv
\connect oshop
DROP DATABASE tmp1;

-- Ende DROP VIEW

SELECT 'Anwendungsgebiet: Vereinfachung (Seite 281)' Hinweis;
CREATE OR REPLACE
 VIEW view_artikel_aktiv
  AS
   SELECT * FROM artikel
    WHERE deleted = 0
;
CREATE OR REPLACE VIEW view_artikel_verfuegbar
AS
 SELECT artikel_id, bezeichnung
  FROM artikel INNER JOIN lagerbestand USING(artikel_id)
  WHERE menge_aktuell >= menge_mindest
  ORDER BY artikel_id
;
SELECT * FROM view_artikel_verfuegbar;
CREATE OR REPLACE 
 VIEW view_lagerbestand_aktiv
  AS
   SELECT * FROM lagerbestand
    WHERE deleted = 0
; 
CREATE OR REPLACE VIEW view_lagerbestand_artikelbezeichnung
AS
 SELECT l.*, a.bezeichnung
  FROM
   view_lagerbestand_aktiv l INNER JOIN view_artikel_aktiv a
    USING(artikel_id)
;
SELECT * FROM view_lagerbestand_artikelbezeichnung;

-- SELECT 'Grenzen der VIEW. Erwarte Fehlermeldungen (Seite 284)';
DROP TABLE IF EXISTS tmp;
CREATE TEMPORARY TABLE tmp AS SELECT * FROM artikel;
CREATE OR REPLACE VIEW view_tmp AS SELECT artikel_id FROM tmp;
DROP VIEW IF EXISTS view_tmp;
CREATE OR REPLACE VIEW view_tmp AS SELECT nachname FROM kunde ORDER BY nachname DESC;
SELECT * FROM view_tmp;
SELECT * FROM view_tmp ORDER BY nachname;
CREATE OR REPLACE VIEW view_tmp_eins
 AS
  SELECT nachname FROM kunde
;
CREATE OR REPLACE VIEW view_tmp_zwei
 AS
  SELECT rechnung_id, COUNT(*) anzahl
   FROM rechnung_position
   GROUP BY rechnung_id
;
UPDATE view_tmp_eins
 SET nachname = 'Streicher'
 WHERE nachname = 'Telcontar'
;
-- SELECT 'Grenzen der VIEW. Erwarte Fehlermeldungen';
-- UPDATE view_tmp_zwei
--  SET anzahl = 2
--  WHERE anzahl > 2
-- ;
-- Rückbau
UPDATE view_tmp_eins
 SET nachname = 'Telcontar'
 WHERE nachname = 'Streicher'
;
-- UPDATE view_tmp_zwei SET rechnung_id = 1 WHERE rechnung_id > 1;
INSERT INTO view_tmp_eins VALUES ('Wurst'), ('Brot');
SELECT * FROM view_tmp_eins;
DELETE FROM view_tmp_eins WHERE nachname IN ('Wurst', 'Brot');

\echo 'Ende listing13.sql //////////////////////////////////////////'