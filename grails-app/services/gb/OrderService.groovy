package gb

import grails.gorm.services.Service
import grails.util.Holders

interface IOrderService {

    Order get(Serializable id)

    Order get(Map args)

    List<Order> list(Map args)

    Long count()

    void delete(Serializable id)

    Order save(Order order)

}

@Service(Order)
abstract class OrderService implements IOrderService {
    SupplierService supplierService
    GroupService groupService
    //@Autowired
    EmailService emailService //= Holders.grailsApplication.mainContext.getBean('emailService')

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    Order get(Map params) {

        def group = Group.findById(params.groupId)

        def order = group ? Order.findByGroupAndId(group, params.id) : Order.findByToken(params.id)
    }

    Long count (Map params){
        def group = Group.findById(params.groupId)
        def orderCount = 0
        
        orderCount = group ? Order.countByGroup(group) : 0
    }

    List<Order> list (Map params){
        def group = Group.findById(params.groupId)
        def ordersList = []
       
        ordersList = group ? Order.findAllByGroup(group, params) : []
        
        ordersList        
    }

    Order save(Order order) {
        EmailService emailService = Holders.grailsApplication.mainContext.getBean('emailService')
        if (!order.id){
            order.supplier = order.supplier?.id ? supplierService.get(order.supplier.id) : null
            order.group = order?.group?.id ? groupService.get(order.group.id) : null
            order.orderDate = new Date()
        }

        if (springSecurityService) {
            if (order.supplier) order.supplier.springSecurityService = springSecurityService
            if (order.group) order.group.springSecurityService = springSecurityService
            order.orderVoice.each(){ it.springSecurityService=springSecurityService }
        }
        emailService.orderStatusChange(order)
        log.debug("OrderService springSecurityService:"+springSecurityService +" mailService"+emailService )
        order.save()
    }

    Order changeStatusTo(Map params, OrderStatus orderStatus) {
        EmailService emailService = Holders.grailsApplication.mainContext.getBean('emailService')
        def group = Group.findById(params.groupId)
        def order = group ? Order.findByGroupAndId(group, params.id) : Order.findByToken(params.id)
        order.status = orderStatus
        OrderStatusLog statusLog = new OrderStatusLog(order: order,
                status: orderStatus,
                date:new Date(),
                user:springSecurityService.getCurrentUser()).save()
        emailService.orderStatusChange(order)
        log.debug("\nOrderService springSecurityService: "+springSecurityService +
                " mailService: "+emailService+
                " groupService: "+groupService+
                " supplierService: "+supplierService
        )
        order.save()
    }

    List<OrderStatusLog> statusLog (Map params){
        def order = OderStatusLog.findById(params.orderId)
        def ordersList = []
        ordersList = group ? OrderStatusLog.findAllByOrder(order, params) : []
        ordersList
    }


}
