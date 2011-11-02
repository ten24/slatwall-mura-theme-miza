<cfoutput>
<!-- Header Section -->
<div id="masthead">
	<div class="space">&nbsp   </div>
    <div class="clear"></div>
    <div class="logo">
    	<a href="/"><img src="#$.siteConfig('themeAssetPath')#/images/logo.png" alt="" /></a>
        <h6>#$.siteConfig('tagLine')#</h6>
    </div>
	<div class="search">
		<form id="searchForm" action="#$.createHREF(filename='search-results')#" method="get">
			<input type="hidden" name="display" value="search" />
			<input type="hidden" name="newSearch" value="true" />
			<input type="hidden" name="noCache" value="1" />
	    	<ul>
	        	<li class="txt">SEARCH</li>
	            <li><input type="text" value="Enter Keywords to search" id="searchBox" name="Keywords" onblur="if(this.value == '') { this.value = 'Enter Keywords to search'; }" onfocus="if(this.value == 'Enter Keywords to search') { this.value = ''; }" class="bar" /></li>
	            <li><a href="##" class="go">&nbsp;</a></li>
	        </ul>
		</form>
    </div>
    <div class="cartsec">
    <div id="cartmenu" class="ddsmoothmenu2">
    	<ul>
        	<li>
	        	<a class="items" href="#$.createHREF(filename='shopping-cart')#">#$.slatwall.cart('totalQuantity')# Item<cfif $.slatwall.cart('totalQuantity') NEQ 1>s</cfif></a>
	            <a class="price" href="#$.createHREF(filename='shopping-cart')#">#dollarFormat($.slatwall.cart('total'))#</a>
	            <a href="#$.createHREF(filename='shopping-cart')#" class="viewcart cartbutn">View Cart</a>
                <ul id="dog" class="cartcollapse">
                	<cfif not $.slatwall.cart('totalQuantity')>
						<li class="noitmes">Your cart is currently empty</li>
					<cfelse>
	                    <li>
		                    <table cellpadding="0" cellspacing="0">
		                    	<tr class="border">
			                    	<td class="product upper colr" width="140">Product</td>
			                        <td align="center" class="qty upper colr" width="42">Qty</td>
			                        <td class="pricetab upper colr" width="52">Price</td>
								</tr>
								<cfloop array="#$.slatwall.cart('orderItems')#" index="local.orderItem">
				                	<tr class="border">
				                    	<td class="product upper">#local.orderItem.getSku().getProduct().getTitle()#</li>
				                        <td align="center" class="qty upper">#local.orderItem.getQuantity()#</li>
				                        <td class="pricetab upper">#dollarFormat(local.orderItem.getExtendedPriceAfterDiscount())#</li>
									</tr>
								</cfloop>
								<tr>
			                    	<td colspan="2" class="total upper">Total</td>
			                        <td class="totalprice upper">#dollarFormat($.slatwall.cart('total'))#</td>
								</tr>
								<tr class="nopadlft">
				                    <td><a href="#$.createHREF(filename='shopping-cart')#" class="empty">View Your Cart</a></td>
				                    <td colspan="2"><a href="#$.createHREF(filename='checkout')#" class="checkout">Checkout</a></td>
								</tr>
							</table>
						</li>
					</cfif>
				</ul>
            </li>
        </ul>
	</div>
    </div>
</div>
<!-- End: Header Section -->
<!-- Navigation Section -->

<div id="navigation">
	<div id="smoothmenu1" class="ddsmoothmenu">
		<cf_CacheOMatic key="dspPrimaryNav#$.content('contentID')#">
			#$.dspPrimaryNav(
				viewDepth="1",
				id="navPrimary",
				displayHome="Always",
				closePortals="true",
				showCurrentChildrenOnly="false"
				)#</cf_cacheomatic>
		<!--- Optional named arguments for Primary Nav are: displayHome="Always/Never/Conditional", openPortals/closePortals="contentid,contentid" (i.e. show specific sub-content in dropdown nav) --->
		<div class="clear"></div>
    </div>
	<ul class="userwelcome">
    	<cfif $.currentUser().isLoggedIn()>
			<li class="txt">Welcome! <a href="#$.createHREF(filename='my-account')#" class="under">#$.slatwall.account('fullName')#</a></li>
			<li><a href="?doaction=logout" class="login upper">Logout</a></li>
		<cfelse>
			<!--- <li><a href="#$.createHREF(filename='my-account')#" class="register upper">Register</a></li> --->
			<li><a href="#$.createHREF(filename='my-account')#" class="login upper">My Account</a></li>
		</cfif>
    </ul>
</div>
<!-- End: Navigation Section -->
<div class="clear"></div>
<cfif $.content('contentID') eq "00000000000000000000000000000000001">
	<!-- Banner Section -->
	<div id="banner">
		<div id="slider1" class="nivoSlider">
			<img src="#$.siteConfig('themeAssetPath')#/images/banner1.jpg" alt="" />
			<img src="#$.siteConfig('themeAssetPath')#/images/banner2.jpg" alt="" />
			<img src="#$.siteConfig('themeAssetPath')#/images/banner3.jpg" alt="" />
		</div>
	</div>
	<div class="clear"></div>
</cfif>
<!-- Bread cremb, Latest news, Categories Section -->
<div id="crumb_cat">
	<cfif $.content('contentID') eq "00000000000000000000000000000000001">
		<!-- Latest News Section -->
	    <div class="latestnews">
	    	<p class="upper">Latest News:</p>
	        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
	    </div>
	<cfelse>
		<!-- Bread Crumb Section -->
		
	    <div class="crumb">
			#$.dspCrumbListLinks("crumbList")#
	    </div>
	</cfif>
	<cfif $.content('subType') eq "SlatwallProductListing">
		<div class="switchbutton">
	    	<a href="##" class="switch_thumb">&nbsp;</a>
	    </div>
	</cfif>
    <!---<ul class="share">
    	<li class="txt">Share with us:</li>
        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/facebook.gif" alt="" /></a></li>
        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/twitter.gif" alt="" /></a></li>
        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/rss.gif" alt="" /></a></li>
        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/blogger.gif" alt="" /></a></li>
        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/linkdin.gif" alt="" /></a></li>
        <li><a href="##"><img src="#$.siteConfig('themeAssetPath')#/images/del.gif" alt="" /></a></li>
    </ul>--->
</div>
</cfoutput>