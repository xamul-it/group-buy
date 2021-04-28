package gb.ui

class OrderController {

    static namespace = 'ui'

    def index() {
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
