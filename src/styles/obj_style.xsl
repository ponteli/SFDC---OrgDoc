<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:func="http://exslt.org/functions"
    extension-element-prefixes="func">

	<xsl:template match="/">
	
		<html xmlns="http://www.w3.org/1999/xhtml">
		  <head>
			<title>Ant Project Summary</title>
		  </head>
		  <body>
			<h1><xsl:value-of select="CustomObject/label"/> - <xsl:value-of select="CustomObject/gender"/></h1>
			<h1>
				<xsl:value-of select="CustomObject/description"/>
			</h1>
			
			<table border="1">
				<tr>
					<td>Field label</td>
					<td>Field name</td>
					<td>Type</td>
					<td>API name</td>
					<td>Datatype</td>
					<td>Length</td>
					<td>External ID</td>
					<td>Unique</td>
					<td>Mandatory?</td>
					<td>List of values</td>
					<td>Default Value</td>
					<td>Related with Object</td>
					<td>Relation ship Name</td>
					<td>Description</td>
					<td>Help Text</td>
					<td>Comments</td>
					<td>Track History</td>
				</tr>
				<xsl:for-each select="CustomObject/fields">
					<tr>
						<td><xsl:value-of select="label"/></td>
						<td><xsl:value-of select="fullName"/></td><!---->
						<td>Custom</td>
						<td><xsl:value-of select="fullName"/></td>
						<td>
							<xsl:if test="formula">
								Formula
							</xsl:if>
							
							<xsl:if test="not(formula)">
								<xsl:value-of select="type"/>
							</xsl:if>
							
						</td>   
						<td>
							<xsl:if test="length">
								<xsl:value-of select="length"/>
							</xsl:if>
							
							<xsl:if test="precision">
								'<xsl:value-of select="precision"/>,
								<xsl:value-of select="scale"/>
							</xsl:if>
						</td>
						<td><xsl:value-of select="externalId"/></td>
						<td><xsl:value-of select="unique"/></td>
						<td><xsl:value-of select="required"/></td>
						<td><!-- List of values -->
							<xsl:if test="picklist">
								<xsl:for-each select="picklist/picklistValues">
									<!-- normalize-space() -->
									<xsl:value-of select="fullName"/>;
								</xsl:for-each>
							</xsl:if>
						</td>
						<td><xsl:value-of select="formula"/></td><!-- Default Value -->
						<td><xsl:value-of select="referenceTo"/></td><!-- Related with Object -->
						<td></td><!-- Relation ship Name  -->
						<td><xsl:value-of select="description"/></td><!-- Description -->
						<td></td><!-- Help Text -->
						<td></td> <!-- Comments -->
						<td><xsl:value-of select="trackHistory"/></td> <!-- trackHistory -->
					</tr>
					
				</xsl:for-each>
			</table>
			
			<br/>
			<h1>..</h1>
			
			
		  </body>
		</html>
	</xsl:template>

</xsl:stylesheet>