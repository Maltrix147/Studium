// Globale Variablen (Seite 294)
var connect = {   host: 'localhost'
                , port: 33060
				, user: 'root'
				, password: 'weinschlauchX10' };
				
var mysqlx = require('mysqlx');

///////////////////////////////////////
// Skript 1: Verbinden, anlegen und schließen (Seite 294)
function warenkorbCollectionAnlegen(mySession) {
  var dbOshop = mySession.getSchema('oshop');
  dbOshop.dropCollection('warenkörbe');
  return dbOshop.createCollection('warenkörbe');
}

var session = mysqlx.getSession(connect);
warenkorbCollectionAnlegen(session);
session.close();


///////////////////////////////////////
// Skript 2: Leere Warenkörbe verteilen (Seite 295)
function warenkorbLeeren(mySession) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');
  
  collWarenkörbe.remove("_id>0").execute();

  // Für alle Kunden einen leeren Warenkorb anlegen.
  var tabKunde = dbOshop.getTable("kunde");
  var alleKunden = tabKunde.select("kunde_id").execute();

  var zeilen = alleKunden.fetchAll();
  for (index in zeilen) {
    var zeile = zeilen[index];
    collWarenkörbe.add({
        _id: zeile.kunde_id,
        warenkorb: {
          kunde_id: zeile.kunde_id,
          positionen: new Array(),
          warenwerte: new Array()
       }
      }).execute();
  }
}

var session = mysqlx.getSession(connect);
warenkorbLeeren(session);
mySession.close();


///////////////////////////////////////
// Skript 3: Kunde 2 legt drei neue  Warenkorbposition an (Seite 296)
function warenkorbPositionEinfügen(mySession, myKundeId, myArtikelId, myMenge) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');
  var sql = "SELECT";
      sql += " artikel_id, bezeichnung, einzelpreis, waehrung";
      sql += " FROM oshop.artikel";
      sql += " WHERE artikel_id=?";
  var artikel = mySession.sql(sql).bind(myArtikelId).execute().fetchOne();
  var objArtikel = {
    artikel_id: artikel.artikel_id,
    artikelname: artikel.bezeichnung,
    preis: artikel.einzelpreis
  };
  var objPosition = {
    artikel: objArtikel,
    menge: myMenge,
    gesamtpreis: myMenge * artikel.einzelpreis,
    währung: artikel.waehrung
  };
  collWarenkörbe.modify('_id=:param').arrayInsert('warenkorb.positionen[0]', {
    position: objPosition
  }).bind('param', myKundeId).execute();
}

var session = mysqlx.getSession(connect);
warenkorbPositionEinfügen(session, 2, 3007, 10);
warenkorbPositionEinfügen(session, 2, 9010, 5);
warenkorbPositionEinfügen(session, 2, 3010, 2);
session.close();


///////////////////////////////////////
// Skript 4: Aktualisierung von Gesamtpreis und Warenwert pro Währung (Seite 298)
function aktualisiereGesamtpreisWarenwert(myWarenkorb) {
  var ergebnis = Object();
  var posindizes = Object.keys(myWarenkorb.warenkorb.positionen);
  posindizes.forEach(function(posindex) { // Positionen durchwandern
    var myPos = myWarenkorb.warenkorb.positionen[posindex].position;
    // gesamtpreis der Position berechnen  
    myPos.gesamtpreis = myPos.artikel.preis * myPos.menge;
    if (ergebnis.hasOwnProperty(myPos.währung)) {
      ergebnis[myPos.währung] += myPos.gesamtpreis;
    } else {
      ergebnis[myPos.währung] = myPos.gesamtpreis;
    }
  });
  var warenwert = new Array();
  for (index in Object.keys(ergebnis)) {
    var währung = Object.keys(ergebnis)[index];
    var wert = ergebnis[währung];
    warenwert.push({ [währung]: wert });
  }

  myWarenkorb.warenkorb.warenwerte = warenwert;
  return myWarenkorb;
}


///////////////////////////////////////
// Skript 3a: insert mit Aktualisierung (Seite 298)
function warenkorbPositionEinfügen(mySession, myKundeId, myArtikelId, myMenge) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');
  var sql = "SELECT";
  sql += " artikel_id, bezeichnung, einzelpreis, waehrung";
  sql += " FROM oshop.artikel";
  sql += " WHERE artikel_id=?";
  var artikel = mySession.sql(sql).bind(myArtikelId).execute().fetchOne();
  var objArtikel = {
    artikel_id: artikel.artikel_id,
    artikelname: artikel.bezeichnung,
    preis: artikel.einzelpreis
  };
  var objPosition = {
    artikel: objArtikel,
    menge: myMenge,
    gesamtpreis: myMenge * artikel.einzelpreis,
    währung: artikel.waehrung
  };
  collWarenkörbe.modify('_id=:param').arrayInsert('warenkorb.positionen[0]', {
    position: objPosition
  }).bind('param', myKundeId).execute();
  var wk = collWarenkörbe.find("_id=:param").bind('param', myKundeId).execute().fetchOne();
  wk = aktualisiereGesamtpreisWarenwert(wk);
  collWarenkörbe.modify('_id=:param').set('$', wk).bind('param', myKundeId).execute();
}

var session = mysqlx.getSession(connect);
warenkorbPositionEinfügen(session, 2, 3007, 10);
warenkorbPositionEinfügen(session, 2, 9010, 5);
warenkorbPositionEinfügen(session, 2, 3010, 2);
session.close();




///////////////////////////////////////
// Skript 5: Auswertung Warenkorb mit Warengruppe (Seite 300)
function printWarenkorbMitWarengruppen(mySession, myKundeId) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');

  var select = "SELECT";
  select += " artikel.artikel_id,";
  select += " GROUP_CONCAT(warengruppe.bezeichnung) 'warengruppen'";
  select += " FROM";
  select += "  oshop.artikel INNER JOIN oshop.artikel_nm_warengruppe";
  select += "   USING(artikel_id)";
  select += "   INNER JOIN";
  select += "  oshop.warengruppe";
  select += "   USING(warengruppe_id)";
  select += " GROUP BY artikel.artikel_id";
  var alleArtikel = mySession.sql(select).execute().fetchAll();
  var arrArtikel = new Array();

  for (index in alleArtikel) {
    var zeile = alleArtikel[index];
    arrArtikel.push({
      artikel_id: zeile["artikel_id"],
      warengruppen: zeile["warengruppen"]
    });
  }

  var wk = collWarenkörbe.find("_id=:param").bind('param', myKundeId).execute().fetchOne();
  var n = 1;
  var items = Object.keys(wk.warenkorb.positionen);
  items.forEach(function(item) {
    var myPos = wk.warenkorb.positionen[item].position;
    var wg = arrArtikel.find(function(element) {
      return element.artikel_id == myPos.artikel.artikel_id
    });
    print('Warenkorbposition ' + n++ + ':');
    print(' ' + myPos.artikel.artikel_id);
    print(', ' + myPos.artikel.artikelname);
    print(', "' + wg.warengruppen + '"');
    print(', ' + myPos.artikel.preis);
    print(', ' + myPos.menge);
    print(', ' + myPos.gesamtpreis);
    print(', ' + myPos.währung + "\n");
  });
}
var session = mysqlx.getSession(connect);
printWarenkorbMitWarengruppen(session, 2);
session.close();


///////////////////////////////////////
// Skript 6: Auswertung Warenkorb 2 Anzahl der Bestellungen pro Warengruppe (Seite 301)
function erweiternUmWarengruppen(mySession, myKundeId) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');
  var wk = collWarenkörbe.find("_id=:param").bind('param', myKundeId).execute().fetchOne();

  var items = Object.keys(wk.warenkorb.positionen);
  items.forEach(function(item) {
    var myPos = wk.warenkorb.positionen[item].position;

    var select = "SELECT";
    select += " warengruppe_id, bezeichnung";
    select += " FROM";
    select += "  oshop.artikel_nm_warengruppe";
    select += "   INNER JOIN";
    select += "  oshop.warengruppe";
    select += "   USING(warengruppe_id)";
    select += " WHERE artikel_id = ?";

    var wgs = mySession.sql(select).bind(myPos.artikel.artikel_id).execute().fetchAll();
    arr = new Array();
    for (index in wgs) {
      var zeile = wgs[index];
      arr.push({
        warengruppe_id: zeile.warengruppe_id,
        bezeichnung: zeile.bezeichnung
      });
    }
    myPos.artikel.warengruppen = arr;
  });
  collWarenkörbe.modify('_id=:param').set('$', wk).bind('param', myKundeId).execute();

  return wk;
}

var session = mysqlx.getSession(connect);
erweiternUmWarengruppen(session, 2);
session.close();


///////////////////////////////////////
// Skript 7: Auswertung Anzahl der Bestellungen pro Warengruppe (Seite 302)
function getAnzahlWarengruppe(mySession, myKundeId) {
  var wk = erweiternUmWarengruppen(mySession, myKundeId);

  var ergebnis = Object();
  var posindizes = Object.keys(wk.warenkorb.positionen);
  posindizes.forEach(function(posindex) {
    var myPos = wk.warenkorb.positionen[posindex].position;
    var wgs = myPos.artikel.warengruppen;
    var wgindizes = Object.keys(wgs);
    wgindizes.forEach(function(wgindex) {
      if (ergebnis.hasOwnProperty(wgs[wgindex].bezeichnung)) {
        ergebnis[wgs[wgindex].bezeichnung]++;
      } else {
        ergebnis[wgs[wgindex].bezeichnung] = 1;
      }
    })
  });
  
  return ergebnis;
}

var session = mysqlx.getSession(connect);
print(getAnzahlBestellungenProWarengruppe(session, 2));
session.close();


///////////////////////////////////////
// Skript 8: Ändern von Mengenangaben (Seite 303)
function mengenÄndern(mySession, myKundeId, myArtikelId, myMenge) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');
  var wk = collWarenkörbe.find("_id=:param").bind('param', myKundeId).execute().fetchOne();

  for (index in Object.keys(wk.warenkorb.positionen)) {
    if (wk.warenkorb.positionen[index].position.artikel.artikel_id == myArtikelId) {
      wk.warenkorb.positionen[index].position.menge = myMenge;
    }
  }
  wk = aktualisiereGesamtpreisWarenwert(wk);
  collWarenkörbe.modify('_id=:param').set('$', wk).bind('param', myKundeId).execute();

  return wk;
}

var session = mysqlx.getSession(connect);  
mengenÄndern(session, 2, 3010, 0);
mengenÄndern(session, 2, 3007, 1);
mengenÄndern(session, 2, 9010, 2);
session.close();


///////////////////////////////////////
// Skript 9: Löschen von Positionen (Seite 303)
function warenkorbPositionLöschen(mySession, myKundeId, myArtikelId) {
  var dbOshop = mySession.getSchema('oshop');
  var collWarenkörbe = dbOshop.getCollection('warenkörbe');
  var wk = collWarenkörbe.find("_id=:param").bind('param', myKundeId).execute().fetchOne();

  for (index in Object.keys(wk.warenkorb.positionen)) {
    if (wk.warenkorb.positionen[index].position.artikel.artikel_id == myArtikelId) {
      var str = 'warenkorb.positionen[' + index + ']';
      collWarenkörbe.modify('_id=:param').arrayDelete(str).bind('param', myKundeId).execute();
      wk = collWarenkörbe.find("_id=:param").bind('param', myKundeId).execute().fetchOne();
      wk = aktualisiereGesamtpreisWarenwert(wk);
    }
  }

  return wk;
}

var session = mysqlx.getSession(connect);  
warenkorbPositionLöschen(session, 2, 3007);
session.close();
