package gb.ui

import gb.EmailService

class GroupBuyController {

    EmailService emailService

    def index() {

        redirect action: "groupList"
    }

    def mail() {
        emailService.groupInvite()
        render "Email sent!"
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
