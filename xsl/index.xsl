<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:quod="http://dlxs.org/quombat" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

  <!-- <xsl:import href="./components/layout.xsl" /> -->
  <!-- <xsl:import href="./components/wireframe.xsl" /> -->

  <xsl:strip-space elements="*" />

  <xsl:param name="message">Hello, La Jolla?</xsl:param>
  <xsl:param name="mode">html</xsl:param>
  <xsl:param name="method">html</xsl:param>

  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="yes" />

  <xsl:template match="/">
    <xsl:variable name="result-tmp">
      <quod:mood>
        <quod:night>
          <xsl:text>exhausted</xsl:text>
        </quod:night>
        <quod:morning>
          <xsl:text>peeved</xsl:text>
        </quod:morning>
      </quod:mood>
      <quod:wireframe>
        <xsl:value-of select="$mode" />
      </quod:wireframe>
      <quod:message>
        <xsl:value-of select="$message" />
      </quod:message>
      <quod:mood>
        <xsl:text>confused</xsl:text>
      </quod:mood>
    </xsl:variable>
    <xsl:variable name="result" select="exsl:node-set($result-tmp)" />

    <root xmlns:quod="http://dlxs.org/quod">
      <style>
        <xsl:text>root::before { content: '&lt;root>' }</xsl:text>
        <xsl:text>root::after { content: '&lt;/root>' }</xsl:text>
        <xsl:for-each select="$result//node()[name()]">
          <xsl:message><xsl:value-of select="name()" /></xsl:message>
          <xsl:value-of select="concat(local-name(), '::before')" />
          <xsl:text> { content: '</xsl:text>
          <xsl:value-of select="concat('&lt;', name(), '>')" />
          <xsl:text>'} </xsl:text>
          <xsl:value-of select="concat(local-name(), '::after')" />
          <xsl:text> { content: '</xsl:text>
          <xsl:value-of select="concat('&lt;/', name(), '>')" />
          <xsl:text>'} </xsl:text>
        </xsl:for-each>
      </style>
      <xsl:copy-of select="$result" />
    </root>
  </xsl:template>


</xsl:stylesheet>
