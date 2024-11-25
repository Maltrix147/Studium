-- Ausführen der vorherigen Befehle
-- SOURCE listing12.sql

SELECT 'Start listingNoSQL.sql //////////////////////////////////////////';
SELECT 'Hinzufügen der JSON-Spalte in kunde (Seite 304)';

ALTER TABLE kunde
 ADD warenkorb JSON AFTER art
;

UPDATE kunde
 SET warenkorb = JSON_OBJECT(
                  'warenkorb', 
                  JSON_OBJECT(
				   'kunde_id', kunde_id, 
                   'positionen', JSON_ARRAY(),         
				   'warenwerte', JSON_ARRAY()
				  )
                 )
;

SELECT 'Hinzufügen von Warenkorbpositionen (Seite 304)';
SELECT 'Kunde 2 10mal 3007';
SELECT 2 INTO @kunde_id;
SELECT 3007 INTO @artikel_id;
SELECT 10 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_EXTRACT(@wk, "$.warenkorb.positionen");

SELECT 
 JSON_OBJECT(
  'position', JSON_OBJECT(
               'artikel', JSON_OBJECT(
	                       'artikel_id', CAST(artikel_id AS CHAR), 
                           'bezeichnung', bezeichnung, 
	                       'einzelpreis', einzelpreis
	                      ),
               'menge', @menge,
               'gesamtpreis', @menge * einzelpreis, 
               'währung', waehrung
              )
 )
 FROM artikel 
 WHERE artikel_id = @artikel_id
 INTO @position
;

UPDATE kunde
 SET warenkorb = JSON_ARRAY_APPEND(
                  @wk, 
                  "$.warenkorb.positionen", 
				  CAST(@position AS JSON)
				 )
 WHERE kunde_id = @kunde_id
;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id\G

SELECT 'Kunde 2 2mal 3010';
SELECT 2 INTO @kunde_id;
SELECT 3010 INTO @artikel_id;
SELECT 2 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_EXTRACT(@wk, "$.warenkorb.positionen");

SELECT 
 JSON_OBJECT(
  'position', JSON_OBJECT(
               'artikel', JSON_OBJECT(
	                       'artikel_id', CAST(artikel_id AS CHAR), 
                           'bezeichnung', bezeichnung, 
	                       'einzelpreis', einzelpreis
	                      ),
               'menge', @menge,
               'gesamtpreis', @menge * einzelpreis, 
               'währung', waehrung
              )
 )
 FROM artikel 
 WHERE artikel_id = @artikel_id
 INTO @position
;

UPDATE kunde
 SET warenkorb = JSON_ARRAY_APPEND(
                  @wk, 
                  "$.warenkorb.positionen", 
				  CAST(@position AS JSON)
				 )
 WHERE kunde_id = @kunde_id
;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id\G

SELECT 'Kunde 2 5mal 9010';
SELECT 2 INTO @kunde_id;
SELECT 9010 INTO @artikel_id;
SELECT 5 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_EXTRACT(@wk, "$.warenkorb.positionen");

SELECT 
 JSON_OBJECT(
  'position', JSON_OBJECT(
               'artikel', JSON_OBJECT(
	                       'artikel_id', CAST(artikel_id AS CHAR), 
                           'bezeichnung', bezeichnung, 
	                       'einzelpreis', einzelpreis
	                      ),
               'menge', @menge,
               'gesamtpreis', @menge * einzelpreis, 
               'währung', waehrung
              )
 )
 FROM artikel 
 WHERE artikel_id = @artikel_id
 INTO @position
;

UPDATE kunde
 SET warenkorb = JSON_ARRAY_APPEND(
                  @wk, 
                  "$.warenkorb.positionen", 
				  CAST(@position AS JSON)
				 )
 WHERE kunde_id = @kunde_id
;

SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G


SELECT 'Auswerten von Warenkorbpositionen';

SELECT 2 INTO @kunde_id;
SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;

SELECT @kunde_id AS 'kunde_id', tt.* 
 FROM 
  JSON_TABLE(
   @wk, 
   '$.warenkorb.positionen[*]'
    COLUMNS (
     posnr       FOR ORDINALITY,
     artikel_id  INT           PATH '$.position.artikel.artikel_id',
     einzelpreis DECIMAL(12,2) PATH '$.position.artikel.einzelpreis',
     menge       INT           PATH '$.position.menge',
     währung     CHAR(3)       PATH '$.position.währung'
    )
   ) AS tt
;

SELECT bezeichnung AS 'warengruppe', COUNT(*) AS 'anzahl'
 FROM 
  JSON_TABLE(
   @wk, 
   '$.warenkorb.positionen[*]'
    COLUMNS (
     posnr       FOR ORDINALITY,
     artikel_id  INT           PATH '$.position.artikel.artikel_id',
     einzelpreis DECIMAL(12,2) PATH '$.position.artikel.einzelpreis',
     menge       INT           PATH '$.position.menge',
     währung     CHAR(3)       PATH '$.position.währung'
    )
   ) AS wk
  INNER JOIN artikel_nm_warengruppe USING(artikel_id)
  INNER JOIN warengruppe USING(warengruppe_id)
 GROUP BY bezeichnung
;

WITH wk AS (
SELECT * FROM JSON_TABLE(
   @wk, 
   '$.warenkorb.positionen[*]'
    COLUMNS (
     posnr FOR ORDINALITY,
     artikel_id INT PATH '$.position.artikel.artikel_id',
     einzelpreis DECIMAL(12,2) PATH '$.position.artikel.einzelpreis',
     menge INT PATH '$.position.menge',
     währung CHAR(3) PATH '$.position.währung'
    ) 
  ) AS t
)
SELECT bezeichnung AS 'warengruppe', COUNT(*) AS 'anzahl'
 FROM 
  wk INNER JOIN artikel_nm_warengruppe USING(artikel_id)
     INNER JOIN warengruppe USING(warengruppe_id)
 GROUP BY bezeichnung
;


SELECT 'Ändern von Warenkorbpositionen (Seite 307)';

SELECT 'Kunde 2 1mal 3007';
SELECT 2 INTO @kunde_id;
SELECT 3007 INTO @artikel_id;
SELECT 1 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_SEARCH(@wk, 'one', @artikel_id) INTO @path;

SELECT CONCAT(
        SUBSTRING(
		 @path, 
		 2, 
		 22+LOCATE('.', LEFT(@path, 13))
		),
		'.position.menge' 
	   )
 INTO @path_to_pos;

UPDATE kunde
 SET warenkorb = JSON_REPLACE(@wk, @path_to_pos, @menge)
 WHERE kunde_id = @kunde_id
;
SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G

SELECT 'Kunde 2 0mal 3010';
SELECT 2 INTO @kunde_id;
SELECT 3010 INTO @artikel_id;
SELECT 0 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_SEARCH(@wk, 'one', @artikel_id) INTO @path;
SELECT CONCAT(
        SUBSTRING(
		 @path, 
		 2, 
		 22+LOCATE('.', LEFT(@path, 13))
		),
		'.position.menge' 
	   )
 INTO @path_to_pos;

SELECT JSON_REPLACE(@wk, @path_to_pos, @menge);
UPDATE kunde
 SET warenkorb = JSON_REPLACE(@wk, @path_to_pos, @menge)
 WHERE kunde_id = @kunde_id
;
SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G

SELECT 'Kunde 2 10mal 9010';
SELECT 2 INTO @kunde_id;
SELECT 9010 INTO @artikel_id;
SELECT 10 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_SEARCH(@wk, 'one', @artikel_id) INTO @path;
SELECT CONCAT(
        SUBSTRING(
		 @path, 
		 2, 
		 22+LOCATE('.', LEFT(@path, 13))
		),
		'.position.menge' 
	   )
 INTO @path_to_pos;

SELECT JSON_REPLACE(@wk, @path_to_pos, @menge);
UPDATE kunde
 SET warenkorb = JSON_REPLACE(@wk, @path_to_pos, @menge)
 WHERE kunde_id = @kunde_id
;
SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G


SELECT 'Kunde 2 1mal 3007 mit Aktualisierungen (Seite 309)';
SELECT 2 INTO @kunde_id;
SELECT 3007 INTO @artikel_id;
SELECT 1 INTO @menge;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_SEARCH(@wk, 'one', @artikel_id) INTO @path;
SELECT CONCAT(SUBSTRING(@path, 2, 22+LOCATE('.', LEFT(@path, 13))),'.position.menge')  
 INTO @path_to_pos;
SELECT CONCAT(SUBSTRING(@path, 2, 22+LOCATE('.', LEFT(@path, 13))),'.position.gesamtpreis')  
 INTO @path_to_gesamtpreis;
SELECT '$.warenkorb.warenwerte' INTO @path_to_warenwerte;

CREATE TEMPORARY TABLE wk 
 SELECT * FROM JSON_TABLE(
    @wk, 
    '$.warenkorb.positionen[*]'
     COLUMNS (
      posnr FOR ORDINALITY,
      artikel_id INT PATH '$.position.artikel.artikel_id',
      einzelpreis DECIMAL(12,2) PATH '$.position.artikel.einzelpreis',
      menge INT PATH '$.position.menge',
      währung CHAR(3) PATH '$.position.währung'
     ) 
    ) AS t
;

SELECT einzelpreis*menge 
 FROM wk
 WHERE artikel_id = @artikel_id
 INTO @gesamtpreis
;

SELECT JSON_ARRAYAGG(warenwert) 
 FROM 
  (SELECT JSON_OBJECT(währung, SUM(einzelpreis*menge)) warenwert
    FROM wk
    GROUP BY währung) AS a
 INTO @warenwerte
;

UPDATE kunde
 SET warenkorb = JSON_REPLACE(@wk, 
                              @path_to_pos, @menge, 
                              @path_to_gesamtpreis, @gesamtpreis, 
                              @path_to_warenwerte, CAST(@warenwerte AS JSON))
 WHERE kunde_id = @kunde_id
;
SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G

SELECT 'Löschen von Warenkorbpositionen (Seite 312)';

SELECT 'Kunde 2 Position mit Artikel 9010';
SELECT 2 INTO @kunde_id;
SELECT 9010 INTO @artikel_id;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;
SELECT JSON_SEARCH(@wk, 'one', @artikel_id) INTO @path;

SELECT SUBSTRING(@path, 2, 22+LOCATE('.', LEFT(@path, 13)))
 INTO @path_to_pos;
UPDATE kunde
 SET warenkorb = JSON_REMOVE(@wk, @path_to_pos)
 WHERE kunde_id = @kunde_id
;
SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G

SELECT 'Kunde 2 Warenkorb leeren';
SELECT 2 INTO @kunde_id;

SELECT warenkorb FROM kunde WHERE kunde_id = @kunde_id INTO @wk;

UPDATE kunde
 SET warenkorb = JSON_REPLACE(@wk, 
                              '$.warenkorb.positionen', JSON_ARRAY(), 
                              '$.warenkorb.warenwerte', JSON_ARRAY())
 WHERE kunde_id = @kunde_id
;
SELECT JSON_PRETTY(warenkorb) FROM kunde WHERE kunde_id = @kunde_id\G
SELECT 'Ende listingNoSQL.sql //////////////////////////////////////////';
