package gb
import grails.gorm.transactions.Transactional

class GroupMemberService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService
    EmailService emailService

    def query(Map params) {
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        log.debug "QUERY by user $userId and $params"
        def qparam= [:]
        String q = "from GroupMember as g where 1=1"
        if (params.q) {
            q += " and g.user.username like :src"
            qparam.src = "%$params.q%"
        }

        if (params.statusId) {
            q += " and g.status=  :statusId"
            qparam.statusId = MemberStatus.getById(params.statusId as Integer)
        }
/*        if (userId!=null) {
            q += "(g.publicGroup = true or "
            q += "g.owner.id = :user)"
            qparam.user = (long)userId
        }
 */       if (params.sort){
            if (params.sort=="name"){
                q += " order by g.user.username $params.order"
            }
        }
        log.debug("$params.categoryId : $qparam.categoryId Query $q Params: $qparam")
        return [qparam,q]
    }

    Long count(Map params) {
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)
        def r = GroupMember.executeQuery("select count(g) "+q , qparam);
        return r[0]
    }

    List<GroupMember> list (Map params){
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)

        qparam.max=params.max
        qparam.offset=params.offset
        def res = GroupMember.findAll(q , qparam)
        log.debug("Risultato "+params.src!=null ? "++ $params.src":"--"+" $res")

        return res
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
    GroupMember subscribe(groupId) {
        log.debug "subscribe ${springSecurityService.getCurrentUser()} to $groupId "
        Group g = Group.get(groupId)
        GroupMember gm = new GroupMember()
        gm  = GroupMember.createCriteria().get{
            eq('group',g)
            eq('user',springSecurityService.getCurrentUser())
        }
        if (gm==null) {
            if (g.publicGroup) {
                log.debug "publicGroup: ${g.publicGroup}"
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
        } else if (!gm.status.equals(MemberStatus.ACTIVE)) {
            gm.status = MemberStatus.ACTIVE
            gm.lastUpdate = new Date()
            gm.save()
        }
        log.debug "memberCount: ${gm.group.memberCount} - ${gm} status : ${gm.status} - ${gm.group}"
        gm.group.isMember=null //?
        return gm
    }

    /**
     * Sets user membership status to Invalid
     */
    @Transactional
    GroupMember unsubscribe(groupId) {
        log.debug "unsubscribe ${springSecurityService.getCurrentUser()} from $groupId "
        Group g = Group.get(groupId)
        GroupMember gm = new GroupMember()
        gm  = GroupMember.createCriteria().get{
            eq('group',g)
            eq('user',springSecurityService.getCurrentUser())
        }
        log.debug " ${gm} status : ${gm.status} lastUpdate : ${gm.lastUpdate}"
        if (gm==null) {
            gm=new GroupMember()
            gm.status = MemberStatus.INVALID
        } else if (!gm.status.equals(MemberStatus.CANCELLED)){
            gm.status = MemberStatus.CANCELLED
            gm.lastUpdate = new Date()
            gm.save()
        }
        log.debug "memberCount: ${gm.group.memberCount} - ${gm} status : ${gm.status} lastUpdate : ${gm.lastUpdate} - ${gm.group}"
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
        }
        return gm
    }

    
}