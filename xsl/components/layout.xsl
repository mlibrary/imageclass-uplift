<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
  <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

  <xsl:strip-space elements="*" />

  <xsl:template match="/">

    <html lang="en" class="antialiased leading-tight text-gray-900">
      <head>
        <meta charset="utf-8" />
        <title>
          <xsl:call-template name="document-title" />
        </title>

        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,400;0,600;0,700;0,800;1,400;1,600;1,700;1,800&amp;display=swap" rel="stylesheet" />
        <link href="https://unpkg.com/@umich-lib/css@v1/dist/umich-lib.css" rel="stylesheet" />
        <script type="module" src="https://unpkg.com/@umich-lib/components@v1/dist/umich-lib/umich-lib.esm.js"></script>
        <script nomodule="nomodule" src="https://unpkg.com/@umich-lib/components@v1/dist/umich-lib/umich-lib.js"></script>

        <link rel="stylesheet" href="../../dist/css/v01.css" />

        <link rel="icon" href="data:image/svg+xml,&lt;svg xmlns='http://www.w3.org/2000/svg' width='1em' height='1em'>&lt;text y='.9em'>🎃&lt;/text>&lt;/svg>" />

      </head>
      <body class="min-h-screen bg-white">

        <xsl:call-template name="m-universal-header" />
        <xsl:call-template name="m-website-header">
          <xsl:with-param name="name">Digital Collections</xsl:with-param>
          <xsl:with-param name="links">
            <a href="#">Help</a>
            <a href="#">Portfolios</a>
            <a href="#">Log in</a>
          </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="dlxs-collection-hero" />

        <!-- this is what templates look like-->
        <xsl:call-template name="dlxs-container" />

        <xsl:call-template name="dlxs-footer" />

      </body>
    </html>

  </xsl:template>

  <xsl:template name="document-title">
    <xsl:value-of select="//CollName/Brief" />
  </xsl:template>

  <xsl:template name="m-universal-header">
    <m-universal-header></m-universal-header>
  </xsl:template>

  <xsl:template name="m-website-header">
    <xsl:param name="name" />
    <xsl:param name="links" />
    <m-website-header name="{$name}">
      <nav class="flex flex-row justify-end">
        <xsl:for-each select="exsl:node-set($links)/node()">
          <xsl:copy>
            <xsl:attribute name="class">
              block ml-4 text-sm font-extrabold tracking-wider uppercase text-gray-umich-lib hover:underline focus:outline focus:underline
            </xsl:attribute>
            <xsl:apply-templates select="@*" mode="copy" />
            <xsl:apply-templates select="text()|*" mode="copy" />
          </xsl:copy>
        </xsl:for-each>
      </nav>
    </m-website-header>
  </xsl:template>

  <xsl:template name="dlxs-collection-hero">
    <div class="container h-64 px-0 m-4 mx-auto bg-local bg-center bg-cover shadow-2xl" style="background-image: url({//HeroImage})" aria-hidden="true"></div>
  </xsl:template>

  <xsl:template name="dlxs-footer">
    <footer class="flex flex-col w-full text-white bg-blue-900">
      <div class="w-full p-8">
        <pre>ABOUT DIGITAL COLLECTIONS</pre>
      </div>
      <div class="w-full p-8 py-4 text-gray-200 align-middle bg-gray-900">
        <div class="inline-block mr-4">© 2020, Regents of the University of Michigan</div>
        <div class="inline-block mr-4">
          Built with the
          <a class="underline" href="https://design-system.lib.umich.edu/">U-M Library Design System</a>
        </div>
        <div class="inline-flex flex-row align-middle">
          DLXS <svg style="margin: 0 0.5rem; stroke: white" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
            <path d="M12 9.229c.234-1.12 1.547-6.229 5.382-6.229 2.22 0 4.618 1.551 4.618 5.003 0 3.907-3.627 8.47-10 12.629-6.373-4.159-10-8.722-10-12.629 0-3.484 2.369-5.005 4.577-5.005 3.923 0 5.145 5.126 5.423 6.231zm-12-1.226c0 4.068 3.06 9.481 12 14.997 8.94-5.516 12-10.929 12-14.997 0-7.962-9.648-9.028-12-3.737-2.338-5.262-12-4.27-12 3.737z" />
          </svg> XML and XSLT
        </div>
      </div>
    </footer>
  </xsl:template>

  <xsl:template name="dlxs-container">
    <div class="container flex flex-row pr-6 mx-auto mb-8">
      <xsl:call-template name="dlxs-sidebar" />
      <xsl:call-template name="dlxs-content" />
    </div>
  </xsl:template>

  <xsl:template name="dlxs-sidebar">
    <div class="flex-initial mr-8 sidebar">
      <form class="flex flex-row mt-4 mb-4">
        <input type="text" name="q1" placeholder="Search collection" class="flex-grow p-2 placeholder-gray-500 border-2 border-gray-700" />
        <button type="submit" class="flex-initial px-2 py-2 text-white bg-gray-700 rounded rounded-l-none">
          <span class="sr-only">Search</span>
          <svg style="stroke: white; fill: white" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
            <path d="M23.822 20.88l-6.353-6.354c.93-1.465 1.467-3.2 1.467-5.059.001-5.219-4.247-9.467-9.468-9.467s-9.468 4.248-9.468 9.468c0 5.221 4.247 9.469 9.468 9.469 1.768 0 3.421-.487 4.839-1.333l6.396 6.396 3.119-3.12zm-20.294-11.412c0-3.273 2.665-5.938 5.939-5.938 3.275 0 5.94 2.664 5.94 5.938 0 3.275-2.665 5.939-5.94 5.939-3.274 0-5.939-2.664-5.939-5.939z" />
          </svg>
        </button>
        <input type="hidden" name="cc" value="//Param[@name='c']" />
      </form>

      <div class="mt-8">
        <h2 class="font-bold text-gray-600 uppercase">In this collection</h2>
        <ul>
          <li>
            <a href="#">...</a>
          </li>
        </ul>
      </div>

      <div class="mt-8 text-sm">
        <h2 class="font-bold text-gray-600 uppercase">Related Collections</h2>
        <ul class="mt-2">
          <xsl:for-each select="//Groups/Group">
            <li>
              <a class="underline" href="/cgi/i/image/image-idx?page=searchgroup;g={@GroupID}">
                <xsl:value-of select="." />
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </div>

      <div class="mt-8 text-sm">
        <h2 class="font-bold text-gray-600 uppercase">Library Contact</h2>
        <p>...</p>
      </div>

    </div>
  </xsl:template>

  <xsl:template name="dlxs-content">
    <div class="flex-grow main">
      <h1 class="text-4xl font-bold"><xsl:call-template name="main-title" /></h1>
      <xsl:call-template name="main-content" />
    </div>
  </xsl:template>

  <xsl:template name="main-title">
    <xsl:value-of select="//CollName/Full" />
  </xsl:template>

  <xsl:template name="main-content">
    <xsl:call-template name="collection-thumbnail-row" />
    <xsl:call-template name="collection-browse-notice" />
    <xsl:call-template name="collection-information" />
    <xsl:call-template name="collection-copyright-use" />
  </xsl:template>

  <xsl:template name="collection-thumbnail-row">
    <div class="max-w-full mt-4 mb-4 overflow-hidden whitespace-no-wrap">
      <xsl:for-each select="//Snapshot">
        <div class="inline-block mr-2">
          <a href="{@href}">
            <img src="{Thumbnail/@src}" class="block">
              <xsl:attribute name="alt">
                <xsl:for-each select="Record//Value">
                  <xsl:value-of select="." />
                  <xsl:if test="position() &lt; last()">
                    <xsl:text> / </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </img>
          </a>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template name="collection-browse-notice">
    <div class="p-4 mt-8 bg-gray-200">
      <xsl:variable name="access" select="//AccessRestrictions" />
      <p>
        <a href="{$access/Public/@href}" class="underline">
          <svg class="inline pr-1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
            <path d="M21 13v10h-21v-19h12v2h-10v15h17v-8h2zm3-12h-10.988l4.035 4-6.977 7.07 2.828 2.828 6.977-7.07 4.125 4.172v-11z" />
          </svg>
          <xsl:text> Browse </xsl:text>
          <xsl:value-of select="$access/Public" />
          <xsl:text> collection items</xsl:text>
        </a>
      </p>
    </div>
  </xsl:template>

  <xsl:template name="collection-information">
    <div class="mt-8 prose">
      <xsl:apply-templates select="//InsertTextInfo//div[@class='instructiontxt']" mode="copy-guts" />
    </div>
  </xsl:template>

  <xsl:template name="collection-copyright-use">
    <div class="mt-8">
      <h2 class="text-2xl font-bold">Copyright/Use Restrictions</h2>
      <div class="mt-4 prose">
        <xsl:apply-templates select="//InsertTextInfo//div[@id='useguidelines']" mode="copy-guts" />
      </div>
    </div>
  </xsl:template>

  <xsl:template match="*" mode="copy-guts">
    <xsl:apply-templates select="*|text()" mode="copy" />
  </xsl:template>

  <xsl:template match="@*|*|text()" mode="copy">
    <xsl:copy>
      <xsl:apply-templates select="@*|*|text()" mode="copy" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>