package gb

import grails.util.Environment

class UrlMappings {

    static mappings = {
        
        "/"(controller:"groupBuy",action:"index")
        
        if (Environment.current == Environment.DEVELOPMENT ||
            Environment.current == Environment.TEST) {

            "/info"(view:"/index")

        }
        
        "/tos"(view:"/tos")
        "/privacy"(view:"/privacy")
        "/cookie"(view:"/cookie")
        "/chisiamo"(view:"/chisiamo")

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
