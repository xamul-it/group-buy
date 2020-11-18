package gb.ui

class GroupBuyController {

    def index() {

        redirect action: "groupList"
    }

    def mail() {
        sendMail {
            from "groupbuy"
            to "fred@g2one.com"
            subject "Hello Fred"
            body 'How are you?'
        }
        render "OK!"
    }

    def groupList() {

    }

    def group(){

    }

    def groupEdit(){

    }

    def groupCreate(){

    }

    def groupOrders() {

    }

    def groupMembers() {

    }

    def userProfile() {

    }

    def userSettings() {

    }

}
