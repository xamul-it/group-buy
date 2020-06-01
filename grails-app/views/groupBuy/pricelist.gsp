<!doctype html>
<html>
	<head>
		<link href="/assets/vue/product/pricelist/js/app.js" rel="preload" as="script"/>
        <link href="/assets/vue/product/pricelist/js/chunk-vendors.js" rel="preload" as="script"/>
		<meta name="layout" content="angular"/>
		<script>
			angular.module('grailsService', ['ngResource'])
				//.constant("baseUrl", "/assets/data/")
				.constant("baseUrl", "/")
				.constant("baseController", "product");

			angular.module('scaffolding', ['grailsService', 'flashService', 'ngRoute','ngSanitize','textAngular','customFilters','datePicker','ui.bootstrap'])
				.constant("templateUrl", "/assets/products/ng-templates")
				.constant("commonTemplateUrl", "/assets/ng-templates");
			
		</script>
		
	</head>
<body>

	<ng-include src="'/navigation/menu.html?menu=groups'"></ng-include>

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
