-- Ausführen der vorherigen Befehle
:r listing10.sql

SELECT 'Start listing11.sql //////////////////////////////////////////';
GO

SELECT 'UNION (Seite 249)';
GO
SELECT
 kunde_id, LEFT(vorname, 10), LEFT(strasse, 10), LEFT(hnr, 10), LEFT(lkz, 10), LEFT(plz, 10), LEFT(ort, 10)
 FROM
  kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
;
GO

SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  lieferant l INNER JOIN adresse a ON l.adresse_id = a.adresse_id
;
GO
SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
 UNION
 SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   lieferant l INNER JOIN adresse a ON l.adresse_id = a.adresse_id
;
GO
SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
 UNION ALL
 SELECT
  strasse, hnr, lkz, plz, ort
  FROM
   lieferant l INNER JOIN adresse a ON l.adresse_id = a.adresse_id
;
GO

SELECT 'INTERSECT (Seite 252)';
GO
SELECT 'Schnittmenge mit Unterabfrage (Seite 253)';
GO
SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011';
GO
SELECT DISTINCT kunde_id
 FROM rechnung
 WHERE YEAR(datum) = '2012' AND kunde_id IN (1, 2, 3)
;
GO
SELECT DISTINCT kunde_id
  FROM rechnung
  WHERE
   YEAR(datum) = '2012' AND kunde_id IN
    (
     SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011'
    )
;
GO

SELECT 'EXCEPT (Seite 254)';
GO

SELECT 'Differenz mit Unterabfrage (Seite 254)';
SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  adresse
;
GO
SELECT
 strasse, hnr, lkz, plz, ort
 FROM
  kunde INNER JOIN adresse
   ON liefer_adresse_id = adresse_id
;
GO
SELECT kunde_id
 FROM rechnung
 WHERE YEAR(datum) <> '2011' AND YEAR(datum) = '2012'
;
GO
SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011';
GO
SELECT DISTINCT kunde_id
 FROM rechnung
 WHERE
  YEAR(datum) = '2012' AND kunde_id NOT IN (1, 2, 3)
;
GO
SELECT DISTINCT kunde_id
  FROM rechnung
  WHERE
   YEAR(datum) = '2012' AND kunde_id NOT IN
    (
     SELECT kunde_id FROM rechnung WHERE YEAR(datum) = '2011'
    )
;
SELECT 'Ende listing11.sql //////////////////////////////////////////';
GO
