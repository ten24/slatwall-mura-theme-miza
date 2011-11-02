<cfif $.content('contentID') eq "00000000000000000000000000000000001">
	<cfinclude template="home.cfm" />
<cfelse>
	<cfinclude template="no_column.cfm" />
</cfif>
