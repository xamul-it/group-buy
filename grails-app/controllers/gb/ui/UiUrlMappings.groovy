package gb.ui

class UiUrlMappings {

    static mappings = { 

        group "/groupBuy", {
            "/group/$groupId/order/$action?/$orderId?/"(controller:"groupOrder")
            "/order/$orderToken?"(controller:"groupOrder",action:"supplierShow")
            //suppliers near group address  
            "/group/$groupId/suppliers/" (controller:"supplier", action: "list")
            "/suppliers/" (controller:"supplier", action: "list")
            "/supplier/$supplierId?" (controller:"supplier", action: "get")
            "/supplier/$supplierId/order" (controller:"supplier", action: "order")
        }
        
    }
    
}