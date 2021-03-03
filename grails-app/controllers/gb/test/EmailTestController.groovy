package gb.test

import grails.web.http.HttpHeaders
import grails.gorm.transactions.Transactional
import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.*

import gb.GroupService
import gb.GroupMemberService
import gb.EmailService
import gb.OrderService

import gb.Group
import gb.GroupMember
import gb.MemberStatus
import gb.User
import gb.Order
import gb.OrderStatus


class EmailTestController {

    GroupService groupService
    GroupMemberService groupMemberService
    OrderService orderService
    EmailService emailService
    transient springSecurityService

    def index() {
        render "EmailTestController index"
    }

    @Transactional
    def subscribe(){
        GroupMember gm = groupMemberService.subscribe(1)
        emailService.subscribe(gm)
        respond gm.group, [formats: ['xml', 'json'], status: CREATED]
    }

    @Transactional
    def unsubscribe(){
        GroupMember gm = groupMemberService.unsubscribe(1)
        emailService.unsubscribe(gm)
        respond gm.group, [formats: ['xml', 'json'], status: CREATED]
    }

    @Transactional
    def invite(){
        def email = "invited@domain.ext"
        def inviteText = "Sei invitato a partecipare al gruppo"
        GroupMember gm = groupMemberService.inviteUser(1,email,inviteText)
        emailService.groupInvite(gm, email, inviteText)
        respond gm, [formats: ['xml', 'json'], status: CREATED]
    }

    //Orders

    @Transactional
    def sent() {
        def p = [groupId:1,id:59]
        def o = orderService.changeStatusTo(p, OrderStatus.SENT)
        emailService.orderStatusChange(o)
        emailService.sentToSupplier(o)
        respond o, [formats: ['xml', 'json']]
    }

}