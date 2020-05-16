package gb
import grails.converters.JSON

class AuthController {

    @Autowired
    grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    def principal() {
        def principal = springSecurityService.principal
        String username = principal.username
        def authorities = principal.authorities // a Collection of GrantedAuthority
        boolean enabled = principal.enabled
        render principal as JSON
    }

}
