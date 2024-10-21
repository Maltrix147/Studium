-- Ausfuehren der vorherigen Befehle
SOURCE listing17.sql

SELECT 'Start listing18.sql //////////////////////////////////////////';

SELECT 'INSERT Trigger (Seite 365)';
DROP TRIGGER IF EXISTS tri_bestellung_after_insert;
DELIMITER //
CREATE TRIGGER tri_bestellung_after_insert -- ein schöner Name
 AFTER INSERT                              -- wann? 
 ON bestellung                             -- bei wem?
 FOR EACH ROW
 BEGIN
  INSERT INTO rechnung                     -- was?
   SET
    kunde_id      = NEW.kunde_id,
    bestellung_id = NEW.bestellung_id,
    adresse_id    = NEW.adresse_id,
    datum         = NEW.datum;
 END//
DELIMITER ;
INSERT INTO bestellung (kunde_id, adresse_id, datum) VALUES (1, 1, NOW());
SELECT bestellung_id, kunde_id, adresse_id, datum FROM bestellung;
SELECT rechnung_id, kunde_id, bestellung_id, adresse_id, datum FROM rechnung\G

SELECT 'UPDATE Trigger (Seite 366)';
DROP TRIGGER IF EXISTS tri_bestellung_after_update;
DELIMITER //
CREATE TRIGGER tri_bestellung_after_update
 AFTER UPDATE
 ON bestellung
 FOR EACH ROW
 BEGIN
  DECLARE vBestellungId INT;

  SET vBestellungId = OLD.bestellung_id;   -- Damit wir es wiederfinden§\label{cmdTrigger05}§

  IF OLD.kunde_id != NEW.kunde_id THEN     -- Nur, wenn nötig§\label{cmdTrigger06}§
   UPDATE rechnung
    SET kunde_id = NEW.kunde_id
    WHERE bestellung_id = vBestellungId;
  END IF;

  IF OLD.adresse_id != NEW.adresse_id THEN
   UPDATE rechnung
    SET adresse_id = NEW.adresse_id
    WHERE bestellung_id = vBestellungId;
  END IF;

  IF OLD.datum != NEW.datum THEN
   UPDATE rechnung
    SET datum = NEW.datum
    WHERE bestellung_id = vBestellungId;
  END IF;

 END//
DELIMITER ;
UPDATE bestellung SET adresse_id = 2 WHERE kunde_id = 1;
SELECT bestellung_id, kunde_id, adresse_id, datum 
 FROM bestellung 
 WHERE kunde_id=1;
SELECT rechnung_id, kunde_id, bestellung_id, adresse_id 
 FROM rechnung 
 WHERE kunde_id = 1;

SELECT 'DELETE Trigger (Seite 368)';
DROP TRIGGER IF EXISTS tri_bestellung_before_delete;
DELIMITER //
CREATE TRIGGER tri_bestellung_before_delete
 BEFORE DELETE
 ON bestellung
 FOR EACH ROW
 BEGIN
  DECLARE vBestellungId INT;
  DECLARE vRechnungId INT;

  SET vBestellungId = OLD.bestellung_id;   -- Damit wir es wiederfinden
  SELECT rechnung_id
   FROM rechnung
   WHERE bestellung_id = vBestellungId
   INTO vRechnungId;

  DELETE FROM rechnung_position   WHERE rechnung_id   = vRechnungId;
  DELETE FROM rechnung            WHERE rechnung_id   = vRechnungId;
  DELETE FROM bestellung_position WHERE bestellung_id = vBestellungId;
 END//
DELIMITER ;
DELETE FROM bestellung WHERE bestellung_id = 5;
SELECT
 (
  SELECT COUNT(*) FROM bestellung WHERE bestellung_id = 5
 ) AS AnzBestellung,
 (
  SELECT COUNT(*) FROM bestellung_position WHERE bestellung_id = 5
 ) AS AnzPosBestellung,
 (
  SELECT COUNT(*) FROM rechnung WHERE bestellung_id = 5
 ) AS AnzRechnung,
 (
  SELECT COUNT(*)
  FROM
   rechnung_position INNER JOIN rechnung USING (rechnung_id)
   WHERE bestellung_id = 5
 ) AS AnzPosRechnung
;
SELECT 'Ende listing18.sql //////////////////////////////////////////';
