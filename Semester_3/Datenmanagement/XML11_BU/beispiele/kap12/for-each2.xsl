<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
<title>Liedübersicht</title>
  <style type="text/css">
  table { border:3px solid #000; width:400px;}
  td    { border:1px dotted #000; padding:3px; }
  .bg   { background-color: #DDD;}
  .big  { font-size:16pt; font-weight:bold; }
  </style>
</head>
<body>
<table>
  <tr valign="top" class="bg">
  <td><span class="big">Musiksammlung - Auflistung der Lieder</span></td>
  </tr>

  <xsl:for-each select="//ALBUM">
  <tr><td style="color:red; font-weight:bold;">
      <xsl:value-of select="./INTERPRET|./GRUPPE" /> - <xsl:value-of select="./TITEL" /> <br />
  </td></tr>

  <tr valign="top">
    <td>

    <xsl:for-each select="./LIED">
      <xsl:value-of select="." /> <br />
    </xsl:for-each>

    </td>
  </tr>
  </xsl:for-each>
  
</table>
</body>
</html>

</xsl:template>

</xsl:stylesheet>
