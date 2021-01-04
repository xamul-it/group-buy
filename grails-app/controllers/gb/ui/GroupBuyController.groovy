package gb.ui

import gb.EmailService
import gb.Order

class GroupBuyController {

    EmailService emailService

    def index() {

    }

    def adout() {

    }

    def mail() {
        //emailService.groupInvite()
        Order order = Order.get(34)
        if (order==null) {
            order.list()[0]
            render "Missing order!"
        }
        else {
            emailService.orderStatusChange(order)
            render "Email sent!"
        }
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

    def user() {
        
    }

    def tos() {

    }

    def privacy() {
        
    }

}
