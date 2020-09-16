package gb

class GroupBuyController {

    def index() {
        redirect action: "groupList"
    }

    def orders(){
    }

    def groups(){
    }

    def suppliers(){
    }

    def groupList() {

    }

    def group(){

        //sanitize params
        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        def isEditParam = params.edit == 'true'?:'false'
        def isDebugParam = params.debug == 'true'?:'false'

        ['groupId': groupIdParam, 'isEdit': isEditParam, 'isDebug': isDebugParam]
    }

    def groupOrders() {

    }

    def groupMembers() {
        
    }

    def shops(){
	}

    def auth() {
	}

    def userProfile() {

    }

    def userSettings() {

    }

    def pricelist() {
        
    }
    
}
