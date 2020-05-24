<!DOCTYPE html>
<!--[if lt IE 7]> <html xmlns:ng="http://angularjs.org" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html xmlns:ng="http://angularjs.org" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html xmlns:ng="http://angularjs.org" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
    <head>
        <!--[if lte IE 7]>
            <asset:javascript src="js/vendor/json3.min.js"/>
        <![endif]-->
        <!--[if lte IE 8]>
          <script>
            document.createElement('ng-include');
            document.createElement('ng-pluralize');
            document.createElement('ng-view');

            // Optionally these for CSS
            document.createElement('ng:include');
            document.createElement('ng:pluralize');
            document.createElement('ng:view');
          </script>
        <![endif]-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Group Buy</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <asset:stylesheet src="angularui/bootstrap.min.css" path="javascript"/>
        <asset:stylesheet src="angularui/main.css" path="javascript"/>
        <asset:stylesheet src="angularui/vendor/datePicker.css"/>
        <asset:stylesheet src="font-awesome.css"/>
        <!--[if lt IE 9]>
            <asset:javascript src="js/vendor/html5-3.6-respond-1.1.0.min.js"/>
        <![endif]-->
        <asset:javascript src="js/vendor/angular.js"/>
        <asset:javascript src="js/vendor/angular-resource.js"/>
        <asset:javascript src="js/vendor/angular-route.js"/>
        <!-- script src="/js/vendor/angular-sanitize.js"></script -->
        <g:layoutHead/>
    </head>
    <body data-ng-app="scaffolding">
        <g:layoutBody/>
        <div class="container">
            <div class="content" role="main" data-ng-view=""></div>
            <footer>
                <p>
                    <asset:image src="fatturasprint.png"/> &copy; Fattura Sprint 2014 - Powered by NUBEEFY S.r.l. © 2010
                    - 2014 Tutti i diritti riservati. - <a href="#">Privacy</a> -
                    <a href="#">Termini di servizio</a>
                </p>
            </footer>

        </div> <!-- /container -->

        <asset:javascript src="js/vendor/ui-bootstrap-tpls-0.12.0.js"/>
        <asset:javascript src="js/vendor/angular-locale_it-it.js"/>
        <asset:javascript src="js/vendor/datePicker.js"/>
        <asset:javascript src="js/vendor/datePickerUtils.js"/>
        <asset:javascript src="js/vendor/dateRange.js"/>
        <!-- <asset:javascript src="js/vendor/input.js"/> -->
        <asset:javascript src="js/vendor/textAngular/textAngular-rangy.min.js"/>
        <asset:javascript src="js/vendor/textAngular/textAngular-sanitize.min.js"/>
        <asset:javascript src="js/vendor/textAngular/textAngular.min.js"/>

        <asset:stylesheet src="js/vendor/textAngular/textAngular.css"/>

        <asset:javascript src="js/scaffolding/scaffolding.js"/>
        <asset:javascript src="js/scaffolding/grails-default.js"/>

        <asset:javascript src="js/angular/services.js"/>
        <asset:javascript src="js/angular/directives.js"/>
        <asset:javascript src="js/angular/controllers.js"/>
        <asset:javascript src="js/angular/filters.js"/>

        <asset:javascript src="js/angular/ext-collapse.js"/>

    </body>
</html>
