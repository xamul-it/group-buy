package gb.ui

class GroupBuyInterceptor {

    boolean before() { true }

    boolean after() { 

        if(!model)
            model = [:]

        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        model.groupId = groupIdParam

        def isDebugParam = params.debug == 'true'?:'false'
        model.isDebug = isDebugParam

        true 
    }

    void afterView() {
        // no-op
    }
}
