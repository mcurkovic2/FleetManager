package hr.fleetman



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Car.list(params), model:[carInstanceCount: Car.count()]
    }

    def show(Car carInstance) {
        respond carInstance
    }

    def create() {
        respond new Car(params)
    }

    @Transactional
    def save(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'create'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carInstance.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*' { respond carInstance, [status: CREATED] }
        }
    }

    def edit(Car carInstance) {
        respond carInstance
    }

    @Transactional
    def update(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'edit'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*'{ respond carInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Car carInstance) {

        if (carInstance == null) {
            notFound()
            return
        }

        carInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carInstance.label', default: 'Car'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
