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
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        def group = Group.findById(params.groupId)
        def gm = GroupMember.findByUserAndGroupAndStatus(springSecurityService?.getCurrentUser(),group,MemberStatus.ACTIVE)
        def order
        if(gm)
            order = group ? Order.findByGroupAndId(group, params.id) : Order.findByToken(params.id)
        else
            order = new Order()
        log.debug "QUERY by user $gm and $order"
        return order
    }

    /**
     *
     * @param params
     *  latitude
     *  longitude
     * Latitude: 1 deg = 110.574 km
     * Longitude: 1 deg = 111.320*cos(latitude) km
     *  src
     * @return
     */
    def query(Map params){
        def userId = springSecurityService?.getCurrentUser()?.getId()?:0;
        log.debug "QUERY by user $userId and $params"
        def qparam= [:]
        String q = "from Order as s where 1=1 "
        q += "and s.user.id=  :userId "
        qparam.userId = "$userId".toLong()
        if (params.groupId) {
            q += "and s.group.id=  :groupId "
            qparam.groupId = "$params.categoryId".toLong()
        }
        q += "order by orderDate desc"
        log.debug("$params.categoryId : $qparam.categoryId Query $q Params: $qparam")
        return [qparam,q]
    }



    Long count (Map params){
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)
        def r = Order.executeQuery("select count(s) "+q , qparam);
        return r[0]
    }

    List<Order> list (Map params){
        def l
        def qparam= [:]
        String q
        (qparam,q) = query(params)

        qparam.max=params.max
        qparam.offset=params.offset
        def res = Order.findAll(q , qparam)
        log.debug("Risultato "+params.src!=null ? "++ $params.src":"--"+" $res")

        return res
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
