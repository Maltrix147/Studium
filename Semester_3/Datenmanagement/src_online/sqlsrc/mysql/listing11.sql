-- Ausführen der vorherigen Befehle
SOURCE listing10.sql

SELECT 'Start listing11.sql //////////////////////////////////////////';

SELECT 'UNION (Seite 251)';
SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
;
SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  lieferant INNER JOIN adresse USING(adresse_id)
;
SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
 UNION
 SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   lieferant INNER JOIN adresse USING(adresse_id)
;
SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
 UNION ALL
 SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   lieferant INNER JOIN adresse USING(adresse_id)
;

SELECT 'INTERSECT (Seite 254)';
SELECT 'Schnittmenge mit Unterabfrage (Seite 255)';
SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011';
SELECT DISTINCT kunde_id
 FROM rechnung
 WHERE YEAR(datum) = '2012' AND kunde_id IN (1, 2, 3)
;
SELECT DISTINCT kunde_id
  FROM rechnung
  WHERE
   YEAR(datum) = '2012' AND kunde_id IN
    (
     SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011'
    )
;

SELECT 'EXCEPT (Seite 256)';

SELECT 'Differenz mit Unterabfrage (Seite 256)';
SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  adresse
;
SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  kunde INNER JOIN adresse
   ON liefer_adresse_id = adresse_id
;
SELECT kunde_id
 FROM rechnung
 WHERE YEAR(datum) <> '2011' AND YEAR(datum) = '2012'
;
SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011';
SELECT DISTINCT kunde_id
 FROM rechnung
 WHERE
  YEAR(datum) = '2012' AND kunde_id NOT IN (1, 2, 3)
;
SELECT DISTINCT kunde_id
  FROM rechnung
  WHERE
   YEAR(datum) = '2012' AND kunde_id NOT IN
    (
     SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011'
    )
;
SELECT 'Ende listing11.sql //////////////////////////////////////////';
