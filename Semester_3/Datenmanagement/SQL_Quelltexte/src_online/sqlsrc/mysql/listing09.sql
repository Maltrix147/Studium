-- Ausführen der vorherigen Befehle
SOURCE listing08.sql

SELECT 'Start listing09.sql //////////////////////////////////////////';

SELECT 'Aggregatfunktionen (Seite 212)';
SELECT AVG(einzelpreis) FROM artikel;
SELECT COUNT(*) FROM kunde;
SELECT COUNT(liefer_adresse_id) FROM kunde;
SELECT COUNT(DISTINCT(rechnung_adresse_id)) FROM kunde;
SELECT MAX(einzelpreis), MIN(einzelpreis) FROM artikel;
SELECT SUM(menge) FROM bestellung_position;
SELECT
 bp.menge, a.einzelpreis
 FROM
  bestellung_position bp INNER JOIN artikel a USING(artikel_id)
;
SELECT
 bp.menge * a.einzelpreis 'Positionswert'
 FROM
  bestellung_position bp INNER JOIN artikel a USING(artikel_id)
;

-- Start Aufbau Lagerverwaltung
SELECT 'Aufbau Lagerbestand (Seite 214)';
SELECT 'CREATE lagerbestand';
DROP TABLE IF EXISTS lagerbestand;
CREATE TABLE lagerbestand (
 artikel_id          INT UNSIGNED NOT NULL DEFAULT 0,
 menge_mindest       DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 menge_aktuell       DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(artikel_id),
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;

SELECT 'Lagerbestand festlegen';
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
-- Ende Aufbau Lagerverwaltung


SELECT 'GROUP BY (Seite 215)';
-- Start Group by
SELECT
 COUNT(*)
 FROM
 bestellung_position
;
SELECT
 bestellung_id Bestellnummer, COUNT(*) `Anzahl der Positionen`
 FROM
  bestellung_position
 GROUP BY
  bestellung_id
;
SELECT
 a.bezeichnung, bp.menge
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
;
SELECT
 a.bezeichnung `Artikelname`, SUM(bp.menge) `Anzahl bestellter Artikel`
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
 GROUP BY
  artikel_id
;
SELECT
 a.bezeichnung `Artikelname`, SUM(bp.menge) `Anzahl bestellter Artikel`
 FROM
  bestellung_position bp RIGHT JOIN artikel a USING (artikel_id)
 GROUP BY
  artikel_id
;
SELECT
 a.bezeichnung `Artikelname`, 
 CASE 
  WHEN SUM(bp.menge) IS NULL THEN 0 
  ELSE SUM(bp.menge) 
 END AS `Anzahl bestellter Artikel`
 FROM
  bestellung_position bp RIGHT JOIN artikel a USING (artikel_id)
 GROUP BY
  artikel_id
;
-- SELECT 'Eine Fehlermeldung! (Seite 218)';
-- SELECT
-- a.bezeichnung `Artikelname`, SUM(bp.menge) `Anzahl bestellter Artikel`
--  FROM
--   bestellung_position bp INNER JOIN artikel a USING (artikel_id)
--  WHERE
--   SUM(bp.menge) > 10
--  GROUP BY
--   artikel_id
-- ;

SELECT 'Gruppenergebnisse mit WITH ROLLUP summieren (Seite 217)';
SELECT
 artikel_id,
 CASE 
  WHEN SUM(bp.menge) IS NULL THEN 0 
  ELSE SUM(bp.menge) 
 END AS `Anzahl bestellter Artikel`
 FROM
  bestellung_position bp RIGHT JOIN artikel a USING (artikel_id)
 GROUP BY
  artikel_id WITH ROLLUP
;


SELECT 'Gruppenergebnisse mit HAVING filtern (Seite 219)';
SELECT
 a.bezeichnung `Artikelname`, SUM(bp.menge) `Anzahl bestellter Artikel`
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
 GROUP BY
  artikel_id
 HAVING 
  SUM(bp.menge) > 10
;
SELECT
 a.bezeichnung `Artikelname`, SUM(bp.menge) `Anzahl bestellter Artikel`
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
 WHERE
  a.bezeichnung LIKE 'Silber%'
 GROUP BY
  artikel_id
 HAVING 
  SUM(bp.menge) > 10
;

SELECT 'Fragen zu Gruppen (Seite 220)';
SELECT
 SUBSTRING(blz, 1, 1) `Clearinggebiet`, COUNT(*) `Anzahl`
 FROM
  bank
 GROUP BY
  `Clearinggebiet` 
 ORDER BY `Anzahl` DESC
;
-- Start Bestellungen erweitern
SELECT 'Bestellungen erweitern';
INSERT INTO bestellung (bestellung_id, kunde_id, adresse_id, datum)
 VALUES
   (3, 1, 1, '2011-01-15 16:43:00')
  ,(4, 1, 1, '2011-01-16 09:15:00')
  ,(5, 1, 1, '2011-01-16 09:16:00')
  ,(6, 2, 2, '2012-04-01 13:11:00')
;

INSERT INTO bestellung_position (
 bestellung_id, position_nr, artikel_id, menge)
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
-- Ende Bestellungen erweitern
SELECT
 CONCAT(YEAR(datum), '/', MONTHNAME(datum)) `Monat`, COUNT(*) `Anzahl`
 FROM bestellung
 GROUP BY
  YEAR(datum), MONTH(datum)
 ORDER BY
  YEAR(datum) DESC, MONTH(datum) DESC
;
EXPLAIN
 SELECT
  SUBSTRING(blz, 1, 1) `Clearinggebiet`, COUNT(*) `Anzahl`
  FROM
   bank
  GROUP BY
   `Clearinggebiet`
  ORDER BY
   `Anzahl` DESC\G
EXPLAIN
 SELECT
  CONCAT(lkz, SUBSTRING(blz, 6, 3)) `Sinnlos`, COUNT(*) `Anzahl`
  FROM
  bank
  GROUP BY
   `Sinnlos`
  ORDER BY
   `Sinnlos`\G

-- Ende Group by
SELECT 'Ende listing09.sql //////////////////////////////////////////';
