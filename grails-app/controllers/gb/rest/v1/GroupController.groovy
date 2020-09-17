package gb.rest.v1

import java.util.concurrent.TimeUnit

import grails.web.http.HttpHeaders
import grails.gorm.transactions.Transactional
import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.*

import grails.rest.RestfulController

import gb.Group
import gb.GroupService

//Extending the RestfulController super class docs:
//https://docs.grails.org/latest/guide/REST.html#extendingRestfulController

//RestfulController<T> source code:
//https://github.com/grails/grails-core/blob/master/grails-plugin-rest/src/main/groovy/grails/rest/RestfulController.groovy

class GroupController extends RestfulController<Group> {

    static namespace = 'v1'
    static responseFormats = ['json']

    GroupService groupService
    transient springSecurityService
    
    GroupController() {
        super(Group)
    }

    def subscribe(){
        log.debug "subscribe to group " + params.groupId
        Group g = queryForResource(params.groupId)
        g.getMembers().add(springSecurityService.getCurrentUser())
        save(g);
        respond g, [status: CREATED]
    }

    def unsubscribe(){
        log.debug "unsubscribe from group " + params.groupId
        Group g = queryForResource(params.groupId)
        g.getMembers().remove(springSecurityService.getCurrentUser())
        save(g);
        respond g, [status: CREATED]
    }

    def members() {
        log.debug "members " + params
        Group g = queryForResource(params.groupId)
        def members = g?.getMembers()
        respond (members ? members : [])
    }

    def autocomplete(String query) {
        log.debug "autocomplete " + params
        params.max = 10
        def lista = groupService.autocomplete(params)
        respond (lista ? lista : [])
    }

    /**
     * Lists all resources up to the given maximum
     *
     * @param max The maximum
     * @return A list of resources
     */
    def index(Integer max) {
        if (max < 0) { max = null }
        params.max = Math.min(max ?: 10, 100)
        respond listAllResources(params)
    }

    /**
     * List all of resource based on parameters
     *
     * @return List of resources or empty if it doesn't exist
     */
    @Override
    protected List<Group> listAllResources(Map params) {
        response.setHeader('X-Pagination-Total', groupService.count(params).toString())
        groupService.list(params);
    }

    /**
     * Creates a new instance of the resource.  If the request
     * contains a body the body will be parsed and used to
     * initialize the new instance, otherwise request parameters
     * will be used to initialized the new instance.
     *
     * @return The resource instance
     */
    protected Group createResource() {
        Group group = resource.newInstance()
        bindData group, getObjectToBind()

        if (!group.id) {
            if (springSecurityService && springSecurityService.isLoggedIn()) {
                group.owner = springSecurityService.getCurrentUser()
            }
            group.creationDate = new Date()
            group.members.add(group.owner)
        }
        group.members.each() {it.springSecurityService=springSecurityService}

        group
    }

}