select
nachname, vorname, datum
From
bestellung inner join kunde on kunde.kunde_id = bestellung.kunde_id
order by nachname; datum desc
