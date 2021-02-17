package gb.ui

import gb.EmailService
import gb.Order

class GroupBuyController {

    EmailService emailService

    

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

    //user

    def user() {
        redirect controller: "user", action: "profile"
    }

    //pages
    
    def index() {

    }

    def adout() {

    }

    //terms

    def tos() {

    }

    def privacy() {
        
    }

    def cookie() {
        
    }

}
