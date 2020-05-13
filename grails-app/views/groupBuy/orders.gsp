<!doctype html>
<html>
<head>
	<meta name="layout" content="angular"/>
		<script>
			angular.module('grailsService', ['ngResource'])
				.constant("baseUrl", "/")
				.constant("baseController", "order");
	
			angular.module('scaffolding', ['grailsService', 'flashService', 'ngRoute','ngSanitize','textAngular','customFilters','datePicker','ui.bootstrap'])
				.constant("templateUrl", "/assets/order/ng-templates")
				.constant("commonTemplateUrl", "/assets/ng-templates");
			
		</script>
		</head>
<body>

	<ng-include src="'/navigation/menu.html?menu=orders'"></ng-include>


</body>
</html>
