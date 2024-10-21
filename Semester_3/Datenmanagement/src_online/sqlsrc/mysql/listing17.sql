-- Ausfuehren der vorherigen Befehle
SOURCE listing16.sql

SELECT 'Start listing17.sql //////////////////////////////////////////';

SELECT 'Funktionen (Seite 362)';
DROP FUNCTION IF EXISTS preis_anpassen;
DELIMITER //
CREATE FUNCTION preis_anpassen
 (
  iPreisOriginal DECIMAL(14,6),       -- Originalpreis
  iProzentsatz   DECIMAL(7,3)         -- Anpassung in Prozent (0-100)
 )
 RETURNS DECIMAL(14,6) DETERMINISTIC
 BEGIN
 DECLARE vPreisNeu DECIMAL(14,6);     -- Neuer Preis

  IF iPreisOriginal IS NULL THEN      -- Test auf NULL
   RETURN NULL; 
  END IF;
  IF iProzentsatz IS NULL THEN        -- Test auf NULL
   RETURN NULL; 
  END IF;
  IF iProzentsatz NOT BETWEEN 0 AND 100 THEN  -- Wertebereich Prozent
   RETURN NULL; 
  END IF;
  SET vPreisNeu = iPreisOriginal + ((iPreisOriginal * iProzentsatz) / 100.0);
  SET vPreisNeu = ROUND(vPreisNeu, 2);
  RETURN vPreisNeu;
 END //
DELIMITER ;

SELECT 'Ende listing17.sql //////////////////////////////////////////';
