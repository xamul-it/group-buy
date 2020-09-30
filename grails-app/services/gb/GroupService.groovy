package gb

import grails.events.annotation.gorm.Listener
import grails.gorm.services.Service
import org.grails.datastore.mapping.engine.event.PreInsertEvent


interface IGroupService {

    Group get(Serializable id)

    List<Group> list(Map args)

    Long count()

    void delete(Serializable id)

    Group save(Group group)

}

@Service(Group)
abstract class GroupService implements IGroupService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    @Listener(Group)
    void onGroupPreInsert(PreInsertEvent event) {
    }

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
            or {
                if (userId != 0) members { id == userId }
                eq ("publicGroup", true)
            }
            if (params.src) {
                or {
                    like("description", "%"+params.src+"%")
                    like("name", "%"+params.src+"%")
                }
            }
        }

        return query.count();
    }


    List<Group> list (Map params){
        def l
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        println "QUERY by user $userId"
        def query = Group.where {
            or {
                if (userId != 0) members { id == userId }
                eq("publicGroup",true)
            }
            if (params.src) {
                or {
                    like("description", "%"+params.src+"%")
                    like("name", "%"+params.src+"%")
                }
            }
        }
        l = query.list(params)

        return l;
    }

    

//    Group subscribe(Long id){
//        def g = Group.findById(id);
////        g.addToMembers(springSecurityService.getCurrentUser()).save(flush:true);
//        g.members.add(springSecurityService.getCurrentUser())
//        save(g);
//        return g
//    }

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
}