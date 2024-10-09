<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
<title>Liedübersicht</title>
  <style type="text/css">
  div { border:3px solid #000; width:600px; }
  p    { border:1px dotted #000; padding:3px; margin:3px; }
  </style>
</head>
<body>
<h2>Musiksammlung - Alben mit Angabe der Stilrichtung</h2>

<div>
  <xsl:for-each select="//ALBUM">
        <p><b><xsl:value-of select="./INTERPRET|./GRUPPE" /> - <xsl:value-of select="./TITEL" /> </b> (Stil:

       <xsl:choose>
         <xsl:when test="./TITEL[@stil = 'Pop'] | ./TITEL[@stil = 'p']">Pop</xsl:when>
         <xsl:when test="./TITEL[@stil = 'Rock'] | ./TITEL[@stil = 'r']">Rock</xsl:when>
         <xsl:when test="./TITEL[@stil = 'Independent'] | ./TITEL[@stil = 'i']">Independent</xsl:when>
         <xsl:when test="./TITEL[@stil = 'Klassik'] | ./TITEL[@stil = 'k']">Klassik</xsl:when>
         <xsl:when test="./TITEL[@stil = 'Schlager'] | ./TITEL[@stil = 's']">Schlager</xsl:when>
         <xsl:when test="./TITEL[@stil = 'Volksmusik'] | ./TITEL[@stil = 'v']">Volksmusik</xsl:when>
         <xsl:otherwise>nicht angegeben</xsl:otherwise>
       </xsl:choose>
       )</p>
  </xsl:for-each>

</div>
</body>
</html>

</xsl:template>

</xsl:stylesheet>
