/**
 * A directive for making a table filterable.
 */
scaffoldingModule.directive('gasStatusFilter', function(commonTemplateUrl) {
	return {
		restrict: 'E',
		transclude: true,
		scope: {
			property: '@filter'
		},
		controller: function($scope, $routeParams, $location) {
			$scope.isStatus = function() {
				return $routeParams.status === $scope.property;
			};
			
			$scope.isNotStatus = function() {
				return !$scope.isStatus();
			};
			
			$scope.filter = function() {
				$location.search('status', $scope.property);
			};
		},
		link: function(scope, element) {
			element.bind('click', function() {
				scope.$apply(scope.filter);
			});
		},
		templateUrl: commonTemplateUrl + '/status-filter.html',
		replace: true
	}
});


/**
 * A directive for showing a status label.
 */
scaffoldingModule.directive('gasStatusLabel', function(commonTemplateUrl) {
	return {
		restrict: 'EA',
		transclude: true,
		scope: {
			property: '@status'
		},
		controller: function($scope) {
			$scope.getStatus = function(status) {
				return $scope.property == status;
				
			};
		},
		templateUrl: commonTemplateUrl + '/status-label.html',
		replace: true
	}
});


/**
 * A directive for making a table searchable.
 */
scaffoldingModule.directive('gasSearch', function(commonTemplateUrl) {
	return {
		restrict: 'E',
		transclude: true,
		scope: {
			text: '@text'
		},
		controller: function($scope, $routeParams, $location) {
			$scope.isSearch = function() {
				return angular.isString($scope.text) && $routeParams.search === $scope.text;
			};
			
			$scope.isNotSearch = function() {
				return !$scope.isSearch();
			};
			
			$scope.getSearchText = function() {
				return $scope.text;
			};
			
			$scope.search = function() {
				console.log('search '+$scope.text);
				$location.search('search', $scope.text);
			};
		},
		templateUrl: commonTemplateUrl + '/search.html',
		replace: true
	}
});

scaffoldingModule.directive('gasInfiniteScroll', function(WindowService) {
    console.log("gasInfiniteScroll")
	return {
		restrict: 'EA',
		transclude: false,
		scope: {
			items: '=ngModel',
		},
		controllerAs:'infiniteScrollCtrl',
		controller: function($scope, $routeParams, $location, Grails, Flash) {
			var ctrl = this; // assign to a variable to be consistent when using in the template
			ctrl.loading = false;
			
			ctrl.loadMore = function() {
				ctrl.loading = true;
				var baseLegth = $scope.items.length; //TODO remove this demo code before production
				if(baseLegth <= 50) //TODO remove this demo code before production
//					Grails.list({offset: $routeParams}, function(list) {
					Grails.list({offset: baseLegth}, function(list) {
						for (var i = 0; i < list.length; i++) {
							var item = list[i];
							//TODO remove this demo code before production
							item.number += baseLegth;
							item.status = Math.round(item.status+Math.random()*10)%4
							$scope.items.push(item);
						}
						ctrl.loading = false;
						$scope.message = Flash.getMessage();
					}, errorHandler.curry($scope, $location, Flash));
			};
		},
		link: function(scope, element, attrs, ctrl) {
			var raw = element[0];
			WindowService.registerForScroll(scope);

			scope.$on(WindowService.WINDOW_SCROLL, function () {
				//console.log(WindowService+' \n'+WindowService.scrollTop()+' + '+WindowService.height()+' >= '+WindowService.scrollHeight());
				if (WindowService.scrollTop() + WindowService.height() >= WindowService.scrollHeight()) {
					scope.$apply(ctrl.loadMore());
				}
				
			});
			
		},
		replace: false
	}
});



scaffoldingModule.directive('gasTypeahead', function() {
	return {
		restrict: 'EA',
		scope: true,
		require:"ngModel",
		controller: function($scope, $http, $routeParams, $location, Grails, Flash) {
			$scope.asyncSelected
			$scope.selctedItem = undefined
			$scope.queryText = undefined
			$scope.opened = false

			$scope.query = function(val,controller) {
				$scope.queryText = val;
				console.log('query '+val);
				var list = Grails.autocomplete({query: val, controller: controller});
				return list.$promise.then(function() {
				    console.log("List "+JSON.stringify(list))
	                return list
			    })
			};
			
			$scope.open = function($event) {
				console.log('open '+$event)
				$event.preventDefault();
				$event.stopPropagation();
				
				//trigger typeahead //SEE: http://stackoverflow.com/questions/16284878/how-to-trigger-angular-parsers-without-inputing-anything-in-the-field
				if(!$scope.opened){
					
					$scope.val = $scope.typeaheadNgModel.$viewValue;
					$scope.typeaheadNgModel.$setViewValue("*"); //query for all
					
					/*angular.forEach($scope.typeaheadNgModel.$parsers, function (parser) {
						parser($scope.typeaheadNgModel.$viewValue);
					});*/
					
				} else {
					//TODO close typeahead (trick using a hopefully nonexistent query)
					$scope.typeaheadNgModel.$setViewValue("supercalifragilisticexpialidocious");
				}
				
				$scope.opened = !$scope.opened
				
			};
			
			$scope.onSelect = function ($item, $model, $label) {
				console.log('onSelect '+JSON.stringify($item)+', '+$model+', '+$label);
				$scope.selctedItem = $item;
			};
		},
		link: function(scope, element, attrs, ngModel) {
			scope.$watch(function(){
				if(angular.isDefined(attrs.field) && angular.isDefined(ngModel.$viewValue) && !angular.isDefined(scope.queryText))
					scope.asyncSelected = ngModel.$viewValue[attrs.field];
			});
			
			scope.$watch("selctedItem",function(newValue, oldValue) {
				if(angular.isDefined(newValue) && !angular.equals(newValue, oldValue)) {
					ngModel.$setViewValue(newValue); 
				}
			});
			
			angular.forEach(ngModel.$parsers, function (parser) {
			    parser(ngModel.$viewValue);
			});
			
			// retreive the inner directive element
			var typeahead = angular.element(element[0].querySelector('[typeahead]'));
			// retreive the inner directive ngModel controller
			var typeaheadNgModel = angular.element(typeahead).controller('ngModel');
			scope.typeaheadNgModel = typeaheadNgModel;
		}
	}
});


/**
 * A directive for loading item via its id
 */
scaffoldingModule.directive('gasUser', function() {
	return {
		restrict: 'EA',
		scope: true/*{
			user:'=', // inherit the item property from the controller scope
			role:'=' // inherit the item property from the controller scope
		}*/,
		//controllerAs:'userCtrl',
		controller: function($scope, $routeParams, $location, Grails, Flash) {
		    $scope.activateSupplier=false
			var ctrl = this; // assign to a variable to be consistent when using in the template
		    if ($scope.user !== 'undefined' ) {
                var usr = Grails.get({controller: "auth", action:"principal"},function() {
                    $scope.user=usr
                    $scope.roles = []
                    for (var i = 0; i < usr.authorities.length; i++) {
                        var aut = usr.authorities[i];
                        console.log(aut.authority);
                        $scope.roles[i]=aut.authority;
                    }
                    $scope.role=usr.authorities[0].authority
                });
            };
            $scope.supplier = function(){
                $scope.activateSupplier=true
                console.log("supplier: "+ $scope)
            };
            $scope.updateSupplier = function(item, user){
                console.log("supplier: "+ $scope+ " - "+JSON.stringify(item) + user.email)
                if (item.contactInfo.email == '') item.contactInfo.email = user.email
                item.$save({controller: 'supplier'},function(response) {
                    $scope.message = {level: 'success', text: "Profilo aggiornato "};
                    //Verificare perché non funzionano i messaggi flash
                    Flash.success("Fatto")
                }, errorHandler.curry($scope, $location, Flash));
            };
		}
	}
});


/**
 * A directive for loading item via its id
 */
scaffoldingModule.directive('gasItemLoad', function(Grails) {
	return {
		restrict: 'EA',
		scope: {
			itemId:'@',
			item:'='
		},
		link: function(scope, element, attrs) {
			if(!angular.isDefined(attrs.resource)){
				console.log("Please define a resource attribute in gasItemLoad directive");
				return;
			}
			scope.$watch("itemId",function(newValue, oldValue) {
				if(angular.isDefined(newValue)) {  //&& !angular.equals(newValue, oldValue)) {
					//Grails.get({id: newValue, controller: attrs.resource, action:newValue+'.json'}, function(item) {
					  Grails.get({id: newValue, controller: attrs.resource}, function(item) {
						scope.item = item;
					});
				}
			});
		}
	}
});



/**
/* Wrapper directive with new child scope for ui.bootstrap.datepicker
*/
scaffoldingModule.directive('gasDatePicker', function() {
	return {
		restrict: 'EA',
		scope: true,
		controller: function($scope, $attrs) {
			$scope.opened = false;
			
			$scope.dateOptions = {
				showWeeks : false,
				startingDay: 1,
				showButtonBar: false
			};
			
			$scope.open = function($event) {
				console.log('open '+$event)
				$event.preventDefault();
				$event.stopPropagation();
				
				$scope.opened = true;
			};
			
			$scope.toggle = function($event) {
				console.log('open '+$event)
				$event.preventDefault();
				$event.stopPropagation();
				
				$scope.opened = !$scope.opened;
			};
		}
	}
});


/**
/* Wrapper directive with new child scope for ui.bootstrap.collapse
*/
scaffoldingModule.directive('gasCollapse', function() {
	return {
		restrict: 'EA',
		scope: true,
		controllerAs:'collapseCtrl',
		controller: function($scope, $attrs) {
			$scope.collapsed = true
			
			this.isCollapsed = function() {
				return $scope.collapsed;
			};

			this.toggleCollapsed = function() {
				$scope.collapsed = !$scope.collapsed;
			};
			
		}
	}
});

/**
/* Wrapper directive with new child scope for ui.bootstrap.datepicker
*/
scaffoldingModule.directive('gasAddNewRow', function() {
	return {
		restrict: 'EA',
		scope: {
			defaults:'@defaults',
			items:'=?'
		},
		controller: function($scope, $attrs) {
			$scope.createNewRow = function(){
				var newItem = angular.copy($scope.items[0]);
				//cleanup and reset item
				for (var prop in newItem) {
					//console.log("item." + prop + " = " + newItem[prop]);
					if(angular.isString(newItem[prop]))
						newItem[prop] = ""
					if(angular.isNumber(newItem[prop]))
						newItem[prop] = 0
					if(angular.isObject(newItem[prop]))
						newItem[prop] = null
					
					//console.log($scope.defaults[prop]);
					
					//newItem[prop] = $scope.$eval($scope.defaults[prop])
				}
				$scope.items.push(newItem);
			}
		},
		link: function(scope, element, attrs) {
			element.bind('click', function(event) {
				console.log('event '+event);
				
				scope.createNewRow();
				scope.$apply(scope.items);
				
				event.preventDefault();
				event.stopPropagation();
			});
		}
	}
});


/**
/* Wrapper directive to delete item from items array by clicking on element
*/
scaffoldingModule.directive('gasDeleteRow', function() {
	return {
		restrict: 'EA',
		scope: {
			items:'=',
			item:'='
		},
		controller: function($scope, $attrs) {
			$scope.remove = function(item){
				$scope.items.splice($scope.items.indexOf(item),1);
			}
		},
		link: function(scope, element, attrs) {
			element.bind('click', function() {
				scope.remove(scope.item);
				scope.$apply(scope.items);
			});
		}
	}
});


scaffoldingModule.directive('back', function factory($window) {
	return {
		restrict   : 'EA',
		link: function (scope, element, attrs) {
			scope.navBack = function() {
				$window.history.back();
			};
		}
	};
});

scaffoldingModule.directive('gasModal', function factory($window) {
	return {
		restrict: 'EA',
		scope: {
			items:'=',
			item:'=',
			handleSave: '&onSave',
            handleCancel: '&onCancel'
		},
		controllerAs:'modalCtrl',
		controller: function($scope, $attrs, $modal, $log) {
		    var ctrl = this;
			$scope.open = function (size) {
				console.log($attrs.templateUrl + " "+ $attrs.controller)
				var modalInstance = $modal.open({
					size: size,
					templateUrl: $attrs.templateUrl,
					controller: $attrs.controller,
					/*resolve: {
						items: function () {
						    console.log("item: " + $scope.item.name )
							return $scope.items;
						}
					}*/
				});
			
				modalInstance.result.then(function (selectedItem) {
						$scope.selected = selectedItem;
					}, function () {
						$log.info('Modal dismissed at: ' + new Date());
					});
			};
			
			$scope.ok = function () {
                $log.info('Modal dismiss');
				$modalInstance.close($scope.selected.item);
			};

			$scope.cancel = function () {
                $log.info('Modal dismiss');
				$modalInstance.dismiss('cancel');
			};
		},
		link: function (scope, element, attrs) {
			element.bind('click', function(event) {
				scope.open();
			});
		}
	};
});

// Inline edit directive
scaffoldingModule.directive('gasInlineEdit', function($timeout) {
	return {
		scope: {
			model: '=gasInlineEdit',
			handleSave: '&onSave',
			handleCancel: '&onCancel'
		},
		controller: function($scope, $attrs, $log, $element) {
			var previousValue;
			
			$scope.editMode = false;
			
			$scope.save = function() {
				$scope.editMode = false;
				$scope.handleSave({value: $scope.model});
			};
			
			$scope.cancel = function() {
				$scope.editMode = false;
				$scope.model = previousValue;
				$scope.handleCancel({value: $scope.model});
			};
			
			$scope.edit = function() {
				$scope.editMode = true;
				previousValue = angular.copy($scope.model);

				$timeout(function() {
					$element.find('input')[0].focus();
				}, 0, false);
			};
		},
		link: function(scope, element, attrs) {
			
		},
		templateUrl: 'ng-templates/'+'inline-edit.gsp'
	};
});

// On esc event
scaffoldingModule.directive('onEsc', function() {
  return function(scope, elm, attr) {
    elm.bind('keydown', function(e) {
      if (e.keyCode === 27) {
        scope.$apply(attr.onEsc);
      }
    });
  };
});

// On enter event
scaffoldingModule.directive('onEnter', function() {
  return function(scope, elm, attr) {
    elm.bind('keypress', function(e) {
      if (e.keyCode === 13) {
        scope.$apply(attr.onEnter);
      }
    });
  };
});

// Inline edit directive
scaffoldingModule.directive('gasNav', function($location) {
	return {
		restrict: 'EA',
		scope:true,
		controllerAs:'navCtrl',
		controller: function($scope, $attrs, $location, $element) {
			$scope.navClass = function (page) {
				
				$element
				
				var currentRoute = $location.path().substring(1) || 'home';
				return page === currentRoute ? 'active' : '';
			};
		},
		link: function(scope, element, attrs) {
			console.log($location);
			console.log($location.absUrl());
			console.log($location.url());
			console.log($location.host());
			
			scope.$on('$locationChangeSuccess', function() {
				if ($location.path() === scope.path) {
					element.addClass('active');
				} else {
					element.removeClass('active');
				}
			});
			
		}
	};
});
