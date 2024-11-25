-- Ausführen der vorherigen Befehle
:r listing04.sql

SELECT 'Start listing05.sql //////////////////////////////////////////';
GO
SELECT 'Aktuelle Datenbankeinstellung (Seite 124)';
GO
SELECT 
 LEFT(name, 10) AS dbname, collation_name 
 FROM sys.databases
;
GO

SELECT 'DATABASE löschen (Seite 125)';
GO
CREATE DATABASE wurstbrot;
SELECT 
 LEFT(name, 10) AS dbname, collation_name 
 FROM sys.databases
;
GO

DROP DATABASE wurstbrot;
SELECT 
 LEFT(name, 10) AS dbname, collation_name 
 FROM sys.databases
;
GO

-- Start Tabellen umbenennen
SELECT 'Tabellen umbenennen (Seite 128)';
USE oshop;
GO

DROP TABLE IF EXISTS wurstbrot;
SELECT LEFT(name, 20) AS 'tabname', crdate FROM oshop.dbo.sysobjects WHERE xtype='U' ORDER BY tabname
GO

EXEC sp_rename adresse, wurstbrot;
SELECT LEFT(name, 20) AS 'tabname', crdate FROM oshop.dbo.sysobjects WHERE xtype='U' ORDER BY tabname
GO

SELECT 
 ordinal_position,
 LEFT(column_name, 20) AS 'column_name',
 LEFT(data_type, 20) AS 'data_type',
 character_maximum_length, 
 is_nullable
 FROM information_schema.columns
 WHERE table_name = 'kunde'
;
GO

EXEC sp_rename wurstbrot, adresse;
GO
-- Ende Tabellen umbenennen

-- Start Spalten verändern
SELECT 'Spalte hinzufügen (Seite 129)';
GO
SELECT 
 ordinal_position,
 LEFT(column_name, 20) AS 'column_name',
 LEFT(data_type, 20) AS 'data_type',
 character_maximum_length, 
 is_nullable
 FROM information_schema.columns
 WHERE table_name = 'kunde'
;
GO
ALTER TABLE kunde
  ADD firmenname VARCHAR(255) NOT NULL DEFAULT ''
;
GO
SELECT 
 ordinal_position,
 LEFT(column_name, 20) AS 'column_name',
 LEFT(data_type, 20) AS 'data_type',
 character_maximum_length, 
 is_nullable
 FROM information_schema.columns
 WHERE table_name = 'kunde'
;
GO

SELECT 'Spalte Datentyp ändern (Seite 131)';
GO
SELECT 'Kein enum in TSQL'
GO
-- ALTER TABLE kunde
--   MODIFY
--    bezahlart ENUM('rechnung', 'bankeinzug', 'nachname') DEFAULT 'rechnung'
-- ;


SELECT 'Spaltenlänge ändern (Seite 131§)';
GO

DROP TABLE IF EXISTS #bla ;
GO
SELECT * INTO #bla FROM artikel;
-- ALTER TABLE #bla
-- ALTER COLUMN bezeichnung CHAR(10);
SELECT MAX(LEN(bezeichnung)) AS 'maxlen' FROM artikel;
GO


SELECT 'Datum- und Zeitspalten ändern (Seite 132)';
GO
-- Die Beispiele lassen sich so nicht in TSQL nachbauen.
-- Das Abändern erfolgt über CAST- oder CONVERT-Funktionen
-- mit einem gleichzeitigen Neuaufbau der Tabellen.


DROP TABLE IF EXISTS wurstbrot ;
GO
SELECT * INTO wurstbrot FROM adresse;
GO
SELECT 
 ordinal_position,
 LEFT(column_name, 20) AS 'column_name',
 LEFT(data_type, 20) AS 'data_type',
 character_maximum_length, 
 is_nullable
 FROM information_schema.columns
 WHERE table_name = 'wurstbrot'
;
GO

SELECT 'Spalten löschen (Seite 135)';
ALTER TABLE wurstbrot
 DROP COLUMN deleted
;
ALTER TABLE wurstbrot
 DROP COLUMN strasse
;
ALTER TABLE wurstbrot
 DROP COLUMN ort
;

SELECT 
 ordinal_position,
 LEFT(column_name, 20) AS 'column_name',
 LEFT(data_type, 20) AS 'data_type',
 character_maximum_length, 
 is_nullable
 FROM information_schema.columns
 WHERE table_name = 'wurstbrot'
;
GO
SELECT 'Ende listing05.sql //////////////////////////////////////////';
GO