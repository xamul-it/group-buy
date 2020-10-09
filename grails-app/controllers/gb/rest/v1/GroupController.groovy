package gb.rest.v1

import java.util.concurrent.TimeUnit

import grails.web.http.HttpHeaders
import grails.gorm.transactions.Transactional
import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.*

import grails.rest.RestfulController

import gb.Group
import gb.GroupMember
import gb.MemberStatus
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

    /**
     * Se la sottoscrizione esiste viene restituta quella esistente e aggiornato lo stato ad active
     * Se non esiste e il gruppo è pubblico viene creata e impostata ad active
     * Se non esiste eil gruppo è privato viene restituita una sottoscrizione vuota in stato invalid
     * TODO Verificare se generare errore
     *
     * @return
     */
    @Transactional
    def subscribe(){
        log.debug "subscribe " + params
        Group g = queryForResource(params.groupId)
        GroupMember gm = new GroupMember()
        gm  = GroupMember.createCriteria().get{
            eq('group',g)
            eq('user',springSecurityService.getCurrentUser())
        }
        if (gm==null) {
            if (g.publicGroup) {
                //verifica se è già iscritto
                gm = new GroupMember()
                gm.group = g
                gm.user = springSecurityService.getCurrentUser()
                gm.status = MemberStatus.ACTIVE
                gm.subscriptionDate = new Date()
                gm.lastUpdate = new Date()
                g.getMembers().add(gm)
                saveResource g
            } else {
                gm=new GroupMember()
                gm.status = MemberStatus.INVALID
            }
        }else if (!gm.status.equals(MemberStatus.ACTIVE)){
            gm.status = MemberStatus.ACTIVE
            gm.lastUpdate = new Date()
            gm.save()
        }

        respond gm.group, [status: CREATED]
    }

    @Transactional
    def unsubscribe(){
        log.debug "unsubscribe " + params
        Group g = queryForResource(params.groupId)
        GroupMember gm = new GroupMember()
        gm  = GroupMember.createCriteria().get{
            eq('group',g)
            eq('user',springSecurityService.getCurrentUser())
        }
        if (gm==null) {
            gm=new GroupMember()
            gm.status = MemberStatus.INVALID
        } else if (!gm.status.equals(MemberStatus.CANCELLED)){
            gm.status = MemberStatus.CANCELLED
            gm.lastUpdate = new Date()
            gm.save()
        }

        respond gm.group, [status: CREATED]
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