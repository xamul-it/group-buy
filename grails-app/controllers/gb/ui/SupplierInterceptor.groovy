package gb.ui

class SupplierInterceptor {

    boolean before() { true }

    boolean after() { 

        if(!model)
            model = [:]

        def groupIdParam = params.groupId?.isInteger() ? params.groupId.toInteger() : 0
        model.groupId = groupIdParam

        def supplierIdParam = params.supplierId?.isInteger() ? params.supplierId.toInteger() : 0
        model.supplierId = supplierIdParam

        true 
    }

    void afterView() {
        // no-op
    }
}
