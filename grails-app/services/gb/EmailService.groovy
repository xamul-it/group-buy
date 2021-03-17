package gb
import grails.gorm.services.Service

import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder

interface IEmailService {
    def orderStatusChange(Order order);
}


/**
 * Emil sending service
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

    def unsubscribe(GroupMember gm) {
        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        def toEmail = user.email
        subscription(gm, toEmail, "Non sei più parte del gruppo ${gm.group.name}")
        subscription(gm, gm.group.owner.email, "L'utente ${gm.group.name} non è più parte del gruppo ${gm.group.name}")
    }

    def subscribe(GroupMember gm) {
        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        def toEmail = user.email
        subscription(gm, toEmail, "Sei parte del gruppo ${gm.group.name}")
        subscription(gm, gm.group.owner.email, "L'utente ${gm.group.name} è parte del gruppo ${gm.group.name}")
    }

    def subscription(GroupMember gm, String toEmail, String message) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')
        def toGroup = gm.group //TODO get the group
        String emailSubject = message
        log.debug "to: ${toEmail}  from: ${fromUsername}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            subject emailSubject
            //text( view:"/email/groupInvitePlain",
            //        model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
            html( view:"/email/subscribtion",
                    model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
        }
    }


    //DEV
    def groupInvite() {
        groupInvite("invited@emaildomain.com", "Sei stato invitato a partecipare al gruppo d'acquisto")
    }

    def groupInvite(GroupMember gm, String toEmail, String message) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        def toGroup = gm.group
        String emailSubject = "${gm.user.username} ti ha invitato a partecipare al gruppo di acquisto ${toGroup.name}"

        log.debug "to: ${toEmail}  from: ${fromUsername}  subject: ${emailSubject}"
        log.debug groovyPageRenderer.render(view: '/email/groupInvitePlain',  model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,basePath:basePath])

        sendMail {
            multipart true
            to toEmail
            subject emailSubject
            text( view:"/email/groupInvitePlain", 		
                    model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
            html( view:"/email/groupInvite", 		
                    model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
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

        sendMail {
            //multipart true
            to "default@site.com"
            from fromEmail
            subject messageSource.getMessage('email.contact.subject', [] as Object[], LocaleContextHolder.locale)
            text( view:"/email/contactPlain", 		
                    model:[fromEmail:fromEmail,messageText:messageText])
        }
    }
}