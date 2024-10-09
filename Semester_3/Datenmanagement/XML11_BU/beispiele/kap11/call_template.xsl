<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html><head><title>call-template</title></head>
    <body>
      <xsl:call-template name="vorlage2">
      </xsl:call-template>
    </body></html>
  </xsl:template>

  <xsl:template match="OBERELEMENT" name="vorlage1">
    <!-- Aktionsteil -->
  </xsl:template>

  <xsl:template match="ELEMENT" name="vorlage2">
    <!-- Aktionsteil -->
  </xsl:template>
</xsl:stylesheet>
