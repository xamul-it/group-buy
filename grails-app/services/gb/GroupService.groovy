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
        def qparam= [:]
        String q
        (qparam,q) = query(params)
        return Group.countBy(q , qparam);
    }

    def query(Map params){
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        println "QUERY by user $userId and $params"
        def qparam= [:]
        String q = "from Group as g where 1=1 and "
        if (params.src) {
            q += "(g.description like :src or " + "g.name like :src ) and "
            qparam.src = params.src
        }
        if (userId!=null) {
            q += "(g.publicGroup = true or "
            //q += "q.members.id = :user or"
            q += "g.owner.id = :user)"
            qparam.user = (long)userId
        }
        if (params.sort){
            if (params.sort=="creationDate"){
                q += " order by g.$params.sort $params.order"
            }
            if (params.sort=="nearest"){
                q += " order by (ABS(g.lat-$params.latitude) + ABS(g.lon-$params.longitude)) asc"
            }
        }
        return [qparam,q]
    }

    List<Group> list (Map params){
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)

        qparam.max=params.max
        qparam.offset=params.offset
        def res = Group.findAll(q , qparam)
        log.debug("Risultato "+params.src!=null ? "++ $params.src":"--"+" $res")

        return res
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