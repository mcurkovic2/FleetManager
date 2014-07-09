package hr.fleetman.users



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegisteredRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegisteredRole.list(params), model:[registeredRoleInstanceCount: RegisteredRole.count()]
    }

    def show(RegisteredRole registeredRoleInstance) {
        respond registeredRoleInstance
    }

    def create() {
        respond new RegisteredRole(params)
    }

    @Transactional
    def save(RegisteredRole registeredRoleInstance) {
        if (registeredRoleInstance == null) {
            notFound()
            return
        }

        if (registeredRoleInstance.hasErrors()) {
            respond registeredRoleInstance.errors, view:'create'
            return
        }

        registeredRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registeredRoleInstance.label', default: 'RegisteredRole'), registeredRoleInstance.id])
                redirect registeredRoleInstance
            }
            '*' { respond registeredRoleInstance, [status: CREATED] }
        }
    }

    def edit(RegisteredRole registeredRoleInstance) {
        respond registeredRoleInstance
    }

    @Transactional
    def update(RegisteredRole registeredRoleInstance) {
        if (registeredRoleInstance == null) {
            notFound()
            return
        }

        if (registeredRoleInstance.hasErrors()) {
            respond registeredRoleInstance.errors, view:'edit'
            return
        }

        registeredRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegisteredRole.label', default: 'RegisteredRole'), registeredRoleInstance.id])
                redirect registeredRoleInstance
            }
            '*'{ respond registeredRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegisteredRole registeredRoleInstance) {

        if (registeredRoleInstance == null) {
            notFound()
            return
        }

        registeredRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegisteredRole.label', default: 'RegisteredRole'), registeredRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredRoleInstance.label', default: 'RegisteredRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
