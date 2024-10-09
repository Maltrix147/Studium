xquery version "1.0";
<LABELLISTE>
  {
  for $a in doc("musiksammlung.xml")//ALBUM
  order by $a//LABEL
  return
    <COMPANY>
      {
      $a/LABEL,
      for $b in doc("labels.xml")//LABEL[NAME=$a/LABEL]
      return 
        <DETAILS>
			{$b/MAINOFFICE}
			{$b/WEB}
		</DETAILS>
      }
    </COMPANY>
  }
</LABELLISTE>