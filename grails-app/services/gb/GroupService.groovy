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

    @Listener(Group)
    void onGroupPreInsert(PreInsertEvent event) {
    }

    List<Group> autocomplete(String query) {
        def l = Group.findAllByNameLike("%"+query+"%")
        def newL = l.collect {
            [ id: it.id, name: it.name, description:it.name]
        }
        return newL
    }
}