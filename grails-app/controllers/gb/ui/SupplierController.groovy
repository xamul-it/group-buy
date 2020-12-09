package gb.ui

import gb.Supplier
import gb.SupplierService

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class SupplierController {

    SupplierService supplierService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def list() {}

    def get() {}

    def order() {}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        response.setHeader('X-Pagination-Total', supplierService.count().toString())
        respond supplierService.list(params), model:[supplierCount: supplierService.count()]
    }

    def autocomplete(String query) {
        params.max = 10
        def lista = supplierService.autocomplete(query)
        render (lista ? lista as JSON : "")
    }

    def show(Long id) {
            respond supplierService.get(id)
    }

    def create() {
        respond new Supplier(params)
    }

    def save(Supplier supplier) {
        if (supplier == null) {
            notFound()
            return
        }

        try {
            supplierService.save(supplier)
        } catch (ValidationException e) {
            respond supplier.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplier.id])
                redirect supplier
            }
            '*' { respond supplier, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond supplierService.get(id)
    }

    def update(Supplier supplier) {
        if (supplier == null) {
            notFound()
            return
        }

        try {
            supplierService.save(supplier)
        } catch (ValidationException e) {
            respond supplier.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplier.id])
                redirect supplier
            }
            '*'{ respond supplier, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        supplierService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}