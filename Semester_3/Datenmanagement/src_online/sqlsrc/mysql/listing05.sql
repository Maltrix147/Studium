-- Ausführen der vorherigen Befehle
SOURCE listing04.sql

SELECT 'Start listing05.sql //////////////////////////////////////////';

SELECT 'Aktuelle Datenbankeinstellung (Seite 126)';
SHOW CREATE DATABASE oshop\G

SELECT 'DATABASE löschen (Seite 127)';
CREATE DATABASE wurstbrot;
SHOW DATABASES;
DROP DATABASE wurstbrot;
SHOW DATABASES;


-- Start Tabellen umbenennen
SELECT 'Tabellen umbenennen (Seite 130)';
DROP TABLE IF EXISTS wurstbrot;
SHOW TABLES;
ALTER TABLE adresse RENAME TO wurstbrot;
SHOW TABLES;
SHOW CREATE TABLE kunde\G
ALTER TABLE wurstbrot RENAME TO adresse;
-- Ende Tabellen umbenennen


-- Start Spalten verändern
SELECT 'Spalte hinzufügen (Seite 131)';
DESCRIBE kunde;
ALTER TABLE kunde
  ADD firmenname VARCHAR(255) NOT NULL DEFAULT '' AFTER vorname
;
DESCRIBE kunde;

SELECT 'Spalte Datentyp ändern (Seite 133)';
ALTER TABLE kunde
  MODIFY
   bezahlart ENUM('rechnung', 'bankeinzug', 'nachname') DEFAULT 'rechnung'
;
DESCRIBE kunde;

SELECT 'Spaltenlänge ändern (Seite 133)';
DROP TABLE IF EXISTS bla ;
CREATE TEMPORARY TABLE bla LIKE artikel;
INSERT INTO bla SELECT * FROM artikel;
-- ALTER TABLE bla MODIFY bezeichnung CHAR(10);
SELECT MAX(CHAR_LENGTH(bezeichnung)) FROM artikel;

SELECT 'Zeichen nach Zahl ändern (Seite 134)';
DROP TABLE IF EXISTS wurstbrot ;
CREATE TEMPORARY TABLE wurstbrot LIKE adresse;
INSERT INTO wurstbrot SELECT * FROM adresse;
SELECT * FROM wurstbrot;
ALTER TABLE wurstbrot MODIFY plz INT;
SELECT * FROM wurstbrot;

-- ALTER TABLE wurstbrot MODIFY plz TINYINT;
-- ALTER TABLE wurstbrot MODIFY hnr INT;
-- ELECT * FROM wurstbrot;

SELECT 'Datum- und Zeitspalten ändern (Seite 136)';
DROP TABLE IF EXISTS wurstbrot ;
CREATE TEMPORARY TABLE wurstbrot
(
  a DATETIME,
  b TIME,
  c YEAR
);

INSERT INTO wurstbrot (a, b, c)
 VALUES ('2012-03-24 14:57:00', '14:57:00', '2012')
;

ALTER TABLE wurstbrot
 MODIFY a BIGINT,
 MODIFY b BIGINT,
 MODIFY c BIGINT
;
SELECT * FROM wurstbrot;

ALTER TABLE wurstbrot
 MODIFY a DATETIME,
 MODIFY b TIME,
 MODIFY c YEAR
;
SELECT * FROM wurstbrot;

ALTER TABLE wurstbrot
 MODIFY a VARCHAR(255),
 MODIFY b VARCHAR(255),
 MODIFY c VARCHAR(255)
;
SELECT * FROM wurstbrot;

ALTER TABLE wurstbrot
 MODIFY a DATETIME,
 MODIFY b TIME,
 MODIFY c YEAR
;
SELECT * FROM wurstbrot;

SELECT 'Spalten löschen (Seite 137)';
DROP TABLE IF EXISTS wurstbrot;
CREATE TEMPORARY TABLE wurstbrot AS SELECT * FROM adresse;
DESCRIBE wurstbrot;
ALTER TABLE wurstbrot
 DROP deleted,
 DROP strasse,
 DROP ort
;
DESCRIBE wurstbrot;

-- Ende Spalten verändern

-- Start Tabellen löschen
SELECT 'Tabelle löschen (Seite 139)';
SHOW TABLES;
-- DROP TABLE
--   rechnung_position
--  ,rechnung
--  ,bestellung_position
--  ,bestellung
-- ;
SHOW TABLES;
-- Ende Tabellen löschen
SELECT 'Ende listing05.sql //////////////////////////////////////////';
