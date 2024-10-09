<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<title>XPath</title>
</head>
<body>

<h3>Alle Lieder</h3>
  <xsl:for-each select="//child::ALBUM/child::LIED">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Titel mit Attribut "stil"</h3>
  <xsl:for-each select="//child::ALBUM/child::TITEL/attribute::stil">
    <br /><xsl:value-of select="./parent::TITEL" />
  </xsl:for-each>
<br /><br />

<h3>Alben mit Attribut "stil=Pop"</h3>
  <xsl:for-each select="//TITEL[@stil='Pop']">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Elemente JAHR und GESAMTZEIT als Kinder des Vorfahren von TITEL</h3>
  <xsl:for-each select="//TITEL/ancestor::*">
    <br />Jahr: <xsl:value-of select="./JAHR" />: Laufzeit: <xsl:value-of select="./GESAMTZEIT" /> min.
  </xsl:for-each>
<br /><br />

<h3>Alle Interpreten</h3>
  <xsl:for-each select="//ALBUM/INTERPRET">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Alle Gruppen</h3>
  <xsl:for-each select="//ALBUM/GRUPPE">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Alle Lieder aus der Musiksammlung</h3>
  <xsl:for-each select="/descendant::LIED">
    <br /><xsl:value-of select="." />
  </xsl:for-each>


</body>
</html>

</xsl:template>

</xsl:stylesheet>

