<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Fahrzeugverwaltung</title>
				<style type="text/css">
  					table { border:3px solid #000; width:700px;}
  					td  { border:1px dotted #000; padding:3px; }
  					tr.bg { background-color: moccasin;}
  				</style>
			</head>
			<body>
				<table>
					<tr valign="top" class="bg">
						<td>
							<b>Hersteller</b>
						</td>
						<td>
							<b>Modell</b>
						</td>
						<td>
							<b>Hubraum</b>
						</td>
						<td>
							<b>Leistung</b>
						</td>
					</tr>
					<xsl:apply-templates select="AUTO/KFZ"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="//KFZ">
		<tr valign="top">
			<td class="bg">
				<b>
					<span style="color:red">
						<xsl:value-of select="HERSTELLER"/>
					</span>
				</b>
			</td>
			<td>
				<xsl:value-of select="MODELL"/>
			</td>
			<td>
				<xsl:value-of select="HUBRAUM"/> <xsl:value-of select="HUBRAUM/@einheit"/>
			</td>
			<td>
				<xsl:value-of select="LEISTUNG"/> <xsl:value-of select="LEISTUNG/@einheit"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
