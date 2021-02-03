package gb.rest.v1

import grails.rest.RestfulController

import gb.OrderVoice
import gb.OrderVoiceService

class OrderVoiceController extends RestfulController<OrderVoice> {

    static namespace = 'v1'
    static responseFormats = ['json']

    OrderVoiceService orderVoiceService
    transient springSecurityService

    OrderVoiceController() {
        super(OrderVoice)
    }

    /**
     * Shows a single resource
     * @param params
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
    protected List<OrderVoice> listAllResources(Map params) {
        log.debug "orderVoices listAllResources" + params
        response.setHeader('X-Pagination-Total', orderVoiceService.count(params).toString())
        orderVoiceService.list(params)
    }

    /**
     * Queries for a resource for the given params
     *
     * @param params
     * @return The resource or null if it doesn't exist
     */
    protected OrderVoice queryForResource(Map params) {
        orderVoiceService.get(params)
    }

    protected OrderVoice createResource() {
        OrderVoice orderVoice = resource.newInstance()
        orderVoice.springSecurityService = springSecurityService
        bindData orderVoice, getObjectToBind()

        orderVoice
    }


}