package gb.ui

class UiUrlMappings {

    static mappings = { 

        "/group/$groupId/orders/" (controller:"group", action: "orders")

        "/order/create" (controller:"groupOrder", action: "create")

        group "/groupBuy", {
            "/group/$groupId/order/$action?/$orderId?/"(controller:"groupOrder")
            "/order/$orderToken?"(controller:"groupOrder",action:"supplierShow")
            //suppliers near group address  
            "/group/$groupId/suppliers/" (controller:"supplier", action: "list")
            "/suppliers/" (controller:"supplier", action: "list")
            "/supplier/$supplierId?" (controller:"supplier", action: "get")
            "/supplier/$supplierId/$supplierName?" (controller:"supplier", action: "get")
            "/supplier/$supplierId/order" (controller:"supplier", action: "order")
            "/user/$action?/$userId?/"(controller:"user")
        }

        
        
    }
    
}