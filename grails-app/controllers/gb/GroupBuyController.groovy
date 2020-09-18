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
        def isDebugParam = params.debug == 'true'?:'false'

        ['isDebug': isDebugParam]
    }

    def group(){
        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        def isEditParam = params.edit == 'true'?:'false'
        def isDebugParam = params.debug == 'true'?:'false'

        ['groupId': groupIdParam, 'isEdit': isEditParam, 'isDebug': isDebugParam]
    }

    def groupOrders() {
        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        def isDebugParam = params.debug == 'true'?:'false'

        ['groupId': groupIdParam, 'isDebug': isDebugParam]
    }

    def groupMembers() {        
        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        def isDebugParam = params.debug == 'true'?:'false'

        ['groupId': groupIdParam, 'isDebug': isDebugParam]
    }

    def shops(){
	}

    def userProfile() {

    }

    def userSettings() {

    }

    def pricelist() {
        
    }
    
}
