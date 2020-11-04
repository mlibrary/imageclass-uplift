<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:quod="http://dlxs.org/quombat" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl" xmlns:qbat="http://dlxs.org/quombat">


  <xsl:template match="Top">
    <qbat:root>
      <m-website-header name="Digital Collections">
        <qbat:nav>
          <a href="#">Help</a>
          <a href="#">Portfolios</a>
          <a href="#">Log in</a>
        </qbat:nav>
      </m-website-header>
      <qbat:message>Message recived, La Jolla</qbat:message>
    </qbat:root>
  </xsl:template>

</xsl:stylesheet>
