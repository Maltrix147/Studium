-- START Bereitstellen der Testumgebung
DROP DATABASE IF EXISTS perfIndexOrderBy01;
CREATE DATABASE perfIndexOrderBy01 CHARACTER SET utf8;

USE perfIndexOrderBy01;

-- Tabelle ohne Index
CREATE TABLE name_ohne
(
 id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nachname VARCHAR(255),
 vorname  VARCHAR(255)
) Engine=InnoDB;

-- Tabelle mit Index
CREATE TABLE name_mit
(
 id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nachname VARCHAR(255),
 vorname  VARCHAR(255)
) Engine=InnoDB;

-- Index erstellen
CREATE INDEX idx_namemit_nnvn ON name_mit(nachname, vorname);

-- Tabelle fuer die Messergebnisse
CREATE TABLE messung
(
  anzahl_ds BIGINT  UNSIGNED,
  sekunden_ohne   DECIMAL(12,8),
  sekunden_mit  DECIMAL(12,8)
);
-- Ende Testumgebung

-- Erzeugen der Testdaten
DELIMITER //
CREATE PROCEDURE datenerzeugen
(
  IN iAnzahl INT UNSIGNED
)
 BEGIN
 DECLARE vAnzahl INT UNSIGNED DEFAULT 0;
 DECLARE vNachname VARCHAR(255);
 DECLARE vVorname VARCHAR(255);

 WHILE vAnzahl < iAnzahl DO
  SELECT MD5(RAND()) INTO vNachname;
  SELECT MD5(RAND()) INTO vVorname;
  INSERT INTO name_ohne (nachname, vorname) VALUES (vNachname, vVorname);
  INSERT INTO name_mit (nachname, vorname) VALUES (vNachname, vVorname);
  SET vAnzahl = 1 + vAnzahl;
 END WHILE;
 END//
DELIMITER ;

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


-- Das eigentliche Experiment
DELIMITER //
CREATE PROCEDURE perfIndexOrderBy01
 (
  IN iAnzahl         INT UNSIGNED
 )
BEGIN
 DECLARE vAnzahl       INT UNSIGNED DEFAULT 0;
 DECLARE vAnzahlDS     BIGINT UNSIGNED DEFAULT 0;
 DECLARE vDauerOhne    DECIMAL(12,8);
 DECLARE vDauerMit     DECIMAL(12,8);
 DECLARE vDummy        VARCHAR(255);

 TRUNCATE messung;          -- Alte Daten entfernen
 TRUNCATE name_ohne;        -- Alte Daten entfernen
 TRUNCATE name_mit;         -- Alte Daten entfernen

 SET PROFILING = 1;         -- Profiling einschalten

 -- Hauptschleife
 SET vAnzahl = 1;
 WHILE vAnzahl <= iAnzahl DO
  SELECT 'Durchlauf ', vAnzahl, ' von ', iAnzahl;
  -- Testdaten erweitern
  CALL datenerzeugen(10);

  -- Messung ohne
   SELECT SQL_NO_CACHE id
    FROM name_ohne
    ORDER BY nachname, vorname
    LIMIT 1 INTO vDummy;
   CALL dauer(vDauerOhne);
  -- Messung mit
   SELECT SQL_NO_CACHE id
    FROM name_mit
    ORDER BY nachname, vorname
    LIMIT 1 INTO vDummy;
   CALL dauer(vDauerMit);

  -- Sichern der Messergebnisse
  SELECT COUNT(*) FROM name_ohne INTO vAnzahlDS;
  INSERT INTO messung(anzahl_ds, sekunden_ohne, sekunden_mit)
   VALUES (vAnzahlDS, vDauerOhne, vDauerMit);

  SET vAnzahl =   1 + vAnzahl;
 END WHILE;

 SET PROFILING = 0;         -- Profiling ausschalten
END//
DELIMITER ;

-- CALL perfIndexOrderBy01(100);
