<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:quod="http://dlxs.org/quombat" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl" xmlns:qbat="http://dlxs.org/quombat" xmlns:qq="http://dlxs.org/quombat/ui">

  <!-- <xsl:import href="social.wireframe.xsl" /> -->

  <xsl:template match="Top">
    <qq:root xmlns="http://www.w3.org/1999/xhtml">
      <!-- fills html/head-->
      <qq:head>
        <qq:title>
          <xsl:value-of select="//CollName/Brief" />
        </qq:title>
        <qq:block slot="meta-social">
          <xsl:call-template name="build-social-twitter" />
          <xsl:call-template name="build-social-facebook" />
        </qq:block>
      </qq:head>
      <qq:m-website-header name="Digital Collections">
        <qq:nav>
          <qq:link href="{//Help}">Help</qq:link>
          <qq:link href="{//OpenPortfolio/Url}">Portfolios</qq:link>
          <xsl:call-template name="build-login-link" />
        </qq:nav>
      </qq:m-website-header>
      <qq:collection-header>
        <xsl:if test="//BannerImage">
          <xsl:attribute name="src">
            <xsl:value-of select="//BannerImage" />
          </xsl:attribute>
        </xsl:if>
        <xsl:call-template name="get-collection-title" />
        <xsl:call-template name="get-collection-subtitle" />
        <qq:nav slot="browse">
          <xsl:comment>browse records?</xsl:comment>
          <xsl:if test="normalize-space(//BrowseRecords)">
            <qq:link href="{//BrowseRecords/Url}">Browse the collection records</qq:link>
          </xsl:if>
          <qq:link href="{//BrowseImages/Url}">Browse the collection images</qq:link>
        </qq:nav>
        <qq:search-form />
      </qq:collection-header>
      <qq:main>
        <qq:block slot="introduction">
          <xsl:apply-templates select="//CollDescr" mode="copy-guts" />
        </qq:block>
        <xsl:call-template name="build-thumbnail-list" /> 
        <qq:block slot="description">
          <xsl:apply-templates select="//InsertTextInfo//div[@class='instructiontxt']" mode="copy-guts" />
        </qq:block>
        <qq:block slot="copyright-information">
          <xsl:apply-templates select="//InsertTextInfo//div[@id='useguidelines']" mode="copy-guts" />
        </qq:block>
      </qq:main>
      <qq:sidebar>
        <xsl:call-template name="build-panel-collection-links" />
        <xsl:call-template name="build-panel-browse-filters" />
        <xsl:call-template name="build-panel-related-collections" />
        <xsl:call-template name="build-panel-collection-contact" />
      </qq:sidebar>
      <qq:message>Message recived, La Jolla</qq:message>
    </qq:root>
  </xsl:template>

  <xsl:template name="build-login-link">
    <qq:link href="{//LoginLink/Url}">
      <xsl:choose>
        <xsl:when test="//LoginLink/Mode = 'logout'">
          <xsl:text>Log out</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Log in</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </qq:link>
  </xsl:template>

  <xsl:template name="get-collection-title">
    <qq:collection-title>
      <xsl:choose>
        <xsl:when test="/Top/CollName = 'multiple'">
          <xsl:value-of select="normalize-space(/Top/GroupName)" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(/Top/CollName/Full)" />
        </xsl:otherwise>
      </xsl:choose>
    </qq:collection-title>
  </xsl:template>

  <xsl:template name="get-collection-subtitle">
    <xsl:if test="normalize-space(//Subtitle)">
      <qq:collection-subtitle name="collection-subtitle">
        <xsl:value-of select="//Subtitle" />
      </qq:collection-subtitle>
    </xsl:if>
  </xsl:template>

  <xsl:template name="build-thumbnail-list">
    <xsl:if test="//Snapshot">
      <qq:thumbnail-list>
        <xsl:for-each select="//Snapshot">
          <qq:link href="{@href}">
            <img src="{Thumbnail/@src}">
              <!-- <xsl:attribute name="alt">
                <xsl:for-each select="Record//Value">
                  <xsl:value-of select="." />
                  <xsl:if test="position() &lt; last()">
                    <xsl:text> / </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute> -->
            </img>
            <span>
              <xsl:for-each select="Record//Value">
                <xsl:value-of select="." />
                <xsl:if test="position() &lt; last()">
                  <xsl:text> / </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </span>
          </qq:link>
        </xsl:for-each>
      </qq:thumbnail-list>
    </xsl:if>
  </xsl:template>

  <xsl:template name="build-panel-collection-links">
    <xsl:if test="//CollectionLinks">
      <qq:panel>
        <qq:header>In this collection</qq:header>
        <qq:nav>
          <xsl:for-each select="//CollectionLinks/Link">
            <qq:link href="{@href}">
              <xsl:value-of select="normalize-space(.)" />
            </qq:link>
          </xsl:for-each>
        </qq:nav>
      </qq:panel>
    </xsl:if>
  </xsl:template>

  <xsl:template name="build-panel-related-collections">
    <xsl:if test="//Groups/Group">
      <qq:panel>
        <qq:header>Related Collections</qq:header>
        <qq:block slot="help">
          <xsl:text>Search this collection with other related collections in </xsl:text>
          <xsl:choose>
            <xsl:when test="count(//Groups/Group) = 1">
              <xsl:text> this group</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text> these groups</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </qq:block>
        <qq:nav>
          <xsl:for-each select="//Groups/Group">
            <qq:link href="/cgi/i/image/image-idx?page=searchgroup;g={@GroupID}">
              <xsl:value-of select="normalize-space(.)" />
            </qq:link>
          </xsl:for-each>
        </qq:nav>
      </qq:panel>
    </xsl:if>
  </xsl:template>

  <xsl:template name="build-panel-collection-contact">
    <qq:panel>
      <qq:header>Collection Contact</qq:header>
      <qq:block-contact>
        <qq:href type="{//ContactLink/@type}"><xsl:value-of select="normalize-space(//ContactLink)" /></qq:href>
        <qq:span><xsl:value-of select="normalize-space(//ContactText)" /></qq:span>
      </qq:block-contact>
    </qq:panel>
  </xsl:template>

  <xsl:template name="build-panel-browse-filters">
    <qq:panel>
      <xsl:comment>see: https://curiosity.lib.harvard.edu/american-currency</xsl:comment>
      <qq:header>Limit your search</qq:header>
      <qq:nav>
        <xsl:for-each select="//SearchForm//Rgn/Option">
          <xsl:choose>
            <xsl:when test="Value = 'ic_all'"></xsl:when>
            <xsl:otherwise>
              <qq:link href="/cgi/i/image/image-idx?c={//Param[@name='cc']};page=search;filter={Value}">
                <xsl:value-of select="Label" />
              </qq:link>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </qq:nav>
    </qq:panel>
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
