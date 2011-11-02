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
<cfparam name="rc.promotionCodeOK" default="true" />

<cfoutput>

	<div class="discount">
		<cfif arrayLen($.slatwall.cart().getPromotionCodes())>
			<p style="padding:0;">Coupon(s) Added:</p>
			<cfloop array="#$.slatwall.cart().getPromotionCodes()#" index="promotionCode">
				<cfif promotionCode.getPromotionCode() EQ ''>
				<a href="?slatAction=frontend:cart.removePromotionCode&promotionCodeID=#promotionCode.getPromotionCodeID()#">click here</a>
				<cfelse>
				<p class="appliedcode"><strong>#promotionCode.getPromotionCode()# / #promotionCode.getPromotion().getPromotionName()#</strong> <a href="?slatAction=frontend:cart.removePromotionCode&promotionCodeID=#promotionCode.getPromotionCodeID()#">remove</a></p>
				</cfif>
			</cfloop>
			<form name="addPromotionCode" action="?slatAction=frontend:cart.addPromotionCode" method="post">
				<cfif not rc.promotionCodeOK>
					<p class="error">The promotion code that you entered is invalid. Please try again.</p>
				</cfif>
	        	<input type="text" name="promotionCode" />
	        	<button type="submit" class="coupon" >Add Another</button>
			</form>
		<cfelse>
			<form name="addPromotionCode" action="?slatAction=frontend:cart.addPromotionCode" method="post">
			    <h3 class="colr">Discount Code:</h3>
				<cfif not rc.promotionCodeOK>
					<p class="error">The promotion code that you entered is invalid. Please try again.</p>
				<cfelse>
			        <p>Enter your coupon code if you have one.</p>
				</cfif>
	        	<input type="text" name="promotionCode" />
	        	<button type="submit" class="coupon" >Apply Coupon</button>
			</form>
		</cfif>
    </div>
	<!---<div class="svocartpromotioncode">
		
			<p>Promotions added:</p>
			<cfloop array="#$.slatwall.cart().getPromotionCodes()#" index="promotionCode">
				<cfif promotionCode.getPromotionCode() EQ ''>
				<p>A promotion code you entered is not valid. Please <a href="?slatAction=frontend:cart.removePromotionCode&promotionCodeID=#promotionCode.getPromotionCodeID()#">click here</a> to remove it.</p>
				<cfelse>
				<p><a href="?slatAction=frontend:cart.removePromotionCode&promotionCodeID=#promotionCode.getPromotionCodeID()#">remove</a> <strong>#promotionCode.getPromotionCode()# / #promotionCode.getPromotion().getPromotionName()#</strong> - #replacelist(promotionCode.getPromotion().getPromotionDescription(),'<p>,</p>','')#</p>
				</cfif>
			</cfloop>
		</cfif>
		
	</div>--->
</cfoutput>