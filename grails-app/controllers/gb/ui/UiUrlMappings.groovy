package gb.ui

class UiUrlMappings {

    static mappings = {

        /*
        "/group/$groupId/orders/" (controller:"group", action: "orders") //group order list

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
        */

        name gruppi: "/gruppi" (controller:"group", action: "list", namespace: 'ui') //group list

        group "/gruppo", {
            name nuovoGruppo: "/nuovo" (controller:"group", action: "create", namespace: 'ui') //create group page

            name schedaGruppo: "/$groupId" (controller:"group", action: "show", namespace: 'ui') //show group page

            name modificaGruppo: "/$groupId/modifica" (controller:"group", action: "edit", namespace: 'ui') //edit group page

            name iscrittiGruppo: "/$groupId/iscritti" (controller:"group", action: "members", namespace: 'ui') //group members page

            name ordiniGruppo: "/$groupId/ordini/" (controller:"group", action: "orders", namespace: 'ui') //group order list

            name visualizzaOrdineGruppo: "/$groupId/ordine/$orderId" (controller:"order", action: 'show', namespace: 'ui')

            name modificaOrdineGruppo: "/$groupId/ordine/$orderId/modifica" (controller:"order", action: 'edit', namespace: 'ui')
        }

        name negozi: "/negozi" (controller:"supplier", action: "list", namespace: 'ui') //supplier list

        group "/negozio", {
            name schedaNegozio: "/$supplierId/$supplierName?" (controller:"supplier", action: "show", namespace: 'ui') //supplier show page
            
            name ordineNegozio: "/$supplierId/ordine" (controller:"supplier", action: "order", namespace: 'ui') //new order for supplier
        }

        group "/ordine", {
            name nuovoOrdine: "/nuovo" (controller:"order", action: "index", namespace: 'ui')  //new order page

            name ordineNegozio: "/$orderToken" (controller:"order", action: "supplierShow", namespace: 'ui')  //order page
        }

        group "/utente", {
            name profiloUtente: "/profilo" (controller:"user", action: "profile", namespace: 'ui') //user profile page

            name preferenzeUtente: "/preferenze" (controller:"user", action: "settings", namespace: 'ui') //user settings page

            name ordiniUtente: "/ordini" (controller:"user", action: "orders", namespace: 'ui') //user orders page

            name gruppiUtente: "/gruppi" (controller:"user", action: "groups", namespace: 'ui') //user groups page
        }

    }
}