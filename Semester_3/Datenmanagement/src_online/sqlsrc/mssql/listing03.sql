-- Ausführen der vorherigen Befehle
:r listing02.sql

SELECT 'Start listing03.sql //////////////////////////////////////////';
GO

-- Seite 93
SELECT
    LEFT(name, 30) AS index_name,
    LEFT(type_desc, 15)  As index_type,
    is_unique,
    LEFT(OBJECT_NAME(object_id), 30) As table_name
FROM
    sys.indexes
WHERE
    is_hypothetical = 0 AND
    index_id != 0 AND
    object_id = OBJECT_ID('kunde');  
GO

-- Anlegen der Indizes nach Liste auf Seite 95
SELECT 'CREATE INDEX idx_kunde_nachname_vorname';
GO
CREATE INDEX idx_kunde_nachname_vorname
  ON kunde (nachname, vorname)
;
GO

SELECT 'CREATE INDEX idx_bank_bankname';
GO
CREATE INDEX idx_bank_bankname
  ON bank (bankname)
;
GO

SELECT 'CREATE INDEX idx_bankverbindung_bankid_kontonummer';
GO
CREATE INDEX idx_bankverbindung_bankid_kontonummer
  ON bankverbindung (bank_id, kontonummer)
;
GO

SELECT 'CREATE UNIQUE INDEX idx_bankverbindung_iban';
GO
CREATE UNIQUE INDEX idx_bankverbindung_iban
  ON bankverbindung (iban)
;
GO

SELECT 'CREATE INDEX idx_artikel_bezeichnung';
GO
CREATE INDEX idx_artikel_bezeichnung
  ON artikel (bezeichnung)
;
GO

SELECT 'CREATE INDEX idx_warengruppe_bezeichnung';
GO
CREATE INDEX idx_warengruppe_bezeichnung
  ON warengruppe (bezeichnung)
;
GO

SELECT 'CREATE INDEX idx_lieferant_firmenname';
GO
CREATE INDEX idx_lieferant_firmenname
  ON lieferant (firmenname)
;
GO

SELECT 'CREATE INDEX idx_bestellung_kundeid_datum';
GO
CREATE INDEX idx_bestellung_kundeid_datum
  ON bestellung (kunde_id, datum)
;
GO


SELECT 'CREATE UNIQUE INDEX idx_adresse_dublette (Seite 98)';
GO
CREATE UNIQUE INDEX idx_adresse_dublette
  ON adresse (strasse, hnr, plz);
GO

-- Start Selektivitaet
SELECT 'Indexselektivitaet (Seite 101)';
SELECT 'CREATE TABLE #testdaten_bank';
GO

DROP TABLE IF EXISTS #testdaten_bank;
CREATE TABLE #testdaten_bank
(
 blz         CHAR(8),
 merkmal     CHAR(1),
 bezeichnung VARCHAR(255),
 plz         CHAR(5),
 ort         VARCHAR(255),
 kurz        VARCHAR(255),
 pan         CHAR(5),
 bic         VARCHAR(255),
 sm          CHAR(2),
 ds          CHAR(6),
 kz          CHAR(1),
 blzl        CHAR(1),
 blzn        CHAR(8)
);
GO

SELECT 'BULK INSERT';
GO

SELECT 'BULK findet unter Linux Pfad nicht: Bug #9380471 for Microsoft-internal reference.'
SELECT '     Ausführung unter Windows mit angepasstem Pfad klappt prima.'
GO
-- Hier Dateiname und Pfad einfuegen
-- BULK INSERT #testdaten_bank
--  FROM '/home/[...]/src/mssql/blz_20120305.csv'
--  WITH (FIRSTROW = 2, FIELDTERMINATOR = ';',	ROWTERMINATOR='0x0a', FORMAT='CSV');
-- GO

SELECT '     Workaround zum Bug';
:r testdaten_blz.sql
GO


-- Workaournd 
-- TSQL kennt keine Einschänkung der Spaltenlänge
CREATE INDEX idx_testdaten_bank_bezeichnung
  ON #testdaten_bank(bezeichnung)
;
GO

SELECT
    LEFT(name, 30) AS index_name,
    LEFT(type_desc, 15)  As index_type,
    is_unique,
    LEFT(OBJECT_NAME(object_id), 30) As table_name
FROM
    sys.indexes
WHERE
    is_hypothetical = 0 AND
    index_id != 0 AND
    object_id = OBJECT_ID('#testdaten_bank');  
GO

-- Ende Selektivitaet

SELECT 'Ende listing03.sql //////////////////////////////////////////';
GO

