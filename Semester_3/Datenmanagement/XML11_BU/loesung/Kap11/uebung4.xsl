<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Musiksammlung</title>
				<style>
  					table { border:3px solid #000; width:700px;}
  					td  { border:1px dotted #000; padding:3px; }
	 				 tr.bg { background-color: #DDD;}
  				</style>
			</head>
			<body>
				<table>
					<tr valign="top" class="bg">
						<td>Interpret<br/>Album</td>
						<td>Label<br/>Jahr</td>
						<td>Musikstil</td>
						<td>Aufgenommen von</td>
					</tr>
					<xsl:apply-templates select="MUSIKSAMMLUNG/ALBUM"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="//ALBUM">
		<tr valign="top">
			<td>
				<b>
					<span style="color:red">
						<xsl:value-of select="INTERPRET"/>
					</span>
				</b>
				<br/>
				<b>
					<xsl:value-of select="TITEL"/>
				</b>
			</td>
			<td>
				<xsl:value-of select="LABEL"/>
				<br/>
				<xsl:value-of select="JAHR"/>
			</td>
			<td>
				<xsl:value-of select="TITEL/@stil"/>
			</td>
			<td>
				<xsl:value-of select="AUTOR"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
