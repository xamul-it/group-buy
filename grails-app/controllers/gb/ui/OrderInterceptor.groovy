package gb.ui

class OrderInterceptor {

    boolean before() { true }

    boolean after() { 

        if(!model)
            model = [:]

        def groupIdParam = params.groupId?.isInteger() ? params.groupId.toInteger() : 0
        model.groupId = groupIdParam

        def orderIdParam = params.orderId?.isInteger() ? params.orderId.toInteger() : 0
        model.orderId = orderIdParam

        true 
    }

    void afterView() {
        // no-op
    }
}
