-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS perfIndexMitOhne02;
CREATE DATABASE perfIndexMitOhne02 CHARACTER SET utf8;

USE perfIndexMitOhne02;

-- Tabelle fuer die Testdaten
CREATE TABLE bank
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
 blzn         CHAR(8),
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
)
;

CREATE TABLE testdaten
(
 bezeichnung_mit  VARCHAR(255),
 bezeichnung_ohne VARCHAR(255)
);

CREATE INDEX idx_testdaten ON testdaten(bezeichnung_mit);

-- Tabelle fuer die Messergebnisse
CREATE TABLE messung
(
  anzahl_ds BIGINT  UNSIGNED,
  sekunden_mitindex  DECIMAL(12,8),
  sekunden_ohneindex DECIMAL(12,8)
);

-- Einlesen der Bankdaten
SELECT 'LOAD DATA';
LOAD DATA INFILE '/home/ralf/daten/privat/Buch/src/blz_20120305.csv'
 INTO TABLE bank
 FIELDS TERMINATED BY ';'
 LINES TERMINATED BY '\n'
;
-- ENDE Bereitstellen der Testumgebung

DELIMITER //
CREATE PROCEDURE testdaten_insert
(
 iAnzahl INT
)
BEGIN
 DECLARE vAnzahl INT;
 DECLARE vCount INT;
 DECLARE vId INT UNSIGNED;

 SELECT COUNT(*) FROM bank INTO vCount;
 SET vAnzahl = 0;
 WHILE vAnzahl < iAnzahl DO
  SET vId = FLOOR(RAND() * vCount);
  INSERT INTO testdaten (bezeichnung_mit, bezeichnung_ohne)
   SELECT bezeichnung, bezeichnung FROM bank WHERE id = vId;
  SET vAnzahl = vAnzahl + 1;
 END WHILE;
 END//
DELIMITER ;



-- Messung
DELIMITER //
CREATE PROCEDURE perfIndexMitOhne02
(
  IN iAnzahlNeueZeilen INT, -- Anzahl der Testdatensaetze
  IN iAnzahlSchleifen  INT  -- Anzahl der Messungen
)
BEGIN
 DECLARE vAnzahlSchleifen   INT DEFAULT 0;
 DECLARE vSekundenMitIndex  DECIMAL(12,8); -- Zeitdauer
 DECLARE vSekundenOhneIndex DECIMAL(12,8); -- Zeitdauer
 DECLARE vAnzahlDS          BIGINT;
 DECLARE vTmp               VARCHAR(255);

 TRUNCATE messung;
 TRUNCATE testdaten;

 SET PROFILING = ON;         -- Profiling einschalten

 WHILE vAnzahlSchleifen < iAnzahlSchleifen DO -- Hauptschleife
  SELECT 'Schleifendurchlauf ', vAnzahlSchleifen, ' von ', iAnzahlSchleifen;
  CALL testdaten_insert(iAnzahlNeueZeilen);  -- Testdatenquelle aufbauen

  -- START Messung mit Index
  SELECT SQL_NO_CACHE COUNT(*)     -- Testquery
   FROM testdaten
   WHERE bezeichnung_mit = 'ABC'
   INTO vTmp;
  SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
   GROUP BY query_id
   ORDER BY query_id DESC LIMIT 1
   INTO vSekundenMitIndex;
  -- ENDE Messung mit Index

  -- START Messung ohne Index
  SELECT SQL_NO_CACHE COUNT(*)     -- Testquery
   FROM testdaten
   WHERE bezeichnung_ohne = 'ABC'
   INTO vTmp;
  SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
   GROUP BY query_id
   ORDER BY query_id DESC LIMIT 1
   INTO vSekundenOhneIndex;
  -- ENDE Messung ohne Index

  -- Messung
  -- Sichern der Ergebnisse
  SELECT COUNT(*) FROM testdaten INTO vAnzahlDS;
  INSERT INTO messung
    (anzahl_ds, sekunden_mitindex, sekunden_ohneindex)
   VALUES
    (vAnzahlDS, vSekundenMitIndex, vSekundenOhneIndex);

    SET vAnzahlSchleifen = vAnzahlSchleifen + 1;
 END WHILE; -- Hauptschleifenende

SET PROFILING = OFF;         -- Profiling ausschalten
END//
DELIMITER ;


-- CALL perfindex(50000, 100);
-- SELECT * FROM messung INTO OUTFILE 'perf_index_such_mit1.csv' FIELDS TERMINATED BY ';';
