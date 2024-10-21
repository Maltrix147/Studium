-- Ausführen der vorherigen Befehle
SOURCE listing05.sql

SELECT 'Start listing06.sql //////////////////////////////////////////';

SELECT 'WHERE mit TRUE / FALSE (Seite 142)';
SELECT * FROM artikel WHERE TRUE;
SELECT * FROM artikel WHERE FALSE;


-- Start Groß-/Kleinschreibung
SELECT 'Groß-/Kleinschreibung (Seite 143)';
DROP TABLE IF EXISTS wurstbrot;
CREATE TEMPORARY TABLE wurstbrot (
 name VARCHAR(255)
);

INSERT INTO wurstbrot 
 VALUES
   ('Jaqueline')
  ,('Kevin')
  ,('kevin')
  ,('jaqueline')
;

SELECT * FROM wurstbrot WHERE name = 'kevin';

DROP TABLE wurstbrot;

CREATE TEMPORARY TABLE wurstbrot (
 name VARCHAR(255) BINARY
);

INSERT INTO wurstbrot 
 VALUES
   ('Jaqueline')
  ,('Kevin')
  ,('kevin')
  ,('jaqueline')
;

SELECT * FROM wurstbrot WHERE name = 'kevin';
-- Ende Groß- Kleinschreibung

-- Start Einfache Wertzuweisung
SELECT 'Einfache Wertzuweisung (Seite 148)';
SELECT * FROM bestellung_position;
UPDATE bestellung_position
 SET menge = 2
 WHERE bestellung_id = 1 AND position_nr = 3
;
SELECT * FROM bestellung_position;
-- Ende Einfache Wertzuweisung

-- Start Wertberechnung
SELECT 'Wertberechnung (Seite 148)';
SELECT * FROM artikel;
UPDATE artikel SET einzelpreis = einzelpreis + einzelpreis / 100.0;
SELECT * FROM artikel;
UPDATE artikel SET einzelpreis = ROUND(einzelpreis, 2);
SELECT * FROM artikel;
-- Ende Wertberechnung

-- Start Gebastelte Zeichenketten
SELECT 'Gebastelte Zeichenketten: Anrede (Seite 149)';
ALTER TABLE kunde ADD anrede VARCHAR(255) AFTER nachname;
UPDATE kunde
 SET anrede = CONCAT('Sehr geehrte/r Frau/Herr ', nachname)
 WHERE nachname <> ''
;
SELECT * FROM kunde;
-- Ende Gebastelte Zeichenketten


-- Start DELETE
SELECT 'Löschen mit DELETE (Seite 150)';
SELECT * FROM bestellung_position;
DELETE FROM bestellung_position WHERE bestellung_id = 1;
SELECT * FROM bestellung_position;

-- Start Wiederherstellen der Daten
INSERT INTO bestellung_position (
 bestellung_id, position_nr, artikel_id, menge)
 VALUES
   (1, 1, 7856, 30)
  ,(1, 2, 7863, 50)
  ,(1, 3, 9015, 1)
;
-- Ende Wiederherstellen der Daten

-- SELECT 'Löschversuch mit Constraint.';
-- SELECT 'Erwarte eine Fehlermeldung! (Seite 152)';
-- DELETE FROM kunde WHERE kunde_id = 1;


SELECT 'Test AUTO_INCREMENT (Seite 152)';
SELECT kunde_id, nachname FROM kunde;
DELETE FROM kunde WHERE kunde_id IN (3,5);
INSERT INTO kunde (nachname, vorname) VALUES ('Eichenschild', 'Thorin');
SELECT kunde_id, nachname FROM kunde;
-- Start Wiederherstellen der Daten
INSERT INTO kunde (kunde_id, rechnung_adresse_id, nachname, vorname, art)
 VALUES
   (3, 2, 'Beutlin',     'Bilbo',   'prv')
  ,(5, 4, 'Earendilionn','Elrond',  'gsch')
;
-- Ende Wiederherstellen der Daten

SELECT 'Tabelle leeren (Seite 154)';
-- DELETE FROM bestellung_position;
-- TRUNCATE bestellung_position;
-- Ende DELETE
SELECT 'Ende listing06.sql //////////////////////////////////////////';
