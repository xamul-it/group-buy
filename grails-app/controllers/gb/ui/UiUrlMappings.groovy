package gb.ui

class UiUrlMappings {

    static mappings = {

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

            name ordineNegozioToken: "/$orderToken" (controller:"order", action: "supplierShow", namespace: 'ui')  //order page
        }

        group "/utente", {

            name utente: "/" (controller:"user", action: "index", namespace: 'ui') //use main page (redirect)

            name profiloUtente: "/profilo" (controller:"user", action: "profile", namespace: 'ui') //user profile page

            name preferenzeUtente: "/preferenze" (controller:"user", action: "settings", namespace: 'ui') //user settings page

            name ordiniUtente: "/ordini" (controller:"user", action: "orders", namespace: 'ui') //user orders page

            name gruppiUtente: "/gruppi" (controller:"user", action: "groups", namespace: 'ui') //user groups page

            name benvenutoUtente: "/benvenuto" (controller:"user", action: "welcome", namespace: 'ui') //user welcome page
        }

    }
}