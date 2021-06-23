package gb
import grails.gorm.services.Service

import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder

interface IEmailService {
    def orderStatusChange(Order order);
}


/**
 * Email sending service
 *
 * Managed emails:
 * -> Invite user
 * -> OrderStatusChange
 * -> UserAdded to group
 *
 */

class EmailService implements IEmailService {

    MessageSource messageSource

    grails.gsp.PageRenderer groovyPageRenderer
    static String appEmail = "noreply@proprioqui.it"

    grails.core.GrailsApplication grailsApplication

    grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    def groupMailSend(GroupMember gm, String toEmail, String userEmail, String emailSubject, String emailMessage, String emailView) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        log.debug "groupMailSend -> to: ${toEmail}  from: ${appEmail}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            from appEmail
            subject emailSubject
            text( view:"${emailView}Plain",
                    model:[fromUsername:appEmail,userEmail:userEmail,toGroup:gm.group,message:emailSubject,basePath:basePath])
            html( view:emailView,
                model:[fromUsername:appEmail,userEmail:userEmail,toGroup:gm.group,message:emailSubject,basePath:basePath])
        }
    }

    def subscribe(GroupMember gm) {
        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        if(user) {
            groupMailSend(gm, user.email, user.email, "Benvenuto in ${gm.group.name}", "/email/subscribe")
            groupMailSend(gm, gm.group.owner.email, user.email, "${user.email} si è iscritto a ${gm.group.name}", "/email/subscription-alert")
        } else {
            log.error "No user available! Please login!"
        }
    }

    def unsubscribe(GroupMember gm) {
        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        if(user) {
            groupMailSend(gm, user.email, user.email, "Hai lasciato ${gm.group.name}", "/email/unsubscribe")
            groupMailSend(gm, gm.group.owner.email, user.email, "${user.email} ha lasciato ${gm.group.name}", "/email/subscription-alert")
        } else {
            log.error "No user available! Please login!"
        }
    }

    def groupInvite(GroupMember gm, String toEmail, String message) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        if(user) {
            if(gm) {
                groupMailSend(gm, toEmail, user.email, "Sei invitato a partecipare al gruppo", message, "/email/groupInvite")
            } else {
                log.error "You are not member of group. Please subscribe!"
            }
        } else {
            log.error "No user available. Please login!"
        }
    }



    def orderMailSend(Order order, String toEmail, String userEmail, String emailSubject, String emailMessage, String emailView) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        log.debug "orderMailSend -> to: ${toEmail}  from: ${appEmail}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            from appEmail
            subject emailSubject
            text( view:"${emailView}Plain",
                    model:[fromUsername:appEmail, userEmail:userEmail, toGroup:order.group, message:emailMessage, basePath:basePath, order:order])
            html( view:emailView,
                model:[userEmail:userEmail, toGroup:order.group, message:emailMessage, basePath:basePath, order:order])
        }
    }

    /**
     * Each time an order is changed a mail with the following information is sent
     * to all group partecipants:
     * List of ordered
     * @return
     */
    def orderStatusChange(Order order){
        order.group.members.each { member ->
            if(!order.group.owner.email.equals(member.user.email))
                orderStatusChange(order,member.user.email)
            //return true
        }
        orderStatusChange(order,order.group.owner.email)
    }

    def orderStatusChange(Order order, String toEmail) {
        orderMailSend(order, toEmail, toEmail, "Ordine ${order.id} ${order.status.value}", "L'ordine numero ${order.id} ora è in stato '${order.status.value.toUpperCase()}'", "/email/order-status")
    }

    def sentToSupplier(Order order) {
        String toEmail = order.supplier.contactInfo.email
        orderMailSend(order, toEmail, toEmail, "Hai ricevuto un nuovo ordine da ${order.group.name}", "Hai ricevuto un nuovo ordine da ${order.group.name}", "/email/supplier-order")
    }

    //Contact
    def contact(String fromEmail, String messageText) {
        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }

        log.debug "contact ${LocaleContextHolder.getLocale()} ${messageSource.getMessage('email.contact.subject', [] as Object[], LocaleContextHolder.locale)}"

        sendMail {
            //multipart true
            to messageSource.getMessage('site.contact.email.info', [] as Object[], LocaleContextHolder.locale)
            from fromEmail
            subject messageSource.getMessage('email.contact.subject', [] as Object[], LocaleContextHolder.locale)
            text( view:"/email/contactPlain", 		
                    model:[fromEmail:fromEmail,messageText:messageText])
        }
    }
}