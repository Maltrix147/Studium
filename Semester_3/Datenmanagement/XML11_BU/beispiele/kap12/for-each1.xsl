<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>
<xsl:template match="/">
<html>
<head>
<title>Liedübersicht</title>
</head>
<body>
  <xsl:for-each select="//ALBUM">
      <xsl:value-of select="./INTERPRET|./GRUPPE" />
      <xsl:value-of select="./TITEL" />
    <xsl:for-each select="./LIED">
      <xsl:value-of select="." />
    </xsl:for-each>
  </xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
