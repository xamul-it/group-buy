package gb

class UrlMappings {

    static mappings = {
        
        "/"(controller:"groupBuy",action:"index")

        group "/groupBuy", {
            "/group/$groupId/order/$action?/$orderId?/"(controller:"groupOrder")
        }
        
        "/info"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                controller(validator: {
                    return !(it in ['groupOrder'])
                })
            }
        }

    }
}
