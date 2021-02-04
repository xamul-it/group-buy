<<<<<<< HEAD
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
=======
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

        true 
    }

    void afterView() {
        // no-op
    }
}
>>>>>>> b93c39cf32d719a77b044e90c88e7373debc3e16
