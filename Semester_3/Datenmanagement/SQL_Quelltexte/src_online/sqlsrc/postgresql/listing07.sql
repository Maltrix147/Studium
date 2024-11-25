-- Ausführen der vorherigen Befehle
\i listing06.sql

\echo 'Start listing07.sql //////////////////////////////////////////'

SELECT 'Ausdrücke (Seite 156)' Hinweis;

SELECT 5, 'Beginn der Auswertung';
SELECT -5, 9 + 4, 9 - 4, 9 * 4, 9.0 / 4.0, DIV(9,4), 9 % 4, MOD(9,4);
SELECT 3 * 4 + 3, (3 * 4) + 3, 3 * (4 + 3); -- Beispiel auf PostgreSQL angepasst, da DIV dort ein Funktionsaufruf und kein Operator ist.
-- SELECT 9 / 0, 9 * NULL, SQRT(-5) ; -- Erzeugt in PostgreSQL eine Fehlermeldung.

SELECT 'Zufallszahlen (Seite 158)' Hinweis;
SELECT SETSEED(0.5);
SELECT RANDOM();
SELECT SETSEED(0.5);
SELECT RANDOM();
SELECT SETSEED(0.5);
SELECT RANDOM() FROM artikel;

SELECT 'Variablen (Seite 159)';
DO $$ -- Zum Deklarieren einer Variablen muss man in einem Anweisungsblock sein. Daher hier der anonyme Anweisungsblock.
DECLARE x double precision := 0;
BEGIN 
 SELECT POWER(2,8) INTO x;
 PERFORM x - 1; -- Ergebnis nicht in der Konsole sichtbar.
END $$;

-- SELECT 'Ungültiger Versuch: erwarte eine Fehlermeldung (Seite 159)'
-- DO $$
-- DECLARE artnr INT := 3010;
-- BEGIN
--  PERFORM * FROM artikel WHERE artikel_id = artnr; -- Ergebnis nicht in der Konsole sichtbar.
-- END $$;


SELECT 'Spalten- und Zeilenwahl (Seite 156)' Hinweis;
SELECT * FROM artikel;
SELECT
 artikel_id, bezeichnung, einzelpreis, waehrung, deleted
 FROM artikel
;

SELECT
 artikel_id + 10000 AS Unsinn, deleted AS Löschkennzeichen
 FROM artikel
;

SELECT
 artikel_id, bezeichnung
 FROM artikel
 WHERE einzelpreis BETWEEN 10 AND 100
;

SELECT 'Sortierung (Seite 161)' Hinweis;
SELECT
 artikel_id, bezeichnung, einzelpreis
 FROM artikel
 ORDER BY einzelpreis ASC
;

SELECT
 nachname, vorname
 FROM kunde
 ORDER BY nachname, vorname
;

SELECT
 nachname, vorname
 FROM kunde
 ORDER BY nachname DESC, vorname ASC
;

-- CP850 wird von PostgreSQL nicht unterstützt. Beispiel ist daher nicht verwendbar.
-- DROP TABLE IF EXISTS wurstbrot;
-- SET NAMES 'cp850';
-- CREATE TEMPORARY TABLE wurstbrot ( name VARCHAR(255) CHARACTER SET 'cp850');
-- INSERT INTO wurstbrot
--  VALUES
--    ('winfried')
--     ,('achim')
--     ,('olga')
--     ,('zechine')
--     ,('ägidius')
-- ;
-- SELECT * FROM wurstbrot ORDER BY name;
-- 
-- DROP TABLE IF EXISTS wurstbrot;
-- SET NAMES 'utf8';
-- CREATE TEMPORARY TABLE wurstbrot ( name VARCHAR(255) CHARACTER SET 'utf8');
-- INSERT INTO wurstbrot
--  VALUES
-- ('winfried')
--     ,('achim')
--     ,('olga')
--     ,('zechine')
--     ,('ägidius')
-- ;
-- SELECT * FROM wurstbrot ORDER BY name;
-- 
DROP TABLE IF EXISTS wurstbrot;
CREATE TEMPORARY TABLE wurstbrot (name VARCHAR(255));
INSERT INTO wurstbrot
 VALUES
  ('winfried')
    ,('achim')
    ,('olga')
    ,('Olga')
    ,('zechine')
;
SELECT * FROM wurstbrot ORDER BY name;
SELECT * FROM wurstbrot ORDER BY name DESC;

-- In PostgreSQL wird immer zwischen Groß- und Kleinschreibung unterschieden.
-- DROP TABLE IF EXISTS wurstbrot;
-- CREATE TEMPORARY TABLE wurstbrot (name VARCHAR(255) BINARY);
-- INSERT INTO wurstbrot
--  VALUES
--   ('winfried')
--     ,('achim')
--     ,('olga')
--     ,('Olga')
--     ,('zechine')
-- ;
-- SELECT * FROM wurstbrot ORDER BY name;
-- SELECT * FROM wurstbrot ORDER BY name DESC;

EXPLAIN SELECT * FROM kunde ORDER BY nachname, vorname;

SELECT
 bestellung_id, datum
 FROM bestellung
 ORDER BY datum;

EXPLAIN SELECT * FROM kunde ORDER BY nachname, vorname;
 
-- In PostgreSQL gibt es keinen Datentyp TIME. Geht nur über Hilfsfunktionen in Text umzuwandeln.
-- SELECT
--  bestellung_id, TIME(datum) Uhrzeit
--  FROM bestellung
--  ORDER BY uhrzeit; 

SELECT 'Mehrfachausgaben unterbinden (Seite 171)' Hinweis;

SELECT ort FROM adresse ORDER BY ort;
SELECT DISTINCT ort FROM adresse ORDER BY ort;
SELECT DISTINCT nachname FROM kunde ORDER BY nachname;

-- Das Fallbeispiel Bankimport müsste in PostgreSQL ganz anders als
-- in MySQL oder MariaDB gelöst werden. 
-- Daher hier nur der INSERT, damit die Bankdaten vorliegen.
\d+ bank
ALTER TABLE bank ADD blz CHAR(12) NOT NULL DEFAULT '';
\i blz_20120305.sql

CREATE INDEX idx_bank_blzbankname
  ON bank (blz, bankname)
;

-- Beginn Für die vorhandenen Kunden eine Bankverbindung bauen

INSERT INTO bankverbindung (kunde_id, bankverbindung_nr, bank_id, kontonummer, iban)
 VALUES
 (1, 1, 2,  '1111111111', '100100101111111111'),
 (1, 2, 2,  '1111111112', '100100101111111112'),
 (2, 1, 35, '2222222221', '100601982222222221'),
 (3, 1, 35, '3333333331', '100601983333333331'),
 (4, 1, 90, '4444444441', '120700004444444441'),
 (5, 1, 90, '5555555551', '120700005555555551')
;
-- Ende Für die vorhandenen Kunden eine Bankverbindung bauen

-- Ende Bankimport

SELECT 'Ausschneiden mit LIMIT (Seite 175)' Hinweis;

SELECT blz, bankname FROM bank ORDER BY blz LIMIT 3;
SELECT
 blz, bankname
 FROM bank
 ORDER BY blz DESC
 LIMIT 1
;
-- Hier per Unterabfrage, da es mit Variablen in PostgreSQL nicht so einfach geht.
SELECT
 bankname
 FROM bank
 WHERE blz = (
  SELECT
   blz
   FROM bank
   ORDER BY blz DESC
   LIMIT 1   )
;

SELECT blz, bankname FROM bank ORDER BY blz LIMIT 2 OFFSET 1;
SELECT blz, bankname FROM bank ORDER BY blz LIMIT 1;
SELECT blz, bankname FROM bank ORDER BY blz LIMIT 1 OFFSET 0;  
\echo 'Ende listing07.sql //////////////////////////////////////////'
