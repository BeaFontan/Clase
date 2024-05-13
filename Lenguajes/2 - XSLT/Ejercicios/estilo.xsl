<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="html"/>
    <xsl:template match="/">
       <html>
          <head>
             <title>Táboa máquinas</title>
          </head>
          <body>
             <h1>Táboa das máquinas</h1>
             <table border="1">
                <tr>
                   <th>Máquina</th>
                   <th>Procesador</th>
                   <th>Memoria</th>
                </tr>
                 <xsl:apply-templates select="equipos/máquina" />
             </table>
          </body>
       </html>
    </xsl:template>
    <xsl:template match="máquina">
       <tr>
          <td><xsl:value-of select="@nome" /></td>
          <td><xsl:value-of select="hardware/procesador/@marca" />-<xsl:value-of select="hardware/procesador/text()" /></td>
          <td><xsl:value-of select="hardware/memoria" />GB <xsl:value-of select="hardware/memoria/@tecnoloxía" /></td>
       </tr>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">

   <xsl:output method="xml" indent="yes"/>
   <xsl:mode on-no-match="shallow-copy"/>

   <xsl:template match="/*" mode="#all">
      <xsl:copy>
         <xsl:apply-templates select="@*, node()" mode="#current"/>
      </xsl:copy>
      <block></block>
      <xsl:apply-templates select=""/>
   </xsl:template>

   

</xsl:stylesheet>