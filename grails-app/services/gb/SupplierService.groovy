package gb
import grails.events.annotation.gorm.Listener
import org.grails.datastore.mapping.engine.event.AbstractPersistenceEvent
import org.grails.datastore.mapping.engine.event.PreInsertEvent
import org.grails.datastore.mapping.engine.event.PreUpdateEvent

import grails.gorm.services.Service


interface ISupplierService {

    Supplier get(Serializable id)

    List<Supplier> list(Map args)

    Long count()

    void delete(Serializable id)

    Supplier save(Supplier supplier)

}

@Service(Supplier)
abstract class SupplierService implements ISupplierService {

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    @Listener(Supplier)
    void onSupplierPreInsert(PreInsertEvent event) {
    }

    List<Supplier> autocomplete(String query) {
        def l = Supplier.findAllByNameLike("%"+query+"%")
        def newl = l.collect {
            [ id: it.id, name: it.name]
        }
        return newl
    }

    /**
     * If no id is passed the returned enity is the one that matches the email of the connected user
     *
     * @param id
     * @return
     */

    Supplier get(Serializable id) {
        if (id) {
            return Supplier.get(id)
        } else {
            if (springSecurityService.isLoggedIn()) {
                String email = springSecurityService.principal.email
                Supplier supplier = Supplier.findByEmail(email)
                return supplier ? supplier : new Supplier()
            }
        }
    }

    /**
     * If email of the supplier and the email of the user are the same
     *  -> the user is a Supplier
     *  -> the user owns this record
     * @param supplier
     * @return
     */
    Supplier save(Supplier supplier) {
        String email = springSecurityService.principal.email
        if (supplier.contactInfo.email==springSecurityService.principal.email){
            supplier.owner=springSecurityService.getCurrentUser()

            UserRole us = new UserRole()
            us.user = springSecurityService.getCurrentUser()
            us.role = Role.findByAuthority("ROLE_SUPPLIER")
            us.save()
        }
        return supplier.save()

    }

}