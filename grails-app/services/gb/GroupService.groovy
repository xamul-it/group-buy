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

    List<Group> list (Integer max, boolean allPublicGroups){
        def l
        if (allPublicGroups) {
            log.debug "QUERY ALL"
            l =  Group.findAllByPublicGroup(true, [max: max]) //, model: [groupCount: groupService.count(), allPublicGroups: true]
        } else {
            log.debug "QUERY by user"
            def query = Group.where{
                members{id == springSecurityService.getCurrentUser().getId()}
            }
            l = query.findAll()
        }
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