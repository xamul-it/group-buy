package gb.ui

class GroupBuyInterceptor {

    boolean before() { true }

    boolean after() { 

        if(!model)
            model = [:]

        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        model.groupId = groupIdParam

        true 
    }

    void afterView() {
        // no-op
    }
}
