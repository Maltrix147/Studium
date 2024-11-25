-- Ausführen der vorherigen Befehle
\i listing09.sql

\echo 'Start listing10.sql //////////////////////////////////////////'

SELECT 'Start Aufbau Rechnungswesen' Hinweis;

INSERT INTO rechnung
 (kunde_id, bestellung_id, adresse_id, datum)
 SELECT kunde_id, bestellung_id, adresse_id, datum + INTERVAL '1 days' FROM bestellung;

INSERT INTO rechnung (rechnung_id, kunde_id, bestellung_id, adresse_id, datum, bezahlart, status)
 VALUES
  (7, 3, 0, 2, '2012-04-06 12:11:00', 'kredit', 'gestellt')
 ,(8, 3, 0, 2, '2012-04-07 13:12:00', 'kredit', 'mahnung1')
 ,(9, 5, 0, 4, '2012-04-08 14:13:00', 'rechnung', 'storno')
 ,(10, 5, 0, 4, '2012-04-09 15:14:00', 'rechnung', 'beglichen')
 ,(11, 5, 0, 4, '2012-04-10 16:15:00', 'rechnung', 'beglichen')
;
UPDATE rechnung SET status = 'inkasso' WHERE rechnung_id = 2;
INSERT INTO rechnung_position (rechnung_id, position_nr, artikel_id, menge)
 SELECT bestellung_id, position_nr, artikel_id, menge FROM bestellung_position;

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

UPDATE rechnung SET rabatt = 7 WHERE kunde_id = 1;
UPDATE rechnung SET skonto = 3 WHERE kunde_id = 5;

SELECT 'Ende Aufbau Rechnungswesen' Hinweis;

SELECT 'Problem und Lösung (Seite 223)' Hinweis;
SELECT
 bp.bestellung_id, SUM(bp.menge * a.einzelpreis) Bestellwert
 FROM
  bestellung_position bp INNER JOIN artikel a USING(artikel_id)
 GROUP BY
  bp.bestellung_id
;
SELECT
  k.nachname, k.vorname, SUM(bp.menge * a.einzelpreis) Bestellwert
 FROM
 bestellung_position bp INNER JOIN artikel a    USING(artikel_id)
                        INNER JOIN bestellung b USING(bestellung_id)
                        INNER JOIN kunde k      USING(kunde_id)
 GROUP BY
  bp.bestellung_id, k.nachname, k.vorname
;
DROP TABLE IF EXISTS tmp_bestellwert;
CREATE TEMPORARY TABLE tmp_bestellwert 
 AS
  SELECT
   bp.bestellung_id, k.nachname, k.vorname, SUM(bp.menge * a.einzelpreis) bestellwert
   FROM
    bestellung_position bp INNER JOIN artikel a USING(artikel_id)
                           INNER JOIN bestellung b USING(bestellung_id)
                           INNER JOIN kunde k USING(kunde_id)
   GROUP BY
   bp.bestellung_id, k.nachname, k.vorname
;

SELECT * FROM tmp_bestellwert;
SELECT
 nachname, vorname, SUM(bestellwert) Umsatz
 FROM tmp_bestellwert
 GROUP BY nachname, vorname
;
SELECT
 bw.nachname, bw.vorname, SUM(bw.bestellwert) Umsatz
  FROM
  (
    SELECT
     bp.bestellung_id, k.nachname, k.vorname, SUM(bp.menge * a.einzelpreis) bestellwert
     FROM
      bestellung_position bp INNER JOIN artikel a USING(artikel_id)
                             INNER JOIN bestellung b USING(bestellung_id)
                             INNER JOIN kunde k USING(kunde_id)
     GROUP BY
      bp.bestellung_id, k.nachname, k.vorname
  ) AS bw
  GROUP BY nachname, vorname
;
-- Start nicht korrelierende Unterabfrage
SELECT 'Nicht korrelierende Unterabfrage (Seite 226)' Hinweis;
SELECT MAX(blz) FROM bank;
SELECT bankname
 FROM bank
 WHERE blz = '37010050'
;
SELECT bankname
 FROM bank
 WHERE blz =
 (
  SELECT MAX(blz)
   FROM bank
 )
;
SELECT
 AVG(einzelpreis) AS durchschnittspreis
 FROM artikel
;
SELECT *
 FROM artikel
 WHERE
  einzelpreis > 30
;
SELECT *
 FROM artikel
 WHERE
  einzelpreis >
   (
    SELECT
     AVG(einzelpreis) AS durchschnittspreis
     FROM artikel
   )
;
SELECT
 bp.bestellung_id, SUM(bp.menge * a.einzelpreis) bestellwert
 FROM
  bestellung_position bp INNER JOIN artikel a USING(artikel_id)
 GROUP BY
  bp.bestellung_id
;
SELECT AVG(bw.bestellwert)
 FROM (
       SELECT
        bp.bestellung_id, SUM(bp.menge * a.einzelpreis) bestellwert
        FROM
         bestellung_position bp INNER JOIN artikel a USING(artikel_id)
        GROUP BY
        bp.bestellung_id
      ) AS bw
;
SELECT
  bp1.bestellung_id, SUM(bp1.menge * a1.einzelpreis) bestellwert1
  FROM
   bestellung_position bp1 INNER JOIN artikel a1 USING(artikel_id)
  GROUP BY
   bp1.bestellung_id
  HAVING SUM(bp1.menge * a1.einzelpreis) > 100
;
SELECT
 bp1.bestellung_id, SUM(bp1.menge * a1.einzelpreis) bwert1
 FROM
  bestellung_position bp1 INNER JOIN artikel a1 USING(artikel_id)
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
        bestellung_position bp2 INNER JOIN artikel a2
        USING(artikel_id)
       GROUP BY
        bp2.bestellung_id
     ) AS bw
   )
;
SELECT bestellung_id FROM bestellung;
SELECT rechnung_id
 FROM rechnung
 WHERE bestellung_id IN
 (
  SELECT bestellung_id FROM bestellung
 )
;
SELECT a.einzelpreis
 FROM
  artikel_nm_warengruppe INNER JOIN artikel a     USING(artikel_id)
                         INNER JOIN warengruppe w USING(warengruppe_id)
 WHERE
  w.bezeichnung = 'Gartenbedarf'
;
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ALL(SELECT 10)
;
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ALL
  (
    SELECT a.einzelpreis
     FROM
      artikel_nm_warengruppe INNER JOIN artikel a USING(artikel_id)
                             INNER JOIN warengruppe w USING(warengruppe_id)
      WHERE
       w.bezeichnung = 'Gartenbedarf'
  )
;
SELECT
 rechnung_id, kunde_id, SUM(einzelpreis*menge) AS umsatz
 FROM
  rechnung_position INNER JOIN artikel  USING(artikel_id)
                    INNER JOIN rechnung USING(rechnung_id)
 GROUP BY
  rechnung_id, kunde_id
;
SELECT SUM(umsatz) AS umsatzsumme
 FROM
 (
  SELECT
   rechnung_id, kunde_id, SUM(einzelpreis*menge) AS umsatz
   FROM
    rechnung_position INNER JOIN artikel  USING(artikel_id)
                      INNER JOIN rechnung USING(rechnung_id)
   GROUP BY
    rechnung_id, kunde_id
 ) AS ksum
 GROUP BY
  kunde_id
;
SELECT SUM(umsatz) AS umsatzsumme
 FROM
 (
  SELECT
   rechnung_id, kunde_id, SUM(einzelpreis*menge) AS umsatz
   FROM
    rechnung_position INNER JOIN artikel  USING(artikel_id)
                      INNER JOIN rechnung USING(rechnung_id)
                      INNER JOIN kunde    USING(kunde_id)
   WHERE nachname = 'beutlin'
   GROUP BY
    rechnung_id, kunde_id
 ) AS ksum
 GROUP BY
  kunde_id
;
SELECT kunde_id, SUM(umsatz) AS umsatzsumme
 FROM
 (
  SELECT
   rechnung_id, kunde_id, SUM(einzelpreis*menge) AS umsatz
   FROM
    rechnung_position INNER JOIN artikel  USING(artikel_id)
                      INNER JOIN rechnung USING(rechnung_id)
   GROUP BY
    rechnung_id, kunde_id
 ) AS ksum
 GROUP BY
  kunde_id
 HAVING SUM(umsatz) > ALL (SELECT 100)
;
SELECT kunde_id, kunde.nachname, kunde.vorname, SUM(umsatz) AS umsatzsumme
 FROM
 (
  SELECT
   rechnung_id, kunde_id, SUM(einzelpreis*menge) AS umsatz
   FROM
    rechnung_position INNER JOIN artikel  USING(artikel_id)
                      INNER JOIN rechnung USING(rechnung_id)
    GROUP BY
     rechnung_id, kunde_id
  ) AS ksum
   INNER JOIN kunde USING (kunde_id)
  GROUP BY
   kunde_id, kunde.nachname, kunde.vorname
   HAVING SUM(umsatz) > ALL
   (
    SELECT SUM(umsatz) AS umsatzsumme
     FROM
     (
      SELECT
       rechnung_id, kunde_id, SUM(einzelpreis*menge) AS umsatz
       FROM
        rechnung_position INNER JOIN artikel  USING(artikel_id)
                          INNER JOIN rechnung USING(rechnung_id)
                          INNER JOIN kunde    USING(kunde_id)
       WHERE nachname = 'beutlin'
       GROUP BY
        rechnung_id, kunde_id
    ) AS ksum
    GROUP BY
     kunde_id, kunde.nachname, kunde.vorname
   )
;
SELECT a.einzelpreis
 FROM
  artikel_nm_warengruppe INNER JOIN artikel a     USING(artikel_id)
                         INNER JOIN warengruppe w USING(warengruppe_id)
 WHERE
  w.bezeichnung = 'Bürobedarf'
;
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ANY(SELECT 10)
;
SELECT
 a.bezeichnung, a.einzelpreis
 FROM
  artikel a
 WHERE
  a.einzelpreis > ANY
  (
   SELECT a.einzelpreis
    FROM
     artikel_nm_warengruppe INNER JOIN artikel a USING(artikel_id)
                            INNER JOIN warengruppe w USING(warengruppe_id)
    WHERE
     w.bezeichnung = 'Bürobedarf'
  )
;
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
     artikel_nm_warengruppe nm  INNER JOIN warengruppe w USING(warengruppe_id)
    WHERE w.bezeichnung = 'Bürobedarf'
  )
  AND
   a.einzelpreis > ANY
   (
    SELECT a.einzelpreis
     FROM
      artikel_nm_warengruppe nm INNER JOIN artikel a USING(artikel_id)
                                INNER JOIN warengruppe w USING(warengruppe_id)
     WHERE
      w.bezeichnung = 'Bürobedarf'
   )
;
SELECT DISTINCT k.nachname, k.vorname
 FROM
  rechnung r INNER JOIN kunde k USING(kunde_id)
 WHERE
  EXTRACT(ISOYEAR FROM r.datum) = '2011' AND (k.nachname, k.vorname) IN
  (
   SELECT
    k.nachname, k.vorname
    FROM
     rechnung r INNER JOIN kunde k USING(kunde_id)
    WHERE
     EXTRACT(ISOYEAR FROM r.datum) = '2012'
  )
;
-- Ende nicht korrelierende Unterabfrage

-- Start korrelierende Unterabfrage
SELECT 'Korrelierende Unterabfrage (Seite 238)' Hinweis;
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
-- Ende korrelierende Unterabfrage

-- Start Fallstudie
SELECT 'Fallstudie Datenimport (Seite 240)' Hinweis;
DROP TABLE IF EXISTS tmp_import;
CREATE TEMPORARY TABLE tmp_import
(
 nachname VARCHAR(255),
 vorname  VARCHAR(255),
 strasse  VARCHAR(255),
 hnr      VARCHAR(255),
 lkz      VARCHAR(255),
 plz      VARCHAR(255),
 ort      VARCHAR(255),
 ktnr     VARCHAR(255),
 blz      VARCHAR(255)
);

\copy tmp_import FROM './kunden01.csv' WITH DELIMITER ';' CSV HEADER
SELECT SETVAL('kunde_kunde_id_seq', 6); -- PK Wert manuel anpassen
INSERT INTO kunde (nachname, vorname)
 SELECT DISTINCT nachname, vorname
  FROM tmp_import tmp
  WHERE
   (tmp.vorname, tmp.nachname) NOT IN
    (
     SELECT vorname, nachname FROM kunde
    )
;
SELECT * FROM tmp_import;
SELECT SETVAL('adresse_adresse_id_seq', 100); -- PK Wert manuel anpassen
INSERT INTO adresse (strasse, hnr, lkz, plz, ort)
 SELECT DISTINCT strasse, hnr, lkz, plz, ort
  FROM tmp_import tmp
  WHERE
   (tmp.strasse, tmp.hnr, tmp.lkz, tmp.plz, tmp.ort) NOT IN
    (
     SELECT strasse, hnr, lkz, plz, ort
      FROM adresse
    )
;
ALTER TABLE tmp_import ADD kunde_id   INT ,
                       ADD adresse_id INT ,
                       ADD bank_id    CHAR(12) 
;
UPDATE tmp_import SET
 kunde_id =
  (
   SELECT kunde_id
    FROM kunde k
    WHERE tmp_import.vorname = k.vorname AND tmp_import.nachname = k.nachname
  ),
 adresse_id =
  (
   SELECT adresse_id
    FROM adresse a
    WHERE
     tmp_import.strasse = a.strasse
      AND tmp_import.hnr = a.hnr
      AND tmp_import.plz = a.plz
      AND tmp_import.ort = a.ort
  ),
 bank_id =
  (
   SELECT bank_id FROM bank WHERE tmp_import.blz = bank.blz LIMIT 1
  )
;

INSERT INTO
 bankverbindung (kunde_id, bankverbindung_nr, bank_id, kontonummer, iban)
 SELECT DISTINCT kunde_id, 1, bank_id, ktnr, blz || ktnr
  FROM tmp_import tmp
  WHERE
   (tmp.kunde_id, 1, tmp.bank_id, tmp.ktnr) NOT IN
    (
     SELECT kunde_id, 1, bank_id, kontonummer
      FROM bankverbindung
    )
;
ALTER TABLE tmp_import
 ADD bankverbindung_nr INT NOT NULL DEFAULT 1
;
UPDATE kunde k SET
 rechnung_adresse_id =
  (
   SELECT adresse_id FROM tmp_import tmp WHERE tmp.kunde_id = k.kunde_id
  )
  WHERE k.rechnung_adresse_id IS NULL
;
SELECT kunde_id, nachname, vorname, strasse, ort
 FROM
  kunde LEFT JOIN adresse ON kunde.rechnung_adresse_id = adresse_id
;
-- Ende Fallstudie

SELECT 'Unterabfragen intern (Seite 243) Hinweis';
SELECT
   bp1.bestellung_id, SUM(bp1.menge * a1.einzelpreis) bwert1
   FROM
    bestellung_position bp1 INNER JOIN artikel a1 USING(artikel_id)
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
          bestellung_position bp2 INNER JOIN artikel a2
           USING(artikel_id)
        GROUP BY
         bp2.bestellung_id
      ) AS bw
);

EXPLAIN 
SELECT
   bp1.bestellung_id, SUM(bp1.menge * a1.einzelpreis) bwert1
   FROM
    bestellung_position bp1 INNER JOIN artikel a1 USING(artikel_id)
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
          bestellung_position bp2 INNER JOIN artikel a2
           USING(artikel_id)
        GROUP BY
         bp2.bestellung_id
      ) AS bw
    );
	
\echo 'Ende listing10.sql //////////////////////////////////////////'
