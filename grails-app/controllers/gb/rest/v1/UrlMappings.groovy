package gb.rest.v1

class UrlMappings {

    static mappings = { 
        group "/api", {
            "/$namespace/groups" (resources:'group') {
                "/groupMembers" (controller: 'groupMember', action: 'index', method: 'GET')
                //Subscribe e unsubscribe possono essere anche in get, non ricevono parametri
                "/subscribe" (controller: 'group', action: 'subscribe')//, method: 'PUT')
                "/unsubscribe" (controller: 'group', action: 'unsubscribe')//, method: 'PUT')
                "/members" (controller: 'group', action: 'members', method: 'GET')

            }
            "/$namespace/categories" (resources:'groupCategory')
        }
    }
    
}