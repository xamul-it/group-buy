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

        if (supplier.contactInfo.email==null){
            supplier.contactInfo.email=springSecurityService.principal.email
        }

        if (supplier.contactInfo.email==springSecurityService.principal.email){
            supplier.owner=springSecurityService.getCurrentUser()

            UserRole us = new UserRole()
            us.user = springSecurityService.getCurrentUser()
            us.role = Role.findByAuthority("ROLE_SUPPLIER")
            us.save()
        }
        return supplier.save()

    }

    /**
     *
     * @param params
     *  latitude
     *  longitude
     *  src
     * @return
     */
    def query(Map params){
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        log.debug "QUERY by user $userId and $params"
        def qparam= [:]
        String q = "from Supplier as s where 1=1 "
        if (params.src) {
            q += "and (s.description like :src or " + "s.name like :src ) "
            qparam.src = "%$params.src%"
        }
        if (params.latitude && params.longitude) {

//            Latitude: 1 deg = 110.574 km
//            Longitude: 1 deg = 111.320*cos(latitude) km

            q += "and (abs(s.lat - :latitude)< 0.1 and abs(s.lon - :longitude)< 0.1) "
            qparam.latitude = Double.valueOf(params.latitude)
            qparam.longitude = Double.valueOf(params.longitude)
        }
        if (params.categoryId) {
            q += "and s.category.id=  :categoryId "
            qparam.categoryId = "$params.categoryId".toLong()
        }
        q += "order by (ABS(s.lat-$params.latitude) + ABS(s.lon-$params.longitude)) asc"
        log.debug("$params.categoryId : $qparam.categoryId Query $q Params: $qparam")
        return [qparam,q]
    }

    Long count (Map params){
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)
        def r = Supplier.executeQuery("select count(s) "+q , qparam);
        return r[0]
    }

    List<Supplier> list(Map params){
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)

        qparam.max=params.max
        qparam.offset=params.offset
        def res = Supplier.findAll(q , qparam)
        log.debug("Risultato "+params.src!=null ? "++ $params.src":"--"+" $res")

        return res
    }

}