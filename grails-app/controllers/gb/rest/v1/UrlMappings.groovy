package gb.rest.v1

class UrlMappings {

    static mappings = { 
        group "/api", {
            "/$namespace/groups" (resources:'group') {
                "/members" (controller: 'group', action: 'members', method: 'GET')
                "/subscribe" (controller: 'group', action: 'subscribe', method: ['PUT','POST'])
                "/unsubscribe" (controller: 'group', action: 'unsubscribe', method: ['PUT','POST'])
            }
            "/$namespace/categories" (resources:'groupCategory')
        }
    }
    
}