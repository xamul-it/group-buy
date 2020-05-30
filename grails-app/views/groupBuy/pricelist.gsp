<!doctype html>
<html>
	<head>
		<link href=/assets/vue/product/pricelist/js/app.js rel=preload as=script>
        <link href=/assets/vue/product/pricelist/js/chunk-vendors.js rel=preload as=script>
		<meta name="layout" content="angularuiBootstrap3"/>
		
	</head>
<body>

	<% params.menu = 'groups'%>
	<g:render template="/navigation/menu" />

	<div class="top-title clearfix">
        <div dropdown="" class="container">
            <h1 dropdown-toggle="">Listino prezzi</h1>
        </div>
    </div>
	
	<div id="app"></div>
    <script src="/assets/vue/product/pricelist/js/app.js"></script>
    <script src="/assets/vue/product/pricelist/js/chunk-vendors.js"></script>

</body>
</html>
