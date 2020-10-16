package gb.rest.v1

import grails.rest.RestfulController

import gb.Order
import gb.OrderService

class OrderController extends RestfulController<Order> {

    static namespace = 'v1'
    static responseFormats = ['json']

    OrderService orderService
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
        log.debug "orders listAllResources" + params
        response.setHeader('X-Pagination-Total', orderService.count(params).toString())
        orderService.list(params)
    }

    /**
     * Queries for a resource for the given id
     *
     * @param id The id
     * @return The resource or null if it doesn't exist
     */
    protected Order queryForResource(Map params) {
        orderService.get(params)
    }



}