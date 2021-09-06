<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

<xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>PRZEGLĄD DRUŻYN</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		    <link rel="stylesheet" href="drugi.css" />
      </head>
		<body>
        <div id="naglowek"> PIŁKA NOŻNA</div>
		
		<div id="Kluby">
            <xsl:apply-templates select="bramka/gol/pilka"/>
		      </div> 
		      <div id="linki">
            <ul>
              <xsl:apply-templates select="bramka/linki/link"/>
            </ul>
          </div>
		  <article>
          <xsl:apply-templates select="bramka/gol/zawodnik"/>
		  </article>
		  <section>
          <div id="zbior">
		  <div id="tablica">
            <table>
              <tr>
				<th>Nazwa Druzyny</th>
                <th>Trener</th>
                <th>Puchary</th>
                <th>Liczba goli</th>
                <th>Procentowe posiadanie piłki </th>
              </tr>
              <xsl:apply-templates select="LigaMistrzow/Druzyny/Druzyna"/>
            </table>
          </div>
		  </div >
		  </section>
		  <article>

		  </article>
		      <div id="stopka">

		  	  </div>
		<div id="linki">
		<xsl:apply-templates select="LigaMistrzow/linki/link"/>
		</div>
		<div id="foty">
		<xsl:apply-templates select="LigaMistrzow/Druzyny"/>
		 </div>
		 </body>
    </html>
</xsl:template>
  
<xsl:template name="naglowek">
  <div id="naglowek">
    <h1> PIŁKA NOŻNA</h1>
  </div>
</xsl:template>



<xsl:template match="LigaMistrzow/Druzyny/Druzyna">
    <tr>
      <td>
	  <xsl:number value="position()" format="1"/>
        <xsl:value-of select='Nazwa'/>
      </td>
	  <td>
        <xsl:value-of select='translate(Trener, $male, $duze)'/>
      </td>
      <td>
	  		<xsl:if test="Puchary &lt; 10">
			<xsl:value-of select='format-number(Puchary, "#")'/>
			</xsl:if>
			<xsl:if test="Puchary &gt; 10">
			<xsl:text> Niepojete </xsl:text>
			</xsl:if>
      </td>
      <td>
        <xsl:value-of select='format-number(LiczbaGoli, "0")'/>
      </td>
      <td>
        <xsl:value-of select='format-number(IloscZawodnikow, "#%")'/>
      </td>
    </tr>

</xsl:template>

<xsl:template match="LigaMistrzow/linki/link">
<xsl:number value="position()" format="I"/>
<br/>
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="@source"/>
      </xsl:attribute>
      <xsl:value-of select="current()"/>
	  <br/>
    </a>
	
</xsl:template>


<xsl:template match="LigaMistrzow/Druzyny">
    <xsl:for-each select="Druzyna">
	<xsl:sort select="Nazwa" order="descending"/>
	<xsl:choose>
	<xsl:when test="@kraj='Hiszpania'">
	<img style="height: 200px; width:200px">
      <xsl:attribute name="src">
          <xsl:value-of select="Zdjecia/@zrodlo"/>
      </xsl:attribute>
    </img>
	<br/>
	</xsl:when>
	    <xsl:otherwise>
	<img>
      <xsl:attribute name="src">
          <xsl:value-of select="Zdjecia/@zrodlo"/>
      </xsl:attribute>
    </img>
	<br/>
	</xsl:otherwise>
	</xsl:choose>
	</xsl:for-each>
</xsl:template>

<xsl:variable name="male" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="duze" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />


</xsl:stylesheet>