package gb.ui

class GroupOrderController {

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
