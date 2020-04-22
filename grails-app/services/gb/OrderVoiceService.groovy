package gb

import grails.gorm.services.Service

@Service(OrderVoice)
interface OrderVoiceService {

    OrderVoice get(Serializable id)

    List<OrderVoice> list(Map args)

    Long count()

    void delete(Serializable id)

    OrderVoice save(OrderVoice orderVoice)

}