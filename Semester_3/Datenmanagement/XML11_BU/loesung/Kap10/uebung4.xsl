<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<title>Musiksammlung</title>
<style>
body 	{ font-family:Verdana,Arial,sans-serif; font-size:10pt;}
h2 	{ font-size: 16pt; text-decoration: underline;}
table  	{ border:2px solid red; }
td 	{ padding:3px; border:thin dotted black; width:500px;}
</style>
</head>
<body>
<h2>Musiksammlung - Alben vor 1990</h2>

<table>
  <xsl:for-each select="//ALBUM/JAHR[text() &lt; 1990]">      <tr valign="top">
        <td>
         <b>
          <xsl:value-of select="." /> - <xsl:value-of select="../INTERPRET | ../GRUPPE" /> - <xsl:value-of select="../TITEL" />
         </b>
        </td>
      </tr>
  </xsl:for-each>
</table>
</body>
</html>

</xsl:template>

</xsl:stylesheet>

