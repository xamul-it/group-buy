package gb

class UrlMappings {

    static mappings = {

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        
        "/vetrina"(controller:"groupBuy",action:"shops")
        "/"(controller:"groupBuy",action:"index")
        "/info"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
