package gb.ui

class UserInterceptor {

    boolean before() { true }

    boolean after() { 

        if(!model)
            model = [:]

        //def userIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        //model.userId = userIdParam

        def isDebugParam = params.debug == 'true'?:'false'
        model.isDebug = isDebugParam

        true 
    }

    void afterView() {
        // no-op
    }
}
