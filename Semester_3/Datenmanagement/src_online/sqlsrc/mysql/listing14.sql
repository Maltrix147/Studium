-- Ausführen der vorherigen Befehle
SOURCE listing13.sql

SELECT 'Start listing14.sql //////////////////////////////////////////';
SELECT 'Lagerbestand (Seite 315)';
UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 5
 WHERE artikel_id = 9015;

UPDATE lagerbestand
 SET menge_aktuell = menge_aktuell - 3
 WHERE artikel_id = 9015;

SELECT * FROM lagerbestand WHERE artikel_id = 9015;

-- Start Lock
SELECT 'LOCK (Seite 318)';
LOCK TABLES artikel WRITE;
SELECT COUNT(*) FROM artikel;
-- SELECT 'Erwarte eine Fehlermeldung (Seite 316)';
-- SELECT COUNT(*) FROM warengruppe;
UNLOCK TABLES;
SELECT COUNT(*) FROM warengruppe;
-- Ende Lock
SELECT 'Ende listing14.sql //////////////////////////////////////////';
