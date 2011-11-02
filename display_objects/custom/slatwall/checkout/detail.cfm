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
<cfparam name="rc.edit" type="string" default="" />
<cfparam name="rc.orderRequirementsList" type="string" default="" />

<cfoutput>
	<div class="col3">
		<div class="svocheckoutdetail">
			<cfif listFind(rc.orderRequirementsList, "account") or rc.edit eq "account">
				#view('frontend:checkout/account')#	
			</cfif>
			<cfif not listFind(rc.orderRequirementsList, "account") and (listFind(rc.orderRequirementsList, "fulfillment") or rc.edit eq "fulfillment") >
				#view('frontend:checkout/fulfillment')#
			</cfif>
			<cfif not listFind(rc.orderRequirementsList, "account") and not listFind(rc.orderRequirementsList, "fulfillment") and not rc.edit eq "fulfillment">
				#view('frontend:checkout/payment')#
			</cfif>
		</div>
		<div class="clear"></div>
	</div>
	<div class="col4">
		<div class="rightnavi checkoutright">
			<h3>Items <a class="edit" href="#$.createHREF(filename='shopping-cart')#">edit</a></h3>
			<cfloop array="#$.slatwall.cart().getOrderItems()#" index="local.orderItem">
				<ul class="item">
					<li>#local.orderItem.getSku().getProduct().getTitle()#</li>
					<li><span class="quantity">Qty: #NumberFormat(local.orderItem.getQuantity(),"0")#</span><span class="price">#DollarFormat(local.orderItem.getExtendedPriceAfterDiscount())#</span></li>
				</ul>
			</cfloop>
    		<cfif not listFind(rc.orderRequirementsList, "account")>
				<h3>Account <a class="edit" href="?slatAction=frontend:account.edit">edit</a></h3>
				<ul>
					<li>#rc.account.getFullName()#</li>
					<li>#rc.account.getEmailAddress()#</li>
					<li>#rc.account.getPhoneNumber()#</li>
				</ul>
			</cfif>
			<cfif not listFind(rc.orderRequirementsList, "fulfillment")>
				<h3>Shipping <a class="edit" href="#$.createHREF(filename='checkout', queryString='edit=fulfillment')#">edit</a></h3>
				<ul>
					<li>#$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getName()#</li>
					<li>#$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getCompany()#</li>
					<li>#$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getStreetAddress()#</li>
					<li>#$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getStreet2Address()#</li>
					<li>#$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getCity()#, #$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getStateCode()# #$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getPostalCode()# </li>
					<li>#$.slatwall.cart().getOrderFulfillments()[1].getShippingAddress().getCountryCode()#</li>
				</ul>
			</cfif>
			<h3>Totals</h3>
			<ul>
				<li>Subtotal: <span class="price">#DollarFormat($.slatwall.cart().getSubtotal())#</span></li>
				<li>Delivery: <span class="price"><cfif not listFind(rc.orderRequirementsList, "fulfillment")>#DollarFormat($.slatwall.cart().getFulfillmentTotal())#</span><cfelse>TBD</cfif></li>
				<li>Tax: <span class="price"><cfif not listFind(rc.orderRequirementsList, "fulfillment")>#DollarFormat($.slatwall.cart().getTaxTotal())#</span><cfelse>TBD</cfif></span></li>
				<cfif $.slatwall.cart().getDiscountTotal() gt 0><li>Discount: <span class="price">- #DollarFormat($.slatwall.cart().getDiscountTotal())#</span></li></cfif>
				<li class="total">Total: <span class="price">#DollarFormat($.slatwall.cart().getTotal())#</span></li>
			</ul>
		</div>
    </div>
</cfoutput>