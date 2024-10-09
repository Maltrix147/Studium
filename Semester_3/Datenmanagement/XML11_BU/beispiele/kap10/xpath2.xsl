<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
<html>
<head>
<title>XPath - Knotenprüfung</title>
</head>
<body>

<h3>Alle Lieder im Dokument</h3>
  <xsl:for-each select="/descendant::LIED">
    <br /><xsl:value-of select="." />
  </xsl:for-each>
<br /><br />

<h3>Alle Kinder des Elements ALBUM</h3>
  <xsl:for-each select="//ALBUM/child::*">
    <br /><xsl:value-of select="." />
  </xsl:for-each>

</body>
</html>

</xsl:template>

</xsl:stylesheet>

