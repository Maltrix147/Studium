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
SELECT 'Löschen einer ggf. vorhandenen Datenbank oshop (Seite 68)';
DROP DATABASE IF EXISTS oshop;
GO

SELECT 'Ermitteln aller Collations und damit auch alle Zeichenkodierungen (Seite 69)';
SELECT name FROM fn_helpcollations();
SELECT name FROM sys.fn_helpcollations() WHERE name LIKE '%latin%';
SELECT name FROM sys.fn_helpcollations() WHERE name LIKE '%german%';
GO

SELECT 'Anlegen der Datenbank mit Zeichensatz und Sortierung (Seite 70)';
-- Phonebook: Sortierung nach DIN 5007-2
-- CI: case insensitive, ohne Berücksichtigung der Groß- und Kleinschreibung
-- AI: accent insensitive, ohne Berücksichtigung von Akzenten
-- (KS): kanatype sensitive: Es werden verschiedene japanische Schriftzeichen berücksichtigt.
-- (WS): width sensitive: Die  Kodierungslänge wird berücksichtigt
CREATE DATABASE oshop
 COLLATE German_PhoneBook_CI_AI
;
GO

SELECT 'Anzeigen aller Datenbanken (§\autopageref{lst01_009}§)';
SELECT 
 LEFT(name, 10) AS dbname, collation_name 
 FROM sys.databases
;
GO

SELECT 'Ende listing01.sql //////////////////////////////////////////';
GO

