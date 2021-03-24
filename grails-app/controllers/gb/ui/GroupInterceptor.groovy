package gb.ui

class GroupInterceptor {

    boolean before() { 

        log.debug "$params"

        true 
    }

    boolean after() { 

        def grailsUrlMappingsHolder
        log.debug "grailsUrlMappingsHolder: $grailsUrlMappingsHolder"

        if(!model)
            model = [:]

        def groupIdParam = params.groupId?.isInteger() ? params.groupId.toInteger() : 0
        model.groupId = groupIdParam

        def idParam = params.id?.isInteger() ? params.id.toInteger() : 0
        if(model.groupId == 0)
            model.groupId = idParam

        true 
    }

    void afterView() {
        // no-op
    }
}
