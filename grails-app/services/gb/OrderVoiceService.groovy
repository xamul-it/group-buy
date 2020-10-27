package gb

import grails.gorm.services.Service

interface IOrderVoiceService {

    OrderVoice get(Serializable id)

    List<OrderVoice> list(Map params)

    Long count(Map params)

    void delete(Serializable id)

    OrderVoice save(OrderVoice orderVoice)

}

@Service(OrderVoice)
abstract class OrderVoiceService implements IOrderVoiceService {

    OrderVoice get(Map params) {
        def order = Order.findById(params.orderId)
        def orderVoice = order ? OrderVoice.findByOrderAndId(order, params.id) : null
    }

    List<OrderVoice> list(Map params) {
        def order = Order.findById(params.orderId)
        def orderVoiceList = []
       
        orderVoiceList = order ? OrderVoice.findAllByOrder(order, params) : []
        orderVoiceList        
    }

    Long count(Map params) {
        def order = Order.findById(params.orderId)
        def orderVoiceCount = 0
        orderVoiceCount = order ? OrderVoice.countByOrder(order) : 0
    }

}
