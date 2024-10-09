<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
   <html><head><title>XSL-Templates</title></head><body>
   <h3>Ansprechen einzelner XML-Elemente</h3>
   <xsl:apply-templates/>
   </body></html>
</xsl:template>

<xsl:template match="OBERELEMENT">
    <p>Die XML-Struktur enthält das Element OBERELEMENT.</p>
    <xsl:apply-templates select="SICHTBAR"/>
</xsl:template>

<xsl:template match="UNSICHTBAR">
    <p>Die XML-Struktur enthält das Element UNSICHTBAR.</p>
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="SICHTBAR">
    <p>Die XML-Struktur enthält das Element SICHTBAR.</p>
</xsl:template>

</xsl:stylesheet>
