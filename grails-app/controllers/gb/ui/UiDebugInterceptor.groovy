package gb.ui

class UiDebugInterceptor {

    public UiDebugInterceptor() {
        matchAll().excludes(namespace: 'v1').excludes(controller: 'sitemap').excludes(controller: 'auth')
    }

    boolean before() { true }

    boolean after() { 

        log.debug("UiDebugInterceptor after $params")

        if(!model)
            model = [:]

        def isDebugParam = params.debug == 'true'?:'false'
        model.isDebug = isDebugParam

        true 
    }

    void afterView() {
        // no-op
    }
}
