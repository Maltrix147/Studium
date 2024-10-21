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
\echo 'Start listing01.sql //////////////////////////////////////////'
SELECT 'Loeschen einer ggf. vorhandenen Datenbank oshop (Seite 66)' Hinweis;
\connect postgres

DROP DATABASE IF EXISTS oshop;

-- In PostgreSQL gibt es keine Möglichkeit, die Zeichensätze und Sortierungen dynamisch zu ermitteln

SELECT 'Anlegen der Datenbank mit Zeichensatz und Sortierung (Seite 66)' Hinweis;
CREATE DATABASE oshop
 ENCODING 'UTF8'
 LC_COLLATE='en_US.utf8'
 LC_CTYPE='en_US.utf8'
;

SELECT 'Anzeigen aller Datenbanken (Seite 72)';
\l

\echo 'Ende listing01.sql //////////////////////////////////////////'

