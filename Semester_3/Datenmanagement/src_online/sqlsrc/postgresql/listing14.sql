-- Ausführen der vorherigen Befehle
\include listing13.sql
\echo 'Start listing14.sql //////////////////////////////////////////'
SELECT 'Lagerbestand (Seite 313)' Hinweis;
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 5
 WHERE artikel_id = 9015;

UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 3
 WHERE artikel_id = 9015;

SELECT * FROM lagerbestand  WHERE artikel_id = 9015;

-- Start Lock
BEGIN WORK;	-- Lock innerhalb einer Transaktion
SELECT 'LOCK (Seite 316)' Hinweis;
LOCK TABLE artikel IN ACCESS EXCLUSIVE MODE;
SELECT COUNT(*) FROM artikel;
-- Ein SELECT COUNT(*) FROM warengruppe; von einer anderen Transaktion aus würde eine FM provozieren.
COMMIT WORK;
-- Ende Lock
\echo 'Ende listing14.sql //////////////////////////////////////////'
