<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:quod="http://dlxs.org/quombat" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl" xmlns:qbat="http://dlxs.org/quombat">

  <!-- <xsl:import href="social.wireframe.xsl" /> -->

  <xsl:template match="Top">
    <qbat:root xmlns="http://www.w3.org/1999/xhtml">
      <qbat:head>
        <qbat:title>
          <xsl:value-of select="//CollName/Brief" />
        </qbat:title>
        <qbat:block slot="meta-social">
          <xsl:call-template name="build-social-twitter" />
          <xsl:call-template name="build-social-facebook" />
        </qbat:block>
      </qbat:head>
      <m-website-header name="Digital Collections">
        <qbat:nav>
          <qbat:link href="{//Help}">Help</qbat:link>
          <qbat:link href="{//OpenPortfolio/Url}">Portfolios</qbat:link>
          <xsl:call-template name="build-login-link" />
        </qbat:nav>
      </m-website-header>
      <qbat:collection-header>
        <xsl:if test="//BannerImage">
          <xsl:attribute name="src">
            <xsl:value-of select="//BannerImage" />
          </xsl:attribute>
        </xsl:if>
        <xsl:call-template name="get-collection-title" />
        <xsl:call-template name="get-collection-subtitle" />
        <qbat:nav>
          <xsl:comment>browse records?</xsl:comment>
          <xsl:if test="normalize-space(//BrowseRecords)">
            <qbat:link href="{//BrowseRecords}">Browse the collection records</qbat:link>
          </xsl:if>
          <qbat:link href="{//BrowseImages}">Browse the collection images</qbat:link>
        </qbat:nav>
        <qbat:search-form />
      </qbat:collection-header>
      <qbat:search-filters></qbat:search-filters>
      <qbat:main>
        <qbat:block slot="introduction">
          <xsl:apply-templates select="//CollDescr" mode="copy-guts" />
        </qbat:block>
        <xsl:call-template name="build-thumbnail-list" /> 
        <qbat:block slot="description">
          <xsl:apply-templates select="//InsertTextInfo//div[@class='instructiontxt']" mode="copy-guts" />
        </qbat:block>
        <qbat:block slot="copyright-information">
          <xsl:apply-templates select="//InsertTextInfo//div[@id='useguidelines']" mode="copy-guts" />
        </qbat:block>
      </qbat:main>
      <qbat:message>Message recived, La Jolla</qbat:message>
    </qbat:root>
  </xsl:template>

  <xsl:template name="build-login-link">
    <qbat:link href="{//LoginLink/Url}">
      <xsl:choose>
        <xsl:when test="//LoginLink/Mode = 'logout'">
          <xsl:text>Log out</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Log in</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </qbat:link>
  </xsl:template>

  <xsl:template name="get-collection-title">
    <qbat:collection-title>
      <xsl:choose>
        <xsl:when test="/Top/CollName = 'multiple'">
          <xsl:value-of select="/Top/GroupName" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="/Top/CollName/Full" />
        </xsl:otherwise>
      </xsl:choose>
    </qbat:collection-title>
  </xsl:template>

  <xsl:template name="get-collection-subtitle">
    <xsl:if test="normalize-space(//Subtitle)">
      <qbat:collection-subtitle name="collection-subtitle">
        <xsl:value-of select="//Subtitle" />
      </qbat:collection-subtitle>
    </xsl:if>
  </xsl:template>

  <xsl:template name="build-thumbnail-list">
    <xsl:if test="//Snapshot">
      <qbat:thumbnail-list>
        <xsl:for-each select="//Snapshot">
          <qbat:link href="{@href}">
            <img src="{Thumbnail/@src}">
              <xsl:attribute name="alt">
                <xsl:for-each select="Record//Value">
                  <xsl:value-of select="." />
                  <xsl:if test="position() &lt; last()">
                    <xsl:text> / </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </img>
          </qbat:link>
        </xsl:for-each>
      </qbat:thumbnail-list>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*" mode="copy-guts">
    <xsl:apply-templates select="*|text()" mode="copy" />
  </xsl:template>

  <xsl:template match="node()[name()]" mode="copy" priority="99">
    <xsl:element name="{name()}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates select="*|@*|text()" mode="copy" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="text()" mode="copy">
    <xsl:value-of select="normalize-space(.)" />
  </xsl:template>

  <xsl:template match="@*|*|text()" mode="copy">
    <xsl:copy>
      <xsl:apply-templates select="@*|*|text()" mode="copy" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
