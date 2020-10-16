package gb

class GroupOrderController {

    def index() {
        render "GroupOrderController index $params"
        //redirect controller: "groupBuy", action: "group", id: params.groupId
    }

    def show() {
        forward action: "edit"
    }

    def edit() {
        
    }

    def create() {
        forward action: "edit", orderId: 13
    }
    
}
