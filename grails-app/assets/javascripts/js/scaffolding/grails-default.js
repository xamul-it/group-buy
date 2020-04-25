/**
 * This module defines the resource mappings required by Angular JS to map to a
 * standard Grails CRUD URL scheme that uses `"/$controller/$action?/$id?"`.
 */
angular.module('grailsService').factory('Grails', function($resource, baseUrl, baseController) {
	return $resource(baseUrl + ':controller/:action?id=:id', {controller: '@controller', id: '@id'}, {
	//return $resource(baseUrl + ':controller/:action/:id', {controller: '@controller', id: '@id'}, {
		list: {method: 'GET', params: {action: 'list.json', controller: baseController }, isArray: true },
		get: {method: 'GET', params: {action: 'get.json', controller: baseController }},
		save: {method: 'POST', params: {action: 'save.json', controller: baseController }},
		update: {method: 'PUT', params: {action: 'update.json', controller: baseController }},
		delete: {method: 'POST', params: {action: 'delete.json', controller: baseController }},
		autocomplete: {method: 'GET', params: {action: 'autocomplete.json', controller: baseController }}
	});
});
