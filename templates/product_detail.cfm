<cfinclude template="inc/html_head.cfm" />
<cfoutput>
<body>
	<!-- Wrapper Section -->
	<div id="wrapper_sec">
		<cfinclude template="inc/header.cfm" />
	    <!-- Content Section -->
		<div id="contentsec">
			<div class="prod_detail">
		    	<div class="header"><h1 class="colr heading">#$.slatwall.product('title')#</h1></div>
				<div class="col1">
					<div class="bigbutton">
	                	<!---
							TODO: Figure out how to make this work
	                    <a href="##" class="prevprod">Previou Item</a>
	                    <a href="##" class="nextprod">Next Item</a>
						--->
	                </div>
					<div class="clear"></div>
					#$.content('body')#
				</div>
				<div class="col2">
	            	<cfinclude template="inc/right_column.cfm" />
	            </div>
			</div>
	    </div>
	    <div class="clear"></div>
	    <cfinclude template="inc/footer.cfm">
	</div>
</body>
</cfoutput>
<cfinclude template="inc/html_footer.cfm" />