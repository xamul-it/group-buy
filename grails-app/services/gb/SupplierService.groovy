package gb

import grails.gorm.services.Service

@Service(Supplier)
interface SupplierService {

    Supplier get(Serializable id)

    List<Supplier> list(Map args)

    Long count()

    void delete(Serializable id)

    Supplier save(Supplier supplier)

}