-- Ausführen der vorherigen Befehle
\i listing04.sql

\echo 'Start listing05.sql //////////////////////////////////////////'

SELECT 'Aktuelle Schemaeinstellung (Seite 124)' Hinweis;
\l+ 

SELECT 'DATABASE loeschen (Seite 125)' Hinweis;
CREATE DATABASE wurstbrot;
\list+
DROP DATABASE wurstbrot;
\list+


-- Start Tabellen umbenennen
SELECT 'Tabellen umbenennen (Seite 128)' Hinweis;
DROP TABLE IF EXISTS wurstbrot;
\dt
ALTER TABLE adresse RENAME TO wurstbrot;
\dt
ALTER TABLE wurstbrot RENAME TO adresse;
-- Ende Tabellen umbenennen



-- Start Spalten verändern
SELECT 'Spalte hinzufügen (Seite 129)' Hinweis;
\d+ kunde
ALTER TABLE kunde
  ADD firmenname VARCHAR(255) NOT NULL DEFAULT ''
;
\d+ kunde

SELECT 'Spalte Datentyp aendern (Seite 131)' Hinweis;
-- Konvertierung geht in PostgreSQL nur unter Zuhilfenahme einer Funktion. 
-- Aus diesem Grunde verzichte ich hier auf die Darstellung der entsprechenden 
-- Konvertierungseffekte, da in den selbsterstellten Funktionen alle Fehlersituationen 
-- abgefangen werden können.
-- Hier ein nicht erklärtes, aber hoffentlich selbsterklärendes Beispiel.

CREATE OR REPLACE FUNCTION IntToBezahlarten(wert INT)
    RETURNS bezahlarten AS
 $BODY$
    SELECT CASE wert
        WHEN 1 THEN 'lastschrift'::bezahlarten
        WHEN 2 THEN 'rechnung'::bezahlarten
        WHEN 3 THEN 'kredit'::bezahlarten
        WHEN 4 THEN 'bar'::bezahlarten
        ELSE 'rechnung'::bezahlarten
    END;
 $BODY$
 IMMUTABLE STRICT LANGUAGE SQL 
;
ALTER TABLE kunde
  ALTER COLUMN bezahlart
   DROP DEFAULT
;
ALTER TABLE kunde
  ALTER COLUMN bezahlart
   SET DATA TYPE bezahlarten USING IntToBezahlarten(bezahlart)
;
ALTER TABLE kunde
  ALTER COLUMN bezahlart
   SET NOT NULL
;
ALTER TABLE kunde
  ALTER COLUMN bezahlart
   SET DEFAULT 'rechnung'::bezahlarten
;
DROP FUNCTION IF EXISTS IntToBezahlarten(int);
\d+ kunde

SELECT 'Spaltenlänge ändern (Seite 131' Hinweis;
DROP TABLE IF EXISTS bla ;
CREATE TEMPORARY TABLE bla (LIKE artikel);
INSERT INTO bla SELECT * FROM artikel;
-- Hinweis: siehe oben.
CREATE OR REPLACE FUNCTION Cut10(wert VARCHAR(255))
    RETURNS CHAR(10) AS
 $BODY$
    SELECT LEFT(wert, 10);
 $BODY$
 IMMUTABLE STRICT LANGUAGE SQL 
;
ALTER TABLE bla ALTER COLUMN bezeichnung SET DATA TYPE CHAR(10) USING Cut10(bezeichnung);
SELECT * FROM bla;
-- SHOW WARNINGS;
SELECT MAX(CHAR_LENGTH(bezeichnung)) FROM artikel;

SELECT 'Zeichen nach Zahl ändern (Seite 132)' Hinweis;
DROP TABLE IF EXISTS wurstbrot ;
CREATE TEMPORARY TABLE wurstbrot (LIKE adresse);
INSERT INTO wurstbrot SELECT * FROM adresse;
SELECT * FROM wurstbrot;
ALTER TABLE wurstbrot ALTER COLUMN plz SET DATA TYPE INT USING plz::int;
\d+ wurstbrot
SELECT * FROM wurstbrot;

ALTER TABLE wurstbrot DROP COLUMN plz;

-- Ende Spalten verändern

-- Start Tabellen löschen
-- DROP TABLE
--   rechnung_position
--  ,rechnung
--  ,bestellung_position
--  ,bestellung
-- ;
\dt
\echo 'Ende listing05.sql //////////////////////////////////////////'
