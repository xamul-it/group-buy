package gb

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"groupBuy",action:"groupList")
        "/info"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
