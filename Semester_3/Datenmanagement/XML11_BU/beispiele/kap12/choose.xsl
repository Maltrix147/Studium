<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
  <title>Komplexe Fallunterscheidung</title>
  <style type="text/css">
    div {  border:1px solid white; padding:3px; }
  </style>
</head>
<body>
<h2>Musiksammlung - Bewertungen auswerten</h2>

  <xsl:for-each select="//ALBUM">
    <xsl:sort select="TITEL/@bewertung" order="descending"/>
    <xsl:choose>
      <xsl:when test="TITEL/@bewertung &gt; 3">
          <div style="background-color:#90EE90;">
            <b><xsl:value-of select="INTERPRET|GRUPPE" /> - <xsl:value-of select="TITEL" /> <br /></b>
            Bewertung: <xsl:value-of select="TITEL/@bewertung" />
          </div>
      </xsl:when>
      <xsl:when test="TITEL/@bewertung &gt;= 0">
          <div style="background-color:#f08080;">
            <b><xsl:value-of select="INTERPRET|GRUPPE" /> - <xsl:value-of select="TITEL" /> <br /></b>
            Bewertung: <xsl:value-of select="TITEL/@bewertung" />
          </div>
      </xsl:when>
      <xsl:otherwise>
          <div>
            <b><xsl:value-of select="INTERPRET|GRUPPE" /> - <xsl:value-of select="TITEL" /> <br /></b>
            Bewertung: nicht vorhanden
          </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>

</body></html>
</xsl:template>
</xsl:stylesheet>

