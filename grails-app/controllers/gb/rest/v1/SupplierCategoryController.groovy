package gb.rest.v1

import grails.rest.RestfulController

import gb.SupplierCategory

class SupplierCategoryController extends RestfulController<SupplierCategory> {

    static namespace = 'v1'
    static responseFormats = ['json']
    static boolean readOnly = true

    SupplierCategoryController() {
        super(SupplierCategory, readOnly)
    }

}