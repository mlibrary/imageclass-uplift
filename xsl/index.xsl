<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

  <xsl:template match="/">

    <html lang="en" class="text-gray-900 antialiased leading-tight">
      <head>
        <meta charset="utf-8" />
        <title><xsl:call-template name="document-title" /></title>

        <xsl:if test="false()">
          <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&amp;display=swap" rel="stylesheet" />
        </xsl:if>

        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />

        <link  href="https://unpkg.com/@umich-lib/css@v1/dist/umich-lib.css"  rel="stylesheet"/>
        <script  type="module"  src="https://unpkg.com/@umich-lib/components@v1/dist/umich-lib/umich-lib.esm.js"></script>
        <script  nomodule="nomodule" src="https://unpkg.com/@umich-lib/components@v1/dist/umich-lib/umich-lib.js"></script>


        <link rel="stylesheet" href="../../dist/css/v01.css" />

        <link rel="icon" href="data:image/svg+xml,&lt;svg xmlns='http://www.w3.org/2000/svg' width='1em' height='1em'>&lt;text y='.9em'>🎃&lt;/text>&lt;/svg>" />

      </head>
      <body class="min-h-screen bg-gray-100">

        <m-universal-header></m-universal-header>

        <div class="w-full text-gray-100 bg-gray-900">
          <div class="container flex px-6 mx-auto items-center justify-beteween flex-row">
            <a class="text-lg font-semibold tracking-widest uppercase rounded-lg" href="#">MLibrary / Digital Collections</a>
            <nav class="flex flex-row flex-grow justify-end items-center pb-0">
              <a class="px-4 py-2 mt-2 mb-2 text-sm font-semibold bg-transparent rounded-lg" href="#">Help</a>
              <a class="px-4 py-2 mt-2 mb-2 text-sm font-semibold bg-transparent rounded-lg" href="#">Portfolios</a>
              <a class="px-4 py-2 mt-2 mb-2 text-sm font-semibold bg-transparent rounded-lg" href="#">Login</a>
            </nav>
          </div>
        </div>

        <!-- <div class="container mx-auto h-64 px-6 m-4">
          <img src="https://quod.lib.umich.edu/cgi/i/image/api/image/sdlhomes:SL1301:SL130101.TIF/full/res:2/0/native.jpg" alt="" aria-hidden="true" class="object-cover" />
        </div> -->

        <div class="container mx-auto h-64 px-6 m-4 bg-local bg-cover bg-center shadow-2xl" style="background-image: url(https://quod.lib.umich.edu/cgi/i/image/api/image/sdlhomes:SL1301:SL130101.TIF/full/res:2/0/native.jpg)" aria-hidden="true">
        </div>

        <div class="container mx-auto px-6 flex flex-row">

          <div class="sidebar flex-initial mr-8">
            <form class="flex flex-row mb-4 mt-4">
              <input type="text" name="q1" placeholder="Search collection" class="p-2 flex-grow border-2 border-gray-700 placeholder-gray-500" />
              <button type="submit" class="flex-initial bg-gray-700 text-white rounded rounded-l-none px-2 py-2">
                <span class="sr-only">Search</span>
                <svg style="stroke: white; fill: white" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M23.822 20.88l-6.353-6.354c.93-1.465 1.467-3.2 1.467-5.059.001-5.219-4.247-9.467-9.468-9.467s-9.468 4.248-9.468 9.468c0 5.221 4.247 9.469 9.468 9.469 1.768 0 3.421-.487 4.839-1.333l6.396 6.396 3.119-3.12zm-20.294-11.412c0-3.273 2.665-5.938 5.939-5.938 3.275 0 5.94 2.664 5.94 5.938 0 3.275-2.665 5.939-5.94 5.939-3.274 0-5.939-2.664-5.939-5.939z"/></svg>
              </button>
              <input type="hidden" name="cc" value="//Param[@name='c']" />
            </form>

            <div class="mt-8">
              <h2 class="font-bold uppercase text-gray-600">In this collection</h2>
              <ul>
                <li>
                  <a href="#">...</a>
                </li>
              </ul>
            </div>

            <div class="mt-8 text-sm">
              <h2 class="font-bold uppercase text-gray-600">Related Collections</h2>
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
              <h2 class="font-bold uppercase text-gray-600">Library Contact</h2>
              <p>...</p>
            </div>

          </div>

          <div class="main flex-grow">

            <h1 class="text-4xl font-bold"><xsl:value-of select="//CollName/Full" /></h1>

            <div class="max-w-full overflow-hidden whitespace-no-wrap mt-4 mb-4">
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

            <div class="bg-gray-200 p-4 mt-8">
              <xsl:variable name="access" select="//AccessRestrictions" />
              <p>
                <a href="{$access/Public/@href}" class="underline">
                  <svg class="inline pr-1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M21 13v10h-21v-19h12v2h-10v15h17v-8h2zm3-12h-10.988l4.035 4-6.977 7.07 2.828 2.828 6.977-7.07 4.125 4.172v-11z"/></svg>
                  <xsl:text> Browse </xsl:text>
                  <xsl:value-of select="$access/Public" />
                  <xsl:text> collection items</xsl:text>
                </a>
              </p>
            </div>

            <div class="prose mt-8">
              <xsl:apply-templates select="//InsertTextInfo//div[@class='instructiontxt']" mode="copy-guts" />
            </div>

            <div class="mt-8">
              <h2 class="text-2xl font-bold">Copyright/Use Restrictions</h2>
              <div class="prose mt-4">
                <xsl:apply-templates select="//InsertTextInfo//div[@id='useguidelines']" mode="copy-guts" />
              </div>
            </div>

          </div>

        </div>
      </body>
    </html>
    
  </xsl:template>

  <xsl:template name="document-title">
    <xsl:value-of select="//CollName/Brief" />
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