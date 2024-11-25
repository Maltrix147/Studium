-- Ausführen der vorherigen Befehle
\i listing08.sql

\echo 'Start listing09.sql //////////////////////////////////////////'

SELECT 'Aggregatfunktionen (Seite 210)' Hinweis;
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
 bp.menge * a.einzelpreis Positionswert
 FROM
  bestellung_position AS bp INNER JOIN artikel AS a USING(artikel_id)
;

-- Start Aufbau Lagerverwaltung
SELECT 'Aufbau Lagerbestand (Seite 212)' Hinweis;
SELECT 'CREATE lagerbestand' Hinweis;
DROP TABLE IF EXISTS lagerbestand;
CREATE TABLE lagerbestand (
 artikel_id          INT,
 menge_mindest       DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 menge_aktuell       DECIMAL(14,6) NOT NULL DEFAULT 0.0,
 deleted             SMALLINT NOT NULL DEFAULT 0,
 PRIMARY KEY(artikel_id),
 FOREIGN KEY (artikel_id)
   REFERENCES artikel(artikel_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
);

SELECT 'Lagerbestand festlegen' Hinweis;
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


SELECT 'GROUP BY (Seite 213)' Hinweis;
-- Start Group by
SELECT
 COUNT(*)
 FROM
 bestellung_position
;
SELECT
 bestellung_id Bestellnummer, COUNT(*) Anzahl_der_Positionen
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
 a.bezeichnung Artikelname, SUM(bp.menge) Anzahl_bestellter_Artikel
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
 GROUP BY
  a.bezeichnung
;

SELECT
 a.bezeichnung Artikelname, SUM(bp.menge) Anzahl_bestellter_Artikel
 FROM
  bestellung_position bp RIGHT JOIN artikel a USING (artikel_id)
 GROUP BY
  a.bezeichnung
;
SELECT
 a.bezeichnung Artikelname, 
 CASE 
  WHEN SUM(bp.menge) IS NULL THEN 0 
  ELSE SUM(bp.menge) 
 END AS Anzahl_bestellter_Artikel
 FROM
  bestellung_position bp RIGHT JOIN artikel a USING (artikel_id)
 GROUP BY
  a.bezeichnung
;
-- SELECT 'Eine Fehlermeldung! (Seite 216)';
-- SELECT
-- a.bezeichnung `Artikelname`, SUM(bp.menge) `Anzahl bestellter Artikel`
--  FROM
--   bestellung_position bp INNER JOIN artikel a USING (artikel_id)
--  WHERE
--   SUM(bp.menge) > 10
--  GROUP BY
--   a.bezeichnung
-- ;

SELECT 'Gruppenergebnisse mit WITH ROLLUP summieren (Seite 215)';
SELECT
 artikel_id, SUM(bp.menge) AS 
 FROM
  bestellung_position bp RIGHT JOIN artikel a USING (artikel_id)
 GROUP BY ROLLUP (artikel_id)
;

SELECT 'Gruppenergebnisse mit HAVING filtern (Seite 217)' Hinweis;
SELECT
 a.bezeichnung Artikelname, SUM(bp.menge) Anzahl_bestellter_Artikel
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
 GROUP BY
  a.bezeichnung
 HAVING 
  SUM(bp.menge) > 10
;
SELECT
 a.bezeichnung Artikelname, SUM(bp.menge) Anzahl_bestellter_Artikel
 FROM
  bestellung_position bp INNER JOIN artikel a USING (artikel_id)
 WHERE
  a.bezeichnung LIKE 'Silber%'
 GROUP BY
  a.bezeichnung
 HAVING 
  SUM(bp.menge) > 10
;

SELECT 'Fragen zu Gruppen (Seite 218)' Hinweis;
SELECT
 SUBSTRING(blz, 1, 1) Clearinggebiet, COUNT(*) Anzahl
 FROM
  bank
 GROUP BY
  Clearinggebiet
 ORDER BY Anzahl DESC
;
-- Start Bestellungen erweitern
SELECT 'Bestellungen erweitern' Hinweis;
INSERT INTO bestellung (bestellung_id, kunde_id, adresse_id, datum)
 VALUES
   (3, 1, 1, '2011-01-15 16:43:00')
  ,(4, 1, 1, '2011-01-16 09:15:00')
  ,(5, 1, 1, '2011-01-16 09:16:00')
  ,(6, 2, 2, '2012-04-01 13:11:00')
;

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
-- Ende Bestellungen erweitern
SELECT
 EXTRACT(ISOYEAR FROM datum) || '/' || EXTRACT(MONTH FROM datum) Monat, COUNT(*) Anzahl
 FROM bestellung
 GROUP BY
  EXTRACT(ISOYEAR FROM datum), EXTRACT(MONTH FROM datum)
 ORDER BY
  EXTRACT(ISOYEAR FROM datum) DESC, EXTRACT(MONTH FROM datum) DESC
;

EXPLAIN
 SELECT
  SUBSTRING(blz, 1, 1) Clearinggebiet, COUNT(*) Anzahl
  FROM
   bank
  GROUP BY
   Clearinggebiet
  ORDER BY
   Anzahl DESC;

EXPLAIN
 SELECT
  lkz || SUBSTRING(blz, 6, 3) Sinnlos, COUNT(*) Anzahl
  FROM
  bank
  GROUP BY
   Sinnlos
  ORDER BY
   Sinnlos;
-- Ende Group by
\echo 'Ende listing09.sql //////////////////////////////////////////'
