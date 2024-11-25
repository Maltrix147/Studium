-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS perfDecimal01;
CREATE DATABASE perfDecimal01;
USE perfDecimal01;

-- Tabellen fuer die Testdaten
CREATE TABLE testdaten
(
  spalte_double  DOUBLE,
  spalte_decimal DECIMAL(30,15)
);

CREATE TABLE testdaten_quelle
(
  spalte_double  DOUBLE,
  spalte_decimal DECIMAL(30,15)
);

-- Tabelle fuer die Messergebnisse
CREATE TABLE messung
(
  anzahl_ds BIGINT  UNSIGNED,
  sekunden_double   DECIMAL(12,8),
  sekunden_decimal  DECIMAL(12,8)
);
-- ENDE Bereitstellen der Testumgebung

-- START Einfuegen von Testdaten
DELIMITER //
CREATE PROCEDURE testdaten_insert
(
 IN iAnzahl INT -- Anzahl der einzufuegenden Testdaten
)
BEGIN
 DECLARE vAnzahl   INT DEFAULT 0; -- Schleifenvariable
 DECLARE vDouble   DOUBLE;
 DECLARE vDecimal  DECIMAL(30,15);

 WHILE vAnzahl < iAnzahl DO       -- Schleifenbedingung
  SELECT RAND() * FLOOR(-10000 + (RAND() * 10000)) -- Zufallswert
   INTO vDecimal;
  SET vDouble = vDecimal;
  INSERT INTO testdaten_quelle VALUES(vDouble, vDecimal); -- Einfuegen
  SET vAnzahl = vAnzahl + 1;      -- Schleifeninkrement 
 END WHILE;
END//
DELIMITER ;
-- ENDE Einfuegen von Testdaten


-- Messung
DELIMITER //
CREATE PROCEDURE perfDecimal01
(
  IN iAnzahlNeueZeilen  INT,  -- Anzahl der neuen Datensaetze pro Messung
  IN iAnzahlSchleifen   INT   -- Anzahl der Messschleifen
)
BEGIN
 DECLARE vAnzahlSchleifen INT DEFAULT 0; -- Schleifenvariable
 DECLARE vSekundenDouble  DECIMAL(12,8); -- Zeitdauer
 DECLARE vSekundenDecimal DECIMAL(12,8); -- Zeitdauer
 DECLARE vAnzahlDS        BIGINT; -- Anzahl der Testdaten
 DECLARE vTmpDouble       DOUBLE; -- Hilfsvariable
 DECLARE vTmpDec          DECIMAL(30,15); -- Hilfsvariable

 TRUNCATE messung;          -- Alte Daten entfernen
 TRUNCATE testdaten;        -- Alte Daten entfernen
 TRUNCATE testdaten_quelle; -- Alte Daten entfernen

 SET PROFILING = 1;         -- Profiling einschalten 

 CALL testdaten_insert(iAnzahlNeueZeilen);  -- Testdatenquelle aufbauen
 WHILE vAnzahlSchleifen < iAnzahlSchleifen DO -- Hauptschleife
  SELECT 'Schleifendurchlauf ', vAnzahlSchleifen, ' von ', iAnzahlSchleifen;
  INSERT INTO testdaten SELECT * FROM testdaten_quelle; -- Testdaten erweitern
  -- START Messung DOUBLE
  SELECT SQL_NO_CACHE AVG(spalte_double)  FROM testdaten INTO vTmpDouble;
  SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
   GROUP BY query_id
   ORDER BY query_id DESC LIMIT 1
   INTO vSekundenDouble;
  -- ENDE Messung DOUBLE

  -- Start Messung DECIMAL
  SELECT SQL_NO_CACHE AVG(spalte_decimal) FROM testdaten INTO vTmpDec;
  SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
   GROUP BY query_id
   ORDER BY query_id DESC LIMIT 1
   INTO vSekundenDecimal;
-- Ende Messung DECIMAL

  -- Sichern der Ergebnisse
  SELECT COUNT(*) FROM testdaten INTO vAnzahlDS;
  INSERT INTO messung
    (anzahl_ds, sekunden_double, sekunden_decimal)
   VALUES
    (vAnzahlDS, vSekundenDouble, vSekundenDecimal);

  SET vAnzahlSchleifen = vAnzahlSchleifen + 1;
 END WHILE; -- Hauptschleifenende 

 SET PROFILING = 0;
END//
DELIMITER ;

-- CALL perfDecimal01(20000, 100);