<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <title>Pop-Alben</title>
  </head>
  <body>
    <h2>Musiksammlung - Auflisten der Pop-Alben</h2>
    <div>
      <xsl:for-each select="//ALBUM">
        <xsl:sort select="./INTERPRET./GRUPPE" />
        <xsl:if test="TITEL/@stil='Pop' or TITEL/@stil='p'">
          <xsl:value-of select="./INTERPRET|./GRUPPE" /> -
          <xsl:value-of select="./TITEL" />
          <br />
        </xsl:if>
      </xsl:for-each>
    </div>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>


