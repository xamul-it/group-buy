package gb

class GroupBuyController {

    def index() {
        redirect action: "groupList"
    }

    /*def orders(){
    }*/

    /*def groups(){
    }*/

    /*def suppliers(){
    }*/

    /*def shops(){
	}*/

    /*def pricelist() { 
    }*/

    def groupList() {
        def isDebugParam = params.debug == 'true'?:'false'

        ['isDebug': isDebugParam]
    }

    def group(){
        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        def isDebugParam = params.debug == 'true'?:'false'

        ['groupId': groupIdParam, 'isEdit': false, 'isDebug': isDebugParam]
    }

    def groupEdit(){
        def groupIdParam = params.id?.isInteger() ? params.id.toInteger() : 0
        def isDebugParam = params.debug == 'true'?:'false'

        ['groupId': groupIdParam, 'isEdit': true, 'isDebug': isDebugParam]
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

    def userProfile() {
        def isDebugParam = params.debug == 'true'?:'false'

        ['isDebug': isDebugParam]
    }

    def userSettings() {
        def isDebugParam = params.debug == 'true'?:'false'

        ['isDebug': isDebugParam]
    }
    
}
