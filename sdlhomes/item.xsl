<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org">
  
  <!-- transform.xml is processed by the middleware into an internally    
  referenced XSL stylesheet. This allows fallback processing of the  
  stylesheets imported into the top-level stylesheet. The top-level  
  stylesheet is normally specified by the <?xml-stylesheet           
  type="text/xsl" href="somestylesheet.xsl"?> processing instruction 
  (PI) in the top-level XML file.  In the absence of that PI, an XML 
  XslFallbackFileList node must be present in the top-level XML file 
  to list the XSL files which should appear in XSL import statements 
  to replace the XSL_FALLBACK_FILE_LIST PI below. -->

  <xsl:import href="/l1/dev/roger/web/lib/xsl2htmlutils.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/feedback.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/htmlhead.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/displayheader.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/entry_imagetools.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/fieldvalues.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/social.xsl"/>
<xsl:import href="/l1/dev/roger/web//i/image/mirador/entry.xsl"/>
<xsl:import href="/l1/dev/roger/web/i/image/panzoom.xsl"/>


  <xsl:output
    method="xml"
    indent="yes"
    encoding="utf-8"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    omit-xml-declaration="no"
    version="5.0"
    />
  <xsl:strip-space elements="*"/>
</xsl:stylesheet>
