-- Ausführen der vorherigen Befehle
\i listing14.sql
\c oshop
\echo 'Start listing15.sql //////////////////////////////////////////'

SELECT 'Das Problem (Seite 318)' Hinweis;
INSERT INTO artikel
 (bezeichnung, einzelpreis, waehrung)
 VALUES
  ('Säge', 17.85, 'EUR')
;
INSERT INTO artikel_nm_warengruppe
 VALUES
 (3, CURRVAL('artikel_artikel_id_seq')),
 (4, CURRVAL('artikel_artikel_id_seq'))
;

UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 1
 WHERE artikel_id = 9015
;
UPDATE bestellung SET status = 'versendet' WHERE bestellung_id = 1;
SELECT 'Isolationsebenen (Seite 322)' Hinweis;
-- AUTOCOMMIT wird in PostgreSQL nicht länger unterstützt.

-- Start read uncommitted
SELECT 'READ UNCOMMITTED (Seite 323)' Hinweis;
-- Session 1
START TRANSACTION ISOLATION 
 LEVEL REPEATABLE READ;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 1
 WHERE artikel_id = 9015
;

SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
ROLLBACK;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
-- Session 2
START TRANSACTION 
 ISOLATION LEVEL READ UNCOMMITTED;


SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
-- Ende read uncommitted

-- Start read committed
SELECT 'READ COMMITTED (Seite 324)' Hinweis;
-- Session 1
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 1
 WHERE artikel_id = 9015
;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
COMMIT;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015;
-- Session 2
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
-- Ende read committed

-- Start repeatable read
SELECT 'REPEATABLE READ (Seite 325)' Hinweis;
-- Session 1
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 1
 WHERE artikel_id = 9015
;
COMMIT;
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 1
 WHERE artikel_id = 9015
;
COMMIT;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
-- Session 2
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
COMMIT;
SELECT artikel_id, menge_aktuell
 FROM lagerbestand
 WHERE artikel_id = 9015
;
-- Ende repeatable read

-- Start Serializable
SELECT 'SERIALIZABLE (Seite 326)' Hinweis;
-- Session 1
SELECT COUNT(*) FROM artikel;
INSERT INTO artikel VALUES (1, 'X', 0.0, 'EUR', 0);
COMMIT;

-- Session 2
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM artikel WHERE artikel_id = 1;
DELETE FROM artikel WHERE artikel_id = 1;
SELECT COUNT(*) FROM artikel;
-- Ende Serializable
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
\echo 'Ende listing15.sql //////////////////////////////////////////'

