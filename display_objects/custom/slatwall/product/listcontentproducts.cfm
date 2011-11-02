<!---

    Slatwall - An e-commerce plugin for Mura CMS
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

--->
<cfset local.displayCount = 1 />
<cfset local.liClass = "first" />

<cfoutput>
	
	<ul id="test" class="display">
		<cfloop array="#$.slatwall.productList().getPageRecords()#" index="local.product">
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
	        		<cfif now() - local.product.getCreatedDateTime() lt 3>
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
						<cfset local.productDescription = '#trim(left(local.productDescription,130))#...' />
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
</cfoutput>
