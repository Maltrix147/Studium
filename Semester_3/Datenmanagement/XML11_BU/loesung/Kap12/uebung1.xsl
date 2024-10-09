<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
<title>Liedübersicht</title>
  <style type="text/css">
  table { border:3px solid #000;}
  td    { border:1px dotted #000; padding:3px; width:200px; }
  .head  { font-weight:bold; color:red; }
  </style>
</head>
<body>
<h2>Musiksammlung - Aufsteigend sortiert nach Interpret und Titel</h2>

<table>
  <tr valign="top">
  <xsl:for-each select="//ALBUM">
  <xsl:sort select="./INTERPRET|./GRUPPE" order="ascending" />
  <td class="head">
      <xsl:value-of select="./INTERPRET|./GRUPPE"/> <br />
      <xsl:value-of select="./TITEL" />
  </td>
  </xsl:for-each>
  </tr>

  <tr valign="top">
    <xsl:for-each select="//ALBUM">
    <xsl:sort select="./INTERPRET|./GRUPPE" order="ascending" />
    <td>
      <xsl:for-each select="./LIED">
        <xsl:value-of select="." /> <br />
      </xsl:for-each>
    </td>
    </xsl:for-each>
  </tr>


</table>
</body>
</html>

</xsl:template>

</xsl:stylesheet>
