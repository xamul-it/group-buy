angular.module('ui.fatturasprint.main', ['ui.bootstrap','customFilters','datePicker']);
//angular.module('ui.fatturasprint.main', ['ui.bootstrap','customFilters']);
angular.module('ui.fatturasprint.main')
	.constant("filterClass", "btn-transparent")
	.constant("filterActiveClass", "btn-active")
	.constant("dangerClass", "-danger")
	.constant("warningClass", "-warning")
	.constant("successClass", "-success")
	.constant("defaultClass", "-default")
	.controller('FsDashboardController', function ($scope, filterClass, filterActiveClass, dangerClass, warningClass, successClass, defaultClass) {

	//hello world
	$scope.greeting = { text: 'Hello' };

	$scope.status = {
		isopen: false
	};
	
	//log open/close status
	$scope.toggled = function(open) {
		console.log('Dropdown is now: ', open);
	};
	
	//disable dropdown
	$scope.toggleDropdown = function($event) {
		$event.preventDefault();
		$event.stopPropagation();
		$scope.status.isopen = !$scope.status.isopen;
	};

	//date range button initialize
	$scope.dateRange = { 
		start: new Date(),
		end: new Date()
	};
	
	//data
	$scope.invoices = invoices;
	
	$scope.getLabelClass = function (status) {
		var labelClass = "label";
		switch (status) {
			case 0:
				labelClass += defaultClass;
			break;
			case 1:
				labelClass += warningClass;
			break;
			case 2:
				labelClass += dangerClass;
			break;
			case 3:
				labelClass += successClass;
			break;
			default:
				labelClass += defaultClass;
		}
		return labelClass;
	}

	//filters
	var selectedStatus = null;

	$scope.selectStatus = function (newStatus) {
		selectedStatus = newStatus;
		//$scope.selectedPage = 1;
	}

	$scope.statusFilterFn = function (doc) {
		return selectedStatus == null ||
			doc.status == selectedStatus;
	}

	$scope.getStatusClass = function (status) {
		return selectedStatus == status ? filterActiveClass : filterClass;
	}
	
	

});
