package gb.rest.v1

class UrlMappings {

    static mappings = { 
        group "/api", {
            "/$namespace/groups" (resources:'group') {
                "/members" (controller: 'group', action: 'members', method: 'GET')
                //"/members" (controller: 'groupMember', action: 'index', method: 'GET')
                "/subscribe" (controller: 'group', action: 'subscribe', method: 'PUT')
                "/unsubscribe" (controller: 'group', action: 'unsubscribe', method: 'PUT')
            }
            "/$namespace/categories" (resources:'groupCategory')
        }
    }
    
}