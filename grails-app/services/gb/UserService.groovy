package gb

import grails.gorm.services.Service


interface IUserService {

    User get()

    User get(Serializable id)

    User get(Map args)

    List<User> list(Map args)

    Long count()

    void delete(Serializable id)

    User save(User user)

}

@Service(User)
abstract class UserService implements IUserService { 

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    User get(Map params) {
        User.get(params.id)
    }

    User get() {
        if (springSecurityService.isLoggedIn()) {
            User.get(springSecurityService.principal.id)
        }
    }

}