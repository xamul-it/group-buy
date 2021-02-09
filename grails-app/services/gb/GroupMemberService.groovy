package gb
import grails.gorm.transactions.Transactional

class GroupMemberService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService
    EmailService emailService

    Long count (Map params){
        def group = Group.findById(params.groupId)
        def groupCount = 0
        if(params.groupStatusId) {
            def groupStatusId = params.groupStatusId?.isInteger() ? params.groupStatusId.toInteger() : 0
            group ? GroupMember.countByGroupAndStatus(group, groupStatusId) : 0
        } else {
            groupCount = group ? GroupMember.countByGroup(group) : 0
        }
        groupCount
    }

    List<GroupMember> list (Map params){
        def group = Group.findById(params.groupId)
        def groupMemberList = []
        if(params.groupStatusId) {
            def groupStatusId = params.groupStatusId?.isInteger() ? params.groupStatusId.toInteger() : 0
            groupMemberList = group ? GroupMember.findAllByGroupAndStatus(group, groupStatusId, params) : []
        } else {
            groupMemberList = group ? GroupMember.findAllByGroup(group, params) : []
        }
        groupMemberList        
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
    GroupMember subscribe(groupId){
        log.debug "subscribe " + groupId
        Group g = Group.get(groupId)
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
                g.save()
                log.debug "subscribe " + g
            } else {
                gm=new GroupMember()
                gm.status = MemberStatus.INVALID
            }
        }else if (!gm.status.equals(MemberStatus.ACTIVE)){
            gm.status = MemberStatus.ACTIVE
            gm.lastUpdate = new Date()
            gm.save()
        }
        gm.group.isMember=null
        return gm
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
    GroupMember changestatus(groupId,uid, status){
        log.debug "changestatus " + groupId
        Group g = Group.get(groupId)
        GroupMember gm
        if (g.owner.equals(springSecurityService.getCurrentUser())){
            User u = User.get(uid)
            gm  = GroupMember.createCriteria().get{
                eq('group',g)
                eq('user', u)
            }

            if (gm!=null) {
                //verifica se è già iscritto
                MemberStatus s = MemberStatus.getById(status as Integer)
                gm.status = s
                gm.lastUpdate = new Date()
                g.save()
            }
        }
        if (gm==null) {
            //By now return error?
            gm=new GroupMember()
            gm.status = MemberStatus.INVALID
        }
        return gm
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
    GroupMember inviteUser(groupId, email, inviteText){
        log.debug "inviteUser " + groupId
        Group g = Group.get(groupId)
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
            User u = User.findByEmail(email)
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
                g.save()
                //Add membership in state active
            } else {
                //By now return error?
                invite = new GroupMember()
                invite.status = MemberStatus.INVALID
            }
            emailService.groupInvite(email, inviteText)
        }
        return gm
    }

    /**
     * Sets user membership status to Invalid
     */
    @Transactional
    GroupMember unsubscribe(groupId){
        log.debug "unsubscribe " + groupId
        Group g = Group.get(groupId)
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
        return gm
    }
}