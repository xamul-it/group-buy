/**
 * A service for storing one-time messages to be displayed after redirecting to
 * another view.
 */
angular.module('flashService', []).factory('Flash', function() {
    var flash = {};

    flash.getMessage = function() {
        var value = this.message;
        this.message = undefined;
        return value;
    };

    flash.error = function(text) {
        this.message = {level: 'error', text: text};
    };
    flash.success = function(text) {
        this.message = {level: 'info', text: text};
    };
    flash.info = function(text) {
        this.message = {level: 'info', text: text};
    };

    return flash;
});

/**
 * The main scaffolding module.
 */
var scaffoldingModule = angular.module('scaffolding');

/**
 * Route definitions connecting URL fragments to views and controllers.
 */
scaffoldingModule.config([
    '$routeProvider', 'templateUrl',
    function($routeProvider, templateUrl) {
        $routeProvider.
            when('/create', { templateUrl: templateUrl + '/create.gsp', controller: "CreateCtrl", controllerAs:"createCtrl" }).
            when('/edit/:id', { templateUrl: templateUrl + '/edit.gsp', controller: "EditCtrl", controllerAs:"editCtrl" }).
            when('/list', { templateUrl: templateUrl + '/list.gsp', controller: "ListCtrl", controllerAs:"listCtrl" }).
            when('/show/:id', { templateUrl: templateUrl + '/show.gsp', controller: "ShowCtrl", controllerAs:"showCtrl" }).
            otherwise({redirectTo: '/list'});
    }
]);

/**
 * A directive for including an alert message in the page.
 */
scaffoldingModule.directive('gasAlert', function(commonTemplateUrl) {
	return {
        restrict: 'E', // can only be used as an element
        transclude: false, // the element should not contain any content so there's no need to transclude
        scope: {
			level: '@level',
			text: '@text'
		},
        templateUrl: commonTemplateUrl + '/alert.html',
        replace: true
    }
});

/**
 * A directive for including a standard pagination block in the page.
 */
scaffoldingModule.directive('gasPagination', function(commonTemplateUrl) {
	return {
        restrict: 'A', // can only be used as an attribute
        transclude: false, // the element should not contain any content so there's no need to transclude
        scope: {
            total: '=total' // inherit the total property from the controller scope
        },
        controller: function($scope, $routeParams, $location) {
            $scope.max = parseInt($routeParams.max) || 10;
            $scope.offset = parseInt($routeParams.offset) || 0;
            $scope.currentPage = Math.ceil($scope.offset / $scope.max);

            $scope.pages = function() {
                var pages = [];
                for (var i = 0; i < Math.ceil($scope.total / $scope.max); i++)
                    pages.push(i);
                return pages;
            };

            $scope.lastPage = function() {
                return $scope.pages().slice(-1)[0];
            };

			$scope.previousPage = function() {
				var offset = $scope.offset - $scope.max;
				if (offset < 0) {
					offset = 0;
				}
				$location.search('offset', offset);
			};

			$scope.nextPage = function() {
				$location.search('offset', $scope.offset + $scope.max);
			};

			$scope.goToPage = function(n) {
				$location.search('offset', n * $scope.max);
			};
        },
        templateUrl: commonTemplateUrl + '/pagination.html',
        replace: false
    }
});

/**
 * A directive for making a table header sortable.
 */
scaffoldingModule.directive('gasSortable', function(commonTemplateUrl) {
	return {
		restrict: 'A',
		transclude: true,
		scope: {
			//property: '@sortable'
			property: '@gasSortable'
		},
		controller: function($scope, $routeParams, $location) {
			$scope.isSortedBy = function() {
				return $routeParams.sort === $scope.property;
			};

			$scope.isSortedByAscending = function() {
				return $scope.isSortedBy() && $routeParams.order !== 'desc';
			};

			$scope.isSortedByDescending = function() {
				return $scope.isSortedBy() && $routeParams.order === 'desc';
			};

			$scope.sort = function() {
				var order;
				if ($scope.isSortedByAscending()) {
					order = 'desc';
				} else {
					order = 'asc';
				}
				$location.search('sort', $scope.property).search('order', order);
			};
		},
		link: function(scope, element) {
			element.bind('click', function() {
				scope.$apply(scope.sort);
			});
		},
		templateUrl: commonTemplateUrl + '/sortable.html',
		replace: false
	}
});

function toArray(element) {
    return Array.prototype.slice.call(element);
}

Function.prototype.curry = function() {
    if (arguments.length < 1) {
        return this; //nothing to curry with - return function
    }
    var __method = this;
    var args = toArray(arguments);
    return function() {
        return __method.apply(this, args.concat(toArray(arguments)));
    }
}

/**
 * Generic $resource error handler used by all controllers.
 */
function errorHandler($scope, $location, Flash, response) {
	
	console.log("errorHandler: "+response.status+" "+" location:"+$location+" Scope:"+$scope+ "Errori: "+response.data.errors)
	//I livelli di errore sono: success, info, warning, danger
    switch (response.status) {
        case 0:
            $scope.message = {level: 'warning', text: "Errore di connessione : "+response.data.message}
            Flash.error(response.data.errors);
            break;
        case 404: // resource not found - return to the list and display message returned by the controller
            Flash.error(response.data.message || "Not found");
            if(angular.isDefined($location) && $location != null)
                 $location.path('/list');
            break;
        case 409: // optimistic locking failure - display error message on the page
            $scope.message = {level: 'error', text: response.data.message};
            break;
        case 422: // validation error - display errors alongside form fields
            $scope.message = {level: 'warning', text: "Errore di compilazione dati"}
            $scope.errors = response.data.errors
            Flash.error(response.data.errors);
            break;
        case 500:
            $scope.message = {level: 'warning', text: "Error 500: "+response.data.message}
            Flash.error(response.data.errors);
            break;
        default: // TODO: general error handling
    }
}
var offset = 0;
scaffoldingModule.controller("ListCtrl", function($scope, $routeParams, $location, Grails, Flash) {
	var ctrl = this; // assign to a variable to be consistent when using in the template
    console.log($routeParams)
	Grails.list($routeParams, function(list, headers) {
		ctrl.list = list;//.items;
		//ctrl.count = list.count;
		//ctrl.listData = list.data
		ctrl.count = parseInt(headers('X-Pagination-Total'));
		ctrl.total = parseInt(headers('X-Pagination-Total'));
		offset = offset + list.length
		$scope.message = Flash.getMessage();
	}, errorHandler.curry($scope, $location, Flash));

	ctrl.show = function(item) {
		console.log("ctrl.show: "+ item.id);
		$location.path('/show/' + item.id);
	};

	ctrl.update = function(item) {
		console.log("ctrl.update: "+ item.id+" "+JSON.stringify(item));
		
		item.$update(function(response) {
			Flash.success(response.message);
		}, errorHandler.curry($scope, null, Flash));
	};
	
	ctrl.delete = function(item) {
		item.$delete(function(response) {
			Flash.success(response.message);
		}, errorHandler.curry($scope, null, Flash));
	};
	
	ctrl.save = function(item) {
		item.$save(function(response) {
			Flash.success(response.message);
		}, errorHandler.curry($scope, null, Flash));
	};

	ctrl.count = function(item) {
		console.log("listCtrl.count: ");
	};
});
	
scaffoldingModule.controller("ShowCtrl", function($scope, $routeParams, $location, Grails, Flash) {
    var ctrl = this; // assign to a variable to be consistent when using in the template
    $scope.message = Flash.getMessage();

    Grails.get({id: $routeParams.id}, function(item) {
        ctrl.item = item;
    }, errorHandler.curry($scope, $location, Flash));

    ctrl.delete = function(item) {
        item.$delete(function(response) {
            Flash.success(response.message);
            $location.path('/list');
        }, errorHandler.curry($scope, $location, Flash));
    };
});

//LZ 2020/04/25 - tolto $scope e sostituito con ctrl, non so perché copiato da altre parti del codice
scaffoldingModule.controller("CreateCtrl", function($scope, $location, Grails, Flash) {
    var ctrl = this; // assign to a variable to be consistent when using in the template
    //create empty object
    Grails.create({}, function(item) {
        ctrl.item = item;
        console.log("createCtrl.create: "+JSON.stringify(item));
    }, errorHandler.curry($scope, $location, Flash));

//    ctrl.item = new Grails;
    ctrl.save = function(item) {
        console.log("createCtrl.save: "+JSON.stringify(item));
        item.$save(function(response) {
            Flash.success(response.message);
            $location.path('/show/' + response.id);
        }, errorHandler.curry($scope, $location, Flash));
    };
});

scaffoldingModule.controller("EditCtrl", function($scope, $routeParams, $location, Grails, Flash) {
    var ctrl = this; // assign to a variable to be consistent when using in the template	
    Grails.get({id: $routeParams.id}, function(item) {
        ctrl.item = item;
		console.log("editCtrl.get: "+ item.id+" "+JSON.stringify(item));
    }, errorHandler.curry($scope, $location, Flash));

    ctrl.update = function(item) {
		console.log("editCtrl.update: "+ item.id+" "+JSON.stringify(item));
		
        item.$update(function(response) {
            Flash.success(response.message);
            $location.path('/show/' + response.id);
        }, errorHandler.curry($scope, $location, Flash));
    };

    ctrl.delete = function(item) {
        item.$delete(function(response) {
            Flash.success(response.message);
            $location.path('/list');
        }, errorHandler.curry($scope, $location, Flash));
    };
});


scaffoldingModule.controller("AutocompleteCtrl", function($scope, $routeParams, $location, Grails, textField, idField, fields) {
	
	console.log($routeParams);
	
	console.log($field);
	
	Grails.list($routeParams, function(list) {
		$scope.list = list.items;
		$scope.query = list.query;
	}).then(function(response){
		console.log(response);
		return response.data.suggestions.map(function(item){
			return item[textField];
		});
	});
	
	$scope.onSelect = function (item, model, label) {
		$scope.selctedItem = $item;
		$scope.model = $model;
		$scope.label = $label;
	};
	
});
