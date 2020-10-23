package gb.rest.v1

class ApiUrlMappings {

    static mappings = { 
        group "/api", {
            "/$namespace/groups" (resources:'group') {
                "/subscribe" (controller: 'group', action: 'subscribe')//, method: 'PUT')
                "/memberstatuslist" (controller: 'group', action: 'memberStatusList')//, method: 'PUT')
                "/changestatus" (controller: 'group', action: 'changestatus')//, method: 'PUT')
                "/unsubscribe" (controller: 'group', action: 'unsubscribe')//, method: 'PUT')
                "/members" (controller: 'groupMember', action: 'index', method: 'GET')
                "/orders" (resources:'order')
            }
            "/$namespace/categories" (resources:'groupCategory')
            "/$namespace/suppliers" (resources:'supplier')
        }
    }
    
}