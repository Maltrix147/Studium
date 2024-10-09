<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
<html>
<head>
<title>XPath - Prädikat</title>
</head>
<body>


<h3>Alben der Interpreten Moby und Philip Glass</h3>
  <xsl:for-each select="//ALBUM/INTERPRET[text() = 'Moby' or text() = 'Philip Glass']">
    <p><b><xsl:value-of select="." /></b> - <xsl:value-of select="./parent::node()/TITEL" />
</p>
  </xsl:for-each>
<br /><br />

<h3>Alle Elemente INTERPRET, bis auf das Letzte</h3>
  <xsl:for-each select="//ALBUM[position() != last()]">
    <p><b><xsl:value-of select="./INTERPRET"/></b> - <xsl:value-of select="./TITEL" />
</p>
  </xsl:for-each>
<br /><br />

<h3>Von jedem Album werden, wenn vorhanden, die zweiten Elemente BILD aufgelistet</h3>
  <xsl:for-each select="//ALBUM/BILD[position() = 2]">
    <p><xsl:value-of select="./parent::node()/TITEL" />
 - <b><xsl:value-of select="./@quelle" /></b></p>
  </xsl:for-each>
<br /><br />

<h3>Von jedem Album werden die ersten drei Elemente LIED aufgelistet</h3>
<xsl:for-each select="//LIED[position() &lt;= 3]">
  <p><xsl:value-of select="./parent::node()/TITEL" />
 - <b><xsl:number/>. <xsl:value-of select="." /></b></p>
  </xsl:for-each>


</body>
</html>

</xsl:template>

</xsl:stylesheet>

