scaffoldingModule.factory('WindowService', ['$window','$document', function ($window, $document) {
		var windowElement = angular.element($window);
		var bodyElement = $document.find('body').eq(0);
		var htmlElement = $document.find('html').eq(0);
		
        var WINDOW_SCROLL = 'WINDOW_SCROLL';
        var listeners = [];

        windowElement.on('scroll', function () {
            var scope;
            for (var index in listeners) {
                scope = listeners[index];
                scope.$broadcast(WINDOW_SCROLL);
            }
        });

        return {
            WINDOW_SCROLL: WINDOW_SCROLL,
            height: function () {
                return windowElement[0].innerHeight;
            },
            scrollTop: function () {
                return bodyElement[0].scrollTop || htmlElement[0].scrollTop;
            },
            scrollHeight: function () {
                return bodyElement[0].scrollHeight;
            },
            registerForScroll: function ($scope) {
                if ($scope && angular.isFunction($scope.$broadcast)) {
                    listeners.push($scope);
                } else {
                    throw new Error('Cannot register a non-scope object for scroll');
                }
            }
        };
    }]);