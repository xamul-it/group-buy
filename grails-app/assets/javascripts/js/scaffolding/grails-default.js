/**
 * This module defines the resource mappings required by Angular JS to map to a
 * standard Grails CRUD URL scheme that uses `"/$controller/$action?/$id?"`.
 */
angular.module('grailsService').factory('Grails', function($resource, baseUrl, baseController) {
    console.log("grailsService "+scaffoldingModule);
    //return $resource(baseUrl + ':controller/:action', {controller: '@controller'}, {
	return $resource(baseUrl + ':controller/:action', {id: '@id'}, {
	//return $resource(baseUrl + ':controller/:action/:id', {controller: '@controller', id: '@id'}, {
		list: {method: 'GET', params: {action: 'list.json', controller: baseController}, isArray: true },
		//get: {method: 'GET', params: {action: 'get.json', controller: baseController, id: '@id' }},
		create: {method: 'GET', params: {action: 'create.json', controller: baseController}},
		get: {method: 'GET', params: {action: 'show.json', controller: baseController, id: '@id' }},
		save: {method: 'POST', params: {action: 'save.json', controller: baseController }},
		update: {method: 'PUT', params: {action: 'update.json', controller: baseController }},
		delete: {method: 'POST', params: {action: 'delete.json', controller: baseController }},
		autocomplete: {method: 'GET', params: {action: 'autocomplete.json', controller: baseController }, isArray: true},
		subscribe: {method: 'GET', params: {action: 'subscribe.json', controller: baseController, id: '@id' }, isArray: true},
		leaveGroup: {method: 'GET', params: {action: 'leaveGroup.json', controller: baseController, id: '@id' }, isArray: true}
	});
});
