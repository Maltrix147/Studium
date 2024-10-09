xquery version "1.0";
<FAHRZEUGE>
{
  let $doc := doc("uebung1.xml")
  for $x in $doc//KFZ
  where $x/HOECHSTGESCHWINDIGKEIT >= 250
  order by $x/HERSTELLER descending
  return
    <KFZ>
      { $x/HERSTELLER }
      { $x/MODELL }
    </KFZ>
}
</FAHRZEUGE>