package gb.rest.v1

class UrlMappings {

    static mappings = { 
        group "/api", {
            "/$namespace/groups" (resources:'group') {
                "/subscribe" (controller: 'group', action: 'subscribe')//, method: 'PUT')
                "/unsubscribe" (controller: 'group', action: 'unsubscribe')//, method: 'PUT')
                "/members" (controller: 'groupMember', action: 'index', method: 'GET')
            }
            "/$namespace/categories" (resources:'groupCategory')
        }
    }
    
}