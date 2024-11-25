-- Ausführen der vorherigen Befehle
-- :r listing12.sql

SELECT 'Start listing13.sql //////////////////////////////////////////';
GO
SELECT 'Meine erste Ansicht (Seite 272)';
GO
CREATE VIEW
 view_kundenrechnungsadresse (id, nachname, vorname, strasse, ort)
 AS
  SELECT
   kunde_id, nachname, vorname,
   CONCAT_WS(' ', strasse, hnr),
   CONCAT_WS(' ', lkz, plz, ort)
   FROM
    kunde INNER JOIN adresse
     ON rechnung_adresse_id = adresse_id
  WHERE kunde.deleted = 0
;
GO

SELECT * FROM view_kundenrechnungsadresse;
GO

SELECT 'VIEW-Verarbeitung (Seite 275)';
GO
CREATE VIEW view_artikel_aktiv
 AS
  SELECT * FROM artikel
   WHERE deleted = 0
;
GO
CREATE VIEW view_artikel_aktiv_tmp -- Nur um es später zu löschen!
 AS
  SELECT * FROM artikel
   WHERE deleted = 0
;
GO

SELECT FLOOR(artikel_id / 1000) gruppe, AVG(einzelpreis)
  FROM view_artikel_aktiv
  GROUP BY FLOOR(artikel_id / 1000)
;
GO

-- EXPLAIN SELECT FLOOR(artikel_id / 1000) gruppe, AVG(einzelpreis)
  -- FROM view_artikel_aktiv
  -- GROUP BY FLOOR(artikel_id / 1000)
-- GO
-- ;

  
SELECT artikel_id, bezeichnung FROM
 view_artikel_aktiv
 WHERE
  artikel_id BETWEEN 7000 AND 9000
;
GO

-- EXPLAIN SELECT artikel_id, bezeichnung FROM
 -- view_artikel_aktiv
 -- WHERE
  -- artikel_id BETWEEN 7000 AND 9000
-- GO


-- Start DROP VIEW
SELECT 'Ansicht loeschen (Seite 277)';
GO
DROP VIEW view_artikel_aktiv_tmp;
GO

DROP DATABASE IF EXISTS tmp1;
GO
CREATE DATABASE tmp1;
GO
USE tmp1;
GO
CREATE TABLE a (ai INT);
GO
CREATE TABLE b (bi INT);
GO
CREATE VIEW ab
 AS
  SELECT * FROM a INNER JOIN b ON ai = bi
;
GO
DROP TABLE a;

-- SELECT 'Erwarte eine Fehlermeldung';
-- SELECT * FROM ab;
-- GO
-- Ende DROP VIEW
USE oshop;
GO
DROP DATABASE tmp1;
GO

SELECT 'Anwendungsgebiet: Vereinfachung (Seite 281)';
GO
CREATE OR ALTER
 VIEW view_artikel_aktiv
  AS
   SELECT * FROM artikel
    WHERE deleted = 0
;
GO
CREATE OR ALTER VIEW view_artikel_verfuegbar
AS
 SELECT a.artikel_id, bezeichnung
  FROM artikel a INNER JOIN lagerbestand l ON a.artikel_id = l.artikel_id
  WHERE menge_aktuell >= menge_mindest
--  ORDER BY a.artikel_id In T-SQL nicht möglich
;
GO
SELECT * FROM view_artikel_verfuegbar;
GO
CREATE OR ALTER 
 VIEW view_lagerbestand_aktiv
  AS
   SELECT * FROM lagerbestand
    WHERE deleted = 0
; 
GO
CREATE OR ALTER VIEW view_lagerbestand_artikelbezeichnung
AS
 SELECT l.*, a.bezeichnung
  FROM
   view_lagerbestand_aktiv l INNER JOIN view_artikel_aktiv a
    ON l.artikel_id = a.artikel_id
;
GO
SELECT * FROM view_lagerbestand_artikelbezeichnung;
GO

SELECT 'Ende listing13.sql //////////////////////////////////////////';
