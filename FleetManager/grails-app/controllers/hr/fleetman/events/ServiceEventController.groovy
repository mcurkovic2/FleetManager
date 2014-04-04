package hr.fleetman.events



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ServiceEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ServiceEvent.list(params), model:[serviceEventInstanceCount: ServiceEvent.count()]
    }

    def show(ServiceEvent serviceEventInstance) {
        respond serviceEventInstance
    }

    def create() {
        respond new ServiceEvent(params)
    }

    @Transactional
    def save(ServiceEvent serviceEventInstance) {
        if (serviceEventInstance == null) {
            notFound()
            return
        }

        if (serviceEventInstance.hasErrors()) {
            respond serviceEventInstance.errors, view:'create'
            return
        }

        serviceEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'serviceEventInstance.label', default: 'ServiceEvent'), serviceEventInstance.id])
                redirect serviceEventInstance
            }
            '*' { respond serviceEventInstance, [status: CREATED] }
        }
    }

    def edit(ServiceEvent serviceEventInstance) {
        respond serviceEventInstance
    }

    @Transactional
    def update(ServiceEvent serviceEventInstance) {
        if (serviceEventInstance == null) {
            notFound()
            return
        }

        if (serviceEventInstance.hasErrors()) {
            respond serviceEventInstance.errors, view:'edit'
            return
        }

        serviceEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ServiceEvent.label', default: 'ServiceEvent'), serviceEventInstance.id])
                redirect serviceEventInstance
            }
            '*'{ respond serviceEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ServiceEvent serviceEventInstance) {

        if (serviceEventInstance == null) {
            notFound()
            return
        }

        serviceEventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ServiceEvent.label', default: 'ServiceEvent'), serviceEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceEventInstance.label', default: 'ServiceEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
