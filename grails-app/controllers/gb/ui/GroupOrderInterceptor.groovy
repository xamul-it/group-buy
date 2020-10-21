package gb.ui

class GroupOrderInterceptor {

    boolean before() { true }

    boolean after() { 

        if(!model)
            model = [:]

        def groupIdParam = params.groupId?.isInteger() ? params.groupId.toInteger() : 0
        model.groupId = groupIdParam

        def orderIdParam = params.orderId?.isInteger() ? params.orderId.toInteger() : 0
        model.orderId = orderIdParam

        def isDebugParam = params.debug == 'true'?:'false'
        model.isDebug = isDebugParam

        true 
    }

    void afterView() {
        // no-op
    }
}
