package gb
import grails.gorm.transactions.Transactional

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
        def r = Group.executeQuery("select count(g) "+q , qparam);
        return r[0]
    }

    def query(Map params){
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        log.debug "QUERY by user $userId and $params"
        def qparam= [:]
        String q = "from Group as g where 1=1 "
        if (params.src) {
            q += " and (g.description like :src or " + "g.name like :src )"
            qparam.src = "%$params.src%"
        }
        /*if (params.latitude && params.longitude) {

//            Latitude: 1 deg = 110.574 km
//            Longitude: 1 deg = 111.320*cos(latitude) km

            q += " and (abs(g.lat - :latitude)< 0.1 and abs(g.lon - :longitude)< 0.1)"
            qparam.latitude = Double.valueOf(params.latitude)
            qparam.longitude = Double.valueOf(params.longitude)
        }*/
        if (params.categoryId) {
            q += " and g.category.id=  :categoryId"
            qparam.categoryId = "$params.categoryId".toLong()
        }
        if (userId!=0) {
            if (!params.userId || ((params.userId as long) != userId))
                q += " and (g.publicGroup = true or "
            else q += " and ("
            q += "g in (" +
                    "select gr from GroupMember gm, Group gr " +
                    "where gm.user.id = :user and gm.group.id = gr.id and " +
                    "gm.status=:status" +
                    ") " +
                    "or "
            q += "g.owner.id = :user)"
            qparam.user = (long) userId
            qparam.status = MemberStatus.ACTIVE

        } else {
            q += " and g.publicGroup = true"
        }
        if (params.sort){
            if (params.sort=="creationDate"){
                q += " order by g.$params.sort $params.order"
            }
            if (params.sort=="nearest"){
                q += " order by (ABS(g.lat-$params.latitude) + ABS(g.lon-$params.longitude)) asc"
            }
        }
        log.debug("$params.categoryId : $qparam.categoryId Query $q Params: $qparam")
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