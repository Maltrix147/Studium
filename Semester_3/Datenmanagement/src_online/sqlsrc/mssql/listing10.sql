-- Ausführen der vorherigen Befehle
:r listing09.sql

SELECT 'Start listing10.sql //////////////////////////////////////////';
GO

SELECT 'Start Aufbau Rechnungswesen';
GO
USE oshop;
GO

INSERT INTO rechnung
 (kunde_id, bestellung_id, adresse_id, datum)
 SELECT kunde_id, bestellung_id, adresse_id, DATEADD(DAY, 1, datum) FROM bestellung;
GO

SET IDENTITY_INSERT rechnung ON ;
INSERT INTO rechnung (rechnung_id, kunde_id, bestellung_id, adresse_id, datum, bezahlart, status)
 VALUES
  (7, 3, 0, 2, CONVERT(DATETIME, '2012-04-06 12:11:00'), 3, 2)
 ,(8, 3, 0, 2, CONVERT(DATETIME, '2012-04-07 13:12:00'), 3, 3)
 ,(9, 5, 0, 4, CONVERT(DATETIME, '2012-04-08 14:13:00'), 2, 5)
 ,(10, 5, 0, 4, CONVERT(DATETIME, '2012-04-09 15:14:00'), 2, 6)
 ,(11, 5, 0, 4, CONVERT(DATETIME, '2012-04-10 16:15:00'), 2, 6)
;
SET IDENTITY_INSERT rechnung OFF ;
GO

UPDATE rechnung SET status = 4 WHERE rechnung_id = 2;
GO
INSERT INTO rechnung_position (rechnung_id, position_nr, artikel_id, menge)
 SELECT bestellung_id, position_nr, artikel_id, menge FROM bestellung_position;
GO
INSERT INTO rechnung_position
 (rechnung_id, position_nr, artikel_id, menge)
 VALUES
   (7, 1, 3001, 5)
  ,(7, 2, 3005, 1)
  ,(8, 1, 3006, 7)
  ,(8, 2, 3007, 1)
  ,(10, 1, 3010, 15)
  ,(10, 2, 3001, 5)
  ,(11, 1, 3005, 20)
;
GO

UPDATE rechnung SET rabatt = 7 WHERE kunde_id = 1;
UPDATE rechnung SET skonto = 3 WHERE kunde_id = 5;
GO

SELECT 'Ende Aufbau Rechnungswesen';
GO
SELECT 'Problem und Lösung (Seite 223)';
GO
SELECT
 bp.bestellung_id, SUM(bp.menge * a.einzelpreis) 'Bestellwert'
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
 GROUP BY
  bp.bestellung_id
;
GO
SELECT
  k.nachname, k.vorname, SUM(bp.menge * a.einzelpreis) 'Bestellwert'
 FROM
 bestellung_position bp INNER JOIN artikel a    ON bp.artikel_id = a.artikel_id
                        INNER JOIN bestellung b ON bp.bestellung_id = b.bestellung_id
                        INNER JOIN kunde k      ON b.kunde_id = k.kunde_id
 GROUP BY
  bp.bestellung_id, k.nachname, k.vorname
;
GO
DROP TABLE IF EXISTS #tmp_bestellwert;
GO
SELECT
 k.nachname, k.vorname, SUM(bp.menge * a.einzelpreis) 'bestellwert'
 INTO #tmp_bestellwert
 FROM
  bestellung_position bp INNER JOIN artikel a    ON bp.artikel_id = a.artikel_id
                         INNER JOIN bestellung b ON bp.bestellung_id = b.bestellung_id
                         INNER JOIN kunde k      ON b.kunde_id = k.kunde_id
 GROUP BY
  bp.bestellung_id, k.nachname, k.vorname
;
GO
SELECT * FROM #tmp_bestellwert;
GO
SELECT
 nachname, vorname, SUM(bestellwert) 'Umsatz'
 FROM #tmp_bestellwert
 GROUP BY nachname, vorname
;
GO
SELECT
 bw.nachname, bw.vorname, SUM(bw.bestellwert) 'Umsatz'
  FROM
  (
    SELECT
     k.nachname, k.vorname, SUM(bp.menge * a.einzelpreis) 'bestellwert'
     FROM
      bestellung_position bp INNER JOIN artikel a    ON bp.artikel_id = a.artikel_id
                             INNER JOIN bestellung b ON bp.bestellung_id = b.bestellung_id
                             INNER JOIN kunde k      ON b.kunde_id = k.kunde_id
     GROUP BY
      bp.bestellung_id, k.nachname, k.vorname
  ) AS bw
  GROUP BY nachname, vorname
;
GO

-- Start nicht korrelierende Unterabfrage
SELECT 'Nicht korrelierende Unterabfrage (Seite 226)';
GO
SELECT MAX(blz) FROM bank;
GO
SELECT bankname
 FROM bank
 WHERE blz = '37010050'
;
GO
SELECT bankname
 FROM bank
 WHERE blz =
 (
  SELECT MAX(blz)
   FROM bank
 )
;
GO
SELECT
 AVG(einzelpreis) AS 'durchschnittspreis'
 FROM artikel
;
GO
SELECT *
 FROM artikel
 WHERE
  einzelpreis > 30
;
GO
SELECT *
 FROM artikel
 WHERE
  einzelpreis >
   (
    SELECT
     AVG(einzelpreis) AS 'durchschnittspreis'
     FROM artikel
   )
;
GO
SELECT
 bp.bestellung_id, SUM(bp.menge * a.einzelpreis) bestellwert
 FROM
  bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
 GROUP BY
  bp.bestellung_id
;
GO
-- Leider kann TSQL Alias nicht in WHERE-Klauseln wiedervewenden!!!
SELECT AVG(bw.bestellwert)
 FROM (
       SELECT
        bp.bestellung_id, SUM(bp.menge * a.einzelpreis) bestellwert
        FROM
         bestellung_position bp INNER JOIN artikel a ON bp.artikel_id = a.artikel_id
        GROUP BY
        bp.bestellung_id
      ) AS bw
;
GO
SELECT
  bp1.bestellung_id, SUM(bp1.menge * a1.einzelpreis) bestellwert1
  FROM
   bestellung_position bp1 INNER JOIN artikel a1 ON bp1.artikel_id = a1.artikel_id
  GROUP BY
   bp1.bestellung_id
  HAVING SUM(bp1.menge * a1.einzelpreis) > 100
;
GO
SELECT
 bp1.bestellung_id, SUM(bp1.menge * a1.einzelpreis) bwert1
 FROM
  bestellung_position bp1 INNER JOIN artikel a1 ON bp1.artikel_id = a1.artikel_id
 GROUP BY
  bp1.bestellung_id
 HAVING
  SUM(bp1.menge * a1.einzelpreis) >
   (
    SELECT AVG(bw.bwert2)
     FROM
     (
      SELECT
       bp2.bestellung_id, SUM(bp2.menge * a2.einzelpreis) bwert2
       FROM
        bestellung_position bp2 INNER JOIN artikel a2 ON bp2.artikel_id = a2.artikel_id
       GROUP BY
        bp2.bestellung_id
     ) AS bw
   )
;
GO
SELECT bestellung_id FROM bestellung;
GO
SELECT rechnung_id
 FROM rechnung
 WHERE bestellung_id IN
 (
  SELECT bestellung_id FROM bestellung
 )
;
GO
SELECT a.einzelpreis
 FROM
  artikel_nm_warengruppe nm INNER JOIN artikel a     ON nm.artikel_id = a.artikel_id
                            INNER JOIN warengruppe w ON nm.warengruppe_id = w.warengruppe_id
 WHERE
  w.bezeichnung = 'Gartenbedarf'
;
GO
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ALL(SELECT 10)
;
GO
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ALL
  (
    SELECT a.einzelpreis
     FROM
      artikel_nm_warengruppe nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                                INNER JOIN warengruppe w ON nm.warengruppe_id = w.warengruppe_id
      WHERE
       w.bezeichnung = 'Gartenbedarf'
  )
;
GO
SELECT
 r.rechnung_id, r.kunde_id, SUM(a.einzelpreis*rp.menge) AS 'umsatz'
 FROM
  rechnung_position rp INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
                       INNER JOIN rechnung r ON rp.rechnung_id = r.rechnung_id
 GROUP BY
  r.rechnung_id, r.kunde_id
;
GO
SELECT SUM(umsatz) AS 'umsatzsumme'
 FROM
 (
  SELECT
   r.rechnung_id, r.kunde_id, SUM(a.einzelpreis*rp.menge) AS 'umsatz'
   FROM
    rechnung_position rp INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
                         INNER JOIN rechnung r ON rp.rechnung_id = r.rechnung_id
   GROUP BY
    r.rechnung_id, r.kunde_id
 ) AS ksum
 GROUP BY
 ksum.kunde_id
;
GO
SELECT SUM(umsatz) AS 'umsatzsumme'
 FROM
 (
  SELECT
   r.rechnung_id, k.kunde_id, SUM(a.einzelpreis*rp.menge) AS 'umsatz'
   FROM
    rechnung_position rp INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
                         INNER JOIN rechnung r ON rp.rechnung_id = r.rechnung_id
                         INNER JOIN kunde k  ON r.kunde_id = k.kunde_id
   WHERE nachname = 'beutlin'
   GROUP BY
    r.rechnung_id, k.kunde_id
 ) AS ksum
 GROUP BY
  ksum.kunde_id
;
GO
SELECT ksum.kunde_id, SUM(umsatz) AS 'umsatzsumme'
 FROM
 (
  SELECT
   r.rechnung_id, r.kunde_id, SUM(a.einzelpreis*rp.menge) AS 'umsatz'
   FROM
    rechnung_position rp INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
                         INNER JOIN rechnung r ON rp.rechnung_id = r.rechnung_id
   GROUP BY
    r.rechnung_id, r.kunde_id
 ) AS ksum
 GROUP BY
  ksum.kunde_id
 HAVING SUM(umsatz) > ALL (SELECT 100)
;
GO
SELECT k.kunde_id, k.nachname, k.vorname, SUM(umsatz) AS 'umsatzsumme'
 FROM
 (
  SELECT
   r.rechnung_id, r.kunde_id, SUM(a.einzelpreis*rp.menge) AS 'umsatz'
   FROM
    rechnung_position rp INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
                         INNER JOIN rechnung r ON rp.rechnung_id = r.rechnung_id
    GROUP BY
     r.rechnung_id, r.kunde_id
  ) AS ksum
   INNER JOIN kunde k ON ksum.kunde_id = k.kunde_id
  GROUP BY
   k.kunde_id, k.nachname, k.vorname
  HAVING SUM(umsatz) > ALL
  (
   SELECT SUM(umsatz) AS 'umsatzsumme'
    FROM
    (
     SELECT
      r.rechnung_id, r.kunde_id, SUM(a.einzelpreis*rp.menge) AS 'umsatz'
      FROM
       rechnung_position rp INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
                            INNER JOIN rechnung r ON rp.rechnung_id = r.rechnung_id
                            INNER JOIN kunde k  ON r.kunde_id = k.kunde_id
      WHERE k.nachname = 'beutlin'
      GROUP BY
       r.rechnung_id, r.kunde_id
   ) AS ksum
   GROUP BY
    ksum.kunde_id
  )
;
GO
SELECT a.einzelpreis
 FROM
  artikel_nm_warengruppe nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                            INNER JOIN warengruppe w on nm.warengruppe_id = w.warengruppe_id
 WHERE
  w.bezeichnung = 'Bürobedarf'
;
GO
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ANY(SELECT 10)
;
GO
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ANY
  (
   SELECT a.einzelpreis
    FROM
     artikel_nm_warengruppe nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                               INNER JOIN warengruppe w ON nm.warengruppe_id = w.warengruppe_id
    WHERE
     w.bezeichnung = 'Bürobedarf'
  )
;
GO
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.artikel_id NOT IN
  (
   SELECT
    artikel_id
    FROM
     artikel_nm_warengruppe nm  INNER JOIN warengruppe w ON nm.warengruppe_id = w.warengruppe_id
    WHERE w.bezeichnung = 'Bürobedarf'
  )
  AND
   a.einzelpreis > ANY
   (
    SELECT a.einzelpreis
     FROM
     artikel_nm_warengruppe nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                               INNER JOIN warengruppe w ON nm.warengruppe_id = w.warengruppe_id
     WHERE
      w.bezeichnung = 'Bürobedarf'
   )
;
GO
-- Leider kann in TSQL kein Prädikat der Art (v1, v2) IN (tabspalte1, tabspalte12) gemacht werden.

-- Ende nicht korrelierende Unterabfrage

-- Start korrelierende Unterabfrage
SELECT 'Korrelierende Unterabfrage (Seite 238)';
 SELECT rechnung_id
  FROM rechnung r
  WHERE
  (
   SELECT
    COUNT(position_nr)
    FROM rechnung_position rp
    WHERE
     rp.rechnung_id = r.rechnung_id
  ) >= 3
;
GO
SELECT rechnung_id
  FROM rechnung r
  WHERE
   EXISTS
    (
     SELECT
      bestellung_id
      FROM bestellung b
      WHERE b.bestellung_id = r.bestellung_id
    )
;
GO
-- Ende korrelierende Unterabfrage

-- Start Fallstudie
SELECT 'Fallstudie Datenimport (Seite 240)';
GO
DROP TABLE IF EXISTS #tmp_import;
GO
CREATE TABLE #tmp_import
(
 nachname NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 vorname  NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 strasse  NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 hnr      NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 lkz      NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 plz      NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 ort      NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 ktnr     NVARCHAR(255) COLLATE German_PhoneBook_CI_AI,
 blz      NVARCHAR(255) COLLATE German_PhoneBook_CI_AI
);

/*
BULK INSERT #tmp_import
 FROM 'X:\[...]\kunden01.csv'
 WITH (FIRSTROW = 2, FIELDTERMINATOR = ';',	ROWTERMINATOR='0x0a', FORMAT='CSV');
*/
:r kunden01.sql
SELECT LEFT(nachname,10), LEFT(vorname,10), LEFT(strasse,10), LEFT(hnr,10), LEFT(plz,10), LEFT(ort,10) FROM #tmp_import;

INSERT INTO kunde (nachname, vorname)
 SELECT DISTINCT nachname, vorname
  FROM #tmp_import
  WHERE
   CONCAT(TRIM(#tmp_import.vorname), TRIM(#tmp_import.nachname)) NOT IN
    (
     SELECT CONCAT(TRIM(vorname), TRIM(nachname)) FROM kunde
    )
;
GO

INSERT INTO adresse (strasse, hnr, lkz, plz, ort)
 SELECT DISTINCT strasse, hnr, lkz, plz, ort
  FROM #tmp_import tmp
  WHERE
   CONCAT(TRIM(tmp.strasse), TRIM(tmp.hnr), TRIM(tmp.lkz), TRIM(tmp.plz), TRIM(tmp.ort)) NOT IN
    (
     SELECT CONCAT(TRIM(strasse), TRIM(hnr), TRIM(lkz), TRIM(plz), TRIM(ort))
      FROM adresse
    )
;
GO

ALTER TABLE #tmp_import ADD kunde_id INT ;
ALTER TABLE #tmp_import ADD adresse_id INT ;
ALTER TABLE #tmp_import ADD bank_id NCHAR(12) COLLATE German_PhoneBook_CI_AI;
GO

SELECT 'UPDATE';
GO
UPDATE #tmp_import
 SET
 #tmp_import.kunde_id = k.kunde_id
 FROM
  (
   SELECT kunde_id, nachname, vorname
    FROM kunde 
  ) k
  WHERE 
   CONCAT(TRIM(#tmp_import.vorname), TRIM(#tmp_import.nachname))
   = 
   CONCAT(TRIM(k.vorname), TRIM(k.nachname))
;

GO
UPDATE #tmp_import
 SET #tmp_import.adresse_id = a.adresse_id
 FROM
  (
   SELECT adresse_id, strasse, hnr, plz, ort
    FROM adresse a
  ) a
  WHERE
   CONCAT(TRIM(#tmp_import.strasse), TRIM(#tmp_import.hnr), TRIM(#tmp_import.plz), TRIM(#tmp_import.ort))
   =
   CONCAT(TRIM(a.strasse), TRIM(a.hnr), TRIM(a.plz), TRIM(a.ort))
;

-- SELECT k.kunde_id, a.adresse_id, CONCAT(TRIM(LEFT(k.vorname, 20)), TRIM(LEFT(k.nachname, 20)), TRIM(LEFT(a.strasse, 20)), TRIM(LEFT(a.hnr, 20))) FROM #tmp_import INNER JOIN kunde k ON #tmp_import.kunde_id = k.kunde_id                  INNER JOIN adresse a ON #tmp_import.adresse_id = a.adresse_id ORDER BY kunde_id, adresse_id
GO
UPDATE #tmp_import
 SET #tmp_import.bank_id = b.bank_id
 FROM (SELECT bank_id, blz FROM bank) b
 WHERE TRIM(#tmp_import.blz) = TRIM(b.blz)
;
GO

INSERT INTO
 bankverbindung (kunde_id, bankverbindung_nr, bank_id, kontonummer, iban)
 SELECT DISTINCT kunde_id, 1, bank_id, ktnr, CONCAT(blz, ktnr)
  FROM #tmp_import
  WHERE 0 = (
   SELECT COUNT(*) 
    FROM bankverbindung bv
	WHERE 
	 #tmp_import.kunde_id = bv.kunde_id
	 AND 
	 #tmp_import.bank_id = bv.bank_id
	 AND
	 #tmp_import.ktnr = bv.kontonummer
    )
;
GO

ALTER TABLE #tmp_import
 ADD bankverbindung_nr INT NOT NULL DEFAULT 1
;
GO

UPDATE kunde 
 SET
  kunde.rechnung_adresse_id = #tmp_import.adresse_id
 FROM kunde INNER JOIN #tmp_import ON #tmp_import.kunde_id = kunde.kunde_id
  WHERE k.rechnung_adresse_id IS NULL
;
GO
SELECT kunde_id, TRIM(LEFT(nachname, 20)), TRIM(LEFT(vorname, 20)), TRIM(LEFT(strasse, 20)), TRIM(LEFT(ort, 20))
 FROM
  kunde LEFT JOIN adresse ON kunde.rechnung_adresse_id = adresse_id
;
GO

SELECT 'Ende listing10.sql //////////////////////////////////////////';
GO
