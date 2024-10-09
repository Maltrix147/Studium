<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html><head><title>Elementinhalte ausgeben</title></head><body>
      <xsl:value-of select="//RED" /> <br />
      <xsl:value-of select="//ITALIC" /> <br />
    </body></html>
  </xsl:template>
</xsl:stylesheet>
