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
    static String fromUsername = "noreply@groupbuy.it"

    grails.core.GrailsApplication grailsApplication

    grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    def groupMailSend(GroupMember gm, String toEmail, String userEmail, String emailSubject, String emailMessage, String emailView) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        log.debug "groupMailSend -> to: ${toEmail}  from: ${fromUsername}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            subject emailSubject
            text( view:"${emailView}Plain",
                    model:[fromUsername:fromUsername,userEmail:userEmail,toGroup:gm.group,message:emailSubject,basePath:basePath])
            html( view:emailView,
                model:[fromUsername:fromUsername,userEmail:userEmail,toGroup:gm.group,message:emailSubject,basePath:basePath])
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

    /**
     * Each time an order is changed a mail with the following information is sent
     * to all group partecipants:
     *  List of ordered
     *
     * @return
     */
    def orderStatusChange(Order order){
        order.group.members.each { member ->
            def toEmail = member.user.email
            orderStatusChange(order,toEmail)
        }
        orderStatusChange(order,order.group.owner.email)
    }

    def orderStatusChange(Order order, String toEmail) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')
//        def user = null
//        user = User.get(springSecurityService.getPrincipal().id)
        //def fromUsername = "noreply@groupbuy.it"

        def message = "L'ordine numero ${order.id} ha cambiato stato ora é in stato '${order.status.value}'"
        def toGroup = order.group //TODO get the group
        String emailSubject = "Ordine ${order.id} del gruppo di acquisto ${order.group.name}"
        log.debug "to: ${toEmail}  from: ${fromUsername}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            from fromUsername
            subject emailSubject
            //text( view:"/email/changeStatus",
            //        model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
            html(view: "/email/changeStatus",
                    model: [fromUsername: fromUsername, toEmail: toEmail, toGroup: toGroup, message: message, basePath: basePath, order: order])
        }
    }

    def sentToSupplier(Order order) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')
//        def user = null
//        user = User.get(springSecurityService.getPrincipal().id)
        String toEmail = order.supplier.contactInfo.email
        def message = "Hai ricevuto l'ordine ${order.id} del gruppo di acquisto ${order.group.name}"
        def toGroup = order.group //TODO get the group
        String emailSubject = "Hai ricevuto l'ordine ${order.id} del gruppo di acquisto ${order.group.name}"
        log.debug "to: ${toEmail}  from: ${fromUsername}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            from fromUsername
            subject emailSubject
            //text( view:"/email/changeStatus",
            //        model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
            html(view: "/email/supplierOrder",
                    model: [fromUsername: fromUsername, toEmail: toEmail, toGroup: toGroup, message: message, basePath: basePath, order: order])
        }
    }


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