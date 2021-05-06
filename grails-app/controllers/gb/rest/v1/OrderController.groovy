package gb.rest.v1

import grails.gorm.transactions.Transactional

import grails.rest.RestfulController

import gb.Order
import gb.OrderStatusLog
import gb.OrderStatus
import gb.OrderService
import gb.EmailService

class OrderController extends RestfulController<Order> {

    static namespace = 'v1'
    static responseFormats = ['json']

    OrderService orderService
    EmailService emailService
    transient springSecurityService

    OrderController() {
        super(Order)
    }

    /**
     * Shows a single resource
     * @param id The id of the resource
     * @return The rendered resource or a 404 if it doesn't exist
     */
    def show() {
        respond queryForResource(params)
    }

    /**
     * List all of resource based on parameters
     *
     * @return List of resources or empty if it doesn't exist
     */
    @Override
    protected List<Order> listAllResources(Map params) {
        response.setHeader('X-Pagination-Total', orderService.count(params).toString())
        orderService.list(params)
    }

    /**
     * Queries for a resource for the given params
     *
     * @param params
     * @return The resource or null if it doesn't exist
     */
    protected Order queryForResource(Map params) {
        orderService.get(params)
    }

    /**
     * Sets order status to SENT
     */
    @Transactional
    def sent() {
        def o = orderService.changeStatusTo(params, OrderStatus.SENT)
        emailService.orderStatusChange(o)
        emailService.sentToSupplier(o)
        log.debug("\n mailService: " + emailService)
        respond o
    }

    /**
     * Sets order status to ACCEPTED
     */
    @Transactional
    def accepted() {
        def o = orderService.changeStatusTo(params, OrderStatus.ACCEPTED)
        emailService.orderStatusChange(o)
        respond o
    }

    /**
     * Sets order status to REJECTED
     */
    @Transactional
    def rejected() {
        def o = orderService.changeStatusTo(params, OrderStatus.REJECTED)
        emailService.orderStatusChange(o)
        respond o, [status: OK]
    }

    /**
     * Sets order status to SHIPPED
     */
    @Transactional
    def shipped() {
        def o = orderService.changeStatusTo(params, OrderStatus.SHIPPED)
        emailService.orderStatusChange(o)
        respond o
    }

    /**
     * Sets order status to DELIVERED
     */
    @Transactional
    def delivered() {
        def o = orderService.changeStatusTo(params, OrderStatus.DELIVERED)
        emailService.orderStatusChange(o)
        respond o, [status: OK]
    }

    /**
     * Sets order status to DELIVERED
     */
    @Transactional
    def statusLog() {
        def o = orderService.statusLog(params)
        respond o, [status: OK]
    }

    @Override
    protected Order createResource() {
        Order order = resource.newInstance()
        order.springSecurityService = springSecurityService
        bindData order, getObjectToBind()
        OrderStatusLog statusLog = new OrderStatusLog(order: order,
                status: OrderStatus.ACTIVE,
                date: new Date(),
                user: 1).save()

        order
    }

    @Override
    protected Order saveResource(Order order) {
        orderService.save(order)
        emailService.orderStatusChange(order)
        order
    }
}