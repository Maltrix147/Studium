-- Ausführen der vorherigen Befehle
:r listing03.sql

SELECT 'Start listing04.sql //////////////////////////////////////////';
GO

SELECT 'BULK INSERT (Seite 106)';
GO

SELECT 'BULK findet unter Linux Pfad nicht: Bug #9380471 for Microsoft-internal reference.'
SELECT '     Ausführung unter Windows mit angepasstem Pfad klappt prima.'
GO
-- Hier Dateiname und Pfad einfuegen
-- BULK INSERT artikel
--    FROM '/home/[...]/src/mssql/artikel02.csv'   
--    WITH (FIRSTROW = 2, FORMATFILE = '/home/[...]/src/mssql/artikel.fmt');  
-- GO 
SELECT '     Workaround zum Bug';
TRUNCATE TABLE artikel;
:r artikel02_insert.sql

SELECT * FROM artikel;
GO

-- Start INSERT

SELECT 'Anlegen mit INSERT INTO ... VALUES (Seite 111)';
SELECT 'Warengruppen anlegen';
GO
SET IDENTITY_INSERT warengruppe ON ;
INSERT INTO warengruppe (warengruppe_id, bezeichnung)
 VALUES
   (1, 'Bürobedarf')
  ,(2, 'Pflanzen')
  ,(3, 'Gartenbedarf')
  ,(4, 'Werkzeug')
;
SET IDENTITY_INSERT warengruppe OFF ;
SELECT * FROM warengruppe;
GO

-- T-SQL kennt die SET-Variante nicht.
SELECT 'Anlegen mit INSERT INTO ... SET (Seite 113}§)';
SELECT 'Warengruppen verbinden';
GO

INSERT INTO artikel_nm_warengruppe(artikel_id, warengruppe_id)
 VALUES
   (3001,1)
  ,(3005,1)
  ,(3006,1)
  ,(3007,1)
  ,(3010,1)
  ,(7856,2)
  ,(7856,3)
  ,(7863,2)
  ,(7863,3)
  ,(9010,3)
  ,(9010,4)
  ,(9015,3)
  ,(9015,4)
;
GO
-- Ende INSERT

-- Start Kundendaten
SELECT 'Testdaten INSERT adresse';
GO
-- adresse
SET IDENTITY_INSERT adresse ON ;
GO
INSERT INTO adresse (adresse_id, strasse, hnr, lkz, plz, ort)
 VALUES
   (1, 'Beutelhaldenweg', '5', 'AL', '67676', 'Hobbingen')
  ,(2, 'Beutelhaldenweg', '1', 'AL', '67676', 'Hobbingen')
  ,(3, 'Auf der Feste',   '1', 'GO', '54786', 'Minas Tirith')
  ,(4, 'Letztes Haus',    '4', 'ER', '87567', 'Bruchtal')
  ,(5, 'Baradur',         '1', 'MO', '62519', 'Lugburz')
  ,(10, 'Hochstrasse',    '4a','DE', '44879', 'Bochum')
  ,(11, 'Industriegebiet','8', 'DE', '44878', 'Bochum')
;
GO
SET IDENTITY_INSERT adresse OFF ;
GO

SELECT 'Testdaten INSERT kunde';
GO
-- kunde
SET IDENTITY_INSERT kunde ON ;
GO
INSERT INTO kunde (kunde_id, rechnung_adresse_id, nachname, vorname, art)
 VALUES
   (1, 1, 'Gamdschie',   'Samweis', 1)
  ,(2, 2, 'Beutlin',     'Frodo',   1)
  ,(3, 2, 'Beutlin',     'Bilbo',   1)
  ,(4, 3, 'Telcontar',   'Elessar', 1)
  ,(5, 4, 'Earendilionn','Elrond',  3)
;
GO

SET IDENTITY_INSERT kunde OFF ;
GO

SELECT 'Lieferadresse bei zwei Adressen aendern';
GO
UPDATE kunde SET liefer_adresse_id = 2 WHERE kunde_id = 1;
UPDATE kunde SET liefer_adresse_id = 4 WHERE kunde_id = 3;
GO
-- Ende Kundendaten

-- Start Aufbau von 2 Bestellungen
SELECT 'Aufbau von 2 Bestellungen: Bestelldaten';
GO

INSERT INTO bestellung (kunde_id, adresse_id, datum)
 VALUES
   (1, 1, '2012-03-24 17:41:00')
  ,(2, 2, '2012-03-23 16:11:00')
;
GO

SELECT 'Aufbau von 2 Bestellungen: Bestellpositionen';
GO

INSERT INTO bestellung_position (bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (1, 1, 7856, 30)
  ,(1, 2, 7863, 50)
  ,(1, 3, 9015, 1)
  ,(2, 1, 7856, 10)
  ,(2, 2, 9010, 5)
 ;
GO

-- Ende Aufbau Bestellung

-- SELECT 'Drei Fehlermeldung wegen Constraints (Seite 114)!';
SELECT bestellung_id, kunde_id, adresse_id, datum FROM bestellung;
GO
-- INSERT INTO bestellung (datum) VALUES (NOW());
-- INSERT INTO bestellung (adresse_id, datum) VALUES (10, NOW());
-- INSERT INTO adresse (adresse_id, strasse) VALUES (10, 'Oberer Weg');

-- Bildttabelle
SELECT 'Bildtabelle anlegen (Seite 114)';
GO
CREATE TABLE bild
(
  bild_id           INT IDENTITY (1,1) PRIMARY KEY,
  bild              VARBINARY(max),
  dateiname         NVARCHAR(255),
  dateityp          NVARCHAR(255),
  dateigroesse      BIGINT,
  artikel_id        INT REFERENCES artikel(artikel_id)
);
GO

SELECT 'Daten kopieren (Seite 119)';
GO

-- T-SQL kennt diese Art, eine Tabelle zu erstellen nicht.
-- DROP TABLE IF EXISTS #kunde_beutlin;
-- CREATE TABLE #kunde_beutlin LIKE kunde;
-- INSERT INTO #kunde_beutlin
--  SELECT * FROM kunde WHERE nachname='Beutlin';
-- SELECT * FROM #kunde_beutlin;
-- GO

-- Das gleiche Ergebnis kann aber wie folgt erreicht werden.
SELECT * 
 INTO #kunde_beutlin 
 FROM kunde
 WHERE nachname='Beutlin'
;
SELECT * FROM #kunde_beutlin;
GO


SELECT 'Ende listing04.sql //////////////////////////////////////////';
GO
