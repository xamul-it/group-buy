package gb

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String email
    String password
    transient String password_new
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        email nullable: false, blank: false
        username nullable: false, blank: false, unique: true
    }

    static mapping = {
	    password column: '`password`'
    }

    def String toString(){
        String s = new String( "["
                + " username: " + username
                + "]")
        return s;
    }
}
