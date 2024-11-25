-- Ausführen der vorherigen Befehle
:r listing06.sql

SELECT 'Start listing07.sql //////////////////////////////////////////';
GO
SELECT 'Ausdrücke (Seite 156)';
GO

SELECT 5, 'Beginn der Auswertung';
GO
SELECT -5, 9 + 4, 9 - 4, 9 * 4, 9 / 4, 9.0 / 4.0, 9 % 4;
GO
SELECT 3 * 4 / 3, (3 * 4) / 3, 3 * (4 / 3);
GO
SELECT 9 * NULL;
GO

SELECT 'Zufallszahlen (Seite 158)';
GO
SELECT RAND(1);
GO
SELECT RAND(1);
GO
SELECT RAND(CONVERT(VARBINARY, NEWID())) FROM artikel;
GO

SELECT 'Variablen (Seite 159)';
GO
DECLARE @x INT
SELECT POWER(2,8) INTO @x;
SELECT @x - 1;
GO

DECLARE @artnr INT
SELECT @artnr=3010;
SELECT * FROM artikel WHERE artikel_id=@artnr;
GO

SELECT 'Spalten- und Zeilenwahl (Seite 160)';
GO

SELECT * FROM artikel;
GO

SELECT
 artikel_id, bezeichnung, einzelpreis, waehrung, deleted
 FROM artikel
;
GO

SELECT
 artikel_id + 10000 AS Unsinn, deleted AS Löschkennzeichen
 FROM artikel
;
GO

SELECT
 artikel_id, bezeichnung
 FROM artikel
 WHERE einzelpreis BETWEEN 10 AND 100
;
GO

SELECT 'Sortierung (Seite 161)';
GO
SELECT
 artikel_id, bezeichnung, einzelpreis
 FROM artikel
 ORDER BY einzelpreis ASC
;
GO

SELECT
 nachname, vorname
 FROM kunde
 ORDER BY nachname, vorname
;
GO

SELECT
 nachname, vorname
 FROM kunde
 ORDER BY nachname DESC, vorname ASC
;
GO

SELECT 'TSQL liefert in diesem Fall die gleiche Sortierung' Hinweis;
GO
DROP TABLE IF EXISTS #wurstbrot;
CREATE TABLE #wurstbrot ( name VARCHAR(255) COLLATE SQL_AltDiction_CP850_CI_AI);
INSERT INTO #wurstbrot
 VALUES
   ('winfried')
  ,('achim')
  ,('olga')
  ,('zechine')
  ,('ägidius')
;
SELECT * FROM #wurstbrot ORDER BY name;
GO

DROP TABLE IF EXISTS #wurstbrot;
CREATE TABLE #wurstbrot ( name VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CS_AS);
INSERT INTO #wurstbrot
 VALUES
   ('winfried')
  ,('achim')
  ,('olga')
  ,('zechine')
  ,('ägidius')
;
SELECT * FROM #wurstbrot ORDER BY name;
GO

DROP TABLE IF EXISTS #wurstbrot;
GO
CREATE TABLE #wurstbrot (name VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS);
INSERT INTO #wurstbrot
 VALUES
   ('winfried')
  ,('achim')
  ,('olga')
  ,('Olga')
  ,('zechine')
;
SELECT * FROM #wurstbrot ORDER BY name;
SELECT * FROM #wurstbrot ORDER BY name DESC;
GO

DROP TABLE IF EXISTS #wurstbrot;
GO
CREATE TABLE #wurstbrot (name VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CS_AS);
INSERT INTO #wurstbrot
 VALUES
   ('winfried')
  ,('achim')
  ,('olga')
  ,('Olga')
  ,('zechine')
;
SELECT * FROM #wurstbrot ORDER BY name;
SELECT * FROM #wurstbrot ORDER BY name DESC;
GO

DROP TABLE IF EXISTS #wurstbrot;
GO

SELECT
 bestellung_id, datum
 FROM bestellung
 ORDER BY datum;
GO

SELECT
 bestellung_id, CONVERT(TIME, datum) Uhrzeit
 FROM bestellung
 ORDER BY uhrzeit; 
GO

SET SHOWPLAN_ALL ON
GO
SELECT * FROM kunde ORDER BY nachname, vorname;
GO
SET SHOWPLAN_ALL OFF
GO

SELECT 'Mehrfachausgaben unterbinden (Seite 171)';
GO

SELECT ort FROM adresse ORDER BY ort;
SELECT DISTINCT ort FROM adresse ORDER BY ort;
SELECT DISTINCT nachname FROM kunde ORDER BY nachname;
GO


-- Das Fallbeispiel Bankimport müsste in TSQL ganz anders als
-- in MySQL oder MariaDB gelöst werden. 
-- Daher hier nur der INSERT, damit die Bankdaten vorliegen.
SELECT 'Bankdaten importieren (Seite 172)';
GO
ALTER TABLE bank ADD blz NCHAR(12) NOT NULL DEFAULT '';
GO
:r blz_20120305.sql
GO

CREATE INDEX idx_bank_blzbankname
  ON bank (blz, bankname)
;
GO

-- Beginn Für die vorhandenen Kunden eine Bankverbindung bauen

INSERT INTO bankverbindung (kunde_id, bankverbindung_nr, bank_id, kontonummer, iban)
 VALUES
 (1, 1, 2,  '1111111111', '100100101111111111'),
 (1, 2, 2,  '1111111112', '100100101111111112'),
 (2, 1, 35, '2222222221', '100601982222222221'),
 (3, 1, 35, '3333333331', '100601983333333331'),
 (4, 1, 90, '4444444441', '120700004444444441'),
 (5, 1, 90, '5555555551', '120700005555555551')
;
GO
-- Ende Für die vorhandenen Kunden eine Bankverbindung bauen

-- Ende Bankimport

SELECT 'Ausschneiden mit TOP (Seite 175)';
GO
-- SELECT * FROM bank;
SELECT TOP(3) blz, bankname FROM bank;
GO
SELECT TOP(1)
 blz, bankname
 FROM bank
 ORDER BY blz DESC
;
GO

DECLARE @blzmin BIGINT;
SELECT TOP(1) @blzmin = 
 blz
 FROM bank
 ORDER BY blz DESC
;
SELECT
 bankname
 FROM bank
 WHERE blz = @blzmin
;
GO

SELECT blz, bankname FROM bank ORDER BY blz OFFSET 1 ROWS FETCH NEXT 2 ROWS ONLY;
SELECT TOP(1) blz, bankname FROM bank ORDER BY blz ;
SELECT blz, bankname FROM bank ORDER BY blz OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;
GO

SELECT 'Ende listing07.sql //////////////////////////////////////////';
GO