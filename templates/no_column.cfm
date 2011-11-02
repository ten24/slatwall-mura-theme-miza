<cfinclude template="inc/html_head.cfm" />
<cfoutput>
<body>
	<!-- Wrapper Section -->
	<div id="wrapper_sec">
		<cfinclude template="inc/header.cfm" />
	    <!-- Content Section -->
		<div id="contentsec">
			<div class="header">
	    		<h1 class="colr heading">#$.content('title')#</h1>
				<ul class="share">
			    	<li class="txt">Share with us:</li>
			        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/facebook.gif" alt="" /></a></li>
			        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/twitter.gif" alt="" /></a></li>
			        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/rss.gif" alt="" /></a></li>
			        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/blogger.gif" alt="" /></a></li>
			        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/linkdin.gif" alt="" /></a></li>
			        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/del.gif" alt="" /></a></li>
			    </ul>
			</div>
			<cfif $.content('subType') eq "SlatwallProductListing"><div class="listing"><cfelse><div class="static"></cfif>
				#$.dspBody(body=$.content("body"),pageTitle="",crumblist=0)#
	        </div>
			<div class="clear"></div>
			<!--- A Custom Pager was created for this theme instead of the built in Custom Tag (below) --->
			<!--- <cf_SlatwallSmartListPager smartList="#$.slatwall.productList()#"> --->	
			<cfinclude template="inc/custom_pager.cfm" />
	    </div>
	    <div class="clear"></div>
	    <cfinclude template="inc/footer.cfm">
	</div>
</body>
</cfoutput>
<cfinclude template="inc/html_footer.cfm" />