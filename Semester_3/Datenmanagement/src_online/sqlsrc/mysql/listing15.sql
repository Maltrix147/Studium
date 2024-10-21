-- Ausführen der vorherigen Befehle
SOURCE listing14.sql

SELECT 'Start listing15.sql //////////////////////////////////////////';
SELECT 'Das Problem (Seite 320)';
INSERT INTO artikel
 (bezeichnung, einzelpreis, waehrung)
 VALUES
  ('Säge', 17.85, 'EUR')
;
SET @id = LAST_INSERT_ID();
INSERT INTO artikel_nm_warengruppe
 VALUES
 (3, @id),
 (4, @id)
;
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 1
 WHERE artikel_id = 9015
;
UPDATE bestellung SET status = 'versendet' WHERE bestellung_id = 1;

SELECT 'Isolationsebenen (Seite 324)';
SHOW VARIABLES LIKE 'AUTOCOMMIT';
SET AUTOCOMMIT = OFF;
SHOW VARIABLES LIKE 'AUTOCOMMIT';


SELECT 'READ UNCOMMITTED (Seite 325)';
-- Session 1
SET AUTOCOMMIT = 0;

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
SET SESSION TRANSACTION ISOLATION LEVEL
 READ UNCOMMITTED;

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

SELECT 'READ COMMITTED (Seite 326)';
-- Session 1
SET AUTOCOMMIT = 0;
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

SELECT 'REPEATABLE READ (Seite 327)';
-- Session 1
SET AUTOCOMMIT = 0;
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

SELECT 'SERIALIZABLE (Seite 328)';
-- Session 1
SET AUTOCOMMIT = 0;
SELECT COUNT(*) FROM artikel;
INSERT INTO artikel VALUES (1, 'X', 0.0, 'EUR', 0);
COMMIT;

-- Session 2
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
DELETE FROM artikel WHERE artikel_id = 1;
DELETE FROM artikel WHERE artikel_id = 1;
SELECT COUNT(*) FROM artikel;
-- Ende Serializable
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT 'Ende listing15.sql //////////////////////////////////////////';