package gb

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class OrderVoiceController {

    OrderVoiceService orderVoiceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond orderVoiceService.list(params), model:[orderVoiceCount: orderVoiceService.count()]
    }

    def show(Long id) {
        respond orderVoiceService.get(id)
    }

    def create() {
        respond new OrderVoice(params)
    }

    def save(OrderVoice orderVoice) {
        if (orderVoice == null) {
            notFound()
            return
        }

        try {
            orderVoiceService.save(orderVoice)
        } catch (ValidationException e) {
            respond orderVoice.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orderVoice.label', default: 'OrderVoice'), orderVoice.id])
                redirect orderVoice
            }
            '*' { respond orderVoice, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond orderVoiceService.get(id)
    }

    def update(OrderVoice orderVoice) {
        if (orderVoice == null) {
            notFound()
            return
        }

        try {
            orderVoiceService.save(orderVoice)
        } catch (ValidationException e) {
            respond orderVoice.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'orderVoice.label', default: 'OrderVoice'), orderVoice.id])
                redirect orderVoice
            }
            '*'{ respond orderVoice, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        orderVoiceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'orderVoice.label', default: 'OrderVoice'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderVoice.label', default: 'OrderVoice'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
