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

    @Listener(Supplier)
    void onSupplierPreInsert(PreInsertEvent event) {
    }
}