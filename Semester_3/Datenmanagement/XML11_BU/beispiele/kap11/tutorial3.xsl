<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html><head><title>Elementinhalte ausgeben</title></head><body>
    <p><b><xsl:value-of select="//BOLD" /></b></p>
    <p><i><xsl:value-of select="//ITALIC" /></i></p>
    <h3 style="color:red"><xsl:value-of select="//RED" /></h3>
    </body></html>
  </xsl:template>
</xsl:stylesheet>
