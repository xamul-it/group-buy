package gb

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority

class GBUserDetails extends GrailsUser {

    final String fullName

    GBUserDetails(String username, String password, boolean enabled,
                  boolean accountNonExpired, boolean credentialsNonExpired,
                  boolean accountNonLocked,
                  Collection<GrantedAuthority> authorities,
                  long id, String fullName) {
        super(username, password, enabled, accountNonExpired,
                credentialsNonExpired, accountNonLocked, authorities, id)

        this.fullName = fullName
    }
}