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
                    <th>Procentowe posiadanie piłki </th>           
                <th>Liczba goli</th>
				 <th>Puchary</th>

              </tr>
              <xsl:apply-templates select="LigaMistrzow/Druzyny/Druzyna"/>
            </table>
          </div>
		  </div >
		  </section>
		  <article>

		  </article>
		      
		 </body>
    </html>
</xsl:template>
  
<xsl:template name="naglowek">
  <div id="naglowek">
    <h1> PIŁKA NOŻNA</h1>
  </div>
</xsl:template>

<xsl:template match="informacje">
    Autor: <xsl:value-of select="autor"/>
    <br/>
    Wiek: <xsl:value-of select='format-number(wiek, "#")'/>
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
        <xsl:value-of select='format-number(IloscZawodnikow, "#%")'/>
      </td>
	  <td>
        <xsl:value-of select='format-number(LiczbaGoli, "0")'/>
      </td>
      <td>
	  		<xsl:if test="Puchary &lt; 10">
			<xsl:value-of select='format-number(Puchary, "#")'/>
			</xsl:if>
			<xsl:if test="Puchary &gt; 10">
			<xsl:text> Niepojete </xsl:text>
			</xsl:if>
      </td>
      
      
    </tr>

</xsl:template>





<xsl:variable name="male" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="duze" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />


</xsl:stylesheet>