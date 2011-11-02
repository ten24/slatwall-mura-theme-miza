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
<cfoutput>
<div class="shoppingcart">
	<cfif $.slatwall.cart('totalQuantity') eq 0>
		<p>Your cart is currently empty.</p>
		<div class="cartbuttons">
			<a href="/" class="continueshop">Continue Shopping</a>
		</div>
	<cfelse>
	<form name="updateCart" action="?slatAction=frontend:cart.update" method="post">
		<ul class="head <cfif $.slatwall.cart('discountTotal') GT 0>wdiscount</cfif>">
	        <li class="remove">&nbsp;</li>
	    	<li class="items"><h5 class="colr">Item</h5></li>
	        <li class="desc"><h5 class="colr">Description</h5></li>
	        <li class="qty"><h5 class="colr">Quantity</h5></li>
	        <li class="itemprice"><h5 class="colr">Item Price</h5></li>
	        <li class="itemprice"><h5 class="colr">Total</h5></li>
	    </ul>
		<cfset discountedTotal = 0>
		<cfloop array="#$.slatwall.cart('orderItems')#" index="local.orderItem">
			<ul class="cartitems <cfif $.slatwall.cart('discountTotal') GT 0>wdiscount</cfif>">
	        	<li class="remove"><a href="#$.createHREF(filename='shopping-cart')#" class="removeItem" orderItemID="#local.orderItem.getOrderItemID()#">&nbsp;</a></li>
				<li class="items">#local.orderItem.getSku().getImage(width=50)#</li>
				<li class="desc">
					<a href="#local.orderItem.getSku().getProduct().getProductURL()#" title="#local.orderItem.getSku().getProduct().getTitle()#">
						#local.orderItem.getSku().getProduct().getTitle()#
						<p>
							#local.orderItem.getSku().displayOptions()#
							#local.orderItem.displayCustomizations()#
						</p>
					</a>
				</li>
				<li class="qty"><input name="orderItem.#local.orderItem.getOrderItemID()#.quantity" type="text" value="#NumberFormat(local.orderItem.getQuantity(),"0")#" /></li>
				<li class="itemprice">#DollarFormat(local.orderItem.getPrice())#</li>
				<li class="itemprice <cfif local.orderItem.getDiscountAmount() gt 0>discounted</cfif>">
					<span>#DollarFormat(local.orderItem.getExtendedPrice())#</span><cfif local.orderItem.getDiscountAmount() gt 0><br/>#DollarFormat(local.orderItem.getExtendedPriceAfterDiscount())#</cfif>
					<cfset discountedTotal += local.orderItem.getExtendedPriceAfterDiscount()>
				</li>
			</ul>
		</cfloop>
		</form>
		<div class="clear"></div>
	    <div class="cartbuttons">
	    	<div class="left">
	        	<a href="?slatAction=frontend:cart.clearCart" class="continueshop">Clear Cart</a>
	            <a href="#$.createHREF(filename='shopping-cart')#" class="updatecar">Update Cart</a>
	        </div>
			#view("frontend:cart/promotioncode")#
			<div class="checkoutsec">
	        	<ul class="greycolr">
	            	<li class="title">Subtotal</li>
	                <li class="figr <cfif $.slatwall.cart('itemDiscountAmountTotal') gt 0>discounted</cfif>">
	                	<span>#DollarFormat($.slatwall.cart('subtotal'))#</span><cfif $.slatwall.cart('itemDiscountAmountTotal') gt 0><br/>#DollarFormat(discountedTotal)#</cfif>
					</li>
	            </ul>
				<ul class="greycolr">
	            	<li class="title">Delivery</li>
	                <li class="figr <cfif $.slatwall.cart().getFulfillmentDiscountAmountTotal() gt 0>discounted</cfif>">
	                	<span>#DollarFormat($.slatwall.cart('fulfillmentTotal'))#</span>
						<!---add back in once shipping discount functionality in place.  (check the math first.)
						<cfif $.slatwall.cart().getFulfillmentDiscountAmountTotal() gt 0>#DollarFormat($.slatwall.cart('fulfillmentTotal')-$.slatwall.cart().getFulfillmentDiscountAmountTotal)#</cfif>--->
					</li>
	            </ul>
				<ul class="greycolr">
	            	<li class="title">Tax</li>
	                <li class="figr">#DollarFormat($.slatwall.cart('taxTotal'))#</li>
	            </ul>
	            <ul class="blackcolr">
	            	<li class="title">Grand Total</li>
	                <li class="figr">#DollarFormat($.slatwall.cart('total'))#</li>
	            </ul>
				<cfif $.slatwall.cart('discountTotal') GT 0>
	            <ul class="blackcolr" style="color:##f00000;">
	            	<li class="title">You Save:</li>
	                <li class="figr">#DollarFormat($.slatwall.cart('discountTotal'))#</li>
	            </ul>
				</cfif>
	            <div class="clear"></div>
	            <a href="#$.createHREF(filename='checkout')#" class="proceed">Proceed to Checkout</a>
        	</div>
	    </div>	
    <div class="clear"></div>
    <div class="method">
    	<h4 class="colr">Payment methods</h4>
        <div class="clear"></div>
        <img src="#$.siteConfig('themeAssetPath')#/images/credit1.gif" alt="" />
        <img src="#$.siteConfig('themeAssetPath')#/images/credit2.gif" alt="" />
        <img src="#$.siteConfig('themeAssetPath')#/images/credit3.gif" alt="" />
        <img src="#$.siteConfig('themeAssetPath')#/images/credit4.gif" alt="" />
        <img src="#$.siteConfig('themeAssetPath')#/images/credit5.gif" alt="" />
        <img src="#$.siteConfig('themeAssetPath')#/images/credit6.gif" alt="" />
    </div>
	
	<script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery('a.updatecar').click(function(e){
				e.preventDefault();
				jQuery('form[name="updateCart"]').submit();
			});
			jQuery('a.removeItem').click(function(e){
				e.preventDefault();
				var selector = 'input[name="orderItem.' + jQuery(this).attr('orderItemID') + '.quantity"]';
				
				jQuery(selector).val(0);
				jQuery('form[name="updateCart"]').submit();
			});
		});
	</script>
	</cfif>
</div>
	<!---
	<div class="svocartdetail">
		<form name="updateCart" action="?slatAction=frontend:cart.update" method="post">
		<cfif not arrayLen($.slatwall.cart().getOrderItems())>
			<p class="noitems">#$.slatwall.rbKey('frontend.cart.detail.noitems')#</p>
		<cfelse>
			<div class="orderItems">
				<cfloop array="#$.slatwall.cart().getOrderItems()#" index="local.orderItem">
					<dl class="orderItem">
						<dt class="image">#local.orderItem.getSku().getImage(size="small")#</dt>
						<dt class="title"><a href="#local.orderItem.getSku().getProduct().getProductURL()#" title="#local.orderItem.getSku().getProduct().getTitle()#">#local.orderItem.getSku().getProduct().getTitle()#</a></dt>
						<dd class="options">#local.orderItem.getSku().displayOptions()#</dd>
						<dd class="customizations">#local.orderItem.displayCustomizations()#</dd>
						<dd class="price">#DollarFormat(local.orderItem.getPrice())#</dd>
						<dd class="quantity"><input name="orderItem.#local.orderItem.getOrderItemID()#.quantity" value="#NumberFormat(local.orderItem.getQuantity(),"0")#" size="3" /></dd>
						<cfif local.orderItem.getDiscountAmount()>
							<dd class="extended">#DollarFormat(local.orderItem.getExtendedPrice())#</dd>
							<dd class="discount">- #DollarFormat(local.orderItem.getDiscountAmount())#</dd>
							<dd class="extendedAfterDiscount">#DollarFormat(local.orderItem.getExtendedPriceAfterDiscount())#</dd>
						<cfelse>
							<dd class="extendedAfterDiscount">#DollarFormat(local.orderItem.getExtendedPriceAfterDiscount())#</dd>
						</cfif>
					</dl>
				</cfloop>
				<dl class="totals">
					<dt class="subtotal">Subtotal</dt>
					<dd class="subtotal">#DollarFormat($.slatwall.cart().getSubtotal())#</dd>
					<dt class="shipping">Delivery</dt>
					<dd class="shipping">#DollarFormat($.slatwall.cart().getFulfillmentTotal())#</dd>
					<dt class="tax">Tax</dt>
					<dd class="tax">#DollarFormat($.slatwall.cart().getTaxTotal())#</dd>
					<cfif $.slatwall.cart().getDiscountTotal() gt 0>
						<dt class="discount">Discount</dt>
						<dd class="discount">- #DollarFormat($.slatwall.cart().getDiscountTotal())#</dd>
					</cfif>
					<dt class="total">Total</dt>
					<dd class="total">#DollarFormat($.slatwall.cart().getTotal())#</dd>
				</dl>
			</div>
			<div class="actionButtons">
				<a href="#$.createHREF(filename='shopping-cart', querystring='slatAction=frontend:cart.clearCart')#" title="Clear Cart" class="frontendcartdetail clearCart button">Clear Cart</a>
				<a href="#$.createHREF(filename='shopping-cart')#" title="Update Cart" class="frontendcartdetail updateCart button">Update Cart</a>
				<a href="#$.createHREF(filename='checkout')#" title="Checkout" class="frontendcheckoutdetail checkout button">Checkout</a>
			</div>
		</cfif>
		</form>
		<script type="text/javascript">
			jQuery(document).ready(function(){
				jQuery('div.actionButtons a.updateCart').click(function(e){
					e.preventDefault();
					jQuery('form[name="updateCart"]').submit();
				});
			});
		</script>
	</div>
	--->
</cfoutput>