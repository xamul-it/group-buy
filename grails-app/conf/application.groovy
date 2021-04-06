// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'gb.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'gb.UserRole'
grails.plugin.springsecurity.authority.className = 'gb.Role'

grails.plugin.springsecurity.rejectIfNoRule = true
grails.plugin.springsecurity.fii.rejectPublicInvocations = false
grails.plugin.springsecurity.apf.storeLastUsername = true

grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"

grails.plugin.springsecurity.interceptUrlMap = [
	[pattern: '/',               					access: ['permitAll']],

	[pattern: '/gruppi',       						access: ['permitAll']],
	[pattern: '/gruppo/nuovo',    					access: 'IS_AUTHENTICATED_REMEMBERED'],
	[pattern: '/gruppo/*/modifica',    				access: 'IS_AUTHENTICATED_REMEMBERED'],
	[pattern: '/gruppo/*/ordini',    				access: 'IS_AUTHENTICATED_REMEMBERED'],
	[pattern: '/gruppo/**',    						access: ['permitAll']],

	[pattern: '/negozi',       						access: ['permitAll']],
	[pattern: '/negozio/**',       					access: ['permitAll']],

	[pattern: '/ordine/nuovo',    					access: 'isAuthenticated()'],
	[pattern: '/ordine/**',    						access: ['permitAll']],

	[pattern: '/utente/**',    						access: ['IS_AUTHENTICATED_FULLY']],

	/*API*/
	[pattern: '/api/v1/**',			access: ['IS_AUTHENTICATED_REMEMBERED'], httpMethod: 'PUT'],
	[pattern: '/api/v1/groups/**',	access: ['IS_AUTHENTICATED_REMEMBERED'], httpMethod: 'POST'],
	[pattern: '/api/v1/orders/**',	access: ['IS_AUTHENTICATED_REMEMBERED'], httpMethod: 'POST'],	
	[pattern: '/api/v1/users/**',	access: ['IS_AUTHENTICATED_REMEMBERED']],
	[pattern: '/api/v1/**',    		access: ['permitAll']],

	/*pages/views/assets*/
	[pattern: '/chisiamo',          			access: ['permitAll']],
	[pattern: '/privacy',          				access: ['permitAll']],
	[pattern: '/tos',          					access: ['permitAll']],
	[pattern: '/cookie',          				access: ['permitAll']],
	[pattern: '/faq',          					access: ['permitAll']],

	[pattern: '/error',          				access: ['permitAll']],
	[pattern: '/index',          				access: ['permitAll']],
	[pattern: '/index.gsp',      				access: ['permitAll']],
	[pattern: '/assets/**',      				access: ['permitAll']],
    [pattern: '/**/js/**',       				access: ['permitAll']],
    [pattern: '/**/css/**',   				    access: ['permitAll']],
    [pattern: '/**/images/**',   				access: ['permitAll']],
    [pattern: '/**/favicon.ico', 				access: ['permitAll']],
    [pattern: '/login',          				access: ['permitAll']],
    [pattern: '/login/**',       				access: ['permitAll']],
	[pattern: '/register',          			access: ['permitAll']],
    [pattern: '/register/**',       			access: ['permitAll']],
    [pattern: '/logout',         				access: ['permitAll']],
    [pattern: '/logout/**',      				access: ['permitAll']]
]	

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',       filters: 'none'],
	[pattern: '/** /js/**',       filters: 'none'],
	[pattern: '/** /css/**',      filters: 'none'],
	[pattern: '/** /images/**',   filters: 'none'],
	[pattern: '/** /favicon.ico', filters: 'none'],
	//[pattern: '/**',             filters: 'none']
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

