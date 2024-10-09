<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
<html>
<head>
<title>XPath - Knotenpr�fung</title>
</head>
<body>

<h3>Alle Kinder des Elements ALBUM, die keine leeren Elemente sind</h3>
  <xsl:for-each select="//ALBUM/child::*/text()">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Alle Elemente INTERPRET des selektierten Knotens</h3>
  <xsl:for-each select="/descendant-or-self::node()/child::INTERPRET">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Auch dies sind alle Elemente INTERPRET des selektierten Knotens</h3>
<xsl:for-each select="//INTERPRET">
  <br /><xsl:value-of select="." />
</xsl:for-each>

</body>
</html>

</xsl:template>

</xsl:stylesheet>

