-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS indexSelektiv01;
CREATE DATABASE indexSelektiv01 CHARACTER SET utf8;

USE indexSelektiv01;

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


CREATE TABLE messung (
 laenge       INT UNSIGNED,
 selektiv     DOUBLE
);
-- Ende Bereitstellen der Testumgebung


DELIMITER //
CREATE PROCEDURE indexSelektiv01()
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
-- CALL indexSelektiv01();

