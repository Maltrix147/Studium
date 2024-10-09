<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match = "/">

<html>
<head>
<title>Fahrzeugverwaltung</title>
  <style type="text/css">
  table { border:3px solid #000;}
  td    { border:1px dotted #000; padding:3px; width:150px; }
  .liste, .first  { width:100px; }
  .first  { background-color:#FFC; font-weight: bold; }
  </style>
</head>
<body>
<h2>Fahrzeugverwaltung - Technische Daten auflisten</h2>
<table>
  <tr>
    <td class="first">Hersteller</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="first">
        <xsl:value-of select="./HERSTELLER" />
    </td>
    </xsl:for-each>

  </tr>
  <tr>
    <td class="first">Modell</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./MODELL" />
    </td>
    </xsl:for-each>

  </tr>
  <tr>
    <td class="first">Leergewicht</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./LEERGEWICHT" />   <xsl:value-of select="LEERGEWICHT/@einheit" />
    </td>
    </xsl:for-each>
  </tr>
  <tr>
    <td class="first">Zylinder</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./ZYLINDER" />
    </td>
    </xsl:for-each>
  </tr>
  <tr>
    <td class="first">Hubraum</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./HUBRAUM" />
        <xsl:value-of select="HUBRAUM/@einheit" />
    </td>
    </xsl:for-each>
  </tr>
  <tr>
    <td class="first">Leistung</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./LEISTUNG" /> 
        <xsl:value-of select="LEISTUNG/@einheit" />
    </td>
    </xsl:for-each>
  </tr>
  <tr>
    <td class="first">Höchstgeschwindigkeit</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./HOECHSTGESCHWINDIGKEIT" />
        <xsl:value-of select="HOECHSTGESCHWINDIGKEIT/@einheit" />
    </td>
    </xsl:for-each>
  </tr>
  <tr>
    <td class="first">von 0 auf 100 km/h</td>

    <xsl:for-each select="//AUTO/KFZ">
    <td class="liste">
        <xsl:value-of select="./VON0AUF100" /> <xsl:value-of select="VON0AUF100/@einheit" />
    </td>
    </xsl:for-each>
  </tr>
</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>