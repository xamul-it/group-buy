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
import gb.User

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
     * Adds a new membership to the group.
     * Constraints:
     *   Group need to be public
     * Cases:
     *  1) Se la sottoscrizione esiste viene restituta quella esistente e aggiornato lo stato ad active
     *  2) Se non esiste e il gruppo è pubblico viene creata e impostata ad active
     *  3) Se non esiste eil gruppo è privato viene restituita una sottoscrizione vuota in stato invalid
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
    /**
     * Adds a new membership to the group.
     * Constraints:
     *   Group need to be public
     * Cases:
     *  1) Se la sottoscrizione esiste viene restituta quella esistente e aggiornato lo stato ad active
     *  2) Se non esiste e il gruppo è pubblico viene creata e impostata ad active
     *  3) Se non esiste eil gruppo è privato viene restituita una sottoscrizione vuota in stato invalid
     * TODO Verificare se generare errore
     *
     * @return
     */
    @Transactional
    def changestatus(){
        log.debug "changestatus " + params
        Group g = queryForResource(params.groupId)
        GroupMember gm
        if (g.owner.equals(springSecurityService.getCurrentUser())){
            User u = User.get(params.uid)
            gm  = GroupMember.createCriteria().get{
                eq('group',g)
                eq('user', u)
                //eq('owner',springSecurityService.getCurrentUser())
            }
            if (gm!=null) {
                //verifica se è già iscritto
                gm.status = MemberStatus.ACTIVE
                gm.lastUpdate = new Date()
                saveResource g
            }
        }
        if (gm==null) {
            //By now return error?
            gm=new GroupMember()
            gm.status = MemberStatus.INVALID
        }
        //respond MemberStatus.values()

        respond gm, [status: CREATED]
    }

    /**
     * Invites a new user.
     * Input:
     *   params.email
     * Constraints:
     *  Only an active  member of a group can invite.
     * Cases:
     *  1) Based on Email user is already in the system, just adds a new membership in status valid
     *      TODO: Processo setting user stauts in pending
     *  2) User is not present in the system a new partial subscription needs to be craeted
     */
    @Transactional
    def inviteUser(){
        log.debug "inviteUser " + params
        Group g = queryForResource(params.groupId)
        GroupMember gm = new GroupMember()
        GroupMember invite = new GroupMember()
        //current user is member of group
        gm  = GroupMember.createCriteria().get{
            eq('group',g)
            eq('user',springSecurityService.getCurrentUser())
            eq('status',MemberStatus.ACTIVE)
        }
        if (gm!=null) {
            //Search user
            User u = User.findByEmail(params.email)
            if (u){
                invite  = GroupMember.createCriteria().get{
                    eq('group',g)
                    eq('user',u)
                }
                if (invite) {
                    invite.status = MemberStatus.ACTIVE
                    invite.lastUpdate = new Date()
                }else {
                    invite.group = g
                    invite.user = springSecurityService.getCurrentUser()
                    invite.status = MemberStatus.ACTIVE
                    invite.subscriptionDate = new Date()
                    invite.lastUpdate = new Date()
                }
                g.getMembers().add(invite)
                saveResource g
                //Add membership in state active
            }else{
                //By now return error?
                invite=new GroupMember()
                invite.status = MemberStatus.INVALID
            }
        }
        respond gm, [status: CREATED]
    }

    /**
     * Sets user membership status to Invalid
     */
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
        GroupMember members = new GroupMember()
        members  = GroupMember.createCriteria().get{
            eq('group',g)
            eq('user',springSecurityService.getCurrentUser())

        }
        if (members){
            respond (g.members ? g.members : [])
        }
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