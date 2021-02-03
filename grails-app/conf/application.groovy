

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'gb.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'gb.UserRole'
grails.plugin.springsecurity.authority.className = 'gb.Role'

grails.plugin.springsecurity.rejectIfNoRule = false
grails.plugin.springsecurity.fii.rejectPublicInvocations = false

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               					access: ['permitAll']],
	[pattern: '/groupBuy/groupOrders/**',    		access: 'isAuthenticated()'],
	[pattern: '/groupBuy/group/1/order/edit/**',    access: 'isAuthenticated()'],
	[pattern: '/groupBuy/group/1/order/create',    access: 'isAuthenticated()'],
	[pattern: '/groupOrder/supplierShow',			access: ['permitAll']],
	[pattern: '/groupOrder/**',						access: 'isAuthenticated()'],
	[pattern: '/supplier/**',       access: ['permitAll']],


	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/navigation/**',  access: ['permitAll']],
	[pattern: '/negozio/**',  access: ['permitAll']],
	[pattern: '/vetrina/**',  access: ['permitAll']],

/*pagine vecchie*/
	[pattern: '/securityinfo/**',access: 'ROLE_ADMIN'],
	[pattern: '/order/**',       access: 'isAuthenticated()'],
	[pattern: '/orderVoice/**',       access: 'isAuthenticated()'],
	[pattern: '/group/**',       access: 'isAuthenticated()'],
	[pattern: '/customer/**',    access: 'isAuthenticated()'],
	[pattern: '/cliente/**',    access: 'isAuthenticated()'],
	[pattern: '/timeline/**',    access: 'isAuthenticated()'],
	[pattern: '/product/**',    access: 'isAuthenticated()'],
	[pattern: '/shop/**',    access: 'isAuthenticated()'],
/*pagine vecchie*/


	[pattern: '/auth/**',    access: 'isAuthenticated()'],
	[pattern: '/api/**',    access: 'isAuthenticated()'],
	[pattern: '/api/v1/**',    access: 'isAuthenticated()'],
	[pattern: '/api/v1/groups',    access: 'isAuthenticated()'],

	[pattern: '/user/**',    access: 'ROLE_ADMIN'],
	[pattern: '/role/**',    access: 'ROLE_ADMIN'],
	[pattern: '/registrationCode/**',    access: 'ROLE_ADMIN'],
	[pattern: '/register/**',    access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	//[pattern: '/**',             filters: 'none']
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

