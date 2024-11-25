-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS perfNotNull01;
CREATE DATABASE perfNotNull01;
USE perfNotNull01;

-- Tabelle fuer die Testdaten
CREATE TABLE testdaten
(
  spalte_notnull VARCHAR(255) NOT NULL DEFAULT '',
  spalte_null    VARCHAR(255) NULL
);

CREATE TABLE testdaten_quelle
(
  spalte_notnull VARCHAR(255) NOT NULL DEFAULT '',
  spalte_null    VARCHAR(255) NULL
);

-- Tabelle fuer die Messergebnisse
CREATE TABLE messung
(
  anzahl_ds BIGINT  UNSIGNED,
  sekunden_notnull  DECIMAL(12,8),
  sekunden_null     DECIMAL(12,8)
);
-- ENDE Bereitstellen der Testumgebung

-- Einfuegen von Testdaten
-- START Einfuegen von Testdaten
DELIMITER //
CREATE PROCEDURE testdaten_insert
(
 IN iAnzahl INT -- Anzahl der einzufuegenden Testdaten
)
BEGIN
 DECLARE vAnzahl INT DEFAULT 0;  -- Schleifenvariable

 WHILE vAnzahl < iAnzahl DO      -- Schleifenbedingung
  INSERT INTO testdaten_quelle VALUES('', NULL);
  SET vAnzahl = vAnzahl + 1;     -- Schleifeninkrement
 END WHILE;
END//
DELIMITER ;
-- ENDE Einfuegen von Testdaten


-- Messung
DELIMITER //
CREATE PROCEDURE perfNotNull01
(
  IN iAnzahlNeueZeilen INT, -- Anzahl der Testdatensautze
  IN iAnzahlSchleifen  INT  -- Anzahl der Messungen
)
BEGIN
 DECLARE vAnzahlSchleifen   INT DEFAULT 0;
 DECLARE vSekundenNotNull   DECIMAL(12,8); -- Zeitdauer
 DECLARE vSekundenNull      DECIMAL(12,8); -- Zeitdauer
 DECLARE vAnzahlDS          BIGINT;
 DECLARE vTmp               VARCHAR(255);

 TRUNCATE messung;
 TRUNCATE testdaten;
 TRUNCATE testdaten_quelle;

 SET PROFILING = ON;         -- Profiling einschalten

 CALL testdaten_insert(iAnzahlNeueZeilen);  -- Testdatenquelle aufbauen

 WHILE vAnzahlSchleifen < iAnzahlSchleifen DO -- Hauptschleife
  SELECT 'Schleifendurchlauf ', vAnzahlSchleifen, ' von ', iAnzahlSchleifen;
  INSERT INTO testdaten SELECT * FROM testdaten_quelle; -- Testdaten erweitern

  -- START Messung NULL
  SELECT SQL_NO_CACHE COUNT(*)     -- Testquery
   FROM testdaten
   WHERE spalte_null IS NULL INTO vTmp;
  SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
   GROUP BY query_id
   ORDER BY query_id DESC LIMIT 1
   INTO vSekundenNull;
  -- ENDE Messung NULL

  -- START Messung NOT NULL
  SELECT SQL_NO_CACHE COUNT(*)     -- Testquery
   FROM testdaten
   WHERE spalte_notnull = '' INTO vTmp;
  SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
   GROUP BY query_id
   ORDER BY query_id DESC LIMIT 1
   INTO vSekundenNotNull;
  -- ENDE Messung NOT NULL

  -- Messung
  -- Sichern der Ergebnisse
  SELECT COUNT(*) FROM testdaten INTO vAnzahlDS;
  INSERT INTO messung
    (anzahl_ds, sekunden_notnull, sekunden_null)
   VALUES
    (vAnzahlDS, vSekundenNotNull, vSekundenNull);

    SET vAnzahlSchleifen = vAnzahlSchleifen + 1;
 END WHILE; -- Hauptschleifenende

SET PROFILING = OFF;         -- Profiling ausschalten
END//
DELIMITER ;

-- CALL perfNotNull01(10000, 1000);

