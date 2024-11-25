-- Warum formatiere ich den Quelltext so ganz anders, als beispielsweise diese Beautyfier?
-- * http://www.dpriver.com/pp/sqlformat.htm
-- * https://codebeautify.org/sqlformatter
-- Ich finde die Arbeit dieser Programme sehr gut und auch die Ergebnisse sind ansprechend, 
-- aber sie widersprechen meinem Anspruch an die leichte Verständlichkeit der Befehle. 
-- Zwei Beispiele:
-- * Es werden keine Einrückungungen eingefügt, die den inhaltlichten Zusammenhang 
--   zwischen dem Befehl und seinen Parametern abbilden:
-- SELECT blz,
--        bankname
-- FROM   bank
-- ORDER  BY blz DESC
-- LIMIT  1;  
--
-- anstelle von
--
-- SELECT 
--  blz, bankname
--  FROM bank
--  ORDER BY blz DESC
--  LIMIT  1
-- ;

-- * Hinter dem FROM wird ein Tabellenname gestellt, obwohl die Auswertung aus dem ganzen JOIN erfolgt:
-- SELECT k.kunde_id,
--        k.nachname,
--        k.vorname,
--        b.datum
-- FROM   bestellung b
--        INNER JOIN kunde k USING (kunde_id)
-- ORDER  BY k.nachname,
--           k.vorname;  

-- anstelle von		  

-- SELECT
--  k.kunde_id, k.nachname, k.vorname, b.datum
--  FROM
--   bestellung b INNER JOIN kunde k USING (kunde_id)
--  ORDER BY
--   k.nachname, k.vorname
-- ;

-- Ich werde daher meine Darstellung beibehalten.


-- Anlegen der Datenbank auf der grünen Wiese
SELECT 'Start listing01.sql //////////////////////////////////////////';
SET NAMES utf8;
SET AUTOCOMMIT=ON;
SELECT 'Löschen einer ggf. vorhandenen Datenbank oshop (Seite 68)';
DROP DATABASE IF EXISTS oshop;

SELECT 'Anzeigen der verfügbaren Zeichenkodierungen (Seite 69)';
SHOW CHARACTER SET;
SHOW CHARACTER SET LIKE 'latin';
SHOW CHARACTER SET LIKE 'utf%';

SELECT 'Anzeigen der verfügbaren Sortierungen (Seite 71)';
SHOW COLLATION;
SHOW COLLATION LIKE 'latin1%';
SHOW COLLATION LIKE 'utf8%';

SELECT 'Anlegen der Datenbank mit Zeichensatz und Sortierung (Seite 66)';
CREATE DATABASE oshop
 DEFAULT CHARACTER SET utf8
 COLLATE utf8_unicode_ci
;

SELECT 'Anzeigen aller Datenbanken (Seite 72)';
SHOW DATABASES;
SELECT 'Ende listing01.sql //////////////////////////////////////////';

