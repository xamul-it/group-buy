package gb.ui

class UiUrlMappings {

    static mappings = { 

        group "/groupBuy", {
            "/group/$groupId/order/$action?/$orderId?/"(controller:"groupOrder")
            "/order/$orderId?"(controller:"groupOrder",action:"supplierShow")
        }
        
    }
    
}