-- Ausführen der vorherigen Befehle
SOURCE listing15.sql

SELECT 'Start listing16.sql //////////////////////////////////////////';

-- Start Prozedur insert_artikel Version 1
SELECT 'Prozedur insert_artikel Version 1 (Seite 337)';
DELIMITER //
CREATE PROCEDURE insert_artikel
(
 IN iArtikelname VARCHAR(255),
 IN iWarengruppe VARCHAR(255)
)

BEGIN

 DECLARE v_artikel_id     INT DEFAULT 0;
 DECLARE v_warengruppe_id INT DEFAULT 0;


 INSERT INTO artikel
  (bezeichnung)
  VALUES (iArtikelname);

 SET v_artikel_id = LAST_INSERT_ID();       -- Variable setzen

 SELECT warengruppe_id
  FROM warengruppe
  WHERE bezeichnung = iWarengruppe
  INTO v_warengruppe_id;                    -- Oder so 

 INSERT INTO artikel_nm_warengruppe         -- Eintrag Hilfstabelle
  (warengruppe_id, artikel_id)
  VALUES
   (v_warengruppe_id, v_artikel_id);

END//                                       -- Anderer DELIMITER
DELIMITER ;
-- Start Prozedur insert_artikel Version 1 §\autopageref{lst16_003}§
CALL insert_artikel ('Schlauch', 'Gartenbedarf');
SELECT artikel_id, bezeichnung FROM artikel ORDER BY artikel_id;
SELECT warengruppe_id, bezeichnung FROM warengruppe;
SELECT * FROM artikel_nm_warengruppe;
SHOW PROCEDURE STATUS\G

-- SELECT 'Verzweigung. Erwarte eine Fehlermeldung (Seite 339) ';
-- CALL insert_artikel ('Fleischwurst', 'Lebensmittel');

-- Start Prozedur insert_artikel Version 2 (Seite 340)
DROP PROCEDURE IF EXISTS insert_artikel;

DELIMITER //
CREATE PROCEDURE insert_artikel
(
 IN iArtikelname VARCHAR(255),
 IN iWarengruppe VARCHAR(255)
)

BEGIN

 DECLARE v_artikel_id      INT DEFAULT -1;
 DECLARE v_warengruppe_id  INT DEFAULT -1;
 DECLARE v_count_zuordnung INT DEFAULT 0;

 -- Teste, ob Warengruppe vorhanden ist
 SELECT warengruppe_id
  FROM warengruppe
  WHERE bezeichnung = iWarengruppe
  INTO v_warengruppe_id;

 -- Wenn nein, fuege eine ein
 IF v_warengruppe_id < 0 THEN               -- Einfache Verzweigung
  INSERT INTO warengruppe (bezeichnung) VALUES (iWarengruppe);
  SET v_warengruppe_id = LAST_INSERT_ID();
 END IF;

 -- Teste, ob artikel vorhanden ist
 SELECT artikel_id
  FROM artikel
  WHERE bezeichnung = iArtikelname
  INTO v_artikel_id;

 -- Wenn nein, teste auf fuege ein
 IF v_artikel_id < 0 THEN
  INSERT INTO artikel (bezeichnung) VALUES (iArtikelname);
  SET v_artikel_id = LAST_INSERT_ID();
 END IF;

 -- Test, ob Zuordnung schon vorhanden
 SELECT COUNT(*)
  FROM artikel_nm_warengruppe
  WHERE artikel_id = v_artikel_id AND warengruppe_id = v_warengruppe_id
  INTO v_count_zuordnung;

 -- Wenn nein, fuege eine hinzu
 IF v_count_zuordnung <= 0 THEN
 INSERT INTO artikel_nm_warengruppe
  (warengruppe_id, artikel_id)
  VALUES
   (v_warengruppe_id, v_artikel_id);
 ELSE
  SELECT 'Zuordnung schon vorhanden';       -- Hinweis 
 END IF;
END//
DELIMITER ;
-- Ende Prozedur insert_artikel Version 2
CALL insert_artikel ('Fleischwurst', 'Lebensmittel');
CALL insert_artikel ('Fleischwurst', 'Lebensmittel');

SELECT 'Mehrfachverzweigung (Seite 342)';
-- Start Prozedur Umsatzreport
DELIMITER //
CREATE PROCEDURE umsatzreport
(
 IN iZeitraum INT
)
BEGIN
 DROP TABLE IF EXISTS umsatzzahlen;

 CASE iZeitraum
  WHEN 1 THEN     -- Total
   CREATE TABLE umsatzzahlen
    SELECT 'Total', SUM(einzelpreis * menge) `Umsatz`
     FROM
      rechnung_position INNER JOIN artikel USING (artikel_id)
                        INNER JOIN rechnung USING (rechnung_id)
   ;
  WHEN 2 THEN     -- Pro Jahr
   CREATE TABLE umsatzzahlen
    SELECT YEAR(datum) `Jahr`, SUM(einzelpreis * menge) `Umsatz`
     FROM
      rechnung_position INNER JOIN artikel USING (artikel_id)
                        INNER JOIN rechnung USING (rechnung_id)
     GROUP BY `Jahr`
     ORDER BY `Jahr` DESC
   ;
  WHEN 3 THEN    -- Pro Monat
   CREATE TABLE umsatzzahlen
    SELECT YEAR(datum) `Jahr`, MONTH(datum) `Monat`, SUM(einzelpreis * menge) `Umsatz`
     FROM
      rechnung_position INNER JOIN artikel USING (artikel_id)
                        INNER JOIN rechnung USING (rechnung_id)
     GROUP BY `Jahr`, `Monat`
     ORDER BY `Jahr` DESC, `Monat` DESC
   ;
  ELSE           -- Sowas sollte es immer geben
   CREATE TABLE umsatzzahlen
    SELECT 'Unbekannte Berichtsart', iZeitraum;
  END CASE;
END//
DELIMITER ;
-- Ende Prozedur Umsatzreport
CALL umsatzreport(1); SELECT * FROM umsatzzahlen;
CALL umsatzreport(2); SELECT * FROM umsatzzahlen;
CALL umsatzreport(3); SELECT * FROM umsatzzahlen;
CALL umsatzreport(0); SELECT * FROM umsatzzahlen;

-- Start Prozedur b (Seite 344)
DELIMITER //
CREATE PROCEDURE b()
BEGIN
 DECLARE vZeitraum INT ;
 SET vZeitraum = 2;
 CASE
  WHEN vZeitraum = 2 THEN SELECT 'A';
  WHEN vZeitraum > 0 THEN SELECT 'B';
  WHEN vZeitraum < 2 THEN SELECT 'C';
  END CASE;
END//
DELIMITER ;

CALL b();
-- Ende Prozedur b

SELECT 'Schleifen (Seite 346)';
-- Start Prozedur warte_auf_ueberlauf
DELIMITER //
CREATE PROCEDURE warte_auf_ueberlauf()
BEGIN
 DECLARE vInt TINYINT;

 SET vInt = 0;
 LOOP                  -- Schleifenstart
  SELECT vInt;
  SET vInt = vInt + 1;
 END LOOP;             -- Schleifenende
END;
//
DELIMITER ;

-- CALL  warte_auf_ueberlauf();
-- Ende Prozedur warte_auf_ueberlauf

-- Start Prozedur min_max
DELIMITER //
CREATE PROCEDURE min_max()
BEGIN
 DECLARE vInt TINYINT;
 DECLARE vMin INT;
 DECLARE vMax INT;

 SET vInt = 0;
 maxsuche: LOOP            -- Jetzt mit Label
  SET vMax = vInt;
  SET vInt = vInt + 1;
  IF vMax = vInt THEN
   LEAVE maxsuche;         -- Verlasse Label
  END IF;
 END LOOP maxsuche;

 SET vInt = 0;
 minsuche: LOOP
  SET vMin = vInt;
  SET vInt = vInt - 1;
  IF vMin = vInt THEN
   LEAVE minsuche;
  END IF;
 END LOOP minsuche;

 SELECT 'MIN = ', vMin, 'MAX = ', vMax;
END;
//
DELIMITER ;
CALL min_max();
-- Ende Prozedur min_max

-- Start Prozedur Sieb (Seite 348)
DELIMITER //
CREATE PROCEDURE sieb
(
 iGrenze BIGINT UNSIGNED
)
BEGIN
 DECLARE vZahl BIGINT UNSIGNED DEFAULT 2;      -- Start mit 2
 DECLARE vPosition BIGINT UNSIGNED DEFAULT 2;

 -- Aufbau der Tabelle
 DROP TABLE IF EXISTS zahlenstrahl;
 CREATE TABLE zahlenstrahl
 (
  position BIGINT UNSIGNED,
  zahl BIGINT UNSIGNED,
  PRIMARY KEY(position)
 );

 WHILE vZahl <= iGrenze DO
  INSERT INTO zahlenstrahl VALUES (vZahl, vZahl);
  SET vZahl = vZahl + 1;
 END WHILE;

-- Sieb
 WHILE vPosition < CEILING(SQRT(iGrenze)) DO
  SELECT zahl FROM zahlenstrahl WHERE position = vPosition INTO vZahl;
  IF vZahl > 0 THEN
   UPDATE zahlenstrahl SET zahl = 0 WHERE (position > vPosition) AND (zahl % vZahl = 0);
  END IF;
  SET vPosition = vPosition + 1;
 END WHILE;


-- Bereinigen der Tabelle
DELETE FROM zahlenstrahl WHERE zahl = 0;
END//
DELIMITER ;
CALL sieb(20);
SELECT zahl FROM zahlenstrahl ORDER BY zahl;
-- Ende Prozedur Sieb

-- Start Prozedur kopiere_blz (349)
DROP DATABASE IF EXISTS tmpSchleife;
CREATE DATABASE tmpSchleife CHARACTER SET utf8;

USE tmpSchleife;

CREATE TABLE bank_quelle
(
 blz          CHAR(8),
 merkmal      CHAR(1),
 bezeichnung  VARCHAR(255),
 plz          CHAR(5),
 ort          VARCHAR(255),
 kurz         VARCHAR(255),
 pan          CHAR(5),
 bic          VARCHAR(255),
 sm           CHAR(2),
 ds           CHAR(6),
 kz           CHAR(1),
 blzl         CHAR(1),
 blzn         CHAR(8)
)
;

LOAD DATA LOCAL INFILE 'blz_20120305.csv'
 INTO TABLE bank_quelle
 FIELDS TERMINATED BY ';'
 LINES TERMINATED BY '\n'
;
CREATE TABLE bank_ziel
(
 blz          CHAR(8),
 bezeichnung  VARCHAR(255),
 adresse      TEXT
)
;

DELIMITER //
CREATE PROCEDURE kopiere_blz
(
 iAnzahl INT UNSIGNED               -- Anzahl der Zeilen pro Kopiervorgang
)
BEGIN
 DECLARE vOffset INT UNSIGNED;      -- Aktueller Startpunkt
 DECLARE vCount  INT UNSIGNED;      -- Anzahl der zu kopierenden Zeilen

 SELECT COUNT(*) FROM bank_quelle INTO vCount;

 SET vOffset = 0;
 WHILE vOffset < vCount DO          -- Start der Schleife
  SELECT 'vOffset ', vOffset;       -- Nur zum gucken

  INSERT INTO bank_ziel (blz, bezeichnung, adresse)
   SELECT blz, bezeichnung, CONCAT(plz, ' ', ort)
    FROM bank_quelle
    LIMIT vOffset, iAnzahl;
  SET vOffset = vOffset + iAnzahl;   -- Neuer Startwert
 END WHILE;                          -- Ende der Schleife
END//
DELIMITER ;

CALL kopiere_blz(1000);
USE oshop;
-- Ende Prozedur kopiere_blz

-- Start Prozedur ggt (351)
DELIMITER //
CREATE PROCEDURE ggt
(
 iZahl1 INT UNSIGNED,
 iZahl2 INT UNSIGNED
)
BEGIN
 SET @m = iZahl1;      -- Deklaration durch
 SET @n = iZahl2;      -- eine Zuweisung

 REPEAT                   -- Schleifenstart
  SET @t = @m % @n;
  SET @m = @n;
  SET @n = @t;
 UNTIL @n = 0 END REPEAT; -- Schleifenende

 SELECT CONCAT('GGT(',iZahl1,', ',iZahl2,') = ') `GgT()`, @m;
END//
DELIMITER ;

CALL ggt(20, 15);
-- Ende Prozedur ggt

SELECT 'Transaktion innerhalb einer Prozedur (Seite 352)';
-- Start Prozedur insert_artikel Version 3
DROP PROCEDURE insert_artikel;

DELIMITER //
CREATE PROCEDURE insert_artikel
(
 IN iArtikelname VARCHAR(255),
 IN iWarengruppe VARCHAR(255)
)

BEGIN
 DECLARE v_artikel_id      INT DEFAULT -1;
 DECLARE v_warengruppe_id  INT DEFAULT -1;
 DECLARE v_count_zuordnung INT DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION   -- Handle fuer Fehler
  BEGIN
   SELECT 'Wegen Fehler ROLLBACK';
   ROLLBACK;
 END;

 START TRANSACTION;

 -- Teste, ob Warengruppe vorhanden ist
 SELECT warengruppe_id
  FROM warengruppe
  WHERE bezeichnung = iWarengruppe
  INTO v_warengruppe_id;

 -- Wenn nein, fuege eine ein
 IF v_warengruppe_id < 0 THEN               -- Einfache Verzweigung
  INSERT INTO warengruppe (bezeichnung) VALUES (iWarengruppe);
  SET v_warengruppe_id = LAST_INSERT_ID();
 END IF;

 -- Teste, ob artikel vorhanden ist
 SELECT artikel_id
  FROM artikel
  WHERE bezeichnung = iArtikelname
  INTO v_artikel_id;

 -- Wenn nein, teste auf fuege ein
 IF v_artikel_id < 0 THEN
  INSERT INTO artikel (bezeichnung) VALUES (iArtikelname);
  SET v_artikel_id = LAST_INSERT_ID();
 END IF;

 -- Test, ob Zuordnung schon vorhanden
 SELECT COUNT(*)
  FROM artikel_nm_warengruppe
  WHERE artikel_id = v_artikel_id AND warengruppe_id = v_warengruppe_id
  INTO v_count_zuordnung;

 -- Wenn nein, fuege eine hinzu
 IF v_count_zuordnung <= 0 THEN
 INSERT INTO artikel_nm_warengruppe
  (warengruppe_id, artikel_id)
  VALUES
   (v_warengruppe_id, v_artikel_id);
 ELSE
  SELECT 'Zuordnung schon vorhanden';       -- Hinweis 
 END IF;

 COMMIT;

END//
DELIMITER ;
-- Ende Prozedur insert_artikel Version 3

SELECT 'Cursor (Seite 356)';
-- Start import mit CURSOR
SOURCE importMitCursor01.sql;
SELECT bestellung_id, kunde_id, adresse_id, datum, status FROM tmp_bestellung;
SELECT bestellung_id, position_nr, artikel_id, menge, position_id FROM tmp_position;
CALL importBestellung();
SELECT * FROM bestellung;
SELECT * from bestellung_position;
-- Ende import mit CURSOR


SELECT 'Ende listing16.sql //////////////////////////////////////////';
