package gb

import grails.gorm.services.Service

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

    @Autowired
    transient grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    Order get(Map params) {
        def group = Group.findById(params.groupId)

        def order = group ? Order.findByGroupAndId(group, params.id) : null
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
        if (!order.id){
            order.supplier = order.supplier?.id ? supplierService.get(order.supplier.id) : null
            order.group = order?.group?.id ? groupService.get(order.group.id) : null
            order.orderDate = new Date()
        }
        println("OrderService springSecurityService:"+springSecurityService )
        if (springSecurityService) {
            if (order.supplier) order.supplier.springSecurityService = springSecurityService
            if (order.group) order.group.springSecurityService = springSecurityService
            order.orderVoice.each(){ it.springSecurityService=springSecurityService }
        }
        order.save()
    }

}
