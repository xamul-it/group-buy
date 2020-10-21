package gb.domain

import gb.Shop
import gb.ShopService

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ShopController {

    ShopService shopService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond shopService.list(params), model:[shopCount: shopService.count()]
    }

    def show(Long id) {
        respond shopService.get(id)
    }

    def create() {
        respond new Shop(params)
    }

    def save(Shop shop) {
        if (shop == null) {
            notFound()
            return
        }

        try {
            shopService.save(shop)
        } catch (ValidationException e) {
            respond shop.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shop.label', default: 'Shop'), shop.id])
                redirect shop
            }
            '*' { respond shop, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond shopService.get(id)
    }

    def update(Shop shop) {
        if (shop == null) {
            notFound()
            return
        }

        try {
            shopService.save(shop)
        } catch (ValidationException e) {
            respond shop.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'shop.label', default: 'Shop'), shop.id])
                redirect shop
            }
            '*'{ respond shop, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        shopService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'shop.label', default: 'Shop'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shop.label', default: 'Shop'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
