-- Ausführen der vorherigen Befehle
\include listing10.sql

 \echo 'Start listing11.sql //////////////////////////////////////////'

SELECT 'UNION (Seite 249)' Hinweis;
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

SELECT 'INTERSECT (252)' Hinweis;

SELECT kunde_id FROM rechnung WHERE EXTRACT(ISOYEAR FROM datum) = '2011'
INTERSECT
SELECT kunde_id FROM rechnung WHERE EXTRACT(ISOYEAR FROM datum) = '2012';

SELECT 'Schnittmenge mit Unterabfrage (Seite 251)' Hinweis;
SELECT kunde_id FROM rechnung WHERE EXTRACT(ISOYEAR FROM datum) = '2011';
SELECT DISTINCT kunde_id
 FROM rechnung
 WHERE EXTRACT(ISOYEAR FROM datum) = '2012' AND kunde_id IN (1, 2, 3)
;
SELECT DISTINCT kunde_id
  FROM rechnung
  WHERE
   EXTRACT(ISOYEAR FROM datum) = '2012' AND kunde_id IN
    (
     SELECT kunde_id FROM rechnung WHERE EXTRACT(ISOYEAR FROM datum) = '2011'
    )
;

SELECT 'EXCEPT (Seite 254)' Hinweis;
SELECT strasse, hnr, lkz, plz, ort FROM adresse
EXCEPT
SELECT strasse, hnr, lkz, plz, ort
 FROM kunde INNER JOIN adresse ON liefer_adresse_id = adresse_id
;

SELECT 'Differenz mit Unterabfrage (Seite 254)' Hinweis;
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
 WHERE EXTRACT(ISOYEAR FROM datum) <> '2011' AND EXTRACT(ISOYEAR FROM datum) = '2012'
;
SELECT kunde_id FROM rechnung WHERE EXTRACT(ISOYEAR FROM datum) = '2011';
SELECT DISTINCT kunde_id
 FROM rechnung
 WHERE
  EXTRACT(ISOYEAR FROM datum) = '2012' AND kunde_id NOT IN (1, 2, 3)
;
SELECT DISTINCT kunde_id
  FROM rechnung
  WHERE
   EXTRACT(ISOYEAR FROM datum) = '2012' AND kunde_id NOT IN
    (
     SELECT kunde_id FROM rechnung WHERE EXTRACT(ISOYEAR FROM datum) = '2011'
    )
;
\echo 'Ende listing11.sql //////////////////////////////////////////'
