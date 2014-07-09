package hr.fleetman.events



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistrationEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegistrationEvent.list(params), model:[registrationEventInstanceCount: RegistrationEvent.count()]
    }

    def show(RegistrationEvent registrationEventInstance) {
        respond registrationEventInstance
    }

    def create() {
        respond new RegistrationEvent(params)
    }

    @Transactional
    def save(RegistrationEvent registrationEventInstance) {
        if (registrationEventInstance == null) {
            notFound()
            return
        }

        if (registrationEventInstance.hasErrors()) {
            respond registrationEventInstance.errors, view:'create'
            return
        }

        registrationEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registrationEventInstance.label', default: 'RegistrationEvent'), registrationEventInstance.id])
                redirect registrationEventInstance
            }
            '*' { respond registrationEventInstance, [status: CREATED] }
        }
    }

    def edit(RegistrationEvent registrationEventInstance) {
        respond registrationEventInstance
    }

    @Transactional
    def update(RegistrationEvent registrationEventInstance) {
        if (registrationEventInstance == null) {
            notFound()
            return
        }

        if (registrationEventInstance.hasErrors()) {
            respond registrationEventInstance.errors, view:'edit'
            return
        }

        registrationEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegistrationEvent.label', default: 'RegistrationEvent'), registrationEventInstance.id])
                redirect registrationEventInstance
            }
            '*'{ respond registrationEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegistrationEvent registrationEventInstance) {

        if (registrationEventInstance == null) {
            notFound()
            return
        }

        registrationEventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegistrationEvent.label', default: 'RegistrationEvent'), registrationEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registrationEventInstance.label', default: 'RegistrationEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
