angular.module('ui.ext.collapse', ['ui.bootstrap.collapse'])

/**
/* Wrapper directive with multiple collapse-gruoup for ui.bootstrap.collapse
*/
.directive('multipleCollapse', function() {
	return {
		restrict: 'EA',
		scope: true,
		controllerAs:'MultipleCollapseCtrl',
		controller: function($scope, $attrs) {
			this.closeOthersDefault = true;
			
			// Keep track of the collapse groups
			this.groups = {};
			
			// Ensure that all the groups in this multiple collapse are closed, unless close-others explicitly says not to
			this.closeOthers = function(openGroup) {
				var closeOthers = angular.isDefined($attrs.closeOthers) ? $scope.$eval($attrs.closeOthers) : this.closeOthersDefault;
				if ( closeOthers ) {
					angular.forEach(this.groups, function (group) {
						if ( group !== openGroup ) {
							group.isOpen = false;
						}
					});
				}
			};
			
			// This is called from the collapse-group directive to add itself to the accordion
			this.addGroup = function(groupScope) {
				var that = this;
				this.groups[groupScope.name] = groupScope; //this.groups.push(groupScope);

				groupScope.$on('$destroy', function (event) {
					that.removeGroup(groupScope);
				});
			};

			// This is called from the collapse-group directive when to remove itself
			this.removeGroup = function(group) {
				delete this.groups[group.name]
				/*var index = this.groups.indexOf(group);
				if ( index !== -1 ) {
					this.groups.splice(index, 1);
				}*/
			};
			
			this.toggleOpenGroup = function(name) {
				console.log("toggleOpenGroup")
				var groupScope = this.groups[name];
				if ( !groupScope.isDisabled ) {
					groupScope.isOpen = !groupScope.isOpen;
				}
			};
			
		}
	}
})

// The collapse-group directive indicates a block of html that will expand and collapse in a multiple-collapse
.directive('collapseGroup', function() {
	return {
		require:'^multipleCollapse',			// We need this directive to be inside a multiple-collapse
		restrict:'EA',
		scope: true, 
		/*{
			isOpen: '=?',
			isDisabled: '=?'
		},*/
		controllerAs:'CollapseGroupCtrl',
		controller: function($scope, $attrs) {
			
			$scope.isOpen = false;
			
			$scope.name;
			
			this.toggleOpen = function() {
				console.log("toggleOpen")
				if ( !$scope.isDisabled ) {
					$scope.isOpen = !$scope.isOpen;
				}
			};
		},
		link: function(scope, element, attrs, multipleCollapseCtrl) {
			
			if(angular.isDefined(attrs.collapseGroupName) && attrs.collapseGroupName !=null ) {
				scope.name = attrs.collapseGroupName;
			} else {
				console.log("ERROR: Please set a collapseGroupName!");
				return;
			}
			
			multipleCollapseCtrl.addGroup(scope);
			
			scope.$watch('isOpen', function(value) {
				if ( value ) {
					multipleCollapseCtrl.closeOthers(scope);
				}
			});
		}
	};
})

/**
/* Wrapper directive with new child scope for ui.bootstrap.collapse
*/
.directive('wrapCollapse', function() {
	return {
		restrict: 'EA',
		scope: true,
		controllerAs:'WrapCollapseCtrl',
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
