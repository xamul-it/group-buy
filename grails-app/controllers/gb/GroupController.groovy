package gb

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GroupController {

    GroupService groupService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", show: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond groupService.list(params), model:[groupCount: groupService.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        response.setHeader('X-Pagination-Total', groupService.count().toString())
        respond groupService.list(params), model:[groupCount: groupService.count()]
    }

    def show(Long id) {
        Group g = groupService.get(id)
        log.debug "**************SHOW " + g.publicGroup+ "--"
        respond g
//        respond groupService.get(id)
    }

    def get(Long id) {
        Group g = groupService.get(id)
        log.debug "**************GET " + g.publicGroup+ "--"
        respond g
        respond groupService.get(id)
    }

    def create() {
        respond new Group(params)
    }

    def save(Group group) {
        if (group == null) {
            notFound()
            return
        }

        try {
            groupService.save(group)
        } catch (ValidationException e) {
            respond group.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'group.label', default: 'Group'), group.id])
                redirect group
            }
            '*' { respond group, [status: CREATED] }
        }
    }

    def edit(Long id) {
        log.info "****edit id " + id
        respond groupService.get(id)
    }

    def changePublic(Group group){
        group.setPublicGroup(!group.isPublicGroup())
        update(group)
    }

    def update(Group group) {
        if (group == null) {
            notFound()
            return
        }

        try {
            groupService.save(group)
        } catch (ValidationException e) {
            respond group.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'group.label', default: 'Group'), group.id])
                redirect group
            }
            '*'{ respond group, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        groupService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'group.label', default: 'Group'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
