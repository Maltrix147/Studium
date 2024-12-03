<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Musiksammlung</title>
                <style>
                    table {
                    width: 100%;
                    margin: 20px 0;
                    border: 1px solid black;
                    }
                    td {
                    border: 1px dotted black;
                    padding: 8px;
                    }
                    th {
                    background-color: lightgrey;
                    text-align: left;
                    font-weight: normal;
                    padding: 8px;
                    border: 1px dotted black;
                    }
                </style>
            </head>
            <body>
                <h1>Musiksammlung</h1>
                <table>
                    <tr>
                        <th>Interpret<br/>Album</th>
                        <th>Label<br/>Jahr</th>
                        <th>Musikstil</th>
                        <th>Aufgenommen von</th>
                    </tr>
                    <xsl:for-each select="MUSIKSAMMLUNG/ALBUM">
                        <tr>
                            <td style="font-weight:bold">
                                <span style="color:red">
                                    <xsl:value-of select="INTERPRET"/>
                                </span><br/>
                                <xsl:value-of select="TITEL"/>
                            </td>
                            <td>
                                <xsl:value-of select="LABEL"/><br/>
                                <xsl:value-of select="JAHR"/>
                            </td>
                            <td>
                                <xsl:value-of select="TITEL/@stil"/>
                            </td>
                            <td>
                                <xsl:value-of select="AUTOR"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
