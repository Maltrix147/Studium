xquery version "1.0";
<html encoding="utf-8">
	<head>
		<title>EINZELINTERPRETEN OLDIES</title>
	</head>
	<body>
		 <ul>
			{	
				let $doc := doc("musiksammlung.xml")
				for $x in $doc//ALBUM
				where $x/JAHR < 1989
				order by $x/INTERPRET
				return
					<li>  Interpret: {data( $x/INTERPRET )},
						   Titel:       {data( $x/TITEL )}, 
						   Jahr:       {data(  $x/JAHR )},</li>
			}
		</ul>
	</body>
</html>

