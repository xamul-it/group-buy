package gb

class GroupMemberService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    Long count (Map params){
        return 10L
    }

    List<GroupMember> list (Map params){
        return []
    }

}