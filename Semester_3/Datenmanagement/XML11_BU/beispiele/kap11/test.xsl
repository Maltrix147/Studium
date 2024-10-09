<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="a">
    <html><head><title>Template-Test</title></head><body>

    <xsl:apply-templates />

    </body></html>
  </xsl:template>

  <xsl:template match="b">
    <p>b = <xsl:value-of select="." /> </p>
 
    <xsl:apply-templates select="c" />
  </xsl:template>

  <xsl:template match="bc">
    <p>bc = <xsl:value-of select="." /> </p>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="c">
    <p>c = <xsl:value-of select="." /> </p>
  </xsl:template>

</xsl:stylesheet>
