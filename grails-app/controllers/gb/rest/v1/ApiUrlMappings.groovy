package gb.rest.v1

class ApiUrlMappings {

    static mappings = { 
        group "/api", {
            "/$namespace/groups" (resources:'group') {
                "/subscribe" (controller: 'group', action: 'subscribe')//, method: 'PUT')
                "/memberstatuslist" (controller: 'group', action: 'memberStatusList')//, method: 'PUT')
                "/changestatus" (controller: 'group', action: 'changestatus')//, method: 'PUT')
                "/unsubscribe" (controller: 'group', action: 'unsubscribe')//, method: 'PUT')
                "/invite" (controller: 'group', action: 'invite')
                "/members" (controller: 'groupMember', action: 'index', method: 'GET')
                "/orders" (resources:'order') {
                    "/voices" (resources:'orderVoice')
                }
                "/orders/$id/$action(.$format)?" (controller:'order', excludes:['index', 'delete', 'update', 'save', 'list'])
            }
            "/$namespace/users" (resources:'user')
            "/$namespace/users/$action(.$format)?" (controller:'user', excludes:['index', 'show', 'delete', 'update', 'save', 'list'])
            "/$namespace/groupCategories" (resources:'groupCategory')
            "/$namespace/supplierCategories" (resources:'supplierCategory')
            "/$namespace/suppliers" (resources:'supplier')
            "/$namespace/orders" (resources:'order', excludes:['delete', 'update', 'save', 'list', 'show'])
            "/$namespace/orders/$id/$action(.$format)?" (controller:'order', excludes:['index', 'delete', 'update', 'save', 'list'])

        }
    }
    
}