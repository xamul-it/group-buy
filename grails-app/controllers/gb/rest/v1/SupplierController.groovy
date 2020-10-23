package gb.rest.v1

import grails.rest.RestfulController

import gb.Supplier
import gb.SupplierService

class SupplierController extends RestfulController<Supplier> {

    static namespace = 'v1'
    static responseFormats = ['json']

    SupplierService supplierService
    transient springSecurityService

    SupplierController() {
        super(Supplier)
    }

    /**
     * List all of resource based on parameters
     *
     * @return List of resources or empty if it doesn't exist
     */
    @Override
    protected List<Supplier> listAllResources(Map params) {
        if(params.q)
            supplierService.autocomplete(params.q)
        else
            supplierService.list(params)
    }

}