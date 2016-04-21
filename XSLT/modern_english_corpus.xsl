<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>

    <xsl:strip-space elements="*"/>

    <!--YAML FRONT-MATTER-->

    <xsl:template match="/">
        <xsl:text>---&#xa;</xsl:text>
        <xsl:call-template name="YAML"/>
        <xsl:text>---&#xa;&#xa;</xsl:text>
        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="teiHeader"> </xsl:template>

    <xsl:template name="YAML">
        <xsl:text>layout: </xsl:text><xsl:choose><xsl:when test="//div1[@type='play']">drama</xsl:when><xsl:when test="//div1[@type='poem'] or //div2[@type='poem']">poem</xsl:when><xsl:otherwise><xsl:text>narrative</xsl:text></xsl:otherwise></xsl:choose>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>author: </xsl:text>
        <xsl:value-of select="/descendant::sourceDesc/descendant::author/text()"/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>title: >&#xa;    </xsl:text>
        <xsl:value-of select="normalize-space(/descendant::sourceDesc/descendant::title[@type = 'main']/text())"/>
        <xsl:text>&#xa;</xsl:text>
      <!--  <xsl:choose>
            <xsl:when test="//head">
                <text>toc:&#xa;</text>
                <xsl:for-each select="//head">
                    <xsl:text>- </xsl:text>
                    <xsl:value-of select="normalize-space(current())"/>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose> -->
        <xsl:text>source: </xsl:text>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>


    <!--We need to deal with the block of stanza, which in the XML are like this : <lg><l>(line of verse)</l></lg>-->

    <xsl:template match="lg">
        <xsl:apply-templates/>
        <xsl:text>
           
        </xsl:text>
    </xsl:template>

    <xsl:template match="l">
        <xsl:text>- </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <!-- For all kinds of typographic highlights -->

    <xsl:template match="hi">

        <xsl:choose>
            <xsl:when test="@rend = 'italic'">
                <xsl:text>*</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>*</xsl:text>
            </xsl:when>
            <xsl:when test="@rend = 'bold'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="@rend = 'small-caps'">
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <!--Below, template for the headers-->
    <xsl:template match="head">
        <xsl:text>## </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>



    <xsl:template match="p">
        <xsl:apply-templates/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>


    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    
    <!--For the play, we must deal with numerous particular features-->
    
<xsl:template match="list">

<xsl:apply-templates></xsl:apply-templates>
</xsl:template>

<xsl:template match="item">
<xsl:text>- </xsl:text><xsl:apply-templates></xsl:apply-templates><xsl:text>&#xa;</xsl:text>
</xsl:template>
    
<xsl:template match="sp">
<xsl:apply-templates></xsl:apply-templates></xsl:template>


<xsl:template match="speaker"><xsl:value-of select="."></xsl:value-of><xsl:text>: </xsl:text></xsl:template>

<xsl:template match="lb"><xsl:text>&#xa;</xsl:text></xsl:template>

<xsl:template match="stage"><xsl:text>*</xsl:text><xsl:apply-templates></xsl:apply-templates><xsl:text>*</xsl:text></xsl:template>

    
    <!--END TEMPLATE FOR THE PLAY-->
<!--

<xsl:template match="text()">

<xsl:analyze-string select="." regex="">

<xsl:matching-substring></xsl:matching-substring>
<xsl:non-matching-substring></xsl:non-matching-substring>

</xsl:analyze-string>

</xsl:template> -->
</xsl:stylesheet>
