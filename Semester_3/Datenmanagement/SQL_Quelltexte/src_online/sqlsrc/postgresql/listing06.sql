-- Ausführen der vorherigen Befehle
\i listing05.sql

\echo 'Start listing06.sql //////////////////////////////////////////'

SELECT 'WHERE mit TRUE / FALSE (Seite 140)' Hinweis;
SELECT * FROM artikel WHERE TRUE;
SELECT * FROM artikel WHERE FALSE;


-- Start Groß-/Kleinschreibung
SELECT 'Groß/Kleinschreibung (Seite 141)' Hinweis;
DROP TABLE IF EXISTS wurstbrot;
CREATE TEMPORARY TABLE wurstbrot (
 name VARCHAR(255)
);

INSERT INTO wurstbrot 
 VALUES
   ('Jaqueline'),
  ,('Kevin'),
  ,('kevin'),
  ,('jaqueline')
;
SELECT * FROM wurstbrot WHERE LOWER(name) = 'kevin';

SELECT * FROM wurstbrot WHERE name = 'kevin';
-- Ende Groß- Kleinschreibung

-- Start Einfache Wertzuweisung
SELECT 'Einfache Wertzuweisung (Seite 146)' Hinweis;
SELECT * FROM bestellung_position;
UPDATE bestellung_position
 SET menge = 2
 WHERE bestellung_id = 1 AND position_nr = 3
;
SELECT * FROM bestellung_position;
-- Ende Einfache Wertzuweisung

-- Start Wertberechnung
SELECT 'Wertberechnung (Seite 146)' Hinweis;
SELECT * FROM artikel;
UPDATE artikel SET einzelpreis = einzelpreis + einzelpreis / 100.0;
SELECT * FROM artikel;
UPDATE artikel SET einzelpreis = ROUND(einzelpreis, 2);
SELECT * FROM artikel;
-- Ende Wertberechnung

-- Start Gebastelte Zeichenketten
SELECT 'Gebastelte Zeichenketten: Anrede (Seite 147)' Hinweis;
ALTER TABLE kunde ADD anrede VARCHAR(255);
UPDATE kunde
 SET anrede = 'Sehr geehrte/r Frau/Herr ' || nachname
 WHERE nachname <> ''
;
SELECT * FROM kunde;
-- Ende Gebastelte Zeichenketten


-- Start DELETE
SELECT 'Löschen mit DELETE (Seite 148)' Hinweis;
SELECT * FROM bestellung_position;
DELETE FROM bestellung_position WHERE bestellung_id = 1;
SELECT * FROM bestellung_position;

-- Start Wiederherstellen der Daten
INSERT INTO bestellung_position (bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (1, 1, 7856, 30)
  ,(1, 2, 7863, 50)
  ,(1, 3, 9015, 1)
;
-- Ende Wiederherstellen der Daten

-- SELECT 'Löschversuch mit Constraint. Erwarte eine Fehlermeldung! (Seite 150)';
-- DELETE FROM kunde WHERE kunde_id = 1;


SELECT 'Test AUTO_INCREMENT (Seite 150)' Hinweis;
SELECT kunde_id, nachname FROM kunde;
DELETE FROM kunde WHERE kunde_id IN (3,5);
-- Liefert in PostgreSQL eine Fehlermeldung, PK-Wert ermittelt werden muss
INSERT INTO kunde (kunde_id, nachname, vorname) VALUES (6, 'Eichenschild', 'Thorin');
SELECT kunde_id, nachname FROM kunde;
-- Start Wiederherstellen der Daten
INSERT INTO kunde (kunde_id, rechnung_adresse_id, nachname, vorname, art)
 VALUES
   (3, 2, 'Beutlin',     'Bilbo',   'prv')
  ,(5, 4, 'Earendilionn','Elrond',  'gsch')
;
-- Ende Wiederherstellen der Daten

SELECT 'Tabelle leeren (Seite 152)' Hinweis;
-- DELETE FROM bestellung_position;
-- TRUNCATE bestellung_position;
-- Ende DELETE
\echo 'Ende listing06.sql //////////////////////////////////////////'
