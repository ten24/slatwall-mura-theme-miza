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
<cfset local.imageGalleryArray = $.slatwall.product().getImageGalleryArray([{width=62},{size="m"},{size="l"}]) />

<cfoutput>
	<script type="text/javascript">
	$(document).ready( function() {
		if (jQuery('##skuIDs').val()==""){
			jQuery('##addtocartbtn').addClass('gray');
		};
	});
	</script>
	<div class="gallery_sec">
		<div id="slider2" class="gallery_cont">
			<cfloop array="#local.imageGalleryArray#" index="local.galleryImage">
				<div class="contentdiv">
	                <a rel="example_group" href="#local.galleryImage.resizedImagePaths[3]#" title="#local.galleryImage.name#"><img src="#local.galleryImage.resizedImagePaths[2]#" alt="#local.galleryImage.name#" /></a>
	            </div>
			</cfloop>
        </div>
        <div class="scrollingunit">
            <a href="javascript:void(0);" class="prevgallery">&nbsp;</a>
            <div class="anyClass" id="paginate-slider2">
                <ul>
                	<cfloop array="#local.imageGalleryArray#" index="local.galleryImage">
						<cfparam name="local.galleryImage.originalFilename" default="" />
			            <li><a href="javascript:void(0);" class="toc" imageFileName="#local.galleryImage.originalFilename#"><img src="#local.galleryImage.resizedImagePaths[1]#" alt="#local.galleryImage.name#" /></a></li>
					</cfloop>
                </ul>
            </div>
            <a href="javascript:void(0);" class="nextgallery">&nbsp;</a>
        </div>
        <script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/gallery.js"></script>
    </div>
    <div class="detail_sec">
        <div class="clear"></div>
        <div class="heading">
            <h4 class="colr">Price: <span class="productPrice">#dollarFormat($.slatwall.product('livePrice'))#</span></h4>
        </div>
        <p class="txt">
            #$.slatwall.product('productDescription')#
        </p>
		<!--- Add To Cart Form --->
		<form id="addToCart" action="?slatAction=frontend:cart.addItem" method="post">
			<input type="hidden" name="productID" value="#$.slatwall.Product().getProductID()#" />
			
			<!--- Product Options --->
			<cfif arrayLen($.slatwall.product().getSkus(true)) eq 1>
				<input type="hidden" name="skuID" value="#$.slatwall.Product().getSkus()[1].getSkuID()#" />
			<cfelse>
				<ul class="detailform">
					<li class="txt">Options *</li>
					<li class="infield">
						<select name="skuID" id="skuIDs">
							<option value="">Select Option</option>
							<cfloop array="#$.slatwall.product().getSkus(true)#" index="local.sku">
								<option value="#local.sku.getSkuID()#" price="#dollarFormat(local.sku.getLivePrice())#" imageFileName="#local.sku.getImageFile()#">#local.sku.displayOptions()#<cfif local.sku.getPrice() neq $.slatwall.product('livePrice')> - #dollarFormat(local.sku.getLivePrice())#</cfif></option>
							</cfloop>
						</select>
					</li>
				</ul>
				<script type="text/javascript">
					jQuery('select[name=skuID]').change(function(){
						jQuery('span.productPrice').html( jQuery('select[name=skuID] option:selected').attr('price') );
						var selector = 'a[imageFileName="' + jQuery('select[name=skuID] option:selected').attr('imageFileName') + '"]';
						jQuery(selector).click();
						if (jQuery('select[name=skuID]').val()==""){jQuery('##addtocartbtn').addClass('gray');jQuery('.pleaseselect').show();}
						else {jQuery('##addtocartbtn').removeClass('gray');jQuery('.pleaseselect').hide();};
					});
				</script>
			</cfif>
	        <!--- END: Product Options --->
			<!--- Product Customizations --->
			<cfloop array="#$.slatwall.product().getAttributeSets(['astProductCustomization'])#" index="local.customizationAttributeSet">
				<div class="productCustomizationSet #lcase(replace(local.customizationAttributeSet.getAttributeSetName(), ' ', '', 'all'))#">
					<h4>#local.customizationAttributeSet.getAttributeSetName()#</h4>
					<dl>
					<cfloop array="#local.customizationAttributeSet.getAttributes()#" index="local.attribute">
						<cf_SlatwallAttributeDisplay attribute="#local.attribute#" />
					</cfloop>
					</dl>
				</div>
			</cfloop>
			<!--- END: Product Customizations --->
			
	        <div class="clear"></div>
			<div class="clear"></div>
	        <a href="javascript:void(0);"  id="addtocartbtn" class="addtocart">Add to Cart</button>
	        <a href="/" class="cont_shop">Continue Shopping</a>
			<p class="pleaseselect">Please select an option from the drop-down.</p>
			<script type="text/javascript">
			jQuery('##addtocartbtn').click(function(){
				if (jQuery('##skuIDs').val()==""){jQuery('.pleaseselect').show();}
				else {jQuery('##addToCart').submit();};
			});
			</script>

		</form>
		
		<!--- END: Add To Cart Form --->
    </div>
</cfoutput>
