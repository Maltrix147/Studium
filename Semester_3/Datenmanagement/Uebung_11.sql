select
nachname, vorname, datum
From
bestellung inner join kunde on kunde.kunde_id = bestellung.kunde_id
order by nachname; datum desc

SELECT bestellung.kunde_id, bestellung.datum, positionen.position_id 
FROM bestellung 
INNER JOIN positionen 
ON bestellung.bestell_id = positionen.bestell_id 
ORDER BY bestellung.kunde_id, bestellung.bestell_id, positionen.position_id;

SELECT position_nr, bezeichnung 
FROM artikel a
INNER JOIN bestellung_position bp
ON positionen.artikel_id = artikel.artikel_id 
ORDER BY artikel.bezeichnung;

