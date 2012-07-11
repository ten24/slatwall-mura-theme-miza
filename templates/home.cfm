<cfinclude template="inc/html_head.cfm" />
<cfoutput>
<body>
	<!-- Wrapper Section -->
	<div id="wrapper_sec">
		<cfinclude template="inc/header.cfm" />
		<!-- Content Section -->
		<div id="contentsec">
	    	<div class="listing">
	        	<h4 class="colr heading">Recently Added Products!</h4>
				
				<!--- Custom home page listing --->
				<cfset recentProducts = $.slatwall.getService("productService").getProductSmartList() />
				<cfset recentProducts.addOrder("createdDateTime|DESC") />
				<cfset local.displayCount = 1 />
				<cfset local.liClass = "first" />
				
				<ul id="test" class="display">
					<cfloop array="#recentProducts.getPageRecords()#" index="local.product">
						<cfif local.displayCount eq 1>
							<cfset local.displayCount ++ />
							<cfset local.liClass = "first" />
						<cfelseif local.displayCount eq 5>
							<cfset local.displayCount = 1 />
							<cfset local.liClass = "last" />
						<cfelse>
							<cfset local.displayCount ++ />
							<cfset local.liClass = "" />
						</cfif>
						
						<li class="#local.liClass#">
				        	<a href="#local.product.getListingProductURL()#" class="thumb">
				        		<cfif now() - local.product.getCreatedDateTime() lt 5>
									<span class="new">&nbsp;</span>
								<cfelseif now() - local.product.getCreatedDateTime() gt 100>
									<span class="hot">&nbsp;</span> 
								</cfif>
				        		#local.product.getImage("s")#
							</a>
				            <div class="detail_big">
				            	<h4 class="colr"><a href="#local.product.getListingProductURL()#">#local.product.getTitle()#</a></h4>
								
								<cfset local.productDescription = replace(replace(local.product.getProductDescription(), "<p>", "", "all"),"</p>","","all") />
								<cfif len(local.productDescription) gt 130>
									<cfset local.productDescription = '#trim(left(local.productDescription,130))#... <a href="#local.product.getListingProductURL()#">more</a>' />
								</cfif>
								
				                <p class="txt">#local.productDescription#</p>
				                <div class="clear"></div>
								<cfif local.product.getListPrice() gt local.product.getLivePrice()><p class="oldprice">#DollarFormat(local.product.getListPrice())#</p></cfif>
				                <p class="newprice left"><cfif local.product.getListPrice() gt local.product.getLivePrice()>Now</cfif> <span class="black">#DollarFormat(local.product.getLivePrice())#</p>
				                <div class="clear"></div>
				                <a href="#local.product.getListingProductURL()#" class="addtocart">more info</a>
				            </div>
				            <div class="clear"></div>
				            <div class="detail_small">
				            	<a href="#local.product.getListingProductURL()#" class="colr title cufontxt">#local.product.getTitle()#</a>
				                <div class="clear"></div>
				                <cfif local.product.getListPrice() gt local.product.getLivePrice()><p class="oldprice">#DollarFormat(local.product.getListPrice())#</p></cfif>
				                <p class="newprice"><cfif local.product.getListPrice() gt local.product.getLivePrice()>Now</cfif> <span class="black">#DollarFormat(local.product.getLivePrice())#</span></p>
				                <div class="clear"></div>
				                <a href="#local.product.getListingProductURL()#" class="addtocart">more info</a>
				            </div>
				        </li>
					</cfloop>
				</ul>
				<!--- End: Custom home page listing --->
				
	        </div>
	    </div>
	    <div class="clear"></div>
	    <cfinclude template="inc/footer.cfm">
	</div>
</body>
</cfoutput>
<cfinclude template="inc/html_footer.cfm" />