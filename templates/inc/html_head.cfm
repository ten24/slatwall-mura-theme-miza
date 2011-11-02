<cfoutput>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="description" content="#HTMLEditFormat($.getMetaDesc())#" />
		<meta name="keywords" content="#HTMLEditFormat($.getMetaKeywords())#" />
		<cfif request.contentBean.getCredits() neq ""><meta name="author" content="#HTMLEditFormat($.content('credits'))#" /></cfif>
		<meta name="generator" content="Mura CMS #$.globalConfig('version')#" />
		<!--- <meta name="robots" content="noindex, nofollow" /> ---><!--- use this to discourage search engines from indexing your site. (can be useful if developing on a live server for example) Delete if not needed. --->
		
		<title>#HTMLEditFormat($.content('HTMLTitle'))# - #HTMLEditFormat($.siteConfig('site'))#</title>
		
		<!-- // Stylesheets // -->
		<link href="#$.siteConfig('themeAssetPath')#/css/style.css" rel="stylesheet" type="text/css" />
		<link href="#$.siteConfig('themeAssetPath')#/css/list.css" rel="stylesheet" type="text/css" />
		<link href="#$.siteConfig('themeAssetPath')#/css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
		<link href="#$.siteConfig('themeAssetPath')#/css/nivo-slider.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="#$.siteConfig('themeAssetPath')#/css/jquery.fancybox-1.3.1.css" rel="stylesheet" type="text/css" media="screen" />
		<!-- // Javascripts // -->
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/jquery.min.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/animatedcollapse.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/collapse.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/ddsmoothmenu.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/menu.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/jquery.nivo.slider.pack.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/nivo.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/ddaccordion.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/acordin.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/switch.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/contentslider.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/jcarousellite_1.0.1.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/gallery_scrol.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/jquery.fancybox-1.3.1.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/lightbox.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/cufon-yui.js"></script>
		<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/Verdana_400-Verdana_700-Verdana_italic_400-Verdana_italic_700.font.js"></script>
	</head>
</cfoutput>