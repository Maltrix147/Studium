-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS perfCursor01;
CREATE DATABASE perfCursor01 CHARACTER SET utf8;

USE perfCursor01;

CREATE TABLE testdaten
(
 blz CHAR(8),  merkmal char(1),  bezeichnung varchar(255),
 plz char(5),  ort varchar(255),  kurz varchar(255),
 pan char(5),  bic varchar(255),  sm char(2),
 ds char(6),  kz char(1),  blzl char(1),  blzn char(8)
);

LOAD DATA INFILE 'blz_20120305.csv'
 INTO TABLE testdaten
 FIELDS TERMINATED BY ';'
 LINES TERMINATED BY '\n'
;


-- Tabelle fuer die Messergebnisse
CREATE TABLE messung
(
  anzahl_ds BIGINT  UNSIGNED,
  sekunden_ohne   DECIMAL(12,8),
  sekunden_mit  DECIMAL(12,8)
);
-- Ende Testumgebung
-- Ende Bereitstellen der Testumgebung

-- Ermitteln des Verbrauchs der letzten Aktion
DELIMITER //
CREATE PROCEDURE dauer
(
  OUT oSekunden DECIMAL(12,8)
)
BEGIN
 SELECT SUM(DURATION) FROM INFORMATION_SCHEMA.PROFILING
  GROUP BY query_id
  ORDER BY query_id DESC LIMIT 1
  INTO oSekunden;
 END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE perfCursor01()
 BEGIN

 DECLARE vLaengeAkt   INT UNSIGNED; -- Schleifenvariable
 DECLARE vLaengeMax   INT UNSIGNED; -- Maximale Stringlaenge
 DECLARE vSelektiv    DOUBLE;       -- Gemessene Seletivitaet
 DECLARE vAnzahl      INT UNSIGNED; -- Anzahl der Testdaten

 -- Testdatenanzahl ermitteln
 SELECT COUNT(*) FROM testdaten INTO vAnzahl;
 -- Maximale Stringlaenge ermitteln
 SELECT MAX(LENGTH(bezeichnung)) FROM testdaten INTO vLaengeMax;

 -- Hauptschleife
 SET vLaengeAkt = 1;
 WHILE vLaengeAkt <= vLaengeMax DO
  -- Messung der Seletivitaet
  SELECT COUNT(DISTINCT LEFT(bezeichnung, vLaengeAkt)) / vAnzahl
   FROM testdaten INTO vSelektiv;

  -- Speichern der Messung
  INSERT INTO messung(laenge, selektiv) VALUES (vLaengeAkt, vSelektiv);
  SELECT 'Laenge ', vLaengeAkt, ' von ', vLaengeMax, ' mit ', vSelektiv;

  SET vLaengeAkt = 1 + vLaengeAkt;
 END WHILE;
END//
DELIMITER ;
-- CALL perfCursor01();

