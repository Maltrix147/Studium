xquery version "1.0";
<EINZELINTERPRETEN_OLDIES>
{
  let $doc := doc("musiksammlung.xml")
  for $x in $doc//ALBUM
  where $x/JAHR < 1989
  order by $x/INTERPRET
  return
    <ALBUM>
      { $x/INTERPRET }
      { $x/TITEL }
      { $x/JAHR }
    </ALBUM>
}
</EINZELINTERPRETEN_OLDIES>