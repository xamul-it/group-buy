package gb
import grails.gorm.services.Service

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
    grails.gsp.PageRenderer groovyPageRenderer

    grails.core.GrailsApplication grailsApplication

    grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    //DEV
    def groupInvite() {
        groupInvite("invited@emaildomain.com", "Sei stato invitato a partecipare al gruppo d'acquisto")
    }

    def groupInvite(String toEmail, String message) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        def fromUsername = user?user.username:"sender name"
        def toGroup = Group.get(2) //TODO get the group 
        String emailSubject = "Invito al gruppo: ${toGroup.name}"

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
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')

        def user = null
        user = User.get(springSecurityService.getPrincipal().id)
        def fromUsername = user?user.username:"sender name"
        def toEmail = order.group.owner.email
        def message = "L'ordine numero ${order.id} ha cambiato stato ora é in stato '${order.status.value}'"

        def toGroup = order.group //TODO get the group
        String emailSubject = "Ordine ${order.id} del gruppo di acquisto ${order.group.name}"
        log.debug "to: ${toEmail}  from: ${fromUsername}  subject: ${emailSubject}"

        sendMail {
            multipart true
            to toEmail
            subject emailSubject
            //text( view:"/email/changeStatus",
            //        model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath])
            html( view:"/email/changeStatus",
                    model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,message:message,basePath:basePath,order:order])
        }

    }
}