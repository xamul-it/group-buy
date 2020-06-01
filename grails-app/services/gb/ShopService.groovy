package gb

import grails.gorm.services.Service

@Service(Shop)
interface ShopService {

    Shop get(Serializable id)

    List<Shop> list(Map args)

    Long count()

    void delete(Serializable id)

    Shop save(Shop shop)

}