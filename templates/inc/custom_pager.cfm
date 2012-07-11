<cfoutput>
	<cfset productList = $.slatwall.getService("productService").getProductSmartList() />
	<cfif productList.getTotalPages() gt 1>
		<!-- Pagination -->
	    <div class="paging">
	        <ul>
	            <li class="txt">Page 1 of #productList.getTotalPages()#</li>
				<li>
					<cfif productList.getCurrentPage() gt 1>
						<a href="#productList.buildURL('P:Current=#productList.getCurrentPage()-1#')#" class="paging_prev">&nbsp;</a>
					<cfelse>
						<a href="##" class="paging_prev">&nbsp;</a>
					</cfif>
				</li>
				<cfloop from="1" to="#productList.getTotalPages()#" index="page">
		            <li><a href="#productList.buildURL('P:Current=#page#')#" class="numbr<cfif productList.getCurrentPage() eq page> select</cfif>">#page#</a></li>
				</cfloop>
				<li>
					<cfif productList.getTotalPages() gt productList.getCurrentPage()>
						<a href="#productList.buildURL('P:Current=#productList.getCurrentPage()+1#')#" class="paging_next">&nbsp;</a>
					<cfelse>
						<a href="##" class="paging_next">&nbsp;</a>
					</cfif>
				</li>
	    	</ul>
	    </div>
	</cfif>
</cfoutput>