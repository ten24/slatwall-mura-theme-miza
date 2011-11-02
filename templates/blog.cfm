<cfinclude template="inc/html_head.cfm" />
<cfoutput>
<body>
	<!-- Wrapper Section -->
	<div id="wrapper_sec">
		<cfinclude template="inc/header.cfm" />
	    <!-- Content Section -->
		<div id="contentsec">
	    	<div class="prod_detail">
	            <div class="col3">
	            	<div class="blog">
	            		<div class="header">
	                		<h1 class="colr heading">Blog</h1>
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
						#$.dspBody(body=$.content("body"),pageTitle="",crumblist=0)#
					</div>
	            	<div class="clear"></div>
					<!---
					<!-- Pagination -->
	                <div class="paging">
	                	<ul>
	                    	<li class="txt">Page 1 of 28</li>
	                        <li><a href="##" class="paging_prev">&nbsp;</a></li>
	                        <li><a href="##" class="numbr">1</a></li>
	                        <li><a href="##" class="numbr select">2</a></li>
	                        <li><a href="##" class="numbr">3</a></li>
	                        <li><a href="##" class="numbr">4</a></li>
	                        <li><a href="##" class="numbr">5</a></li>
	                        <li><a href="##" class="paging_next">&nbsp;</a></li>
	                    </ul>
	                </div>
					--->
	            </div>
	            <div class="col4">
	            	<div class="rightnavi">
	            	#$.dspObjects(3)#
	            	</div>
	            </div>
	        </div>
	    </div>
	    <div class="clear"></div>
		<cfinclude template="inc/footer.cfm">
	</div>
</body>
</cfoutput>
<cfinclude template="inc/html_footer.cfm" />