package gb.rest.v1

import gb.EmailService

import static org.springframework.http.HttpStatus.*
import groovy.json.JsonSlurper

class ContactController {

    static namespace = 'v1'
    static responseFormats = ['json']

    EmailService emailService

    static allowedMethods = [contact: "POST", support: "POST"]

    def contact(){
        log.debug "contact $params $request.JSON"
        def payload = request.JSON
        log.debug "$payload.emailAddress, $payload.messageText, $payload.privacy"
        
        emailService.contact(payload.emailAddress, payload.messageText)

        respond payload, [status: CREATED]
    }

    def support() {

    }

    private errorJson(String errorMessage) {
        def jsonSlurper = new JsonSlurper()
        jsonSlurper.parseText('{ "errors": [ { "object": "gb.Contact", "message": "'+errorMessage+'" } ] }')
    }

}
