-- Ausführen der vorherigen Befehle
\include listing11.sql

\echo 'Start listing12.sql //////////////////////////////////////////'

SELECT kunde_id, nachname, vorname, art FROM kunde;
SELECT 'Start Aufbau einer temporaeren art-Tabelle (Seite 260)' Hinweis;

DROP TABLE IF EXISTS  tmp_art;
CREATE TEMPORARY TABLE tmp_art
(
 art kundenart,
 k_art VARCHAR(255)
)
;

INSERT INTO tmp_art
  VALUES
    ('prv', 'Privatkunde')
   ,('gsch', 'Geschäftskunde')
   ,('unb', 'Unbekannt')
;

SELECT kunde_id, nachname, vorname, k_art
  FROM
   kunde INNER JOIN tmp_art USING(art)
;
SELECT 'Ende Aufbau einer temporaeren art-Tabelle' Hinweis;

SELECT 'Lösung mit UNIONs (Seite 260)' Hinweis;
SELECT kunde_id, nachname, vorname, k_art
 FROM
  kunde INNER JOIN
  (
   SELECT 'prv' AS art, 'Privatkunde' AS k_art
   UNION
   SELECT 'gsch' AS art, 'Geschäftskunde' AS k_art
   UNION
   SELECT 'unb' AS art, 'Unbekannt' AS k_art
  ) t
   ON kunde.art::text = t.art
;

SELECT 'Nö (Seite 261)' Hinweis;
SELECT kunde_id, nachname, vorname,
 CASE art
  WHEN  'prv'  THEN 'Privatkunde'
  WHEN  'gsch' THEN 'Geschäftskunde'
  ELSE 'Unbekannt'
 END AS k_art
 FROM kunde
;

-- Start Einfacher CASE
SELECT 'Einfacher CASE (Seite 262)' Hinweis;
SELECT artikel_id, bezeichnung,
 CASE waehrung
  WHEN 'EUR' THEN ROUND(einzelpreis, 2) || ' €'
  WHEN 'USD' THEN ROUND(einzelpreis, 2) || ' $'
  ELSE '?????'
 END AS preis
 FROM artikel
;
UPDATE artikel SET waehrung = 'XYZ' WHERE artikel_id = 3001;
SELECT artikel_id, bezeichnung,
 CASE waehrung
  WHEN 'EUR' THEN ROUND(einzelpreis, 2) || ' €'
  WHEN 'USD' THEN ROUND(einzelpreis, 2) || ' $'
 END AS preis
 FROM artikel
;
UPDATE artikel SET waehrung = 'EUR' WHERE artikel_id = 3001;
-- Ende Einfacher CASE

-- Start Searched CASE
SELECT 'Searched CASE (Seite 263)' Hinweis;
SELECT beitrag_id,
 CASE
  WHEN bezug_beitrag_id > 1 THEN 'Antwort'
  WHEN bezug_beitrag_id <= 1 THEN 'Keine Antwort'
  ELSE '??????'
 END AS Typ
 FROM beitrag
 ORDER BY beitrag_id
;
SELECT beitrag_id,
 CASE
  WHEN bezug_beitrag_id > 1
   THEN nachricht || ' Antwort auf ' || bezug_beitrag_id || ': >' ||
   (
    SELECT nachricht
     FROM beitrag b2
     WHERE b2.beitrag_id = b1.bezug_beitrag_id
   )
  WHEN bezug_beitrag_id <= 1 THEN nachricht
  ELSE '??????'
 END AS Inhalt
 FROM beitrag b1
 WHERE beitrag_id > 1
;
SELECT beitrag_id,
 CASE
  WHEN bezug_beitrag_id >= 0 THEN 'Antwort'
  WHEN bezug_beitrag_id >  1 THEN 'Keine Antwort'
  ELSE '??????'
 END AS Typ
 FROM beitrag
 ORDER BY beitrag_id
;
-- Ende Searched CASE

-- Start Fallbeispiele
SELECT 'Fallbeispiel Lagerbestand (Seite 265)' Hinweis;
SELECT * FROM lagerbestand;
SELECT a.bezeichnung,
 CASE
  WHEN l.menge_aktuell <= l.menge_mindest
   THEN 'Artikel nachbestellen'
  ELSE 'Bestand ausreichend'
 END AS lagerstand
 FROM lagerbestand l INNER JOIN artikel a USING(artikel_id)
 ORDER BY l.menge_aktuell / l.menge_mindest
;

SELECT 'Fallbeispiel Kundengruppen (Seite 266)' Hinweis;
SELECT DISTINCT k.kunde_id, k.nachname, k.vorname,
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
  rechnung r RIGHT OUTER JOIN kunde k USING(kunde_id)
 ;
SELECT k.kunde_id, k.nachname, k.vorname,
  (
   SELECT SUM(a.einzelpreis * rp.menge)
    FROM rechnung r INNER JOIN rechnung_position rp
                     USING (rechnung_id)
                    INNER JOIN artikel a
                     USING (artikel_id)
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
                      USING (rechnung_id)
                     INNER JOIN artikel a
                      USING (artikel_id)
    WHERE r.kunde_id = k.kunde_id
  ) BETWEEN 0 AND 300 THEN 'Kleinkunde'
  WHEN
  (
   SELECT SUM(a.einzelpreis * rp.menge) rechnungswert
    FROM rechnung r INNER JOIN rechnung_position rp
                     USING (rechnung_id)
                    INNER JOIN artikel a
                     USING (artikel_id)
    WHERE r.kunde_id = k.kunde_id
  ) BETWEEN 300 AND  1000 THEN 'Guter Kunde'
  ELSE 'Prämiumkunde'
 END AS kundenart
 FROM kunde k
 ORDER BY
 (
  SELECT SUM(a.einzelpreis * rp.menge) rechnungswert
   FROM rechnung r INNER JOIN rechnung_position rp
                    USING (rechnung_id)
                   INNER JOIN artikel a
                    USING (artikel_id)
   WHERE r.kunde_id = k.kunde_id
 ) DESC
;
DROP TABLE IF EXISTS tmp_umsatz;
CREATE TEMPORARY TABLE tmp_umsatz AS
 SELECT kunde_id, SUM(a.einzelpreis * rp.menge) rechnungswert
    FROM rechnung r INNER JOIN rechnung_position rp USING (rechnung_id)
                    INNER JOIN artikel a USING (artikel_id)
 GROUP BY kunde_id
;
SELECT k.kunde_id, k.nachname, k.vorname, tmp.rechnungswert,
 CASE
  WHEN
   tmp.kunde_id IS NULL THEN 'Kleinkunde'
  WHEN
   rechnungswert BETWEEN 0 AND 300 THEN 'Kleinkunde'
  WHEN
  rechnungswert BETWEEN 300 AND  1000 THEN 'Guter Kunde'
  ELSE 'Premiumkunde'
 END AS kundenart
 FROM kunde k LEFT JOIN tmp_umsatz tmp USING(kunde_id)
 ORDER BY rechnungswert DESC
;

WITH tmp_umsatz (kunde_id, rechnungswert)
AS (
 SELECT kunde_id, SUM(a.einzelpreis * rp.menge) rechnungswert
  FROM rechnung r INNER JOIN rechnung_position rp USING (rechnung_id)
                  INNER JOIN artikel a USING (artikel_id)
  GROUP BY kunde_id
)
SELECT k.kunde_id, k.nachname, k.vorname, tmp.rechnungswert,
 CASE
  WHEN
   tmp.kunde_id IS NULL THEN 'Kleinkunde'
  WHEN
   rechnungswert BETWEEN 0 AND 300 THEN 'Kleinkunde'
  WHEN
  rechnungswert BETWEEN 300 AND  1000 THEN 'Guter Kunde'
  ELSE 'Premiumkunde'
 END AS kundenart
 FROM kunde k LEFT JOIN tmp_umsatz tmp USING(kunde_id)
 ORDER BY rechnungswert DESC
;

SELECT 'Fallbeispiel Lieferanten (Seite 269)' Hinweis;
SELECT l.firmenname,
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

SELECT a.bezeichnung,
  CASE
    WHEN l.menge_aktuell <= l.menge_mindest THEN 'Artikel sofort nachbestellen'
    WHEN l.menge_aktuell <= l.menge_mindest + 0.3 * l.menge_mindest THEN 'Artikel bald nachbestellen'
    ELSE 'Bestand ausreichend'  END AS lagerstand  FROM lagerbestand l INNER JOIN artikel a USING(artikel_id)
   ORDER BY l.menge_aktuell / l.menge_mindest
;
-- Ende Fallbeispiele
\echo 'Ende listing12.sql //////////////////////////////////////////'
