package hr.fleetman.users



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import hr.fleetman.Utils.Utils

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject
import org.springframework.util.Assert

@Transactional(readOnly = true)
class RegisteredUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegisteredUser.list(params), model:[registeredUserInstanceCount: RegisteredUser.count()]
    }

    def show(RegisteredUser registeredUserInstance) {
        respond registeredUserInstance
    }

    def create() {
        respond new RegisteredUser(params)
    }

    @Transactional
    def save(RegisteredUser registeredUserInstance) {
        if (registeredUserInstance == null) {
            notFound()
            return
        }

        if (registeredUserInstance.hasErrors()) {
            respond registeredUserInstance.errors, view:'create'
            return
        }
		
		Assert.hasText(params.passwordHash);
		registeredUserInstance.passwordHash = Utils.encrypt(params.passwordHash);
        registeredUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registeredUserInstance.label', default: 'RegisteredUser'), registeredUserInstance.username])
                redirect registeredUserInstance
            }
            '*' { respond registeredUserInstance, [status: CREATED] }
        }
    }

    def edit(RegisteredUser registeredUserInstance) {
        respond registeredUserInstance
    }

    @Transactional
    def update(RegisteredUser registeredUserInstance) {
        if (registeredUserInstance == null) {
            notFound()
            return
        }

        if (registeredUserInstance.hasErrors()) {
            respond registeredUserInstance.errors, view:'edit'
            return
        }

        registeredUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegisteredUser.label', default: 'RegisteredUser'), registeredUserInstance.username])
                redirect registeredUserInstance
            }
            '*'{ respond registeredUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegisteredUser registeredUserInstance) {
		
        if (registeredUserInstance == null) {
            notFound()
            return
        }
		Subject currentUser = SecurityUtils.getSubject();
		if (registeredUserInstance.username.equals(currentUser.getPrincipal())){
			flash.message = message(code: 'RegisteredUser.delete.currentUser.error', args: [registeredUserInstance.username])
			redirect registeredUserInstance
			return
		}
		
        registeredUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegisteredUser.label', default: 'RegisteredUser'), registeredUserInstance.username])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredUserInstance.label', default: 'RegisteredUser'), params.username])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
