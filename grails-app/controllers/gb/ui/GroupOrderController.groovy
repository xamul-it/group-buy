package gb.ui

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
        
    }

    def supplierShow() {
        log.debug "GroupOrderController.supplierShow $params"
    }
    
}
