<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/films">

        <html>
            <head><title>
                Film
            </title></head>
            <body>
                <h1>Films</h1>
                <table>
                    <thead>
                        <tr><th>
                            Titre
                        </th>
                        <th>
                            Résumé
                        </th>
                        <th>
                            Realisateur
                        </th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="film"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <tr><td>
            <xsl:value-of select="titre"/>
        </td>
        <td>
            <xsl:value-of select="resume/text"/>
        </td>
            <xsl:variable name="real" select="@id_realisateur"/>
        <td>
            <xsl:value-of select="/films/realisateur[@id_realisateur=$real]/prenom"/> &#160; <xsl:value-of select="/films/realisateur[@id_realisateur=$real]/nom"/>
        </td>
        <th>

        </th>
        </tr>
    </xsl:template>

</xsl:stylesheet>