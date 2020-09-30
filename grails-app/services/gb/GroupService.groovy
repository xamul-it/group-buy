package gb

class GroupService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    List<Group> autocomplete(String query) {
        def l = Group.findAllByNameLike("%"+query+"%")
        def newL = l.collect {
            [ id: it.id, name: it.name]
        }
        return newL
    }

    Long count (Map params){
        def l
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;

        def query = Group.where {
            //if (userId!=0) members{id == userId}
            if (params.src) {
                like("description", "%"+params.src+"%")
                like("name", "%"+params.src+"%")
            }
        }

        return query.count();
    }

    List<Group> list (Map params){
        def l
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        //log.debug "QUERY by user $userId"
        def query = Group.where {
            //if (userId!=0) members{id == userId}
            if (params.src) {
                like("description", "%"+params.src+"%")
                like("name", "%"+params.src+"%")
            }
        }
        l = query.list(params)

        return l;
    }

    Group save (Group group){
        if (!group.id) {
            if (springSecurityService && springSecurityService.isLoggedIn()) {
                group.owner = springSecurityService.getCurrentUser()
            }
            group.creationDate = new Date()
            group.members.add(group.owner)
        }
        group.members.each() {it.springSecurityService=springSecurityService}
        group.save()
    }

    boolean isOwner (Long groupId) {
        if(groupId<=0)
            return false
        Group group = Group.findById(groupId);
        group?.owner == springSecurityService.getCurrentUser()
    }

}