<!doctype html>
<html>
<head>
	<meta name="layout" content="angular"/>
		<script>
			angular.module('grailsService', ['ngResource'])
				.constant("baseUrl", "/assets/data/")
				.constant("baseController", "fattura");
	
			angular.module('scaffolding', ['grailsService', 'flashService', 'ngRoute','ngSanitize','textAngular','customFilters','datePicker','ui.bootstrap'])
				.constant("templateUrl", "/assets/fattura/ng-templates")
				.constant("commonTemplateUrl", "/assets/ng-templates");
			
		</script>
		</head>
<body>

	<ng-include src="'/assets/ng-templates/navigation-vendite.html'"></ng-include>


</body>
</html>
