package gb

class GroupMemberService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

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

}