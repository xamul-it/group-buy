package gb

class UrlMappings {

    static mappings = {
        
        "/"(controller:"groupBuy",action:"index")
        
        "/info"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                controller(validator: {
                    return !(it in ['groupOrder','emailTest'])
                })
            }
        }

    }
}
