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
import gb.GroupMemberService
import gb.User

//Extending the RestfulController super class docs:
//https://docs.grails.org/latest/guide/REST.html#extendingRestfulController

//RestfulController<T> source code:
//https://github.com/grails/grails-core/blob/master/grails-plugin-rest/src/main/groovy/grails/rest/RestfulController.groovy

class GroupController extends RestfulController<Group> {

    static namespace = 'v1'
    static responseFormats = ['json']

    GroupService groupService
    GroupMemberService groupMemberService
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
        GroupMember gm = groupMemberService.subscribe(params.groupId)
        respond gm.group, [status: CREATED]
    }

    def memberStatusList() {
        respond MemberStatus.values()
    }

    /**
     * Changes membership of a member.
     * Input:
     *  http://localhost:8080/api/v1/groups/1/changestatus?uid=1&status=0
     * Params:
     *   uid = userid
     *   status = new status refer to list http://localhost:8080/api/v1/groups/1/memberstatuslist
     * Constraints:
     *   Current user needs to be owner of the group
     *   User must be alredy subscribed to group
     *   No other checks are performed
     * TODO Verificare se generare errore
     *
     * @return
     */
    @Transactional
    def changestatus(){
        GroupMember gm = groupMemberService.changestatus(params.groupId,params.uid,params.status)
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
    def invite(){
        log.debug "invite $params $request.JSON"
        def payload = request.JSON
        GroupMember gm = groupMemberService.inviteUser(params.groupId,payload.email,payload.inviteText)
        respond gm, [status: CREATED]
    }

    /**
     * Sets user membership status to Invalid
     */
    @Transactional
    def unsubscribe(){
        GroupMember gm = groupMemberService.unsubscribe(params.groupId)
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