-- Ausführen der vorherigen Befehle
:r listing07.sql

SELECT 'Start listing08.sql //////////////////////////////////////////';
GO

-- Start INNER JOIN
SELECT 'CROSS JOIN (Seite 182)';
GO
SELECT
 kunde_id, nachname, vorname, rechnung_adresse_id, adresse_id
 FROM
  kunde, adresse
;
GO

SELECT 'CROSS JOIN mit WHERE (Seite 184)';
GO
SELECT
 kunde_id, nachname, vorname, rechnung_adresse_id, adresse_id
 FROM
  kunde, adresse
 WHERE
  rechnung_adresse_id = adresse_id
;
GO

SELECT 'INNER JOIN (Seite 185)';
GO
SELECT
 kunde_id, nachname, vorname, rechnung_adresse_id, adresse_id
 FROM
  kunde INNER JOIN adresse
   ON rechnung_adresse_id = adresse_id
;
GO

SELECT
 kunde_id, kontonummer, blz, bankname
 FROM
  bankverbindung INNER JOIN bank
   ON bankverbindung.bank_id = bank.bank_id
;
GO
SELECT
 nachname, vorname, kontonummer
 FROM
  bankverbindung INNER JOIN kunde ON bankverbindung.kunde_id = kunde.kunde_id
;
GO

SELECT 'Abkürzung mit USING (Seite 190)';
SELECT 'TSQL kennt keine Abkürzung mit USING oder eine vegleichbare';
GO

SELECT 'Abkurzung mit NATURAL JOIN (Seite 190)';
SELECT 'TSQL kennt keine NATURAL JOIN';
GO
-- Ende INNER JOIN

-- Start Aufbau Lieferanten
SELECT 'Aufbau der Lieferanten';
GO
INSERT INTO lieferant (firmenname, adresse_id)
 VALUES
  ('Gartenbedarf AllesGrün', 10)
  ,('Office International', 11)
  ,('Bürohengst GmbH', 11)
;

INSERT INTO artikel_nm_lieferant (lieferant_id, artikel_id)
 VALUES
   (1, 7856)
  ,(1, 7863)
  ,(1, 9010)
  ,(1, 9015)
  ,(3, 3001)
  ,(3, 3005)
  ,(3, 3006)
  ,(3, 3007)
  ,(3, 3010)
;
GO
-- Ende Aufbau Lieferanten

-- Start OUTER JOIN
SELECT 'OUTER JOIN (Seite 198)';
GO
SELECT
 k.kunde_id, k.nachname, k.vorname, b.datum
 FROM
  bestellung b INNER JOIN kunde k ON b.kunde_id = k.kunde_id
 ORDER BY
  k.nachname, k.vorname
;
GO
SELECT
 k.kunde_id, k.nachname, k.vorname, b.datum
 FROM
  bestellung b RIGHT OUTER JOIN kunde k ON b.kunde_id = k.kunde_id
 ORDER BY
  k.nachname, k.vorname
;
GO
SELECT
 k.kunde_id, k.nachname, k.vorname, b.datum
 FROM
  kunde k LEFT OUTER JOIN bestellung b ON k.kunde_id = b.kunde_id
 ORDER BY
  k.nachname, k.vorname
;
GO
SELECT
 l.lieferant_id, l.firmenname, a.artikel_id, a.bezeichnung
 FROM
  artikel_nm_lieferant nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                          INNER JOIN lieferant l ON nm.lieferant_id = l.lieferant_id
 ORDER BY firmenname
;
GO
SELECT
 l.lieferant_id, l.firmenname, a.artikel_id, a.bezeichnung
 FROM
  artikel_nm_lieferant nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                          RIGHT JOIN lieferant l ON nm.lieferant_id = l.lieferant_id
 ORDER BY firmenname
;
GO
SELECT
 l.firmenname
 FROM
  artikel_nm_lieferant nm INNER JOIN artikel a ON nm.artikel_id = a.artikel_id
                          RIGHT JOIN lieferant l ON nm.lieferant_id = l.lieferant_id
 WHERE a.artikel_id IS NULL
 ORDER BY firmenname
;
GO
SELECT k.kunde_id, k.nachname, k.vorname
 FROM
  bestellung b RIGHT JOIN kunde k ON k.kunde_id = b.kunde_id
 WHERE b.bestellung_id IS NULL
;
GO
-- Ende OUTER JOIN

-- Start Aufbau Forum
SELECT 'SELF JOIN (Seite 203)';
GO
DROP TABLE IF EXISTS beitrag;
DROP TABLE IF EXISTS account;
GO
SELECT 'CREATE account';
GO
CREATE TABLE account (
 kunde_id  INT NOT NULL DEFAULT 0,
 name      NVARCHAR(255) NOT NULL DEFAULT '',
 passwort  NCHAR(34)     NOT NULL DEFAULT '',
 status    INT NOT NULL DEFAULT '0',
 kommentar TEXT ,
 admin     TINYINT   NOT NULL DEFAULT 0,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

SELECT 'CREATE beitrag';
GO
CREATE TABLE beitrag (
 beitrag_id  INT NOT NULL IDENTITY(1,1),
 account_id  INT NOT NULL,
 bezug_beitrag_id INT  NOT NULL DEFAULT 1,
 zeitstempel  DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
 nachricht TEXT ,
 deleted             TINYINT NOT NULL DEFAULT 0,
 PRIMARY KEY(beitrag_id),
 FOREIGN KEY (account_id)
   REFERENCES account(kunde_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,
 FOREIGN KEY (bezug_beitrag_id)
   REFERENCES beitrag(beitrag_id)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
GO

SELECT 'account daten';
GO
INSERT INTO account (kunde_id, name, passwort, admin)
 VALUES
   (1, 'admin', CONVERT(NCHAR(34), HASHBYTES('MD5', 'rosi'), 2), 1)
  ,(2, 'frodo', CONVERT(NCHAR(34), HASHBYTES('MD5', 'elbereth'), 2), 0)
  ,(3, 'bilbo', CONVERT(NCHAR(34), HASHBYTES('MD5', 'blitzerschlagen'), 2), 0)
  ,(5, 'elle', CONVERT(NCHAR(34), HASHBYTES('MD5', 'feanor'), 2), 1)
;
GO


SELECT 'beitrag daten';
SET IDENTITY_INSERT beitrag ON ;
INSERT INTO beitrag (beitrag_id, account_id, bezug_beitrag_id, zeitstempel, nachricht)
 VALUES
   (1, 1, 1, CONVERT(DATETIME, '1753-01-01 00:00:00'), '')
  ,(2, 2, 1, CONVERT(DATETIME, '2011-05-01 14:13:00'), 'Der Lieferservice ist super.')
  ,(3, 3, 2, CONVERT(DATETIME, '2011-05-02 11:45:00'), 'Das finde ich auch.')
  ,(4, 5, 2, CONVERT(DATETIME, '2011-05-01 17:01:00'), 'Aber ein wenig langsam.')
  ,(5, 2, 4, CONVERT(DATETIME, '2011-05-01 17:15:00'), 'Finde ich nicht.')
  ,(6, 5, 1, CONVERT(DATETIME, '2011-06-12 09:07:00'), 'Angebot könnte besser sein.')
;
SET IDENTITY_INSERT beitrag OFF ;
GO
-- Ende Aufbau Forum

-- Start SELF JOIN
SELECT 'SELF JOIN (Seite 204)';
GO
SELECT
 kunde_id, name, status, admin
 FROM
  account
;

SELECT
 beitrag_id, account_id, bezug_beitrag_id, LEFT(CONVERT(NVARCHAR(255), nachricht), 20) kurz
 FROM
  beitrag
;
GO
-- SELECT 'Erwarte eine Fehlermeldung (Seite 205)';
--  SELECT nachricht
--   FROM
   -- beitrag INNER JOIN beitrag ON bezug_beitrag_id = beitrag_id
--   WHERE beitrag_id = 2
-- ;
-- GO

SELECT ant.nachricht 'Antwort'
 FROM
  beitrag ant INNER JOIN beitrag orig ON ant.bezug_beitrag_id = orig.beitrag_id
 WHERE orig.beitrag_id = 2
;
GO

SELECT 'CTE rekursiv (Seite 206)';
GO
WITH ant_auf AS 
(
 -- nicht rekuriver Teil
 SELECT * FROM beitrag WHERE bezug_beitrag_id = 2
 UNION ALL
 -- rekuriver Teil
 SELECT ant.* 
  FROM 
    beitrag ant INNER JOIN ant_auf orig 
	 ON ant.bezug_beitrag_id = orig.beitrag_id 
)
SELECT beitrag_id, bezug_beitrag_id, nachricht FROM ant_auf;
GO
-- Ende SELF JOIN

-- Start Redundant
SELECT 'Beschleunigen mit Redundanzen (Seite 207)';
GO
ALTER TABLE kunde
 ADD r_strasse NVARCHAR(255)
;
ALTER TABLE kunde
 ADD r_ort NVARCHAR(255)
;
ALTER TABLE kunde
 ADD r_aktuell TINYINT NOT NULL DEFAULT 1
;
ALTER TABLE kunde
 ADD l_strasse NVARCHAR(255)
;
ALTER TABLE kunde
 ADD l_ort NVARCHAR(255)
;
ALTER TABLE kunde
 ADD l_aktuell TINYINT NOT NULL DEFAULT 1
;
GO
UPDATE kunde 
 SET
  r_strasse = CONCAT(strasse, ' ', hnr),
  r_ort = CONCAT(lkz, '-', plz, ' ', ort),
  r_aktuell = 1
  FROM kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
;
GO
SELECT
 kunde_id, r_strasse, r_ort, r_aktuell
 FROM kunde
;
GO
-- Ende Redundant