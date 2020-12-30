package gb.rest.v1

import grails.rest.RestfulController

import gb.User
import gb.UserService

class UserController extends RestfulController<User> {

    static namespace = 'v1'
    static responseFormats = ['json']

    UserService userService
    transient springSecurityService

    UserController() {
        super(User)
    }

    def get() {
        respond queryForResource()
    }

    /**
     * List all of resource based on parameters
     *
     * @return List of resources or empty if it doesn't exist
     */
    @Override
    protected List<User> listAllResources(Map params) {
        //No user list available, controller not for admin
        []
    }

    /**
     * Queries for a resource for the given id
     *
     *  @param id The id
     * @return The resource or null if it doesn't exist
     */
    protected User queryForResource(Serializable id) {
        //No user available, controller not for admin
        //returns empty user
        new User()
    }

    /**
     * Queries for a resource with no params
     *
     * @return The resource or null if it doesn't exist
     */
    protected User queryForResource() {
        userService.get()
    }

}