-- Ausfuehren der vorherigen Befehle
SOURCE listing18.sql

SELECT 'Start listing19.sql //////////////////////////////////////////';

SELECT 'EVENT anlegen (Seite 372)';

DROP EVENT IF EXISTS event_umsatz_woche;
CREATE EVENT event_umsatz_woche
 ON SCHEDULE EVERY 1 WEEK
 DO 
  CALL umsatzreport(1);

SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;
ALTER EVENT event_umsatz_woche DISABLE;
DROP EVENT IF EXISTS event_umsatz_woche; -- Wegen Vorsicht!

DROP TABLE IF EXISTS a;
CREATE TABLE a 
(
 zeit DATETIME
);
DROP EVENT IF EXISTS event_zeit_sekunde;
CREATE EVENT event_zeit_sekunde
 ON SCHEDULE EVERY 2 SECOND
 DO 
  INSERT INTO a VALUES (NOW());

-- Warte 20 Sekunden
SELECT * FROM a;


SELECT 'EVENT loeschen (Seite 372)';
DROP EVENT IF EXISTS event_zeit_sekunde;
SET GLOBAL event_scheduler = OFF;
DROP TABLE IF EXISTS a;
SELECT 'Ende listing19.sql //////////////////////////////////////////';

