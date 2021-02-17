package gb.rest.v1

import grails.rest.RestfulController

import gb.User
import gb.UserService

import static org.springframework.http.HttpStatus.*
import groovy.json.JsonSlurper

class UserController extends RestfulController<User> {

    static namespace = 'v1'
    static responseFormats = ['json']
    static allowedMethods = [updatePassword: ["PUT", "POST"]]

    UserService userService
    transient springSecurityService

    UserController() {
        super(User)
    }

    def get() {
        respond queryForResource()
    }

    //https://grails-plugins.github.io/grails-spring-security-core/4.0.x/index.html#locking
    def password() {
            
        log.debug("password $params $request ${request.JSON}")

        //String password, String password_new, String password_new_2) 

        String username = session['SPRING_SECURITY_LAST_USERNAME']
        if(!username)
            username = params.username
        if (!username) {
            def error = errorJson('Si &egrave; verificato un errore')
            respond error, status: BAD_REQUEST
            return
        }

        if (!params.password || !params.password_new) { //|| !params.password_new || !params.password_new_2 || params.password_new != params.password_new_2) {
            def error = errorJson('Per favore inserisci la tua attuale password e una nuova password')
            respond error, status: UNPROCESSABLE_ENTITY, model: [username: session['SPRING_SECURITY_LAST_USERNAME']]
            return
        }

        User user = User.findByUsername(username)
        if (!springSecurityService.passwordEncoder.matches(params.password, user.password)) {
            def error = errorJson('Password attuale non corretta')
            respond error, status: UNPROCESSABLE_ENTITY, model: [username: session['SPRING_SECURITY_LAST_USERNAME']]
            return
        }

        if (springSecurityService.passwordEncoder.matches(params.password_new, user.password)) {
            def error = errorJson('Per favore scegli una nuova password diversa dall\'attuale')
            respond error, status: UNPROCESSABLE_ENTITY, model: [username: session['SPRING_SECURITY_LAST_USERNAME']]
            return

        }

        user.password = params.password_new
        //user.passwordExpired = false
        user.save() //TODO check password constraints here

        respond user, status: CREATED
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
        //returns active user
        userService.get()
    }

    /**
     * Queries for a resource with no params
     *
     * @return The resource or null if it doesn't exist
     */
    protected User queryForResource() {
        userService.get()
    }

    private errorJson(String errorMessage) {
        def jsonSlurper = new JsonSlurper()
        jsonSlurper.parseText('{ "errors": [ { "object": "gb.User", "message": "'+errorMessage+'" } ] }')
    }

}