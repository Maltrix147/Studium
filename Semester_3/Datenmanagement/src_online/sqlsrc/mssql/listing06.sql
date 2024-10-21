-- Ausführen der vorherigen Befehle
:r listing05.sql

SELECT 'Start listing06.sql //////////////////////////////////////////';
GO
SELECT 'WHERE mit TRUE / FALSE (Seite 140)';
SELECT 'TSQL kennt keine boolschen Konstanten';
-- SELECT * FROM artikel WHERE TRUE;
-- SELECT * FROM artikel WHERE FALSE;

-- Start Groß- Kleinschreibung
SELECT 'Gross- Kleinschreibung (Seite 141)';
GO
DROP TABLE IF EXISTS #wurstbrot;
GO
CREATE TABLE #wurstbrot (
 name NVARCHAR(15) 
);
GO

INSERT INTO #wurstbrot 
 VALUES
   ('Jaqueline')
  ,('Kevin')
  ,('kevin')
  ,('jaqueline')

SELECT * FROM #wurstbrot WHERE name = 'kevin';
GO

DROP TABLE #wurstbrot;
GO

CREATE TABLE #wurstbrot (
 name NVARCHAR(15) COLLATE SQL_Latin1_General_CP1_CS_AS
);
GO

INSERT INTO #wurstbrot 
 VALUES
   ('Jaqueline')
  ,('Kevin')
  ,('kevin')
  ,('jaqueline')

SELECT * FROM #wurstbrot WHERE name = 'kevin';
GO
-- Ende Groß- Kleinschreibung

-- Start Wertberechnung
SELECT 'Wertberechnung (Seite 146)' Hinweis;
SELECT * FROM artikel;
GO
UPDATE artikel SET einzelpreis = einzelpreis + einzelpreis / 100.0;
SELECT * FROM artikel;
GO
UPDATE artikel SET einzelpreis = ROUND(einzelpreis, 2);
SELECT * FROM artikel;
GO
-- Ende Wertberechnung

-- Start Gebastelte Zeichenketten
SELECT 'Gebastelte Zeichenketten: Anrede (Seite 147)' Hinweis;
GO
ALTER TABLE kunde ADD anrede NVARCHAR(255);
GO
UPDATE kunde
 SET anrede = CONCAT('Sehr geehrte/r Frau/Herr ', nachname)
 WHERE nachname <> ''
;
SELECT * FROM kunde;
GO
-- Ende Gebastelte Zeichenketten

-- Start DELETE
SELECT 'Löschen mit DELETE (Seite 148)';
GO
SELECT * FROM bestellung_position;
GO
DELETE FROM bestellung_position WHERE bestellung_id = 1;
SELECT * FROM bestellung_position;
GO

-- Start Wiederherstellen der Daten
INSERT INTO bestellung_position (bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (1, 1, 7856, 30)
  ,(1, 2, 7863, 50)
  ,(1, 3, 9015, 1)
;
GO
-- Ende Wiederherstellen der Daten

-- SELECT 'Löschversuch mit Constraint. Erwarte eine Fehlermeldung! (Seite 150)';
-- DELETE FROM kunde WHERE kunde_id = 1;

SELECT 'Test IDENTITY(1,1) (Seite 150)';
GO
SELECT kunde_id, nachname FROM kunde;
GO
DELETE FROM kunde WHERE kunde_id IN (3,5);
GO
SELECT kunde_id, nachname FROM kunde;
GO
INSERT INTO kunde (nachname, vorname) VALUES ('Eichenschild', 'Thorin');
SELECT kunde_id, nachname FROM kunde;
GO
-- Start Wiederherstellen der Daten
SET IDENTITY_INSERT kunde ON ;
INSERT INTO kunde (kunde_id, rechnung_adresse_id, nachname, vorname, art)
 VALUES
   (3, 2, 'Beutlin',     'Bilbo',   1)
  ,(5, 4, 'Earendilionn','Elrond',  3)
;
SET IDENTITY_INSERT kunde OFF ;
SELECT kunde_id, nachname FROM kunde;
GO

SELECT 'Tabelle leeren (Seite 152)' Hinweis;
GO
-- DELETE FROM bestellung_position;
-- GO
-- TRUNCATE bestellung_position;
-- GO
-- Ende DELETE
SELECT 'Ende listing06.sql //////////////////////////////////////////';
GO