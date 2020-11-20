package gb

class EmailService {

    grails.core.GrailsApplication grailsApplication

    grails.plugin.springsecurity.SpringSecurityService  springSecurityService

    def groupInvite(String toEmail) {
        def basePath = grailsApplication.config.getProperty('grails.mail.serverURL')
        toEmail = "invited@emaildomain.com" //TODO get toEmail
        def user = null
        if (springSecurityService && springSecurityService.isLoggedIn()) {
            user = User.get(springSecurityService.getPrincipal().id)
        }
        def fromUsername = user?user.username:"sender name"

        def toGroup = Group.get(2) //TODO get the group 

        sendMail {
            multipart true
            to toEmail
            subject "Invito al gruppo: ${toGroup.name}"
            text( view:"/email/groupInvitePlain", 		
                    model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,basePath:basePath])
            html( view:"/email/groupInvite", 		
                    model:[fromUsername:fromUsername,toEmail:toEmail,toGroup:toGroup,basePath:basePath])
        }
    }
}