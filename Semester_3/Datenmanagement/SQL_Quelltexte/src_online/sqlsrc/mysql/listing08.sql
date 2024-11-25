-- Ausführen der vorherigen Befehle
SOURCE listing07.sql

SELECT 'Start listing08.sql //////////////////////////////////////////';

-- Start INNER JOIN
SELECT 'CROSS JOIN (Seite 184)';
SELECT
 kunde_id, nachname, vorname, rechnung_adresse_id, adresse_id
 FROM
  kunde, adresse
;

SELECT 'CROSS JOIN mit WHERE (Seite 184)';
SELECT
 kunde_id, nachname, vorname, rechnung_adresse_id, adresse_id
 FROM
  kunde, adresse
 WHERE
  rechnung_adresse_id = adresse_id
;

SELECT 'INNER JOIN (Seite 187)';
SELECT
 kunde_id, nachname, vorname, rechnung_adresse_id, adresse_id
 FROM
  kunde INNER JOIN adresse
   ON rechnung_adresse_id = adresse_id
;

SELECT
 kunde_id, kontonummer, blz, bankname
 FROM
  bankverbindung INNER JOIN bank
   ON bankverbindung.bank_id = bank.bank_id
 ORDER BY 
  kunde_id, kontonummer
;
SELECT
 nachname, vorname, kontonummer
 FROM
  bankverbindung INNER JOIN kunde ON bankverbindung.kunde_id = kunde.kunde_id
 ORDER BY
  nachname, vorname, kontonummer
;

SELECT 'Abkürzung mit USING (Seite 192)';
SELECT
 kunde_id, kontonummer, blz, bankname
 FROM
  bankverbindung INNER JOIN bank USING (bank_id)
;

SELECT 'Abkürzung mit NATURAL JOIN (Seite 192)';
SELECT
 kunde_id, kontonummer, blz, bankname
 FROM
  bankverbindung NATURAL JOIN bank
;
-- Ende INNER JOIN

-- Start Datenquelle
SELECT 'JOIN als Datenquelle (Seite 193)';
SELECT
 k.kunde_id, k.nachname, k.vorname, a.strasse, a.hnr, a.plz, a.ort
 FROM
  kunde k INNER JOIN adresse a
   ON k.rechnung_adresse_id = a.adresse_id
;
DROP TABLE IF EXISTS tmp_kadresse;
CREATE TEMPORARY TABLE tmp_kadresse
 SELECT
  k.kunde_id, k.nachname, k.vorname, a.strasse, a.hnr, a.plz, a.ort
  FROM
   kunde k INNER JOIN adresse a
    ON k.rechnung_adresse_id = a.adresse_id
;
SELECT
 t.kunde_id, t.nachname, t.ort, b.bestellung_id, DATE(b.datum)
  FROM
   bestellung b INNER JOIN tmp_kadresse t USING (kunde_id)
;
DROP TABLE IF EXISTS tmp_kbank;
CREATE TEMPORARY TABLE tmp_kbank
 SELECT
  bv.kunde_id, bv.bankverbindung_nr, bv.kontonummer,
  bv.iban, ba.blz, ba.bankname
 FROM
  bankverbindung bv INNER JOIN bank ba USING (bank_id)
;
DROP TABLE IF EXISTS tmp_kbankeinzug;
CREATE TEMPORARY TABLE tmp_kbankeinzug
 SELECT
  ka.*, kb.bankverbindung_nr, kb.kontonummer,
  kb.iban, kb.blz, kb.bankname
  FROM
   tmp_kadresse ka INNER JOIN tmp_kbank kb USING(kunde_id);

SELECT kunde_id, nachname, ort, bankname FROM tmp_kbankeinzug ;
-- Ende Datenquelle

-- Start Keine Schlüssel
SELECT 'Ohne Schlüssel (Seite 196)';
DESCRIBE tmp_kadresse;
DESCRIBE tmp_kbank;
SELECT
 k.kunde_id, k.vorname, a.strasse, a.hnr, a.plz, a.ort
 FROM
   kunde k INNER JOIN adresse a
    ON k.rechnung_adresse_id <= a.adresse_id
;
-- Ende Kein Schlüssel

-- Start mehr als zwei Tabellen
SELECT 'Mit mehr als 2 Tabellen (Seite 198)';
SELECT
 a.bezeichnung, nm.warengruppe_id
 FROM
   artikel_nm_warengruppe nm NATURAL JOIN artikel a
;
SELECT
 w.bezeichnung, nm.artikel_id
 FROM
  artikel_nm_warengruppe nm NATURAL JOIN warengruppe w
;
SELECT
 w.bezeichnung, nm.artikel_id
 FROM
  (artikel_nm_warengruppe nm INNER JOIN warengruppe w USING(warengruppe_id))
;
SELECT
 w.bezeichnung, a.bezeichnung
 FROM
  (artikel_nm_warengruppe nm INNER JOIN warengruppe w USING (warengruppe_id))
                             INNER JOIN artikel a USING(artikel_id)
;
SELECT
 w.bezeichnung Warengruppe, a.bezeichnung Artikel
 FROM
  artikel_nm_warengruppe nm INNER JOIN warengruppe w USING (warengruppe_id)
                            INNER JOIN artikel a USING(artikel_id)
;
-- Ende mehr als zwei Tabellen

-- Start Aufbau Lieferanten
SELECT 'Aufbau der Lieferanten';
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
-- Ende Aufbau Lieferanten

-- Start OUTER JOIN
SELECT 'OUTER JOIN (Seite 200)';
SELECT
 k.kunde_id, k.nachname, k.vorname, b.datum
 FROM
  bestellung b INNER JOIN kunde k USING (kunde_id)
 ORDER BY
  k.nachname, k.vorname
;
SELECT
 k.kunde_id, k.nachname, k.vorname, b.datum
 FROM
  bestellung b RIGHT OUTER JOIN kunde k USING (kunde_id)
 ORDER BY
  k.nachname, k.vorname
;
SELECT
 k.kunde_id, k.nachname, k.vorname, b.datum
 FROM
  kunde k LEFT OUTER JOIN bestellung b USING (kunde_id)
 ORDER BY
  k.nachname, k.vorname
;
SELECT
 l.lieferant_id, l.firmenname, a.artikel_id, a.bezeichnung
 FROM
  artikel_nm_lieferant nm INNER JOIN artikel a USING(artikel_id)
                          INNER JOIN lieferant l USING(lieferant_id)
 ORDER BY firmenname
;
SELECT
 l.lieferant_id, l.firmenname, a.artikel_id, a.bezeichnung
 FROM
  artikel_nm_lieferant nm INNER JOIN artikel a USING(artikel_id)
                          RIGHT JOIN lieferant l USING(lieferant_id)
 ORDER BY firmenname
;
SELECT
 l.firmenname
 FROM
  artikel_nm_lieferant nm INNER JOIN artikel a USING(artikel_id)
                          RIGHT JOIN lieferant l USING(lieferant_id)
 WHERE artikel_id IS NULL
 ORDER BY firmenname
;
SELECT k.kunde_id, k.nachname, k.vorname
 FROM
  bestellung b RIGHT JOIN kunde k USING(kunde_id)
 WHERE b.bestellung_id IS NULL
;
-- Ende OUTER JOIN

-- Start Aufbau Forum
SELECT 'SELF JOIN (Seite 205)' Hinweis;
SELECT 'CREATE account';
CREATE TABLE account (
 kunde_id  INT UNSIGNED NOT NULL DEFAULT 0,
 name      VARCHAR(255) NOT NULL DEFAULT '',
 passwort  CHAR(34)     NOT NULL DEFAULT '',
 status    ENUM('aktiv','gesperrt') NOT NULL DEFAULT 'aktiv',
 kommentar TEXT ,
 admin     BOOL         NOT NULL DEFAULT FALSE,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(kunde_id),
 FOREIGN KEY (kunde_id)
   REFERENCES kunde(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;

SELECT 'CREATE beitrag';
CREATE TABLE beitrag (
 beitrag_id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
 account_id  INT UNSIGNED NOT NULL,
 bezug_beitrag_id INT UNSIGNED NOT NULL DEFAULT 1,
 zeitstempel  DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
 nachricht TEXT ,
 deleted             TINYINT UNSIGNED NOT NULL DEFAULT 0,
 PRIMARY KEY(beitrag_id),
 FOREIGN KEY (account_id)
   REFERENCES account(kunde_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT,
 FOREIGN KEY (bezug_beitrag_id)
   REFERENCES beitrag(beitrag_id)
   ON UPDATE RESTRICT
   ON DELETE RESTRICT
) ENGINE=InnoDB;

SELECT 'account daten';
INSERT INTO account (kunde_id, name, passwort, admin)
 VALUES
  (1, 'admin', md5('rosi'), TRUE)
  ,(2, 'frodo', md5('elbereth'), FALSE)
  ,(3, 'bilbo', md5('blitzerschlagen'), FALSE)
  ,(5, 'elle', md5('feanor'), FALSE)
;


SELECT 'beitrag daten';
INSERT INTO beitrag (beitrag_id, account_id, bezug_beitrag_id, zeitstempel, nachricht)
 VALUES
   (1, 1, 1, '1000-01-01 00:00:00', '')
  ,(2, 2, 1, '2011-05-01 14:13:00', 'Der Lieferservice ist super.')
  ,(3, 3, 2, '2011-05-02 11:45:00', 'Das finde ich auch.')
  ,(4, 5, 2, '2011-05-01 17:01:00', 'Aber ein wenig langsam.')
  ,(5, 2, 4, '2011-05-01 17:15:00', 'Finde ich nicht.')
  ,(6, 5, 1, '2011-06-12 09:07:00', 'Angebot könnte besser sein.')
;
-- Ende Aufbau Forum

-- Start SELF JOIN
SELECT 'SELF JOIN (Seite 206)';
SELECT
 kunde_id, name, status, admin
 FROM
  account
;
SELECT
 beitrag_id, account_id, bezug_beitrag_id, LEFT(nachricht, 20)
 FROM
  beitrag
;
-- SELECT 'Erwarte eine Fehlermeldung (Seite 207)';
-- SELECT nachricht
--  FROM
--   beitrag INNER JOIN beitrag ON bezug_beitrag_id = beitrag_id
--  WHERE beitrag_id = 2
-- ;
SELECT ant.nachricht `Antwort`
 FROM
  beitrag ant INNER JOIN beitrag orig ON ant.bezug_beitrag_id = orig.beitrag_id
 WHERE orig.beitrag_id = 2
;

SELECT 'CTE rekursiv (Seite 208)';
WITH RECURSIVE ant_auf AS 
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
-- Ende SELF JOIN

-- Start Redundant
SELECT 'Beschleunigen mit Redundanzen (Seite 209)';
ALTER TABLE
 kunde
 ADD r_strasse VARCHAR(255),
 ADD r_ort VARCHAR(255),
 ADD r_aktuell BOOL NOT NULL DEFAULT TRUE,
 ADD l_strasse VARCHAR(255),
 ADD l_ort VARCHAR(255),
 ADD l_aktuell BOOL NOT NULL DEFAULT TRUE
;
UPDATE kunde INNER JOIN adresse ON rechnung_adresse_id = adresse_id
 SET
  r_strasse = CONCAT(strasse, ' ', hnr),
  r_ort = CONCAT(lkz, '-', plz, ' ', ort),
  r_aktuell = TRUE
;
SELECT
 kunde_id, r_strasse, r_ort, r_aktuell
 FROM kunde
;
-- Ende Redundant
SELECT 'Ende listing08.sql //////////////////////////////////////////';
