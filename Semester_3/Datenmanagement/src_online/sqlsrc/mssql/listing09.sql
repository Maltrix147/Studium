-- Ausführen der vorherigen Befehle
:r listing08.sql

SELECT 'Start listing09.sql //////////////////////////////////////////';
GO
SELECT 'Aggregatfunktionen (Seite 210)';
GO
SELECT AVG(einzelpreis) FROM artikel;
SELECT COUNT(*) FROM kunde;
SELECT COUNT(liefer_adresse_id) FROM kunde;
SELECT COUNT(DISTINCT(rechnung_adresse_id)) FROM kunde;
SELECT MAX(einzelpreis), MIN(einzelpreis) FROM artikel;
SELECT SUM(menge) FROM bestellung_position;
SELECT
 bp.menge, a.einzelpreis
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
;
SELECT
 bp.menge * a.einzelpreis 'Positionswert'
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
;
GO

-- Start Aufbau Lagerverwaltung
SELECT 'Aufbau Lagerbestand (Seite 212)';
SELECT 'CREATE lagerbestand';
GO
DROP TABLE IF EXISTS lagerbestand;
GO
CREATE TABLE lagerbestand (
 artikel_id          INT NOT NULL DEFAULT 0,
 menge_mindest       DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 menge_aktuell       DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(artikel_id),
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO
SELECT 'Lagerbestand festlegen';
GO
INSERT INTO lagerbestand (artikel_id, menge_aktuell, menge_mindest)
 VALUES
  (7856, 500, 100)
  ,(7863, 400, 100)
  ,(9010, 30, 10)
  ,(9015, 25, 10)
  ,(3001, 5000, 1000)
  ,(3005, 250, 200)
  ,(3006, 250, 200)
  ,(3007, 149, 200)
  ,(3010, 3, 100)
;
GO
-- Ende Aufbau Lagerverwaltung

SELECT 'GROUP BY (Seite 213)';
GO
-- Start Group by
SELECT
 COUNT(*)
 FROM
 bestellung_position
;
GO
SELECT
 bestellung_id Bestellnummer, COUNT(*) 'Anzahl der Positionen'
 FROM
  bestellung_position
 GROUP BY
  bestellung_id
;
GO
SELECT
 a.bezeichnung, bp.menge
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
;
GO
SELECT
 a.bezeichnung 'Artikelname', SUM(bp.menge) 'Anzahl bestellter Artikel'
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
 GROUP BY
  a.bezeichnung
;
GO
SELECT
 a.bezeichnung 'Artikelname', SUM(bp.menge) 'Anzahl bestellter Artikel'
 FROM
  bestellung_position bp RIGHT JOIN artikel a ON bp.artikel_id = a.artikel_id
 GROUP BY
  a.bezeichnung
;
GO
SELECT
 a.bezeichnung 'Artikelname', 
 CASE 
  WHEN SUM(bp.menge) IS NULL THEN 0 
  ELSE SUM(bp.menge) 
 END AS 'Anzahl bestellter Artikel'
 FROM
  bestellung_position bp RIGHT JOIN artikel a ON bp.artikel_id = a.artikel_id
 GROUP BY
  a.bezeichnung
;
GO
-- SELECT 'Eine Fehlermeldung! (Seite 216)';
-- SELECT
-- a.bezeichnung 'Artikelname', SUM(bp.menge) 'Anzahl bestellter Artikel'
--  FROM
--   bestellung_position bp INNER JOIN artikel a USING (artikel_id)
--  WHERE
--   SUM(bp.menge) > 10
--  GROUP BY
--   artikel_id
-- ;

SELECT 'Gruppenergebnisse mit WITH ROLLUP summieren (Seite 215)';
GO
SELECT
 artikel_id, SUM(bp.menge)
 FROM
  bestellung_position bp RIGHT JOIN artikel a ON bp.artikel_id = a.artikel_id)
 GROUP BY
  artikel_id WITH ROLLUP
;
GO

SELECT 'Gruppenergebnisse mit HAVING filtern (Seite 216)';
GO
SELECT
 a.bezeichnung 'Artikelname', SUM(bp.menge) 'Anzahl bestellter Artikel'
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
 GROUP BY
  a.bezeichnung
 HAVING 
  SUM(bp.menge) > 10
;
GO
SELECT
 a.bezeichnung 'Artikelname', SUM(bp.menge) 'Anzahl bestellter Artikel'
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
 WHERE
  a.bezeichnung LIKE 'Silber%'
 GROUP BY
  a.bezeichnung
 HAVING 
  SUM(bp.menge) > 10
;
GO

SELECT 'Fragen zu Gruppen (Seite 218)';
GO
SELECT
 SUBSTRING(blz, 1, 1) 'Clearinggebiet', COUNT(*) 'Anzahl'
 FROM
  bank
 GROUP BY
  SUBSTRING(blz, 1, 1) 
 ORDER BY 'Anzahl' DESC
;
GO

-- Start Bestellungen erweitern
SELECT 'Bestellungen erweitern';
GO
SET IDENTITY_INSERT bestellung ON ;
INSERT INTO bestellung (bestellung_id, kunde_id, adresse_id, datum)
 VALUES
   (3, 1, 1, '2011-01-15 16:43:00')
  ,(4, 1, 1, '2011-01-16 09:15:00')
  ,(5, 1, 1, '2011-01-16 09:16:00')
  ,(6, 2, 2, '2012-04-01 13:11:00')
;
SET IDENTITY_INSERT bestellung OFF ;
INSERT INTO bestellung_position (bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (3, 1, 7856, 10)
  ,(3, 2, 7863, 10)
  ,(4, 1, 3006, 1)
  ,(4, 2, 3010, 4)
  ,(5, 1, 3001, 100)
  ,(5, 2, 3010, 5)
  ,(5, 3, 3006, 1)
  ,(5, 4, 3005, 4)
 ;
GO
-- Ende Bestellungen erweitern

SELECT
 LEFT(CONCAT(FORMAT(datum, 'yyyy', 'de-de'), '/', FORMAT(datum, 'MMMM', 'de-de')), 20) AS 'Monat', COUNT(*) 'Anzahl'
 FROM bestellung
 GROUP BY
  FORMAT(datum, 'yyyy', 'de-de'), FORMAT(datum, 'MMMM', 'de-de')
 ORDER BY
  FORMAT(datum, 'yyyy', 'de-de') DESC, FORMAT(datum, 'MMMM', 'de-de') DESC
;
GO
-- Ende Group by
SELECT 'Ende listing09.sql //////////////////////////////////////////';
GO
