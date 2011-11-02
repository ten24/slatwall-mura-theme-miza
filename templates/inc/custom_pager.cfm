<cfoutput>
	<cfif $.slatwall.productList('totalPages') gt 1>
		<!-- Pagination -->
	    <div class="paging">
	        <ul>
	            <li class="txt">Page 1 of #$.slatwall.productList('totalPages')#</li>
				<li>
					<cfif $.slatwall.productList('currentPage') gt 1>
						<a href="#$.slatwall.productList().buildURL('P:Current=#$.slatwall.productList('currentPage')-1#')#" class="paging_prev">&nbsp;</a>
					<cfelse>
						<a href="##" class="paging_prev">&nbsp;</a>
					</cfif>
				</li>
				<cfloop from="1" to="#$.slatwall.productList('totalPages')#" index="page">
		            <li><a href="#$.slatwall.productList().buildURL('P:Current=#page#')#" class="numbr<cfif $.slatwall.productList('currentPage') eq page> select</cfif>">#page#</a></li>
				</cfloop>
				<li>
					<cfif $.slatwall.productList('totalPages') gt $.slatwall.productList('currentPage')>
						<a href="#$.slatwall.productList().buildURL('P:Current=#$.slatwall.productList('currentPage')+1#')#" class="paging_next">&nbsp;</a>
					<cfelse>
						<a href="##" class="paging_next">&nbsp;</a>
					</cfif>
				</li>
	    	</ul>
	    </div>
	</cfif>
</cfoutput>