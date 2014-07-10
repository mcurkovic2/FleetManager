package hr.fleetman.resources

import grails.test.mixin.*
import spock.lang.Specification


@TestFor(VehicleController)
@Mock([Vehicle])
class VehicleControllerSpec extends Specification {
	
	def DUMMY_VIN = "12345678911234567"
	
	def vehicleService = Stub(VehicleService)
	
	def setup() {
		def createDummyVehicle =  {args -> 

			new Vehicle(vin:DUMMY_VIN)
		}
		
		vehicleService.findByVin(DUMMY_VIN) >> createDummyVehicle
		
		vehicleService.populateDetails(DUMMY_VIN) >> createDummyVehicle
		
		controller.vehicleService = vehicleService
	}

	def cleanup() {
	}

	void "Test index page"() {
		when:"The index action is executed"
			controller.index()

		then:"The model is correct"
			!model.vehicleInstanceList
			model.vehicleInstanceCount == 0
	}

	void "Test that the show action returns the correct model"() {
		when:"The show action is executed with a null domain"
			controller.show()

		then:"A 404 error is returned"
			response.status == 404

		when:"A domain instance is passed to the show action"
			response.reset()
			def vehicle = createVehicle(vin:DUMMY_VIN)
			
			boolean validated = vehicle.validate()
			def saved = vehicle.save()
			def id = vehicle.id
			params['id'] = id
			controller.show()

		then:"A model is populated containing the domain instance"
			validated
			saved
			model.vehicle != null
	}
	
	void "create and populate vehicle"() {
		when:"create action is executed"
			controller.create()
		then:"new vehicle command is returned"
			model.newVehicleCommand
			
	}
	
	void "Test that after providing VIN of vehicle vehicle details is populated and vehicle is saved"() {
		when:"create save is executed with bad vin"
			def command = new NewVehicleCommand('12345')
			controller.save(command)
		then:"validation message is displayed"
			flash.message
			
	}
	
	
	
	private Vehicle createVehicle(Map data) {
		def vehicle = new Vehicle(vin: 'aaa')
		vehicle.properties = data
		return vehicle
	}
}
