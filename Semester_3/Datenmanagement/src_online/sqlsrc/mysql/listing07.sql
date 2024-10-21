-- Ausführen der vorherigen Befehle
SOURCE listing06.sql

SELECT 'Start listing07.sql //////////////////////////////////////////';

SELECT 'Ausdrücke (Seite 158)';

SELECT 5, 'Beginn der Auswertung';
SELECT -5, 9 + 4, 9 - 4, 9 * 4, 9 / 4, 9 DIV 4, 9 % 4, 9 MOD 4;
SELECT 3 * 4 DIV 3, (3 * 4) DIV 3, 3 * (4 DIV 3);
SELECT 9 / 0, 9 * NULL, SQRT(-5);

SELECT 'Zufallszahlen (Seite 160)';
SELECT RAND(1);
SELECT RAND(1);
SELECT RAND(1) FROM artikel;
-- FLOOR(a + RAND() * (b - a))

SELECT 'Variablen (Seite 161)';

SELECT POWER(2,8) INTO @x;
SELECT @x - 1;

-- SELECT 'Ungültiger Versuch: erwarte eine Fehlermeldung (Seite 161)';
-- SELECT einzelpreis FROM artikel INTO @y;

SET @artnr=3010;
SELECT * FROM artikel WHERE artikel_id=@artnr;


SELECT 'Spalten- und Zeilenwahl (Seite 162)';
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

SELECT 'Sortierung (Seite 163)';
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

DROP TABLE IF EXISTS wurstbrot;
SET NAMES cp850;
CREATE TEMPORARY TABLE wurstbrot ( name VARCHAR(255) CHARACTER SET 'cp850');
INSERT INTO wurstbrot
 VALUES
   ('winfried')
  ,('achim')
  ,('olga')
  ,('zechine')
  ,('ägidius')
;
SELECT * FROM wurstbrot ORDER BY name;

DROP TABLE IF EXISTS wurstbrot;
SET NAMES utf8;
CREATE TEMPORARY TABLE wurstbrot ( name VARCHAR(255) CHARACTER SET 'utf8');
INSERT INTO wurstbrot
 VALUES
   ('winfried')
  ,('achim')
  ,('olga')
  ,('zechine')
  ,('ägidius')
;
SELECT * FROM wurstbrot ORDER BY name;

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

DROP TABLE IF EXISTS wurstbrot;
CREATE TEMPORARY TABLE wurstbrot (name VARCHAR(255) BINARY);
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


SELECT
 bestellung_id, datum
 FROM bestellung
 ORDER BY datum;

SELECT
 bestellung_id, TIME(datum) Uhrzeit
 FROM bestellung
 ORDER BY uhrzeit; 
 
EXPLAIN SELECT * FROM kunde ORDER BY nachname, vorname\G
 
SELECT 'Mehrfachausgaben unterbinden (Seite 173)';

SELECT ort FROM adresse ORDER BY ort;
SELECT DISTINCT ort FROM adresse ORDER BY ort;
SELECT DISTINCT nachname FROM kunde ORDER BY nachname;

-- Start Bankimport
SELECT 'Bankdaten importieren (Seite 174)';
DROP TABLE IF EXISTS bank_import;
CREATE TEMPORARY TABLE bank_import (
 bankleitzahl    CHAR(8),
 bezeichnung     VARCHAR(255)
);

LOAD DATA LOCAL INFILE 'blz_20120305.csv'  -- Hier ggf. anpassen!
 INTO TABLE bank_import
 FIELDS
  TERMINATED BY ';'
 LINES
  TERMINATED BY '\n'
 IGNORE 1 LINES
 (bankleitzahl, @dummy, bezeichnung)
;
-- SELECT DISTINCT * FROM bank_import;
-- SELECT DISTINCT bankleitzahl FROM bank_import;
-- SELECT DISTINCT bankleitzahl, bezeichnung FROM bank_import;

ALTER TABLE bankverbindung
 DROP FOREIGN KEY bankverbindung_ibfk_1,
 DROP FOREIGN KEY bankverbindung_ibfk_2,
 DROP INDEX idx_bankverbindung_bankid_kontonummer,
 DROP PRIMARY KEY
;
ALTER TABLE bank
 DROP PRIMARY KEY
;

ALTER TABLE bank
 MODIFY bank_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 ADD    blz     CHAR(12) NOT NULL DEFAULT '' AFTER bank_id
;

ALTER TABLE bankverbindung
 MODIFY bank_id INT UNSIGNED,
 ADD PRIMARY KEY(kunde_id, bankverbindung_nr),
 ADD INDEX idx_bankverbindung_bankid_kontonummer (bank_id, kontonummer),
 ADD FOREIGN KEY (kunde_id)
  REFERENCES kunde(kunde_id)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT,
 ADD FOREIGN KEY (bank_id)
  REFERENCES bank(bank_id)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT
;

INSERT INTO bank (blz, bankname)
 SELECT DISTINCT bankleitzahl, bezeichnung FROM bank_import
;

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

SELECT 'Ausschneiden mit LIMIT (Seite 177)';
-- SELECT * FROM bank;
SELECT blz, bankname FROM bank ORDER BY blz LIMIT 3;
SELECT
 blz, bankname
 FROM bank
 ORDER BY blz DESC
 LIMIT 1
;
SELECT
 blz
 FROM bank
 ORDER BY blz DESC
 LIMIT 1
 INTO @blzmin
;
SELECT
 bankname
 FROM bank
 WHERE blz = @blzmin
;
SELECT blz, bankname FROM bank ORDER BY blz LIMIT 2 OFFSET 1;
SELECT blz, bankname FROM bank ORDER BY blz LIMIT 1;
SELECT blz, bankname FROM bank ORDER BY blz LIMIT 1 OFFSET 0;

SELECT 'CSV-Datei exportieren (Seite 180)';

-- SELECT
--  blz Bankleitzahl, bankname Bankname
--  INTO OUTFILE '/var/lib/mysql/interchange/bank.csv'
--   FIELDS
--    TERMINATED BY ';'
--    ENCLOSED BY '"'
--   LINES
--    TERMINATED BY '\r\n'
--  FROM
--   bank
--  ORDER BY
--   Bankleitzahl, Bankname;
SELECT 'Ende listing07.sql //////////////////////////////////////////';
