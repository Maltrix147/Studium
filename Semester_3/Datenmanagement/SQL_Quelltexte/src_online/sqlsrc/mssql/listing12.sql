-- Ausführen der vorherigen Befehle
:r listing11.sql

SELECT 'Start listing12.sql //////////////////////////////////////////';
GO

SELECT kunde_id, nachname, vorname, art FROM kunde;
GO

SELECT 'Start Aufbau einer temporären art-Tabelle (Seite 260)';
GO

DROP TABLE IF EXISTS #tmp_art;
CREATE TABLE #tmp_art
(
 art INT,
 k_art NVARCHAR(255)
)
;
GO

INSERT INTO #tmp_art
  VALUES
    (1, 'Privatkunde')
   ,(2, 'Geschäftskunde')
   ,(0, 'Unbekannt')
;

SELECT kunde_id, nachname, vorname, k_art
  FROM
   kunde INNER JOIN #tmp_art ON kunde.art = #tmp_art.art
;
SELECT 'Ende Aufbau einer temporären art-Tabelle';
GO

SELECT 'Lösung mit UNIONs (Seite 260)';
GO

SELECT kunde_id, nachname, vorname, k_art
 FROM
  kunde INNER JOIN
  (
   SELECT 1 AS art, 'Privatkunde' AS k_art
   UNION
   SELECT 2 AS art, 'Geschäftskunde' AS k_art
   UNION
   SELECT 3 AS art, 'Unbekannt' AS k_art
  ) t
   ON kunde.art = t.art
;
GO

SELECT 'Nö (Seite 261)';
SELECT kunde_id, nachname, vorname,
 CASE art
  WHEN  1 THEN 'Privatkunde'
  WHEN  2 THEN 'Geschäftskunde'
  ELSE 'Unbekannt'
 END AS k_art
 FROM kunde
;
GO

-- Start Einfacher CASE
SELECT 'Einfacher CASE (Seite 262)';
SELECT artikel_id, bezeichnung,
 CASE waehrung
  WHEN 'EUR' THEN CONCAT(ROUND(einzelpreis, 2),' €')
  WHEN 'USD' THEN CONCAT(ROUND(einzelpreis, 2),' $')
  ELSE '?????'
 END AS preis
 FROM artikel
;
GO

UPDATE artikel SET waehrung = 'XYZ' WHERE artikel_id = 3001;
SELECT artikel_id, bezeichnung,
 CASE waehrung
  WHEN 'EUR' THEN CONCAT(ROUND(einzelpreis, 2),' €')
  WHEN 'USD' THEN CONCAT(ROUND(einzelpreis, 2),' $')
 END AS preis
 FROM artikel
;
GO

UPDATE artikel SET waehrung = 'EUR' WHERE artikel_id = 3001;
GO
-- Ende Einfacher CASE

-- Start Searched CASE
SELECT 'Searched CASE (Seite 263)';
GO
SELECT beitrag_id,
 CASE
  WHEN bezug_beitrag_id > 1 THEN 'Antwort'
  WHEN bezug_beitrag_id <= 1 THEN 'Keine Antwort'
  ELSE '??????'
 END AS Typ
 FROM beitrag
 ORDER BY beitrag_id
;
GO

SELECT beitrag_id,
 CASE
  WHEN bezug_beitrag_id > 1
   THEN CONCAT(nachricht, ' Antwort auf ', bezug_beitrag_id, ': >',
   (
    SELECT nachricht
     FROM beitrag b2
     WHERE b2.beitrag_id = b1.bezug_beitrag_id
   )
   )  -- Ende CONCAT
  WHEN bezug_beitrag_id <= 1 THEN nachricht
  ELSE '??????'
 END AS Inhalt
 FROM beitrag b1
 WHERE beitrag_id > 1
;
GO

SELECT beitrag_id,
 CASE
  WHEN bezug_beitrag_id >= 0 THEN 'Antwort'
  WHEN bezug_beitrag_id >  1 THEN 'Keine Antwort'
  ELSE '??????'
 END AS Typ
 FROM beitrag
 ORDER BY beitrag_id
;
GO
-- Ende Searched CASE

-- Start Fallbeispiele
SELECT 'Fallbeispiel Lagerbestand (Seite 265)';
GO
SELECT * FROM lagerbestand;
GO
SELECT a.bezeichnung,
 CASE
  WHEN l.menge_aktuell <= l.menge_mindest
   THEN 'Artikel nachbestellen'
  ELSE 'Bestand ausreichend'
 END AS lagerstand
 FROM lagerbestand l INNER JOIN artikel a ON l.artikel_id=a.artikel_id
 ORDER BY l.menge_aktuell / l.menge_mindest
;
GO

SELECT 'Fallbeispiel Kundengruppen (Seite 266)';
GO
SELECT DISTINCT k.kunde_id, LEFT(k.nachname, 20), LEFT(k.vorname, 20),
 CASE
  WHEN 3 <
  (
   SELECT COUNT(rechnung_id) FROM rechnung r
   WHERE r.kunde_id = k.kunde_id
  ) THEN 'Prämiumkunde'
  WHEN 2 <
  (
   SELECT COUNT(rechnung_id) FROM rechnung r
   WHERE r.kunde_id = k.kunde_id
  ) THEN 'Guter Kunde'
  ELSE  'Kleinkunde'
 END kundenart
 FROM
  rechnung r RIGHT OUTER JOIN kunde k ON r.kunde_id = k.kunde_id
;
GO
SELECT k.kunde_id, LEFT(k.nachname, 20), LEFT(k.vorname, 20), 
  (
   SELECT SUM(a.einzelpreis * rp.menge)
    FROM rechnung r INNER JOIN rechnung_position rp
                     ON rp.rechnung_id = r.rechnung_id
                    INNER JOIN artikel a
                     ON rp.artikel_id=a.artikel_id
    WHERE r.kunde_id = k.kunde_id
  ) rechnungswert,
 CASE
  WHEN
   kunde_id NOT IN (SELECT kunde_id FROM rechnung)
    THEN 'Kleinkunde'
  WHEN
  (
   SELECT SUM(a.einzelpreis * rp.menge) rechnungswert
    FROM rechnung r  INNER JOIN rechnung_position rp
                      ON rp.rechnung_id = r.rechnung_id
                     INNER JOIN artikel a
                      ON rp.artikel_id=a.artikel_id
    WHERE r.kunde_id = k.kunde_id
  ) BETWEEN 0 AND 300 THEN 'Kleinkunde'
  WHEN
  (
   SELECT SUM(a.einzelpreis * rp.menge) rechnungswert
    FROM rechnung r INNER JOIN rechnung_position rp
                     ON rp.rechnung_id = r.rechnung_id
                    INNER JOIN artikel a
                     ON rp.artikel_id=a.artikel_id
    WHERE r.kunde_id = k.kunde_id
  ) BETWEEN 300 AND  1000 THEN 'Guter Kunde'
  ELSE 'Prämiumkunde'
 END AS kundenart
 FROM kunde k
 ORDER BY
 (
  SELECT SUM(a.einzelpreis * rp.menge) rechnungswert
   FROM rechnung r INNER JOIN rechnung_position rp
                    ON rp.rechnung_id = r.rechnung_id
                   INNER JOIN artikel a
                    ON rp.artikel_id=a.artikel_id
   WHERE r.kunde_id = k.kunde_id
 ) DESC
;
GO

DROP TABLE IF EXISTS #tmp_umsatz;
GO
SELECT kunde_id, SUM(a.einzelpreis * rp.menge) rechnungswert
 INTO #tmp_umsatz
 FROM rechnung r INNER JOIN rechnung_position rp ON rp.rechnung_id = r.rechnung_id
                 INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
  GROUP BY kunde_id
;
GO
SELECT k.kunde_id, LEFT(k.nachname, 20), LEFT(k.vorname, 20), #tmp_umsatz.rechnungswert,
 CASE
  WHEN
   #tmp_umsatz.kunde_id IS NULL THEN 'Kleinkunde'
  WHEN
   rechnungswert BETWEEN 0 AND 300 THEN 'Kleinkunde'
  WHEN
  rechnungswert BETWEEN 300 AND  1000 THEN 'Guter Kunde'
  ELSE 'Premiumkunde'
 END AS kundenart
 FROM kunde k LEFT JOIN #tmp_umsatz ON k.kunde_id = #tmp_umsatz.kunde_id
 ORDER BY rechnungswert DESC
;
GO

WITH tmp_umsatz (kunde_id, rechnungswert)
AS (
 SELECT kunde_id, SUM(a.einzelpreis * rp.menge) rechnungswert
  FROM rechnung r INNER JOIN rechnung_position rp ON rp.rechnung_id = r.rechnung_id
                  INNER JOIN artikel a ON rp.artikel_id = a.artikel_id
  GROUP BY kunde_id
)
SELECT k.kunde_id, LEFT(k.nachname, 20), LEFT(k.vorname, 20), tmp_umsatz.rechnungswert,
 CASE
  WHEN
   tmp_umsatz.kunde_id IS NULL THEN 'Kleinkunde'
  WHEN
   rechnungswert BETWEEN 0 AND 300 THEN 'Kleinkunde'
  WHEN
  rechnungswert BETWEEN 300 AND  1000 THEN 'Guter Kunde'
  ELSE 'Premiumkunde'
 END AS kundenart
 FROM kunde k LEFT JOIN tmp_umsatz ON k.kunde_id = tmp_umsatz.kunde_id
 ORDER BY rechnungswert DESC
;
GO

SELECT 'Fallbeispiel Lieferanten (Seite 269)';
GO
SELECT LEFT(l.firmenname, 20),
 CASE
  WHEN
   l.lieferant_id IN
    (
     SELECT lieferant_id FROM artikel_nm_lieferant
    ) THEN 'aktiv'
  ELSE 'inaktiv'
 END AS status
 FROM lieferant l
 ORDER BY firmenname
;
GO

SELECT LEFT(a.bezeichnung, 20),
  CASE
    WHEN l.menge_aktuell <= l.menge_mindest THEN 'Artikel sofort nachbestellen'
    WHEN l.menge_aktuell <= l.menge_mindest + 0.3 * l.menge_mindest THEN 'Artikel bald nachbestellen'
    ELSE 'Bestand ausreichend'  END AS lagerstand  FROM lagerbestand l INNER JOIN artikel a ON l.artikel_id = a.artikel_id
   ORDER BY l.menge_aktuell / l.menge_mindest
;
-- Ende Fallbeispiele
SELECT 'Ende listing12.sql //////////////////////////////////////////';
GO
