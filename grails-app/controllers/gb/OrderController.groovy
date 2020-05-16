package gb

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class OrderController {

    OrderService orderService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond orderService.list(params), model:[orderCount: orderService.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        response.setHeader('X-Pagination-Total', orderService.count().toString())
        respond orderService.list(params), model:[orderCount: orderService.count()]

    }

    def show(Long id) {
        respond orderService.get(id)
    }

    def create() {
        Order item = new Order(params);
        item.orderDate = new Date()
        item.addToOrderVoice(new OrderVoice())
        item.setSupplier(new Supplier())
        item.setGroup(new Group())
        respond item
    }

    def save(Order order) {
        println "Params "+params+" "+request.params
        if (order == null) {
            notFound()
            return
        }

        try {
            orderService.save(order)
        } catch (ValidationException e) {
            respond order.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'order.label', default: 'Order'), order.id])
                redirect order
            }
            '*' { respond order, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond orderService.get(id)
    }

    def update(Order order) {
        if (order == null) {
            notFound()
            return
        }

        try {
            orderService.save(order)
        } catch (ValidationException e) {
            respond order.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'order.label', default: 'Order'), order.id])
                redirect order
            }
            '*'{ respond order, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        orderService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'order.label', default: 'Order'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
