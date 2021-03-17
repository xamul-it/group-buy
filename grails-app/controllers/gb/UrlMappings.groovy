package gb

import grails.util.Environment

class UrlMappings {

    static mappings = {
                
        if (Environment.current == Environment.DEVELOPMENT ||
            Environment.current == Environment.TEST) {
            "/info"(view:"/index")
        }
        
        //pages
        "/"(view:"/home")
        "/chisiamo"(view:"/chisiamo")
        "/faq"(view:"/faq")

        "/tos"(view:"/tos")
        "/privacy"(view:"/privacy")
        "/cookie"(view:"/cookie")
        
        //error codes
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
