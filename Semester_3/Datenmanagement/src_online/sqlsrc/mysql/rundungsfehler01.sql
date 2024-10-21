-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS rundungsfehler01;
CREATE DATABASE rundungsfehler01;
USE rundungsfehler01;

-- Tabellen fuer die Testdaten
CREATE TABLE bla
(
  douSpalte FLOAT,
  decSpalte DECIMAL(30,15)
);
-- Ende Bereitstellung Testumgebung

-- Prozedur zum Aufbau der Testdaten
DELIMITER //
CREATE PROCEDURE testdaten(IN iAnzahl INT)
BEGIN
 DECLARE vAnzahl   INT DEFAULT 0;
 DECLARE douSpalte FLOAT;
 DECLARE decSpalte DECIMAL(10,4);

 SET douSpalte = 0.001;
 SET decSpalte = 0.001;
 WHILE vAnzahl < iAnzahl DO
  INSERT INTO bla VALUES(douSpalte, decSpalte);
  SET vAnzahl = 1 + vAnzahl;
 END WHILE;
END//
DELIMITER ;

-- Der Test
CALL testdaten(1000);  -- Erzeuge 1000 Testdaten
SELECT  SUM(douSpalte) 'FLOAT',  SUM(decSpalte) 'DECIMAL'  FROM bla ;

