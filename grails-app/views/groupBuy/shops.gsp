<!doctype html>
<html>
<head>
    <meta name="layout" content="angular"/>
    <script>
        angular.module('grailsService', ['ngResource'])
        //.constant("baseUrl", "/assets/data/")
        .constant("baseUrl", "/")
        .constant("baseController", "shop");

        angular.module('scaffolding', ['grailsService', 'flashService', 'ngRoute','ngSanitize','textAngular','customFilters','datePicker','ui.bootstrap'])
        .constant("templateUrl", "/assets/shops/ng-templates")
        .constant("commonTemplateUrl", "/assets/ng-templates");

    </script>
</head>
<body>

    <ng-include src="'/navigation/menu.html?menu=groups'"></ng-include>


</body>
</html>