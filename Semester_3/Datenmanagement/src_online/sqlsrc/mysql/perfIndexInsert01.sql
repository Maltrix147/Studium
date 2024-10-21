-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS perfIndexInsert01;
CREATE DATABASE perfIndexInsert01 CHARACTER SET utf8;

USE perfIndexInsert01;

-- Tabellen fuer die Testdaten
CREATE TABLE testdaten
(
 blz CHAR(8),  merkmal char(1),  bezeichnung varchar(255),
 plz char(5),  ort varchar(255),  kurz varchar(255),
 pan char(5),  bic varchar(255),  sm char(2),
 ds char(6),  kz char(1),  blzl char(1),  blzn char(8)
) Engine=MyISAM;

-- Einlesen der Bankdaten
LOAD DATA INFILE '/home/ralf/daten/privat/Buch/src/blz_20120305.csv'
 INTO TABLE testdaten
 FIELDS TERMINATED BY ';'
 LINES TERMINATED BY '\n'
;

CREATE TABLE bank_ohne
(
 blz CHAR(8),  merkmal char(1),  bezeichnung varchar(255),
 plz char(5),  ort varchar(255),  kurz varchar(255),
 pan char(5),  bic varchar(255),  sm char(2),
 ds char(6),  kz char(1),  blzl char(1),  blzn char(8)
) Engine=MyISAM;

CREATE TABLE bank_mit
(
 blz CHAR(8),  merkmal char(1),  bezeichnung varchar(255),
 plz char(5),  ort varchar(255),  kurz varchar(255),
 pan char(5),  bic varchar(255),  sm char(2),
 ds char(6),  kz char(1),  blzl char(1),  blzn char(8)
) Engine=MyISAM;

CREATE INDEX idx_bankmit_bzeichnung ON bank_mit(bezeichnung);
CREATE INDEX idx_bankmit_plzortblz ON bank_mit(plz, ort, blz);

-- Tabelle fuer die Messergebnisse
CREATE TABLE messung
(
  anzahl_ds BIGINT  UNSIGNED,
  sekunden_mitindex  DECIMAL(12,8),
  sekunden_ohneindex DECIMAL(12,8)
);
-- ENDE Bereitstellen der Testumgebung


-- Prozedur kopieren der Testdaten
DELIMITER //
CREATE PROCEDURE kopiere
(
  IN iName VARCHAR(255),
  OUT oSekunden DECIMAL(12,8)  -- Ein OUT Parameter!
)
BEGIN
 CASE iName
  WHEN 'bank_ohne' THEN
   INSERT INTO bank_ohne SELECT SQL_NO_CACHE * FROM testdaten;
  WHEN 'bank_mit' THEN
   INSERT INTO bank_mit  SELECT SQL_NO_CACHE * FROM testdaten;
 END CASE;
 SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
  GROUP BY query_id
  ORDER BY query_id DESC LIMIT 1
  INTO oSekunden;              -- Ergebnis in den OUT-Parameter
END//
DELIMITER ;


-- Testprozedur
DELIMITER //
CREATE PROCEDURE perfIndexInsert01
(
 IN iAnzahlSchleifen INT UNSIGNED
)
BEGIN
 DECLARE vAnzahlSchleifen   INT DEFAULT 0;
 DECLARE vSekundenMitIndex  DECIMAL(12,8); -- Zeitdauer
 DECLARE vSekundenOhneIndex DECIMAL(12,8); -- Zeitdauer
 DECLARE vAnzahlDS          BIGINT;
 
 TRUNCATE messung;
 TRUNCATE bank_mit;
 TRUNCATE bank_ohne;

 SET PROFILING = ON;         -- Profiling einschalten

 SET vAnzahlSchleifen = 0;
 -- Hauptschleife
 WHILE vAnzahlSchleifen < iAnzahlSchleifen DO
  SELECT 'Durchlauf ', vAnzahlSchleifen, ' von ', iAnzahlSchleifen;

  -- START Messung
  CALL kopiere('bank_ohne', vSekundenOhneIndex);
  CALL kopiere('bank_mit', vSekundenMitIndex);
  -- Ende Messung

  -- Sichern der Messergebnisse
  SELECT COUNT(*) FROM bank_ohne INTO vAnzahlDS;
    INSERT INTO messung
    (anzahl_ds, sekunden_mitindex, sekunden_ohneindex)
   VALUES
    (vAnzahlDS, vSekundenMitIndex, vSekundenOhneIndex);

  SET vAnzahlSchleifen = 1 + vAnzahlSchleifen;
 END WHILE;

 SET PROFILING = OFF;         -- Profiling ausschalten

 END//
DELIMITER ;

-- CALL perfIndexInsert01(50);
