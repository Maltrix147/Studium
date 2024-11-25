USE oshop;
 -- Anlegen und Befuellen der Zwischentabelle
 -- fuer die Bestellungen
 DROP TABLE IF EXISTS tmp_bestellung;
 CREATE TEMPORARY TABLE tmp_bestellung LIKE bestellung;
 LOAD XML
  LOCAL INFILE 'lstBestellungen.xml'
  INTO TABLE tmp_bestellung
  ROWS IDENTIFIED BY '<bestellung>'
  SET status = 'offen';

 -- Anlegen und Befuellen der Zwischentabelle
 -- fuer die Bestellungen
 DROP TABLE IF EXISTS tmp_position;
 CREATE TEMPORARY TABLE tmp_position LIKE bestellung_position;
 ALTER TABLE tmp_position DROP PRIMARY KEY;  -- Sonst Probleme!§\label{cmdProzedur18}§
 ALTER TABLE tmp_position ADD position_id INT AUTO_INCREMENT PRIMARY KEY;
 LOAD XML
  LOCAL INFILE 'lstBestellungen.xml'
  INTO TABLE tmp_position
  ROWS IDENTIFIED BY '<position>';


DROP PROCEDURE IF EXISTS importBestellung;
DELIMITER //
CREATE PROCEDURE importBestellung()
BEGIN
 DECLARE vBId  INT;
 DECLARE vPId  INT;
 DECLARE vBestellungId INT;
 DECLARE vPosNr INT ;
 DECLARE vEndeHaupt  INT DEFAULT 0;
 DECLARE vEndeInnere INT DEFAULT 0;
 DECLARE vWoBinIch INT;

 DECLARE curBestellung CURSOR FOR
  SELECT bestellung_id FROM tmp_bestellung;

 DECLARE curPosition CURSOR FOR
  SELECT position_id FROM tmp_position WHERE bestellung_id = vBId;

 DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
  BEGIN
   CASE vWoBinIch
    WHEN 1 THEN SET vEndeHaupt = 1;
    WHEN 2 THEN SET vEndeInnere = 1;
   END CASE;
  END;

 OPEN curBestellung;             -- Jetzt wird der SELECT ausgefuehrt§\label{cmdProzedur19}§
 SET vEndeHaupt = 0;
 hauptschleife: LOOP             -- Start Hauptschleife§\label{cmdProzedur20}§
  SET vWoBinIch = 1;             -- Ich bin in der Hauptschleife
  FETCH curBestellung INTO vBId; -- Entweder Wert oder CONTINUE HANDLER
  IF vEndeHaupt = 1 THEN
   LEAVE hauptschleife;
  END IF;

  INSERT INTO bestellung         -- Fuege die neue Bestellung ein§\label{cmdProzedur22}§
   SELECT NULL, kunde_id, adresse_id, datum, status, deleted
    FROM tmp_bestellung
    WHERE bestellung_id = vBId;  -- Und zwar nur die eine!

  SET vBestellungId = LAST_INSERT_ID(); -- Neue Bestellnummer
  SET vPosNr = 1;                -- Position bei 1 starten
  SET vEndeInnere = 0;
  OPEN curPosition;              -- Jetzt wird der SELECT ausgefuehrt

  innereschleife: LOOP           -- Start inneren Schleife§\label{cmdProzedur23}§
   SET vWoBinIch = 2;            -- Ich bin in der inneren Schleife
   FETCH curPosition INTO vPId;  -- Entweder Wert oder CONTINUE HANDLER
   IF vEndeInnere = 1 THEN
    LEAVE innereschleife;
   END IF;

   INSERT INTO bestellung_position -- Position mit neuen Bestell-/Posnr§\label{cmdProzedur25}§
    SELECT vBestellungId, vPosNr, artikel_id, menge, deleted
    FROM tmp_position
    WHERE position_id = vPId;

   SET vPosNr = 1 + vPosNr;      -- Erhoehe Positionsnummer
   ITERATE innereschleife;
  END LOOP;                      -- Ende inneren Schleife§\label{cmdProzedur24}§
  CLOSE curPosition;             -- Schliesse den Cursor
  ITERATE hauptschleife;
 END LOOP;                       -- Ende Hauptschleife§\label{cmdProzedur21}§

 CLOSE curBestellung;            -- Schliesse den Cursor
END//
DELIMITER ;
-- CALL importBestellung();