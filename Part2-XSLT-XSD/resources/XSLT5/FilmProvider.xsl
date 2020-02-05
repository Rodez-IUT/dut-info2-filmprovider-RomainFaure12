<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/films">
        <html>
            <head><META http-equiv="Content-Type" content="text/html; charset=UTF-8"/><title>
                Film Provider
            </title></head>
            <body>
                <h1>Liste des films</h1>
                <xsl:apply-templates select="film"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <xsl:variable name="real" select="@id_realisateur"/>
        <table width="60%">
            <tr>
                <td colspan="2"><b><xsl:value-of select="titre"/></b><i> (<xsl:value-of select="/films/realisateur[@id_realisateur=$real]/prenom"/>,&#160;
                    <xsl:value-of select="/films/realisateur[@id_realisateur=$real]/nom"/>)</i></td>
            </tr>
            <tr>
                <xsl:if test="resume/image = true()">
                    <td>
                        <xsl:variable name="source" select="resume/image/@source"/>
                        <img src="{$source}"/>
                    </td>
                </xsl:if>
                <td colspan="2"><xsl:value-of select="resume/text"/></td>
            </tr>
        </table>
        <hr></hr>
    </xsl:template>

</xsl:stylesheet>