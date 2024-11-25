-- Start Fallstudie
SELECT 'Fallstudie Datenimport (Seite 238)';
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
;
GO
SELECT kunde_id, TRIM(LEFT(nachname, 20)), TRIM(LEFT(vorname, 20)), TRIM(LEFT(strasse, 20)), TRIM(LEFT(ort, 20))
 FROM
  kunde LEFT JOIN adresse ON kunde.rechnung_adresse_id = adresse_id
;
GO
