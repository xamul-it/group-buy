package gb

import grails.validation.ValidationException
import org.hibernate.FetchMode

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class GroupController {

    GroupService groupService
    transient springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", show: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond groupService.list(params), model:[groupCount: groupService.count()]
    }

    def list(Integer max) {
        def all = params.all
        log.debug "************list ALL: " + all + "+"
        params.max = Math.min(max ?: 10, 100)
//        params.fetch = [owner: "eager"]
        response.setHeader('X-Pagination-Total', groupService.count().toString())
        if(params.all){
            log.debug "QUERY ALL"
            respond groupService.list(params), model:[groupCount: groupService.count()]
        }else{
            log.debug "QUERY by user"
            respond Group.findAllByOwner(springSecurityService.getCurrentUser(), params), model:[groupCount: groupService.count()]
        }
    }

    def autocomplete(String query) {
        params.max = 10
        def lista = groupService.autocomplete(query)
        render (lista ? lista as JSON : "")
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

    def update(Group group) {
        log.debug "****** update - publicGroup: " + group.publicGroup
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
