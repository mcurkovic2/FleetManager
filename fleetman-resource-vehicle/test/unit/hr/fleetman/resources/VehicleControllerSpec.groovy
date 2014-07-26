package hr.fleetman.resources

import grails.test.mixin.*
import grails.test.mixin.webflow.WebFlowUnitTestMixin
import spock.lang.Specification



@TestMixin(WebFlowUnitTestMixin)
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
			response.redirectUrl == '/vehicle/newVehicle'
			
	}
	
	/*All of the default unit test controller properties are available + flow,
	conversation, lastTransitionName, lastEventName, currentEvent*/
	void "Test of new wehicle flow"() {
		
		when:"start flow is executed"
			newVehicleFlow.start.action()
		then:"NewVehicleCommand is inserted in flow context"
			lastEventName == 'start'
			flow.newVehicleCommand instanceof NewVehicleCommand
			
		when:"brand is selected"
			newVehicleFlow.brandSelection.on.next
			
		then:"transition id on typeSelection"
			currentEvent == 'brandSelection'
			
	}
	
	void "Test new vehicle flow transitions" (){
		when:"flow is executed"
			
		then:"Correct transitions are executed"
			"brandSelection" == newVehicleFlow.start.on.success.to
			response.reset()
			"typeSelection" == newVehicleFlow.brandSelection.on.next.to
			response.reset()
			"newBrand" == newVehicleFlow.brandSelection.on.newBrand.to
			response.reset()
			"end" == newVehicleFlow.brandSelection.on.cancel.to
			response.reset()
			"enterDetails" == newVehicleFlow.typeSelection.on.next.to
			response.reset()
			"brandSelection" == newVehicleFlow.typeSelection.on.back.to
			response.reset()
			"end" == newVehicleFlow.typeSelection.on.cancel.to
			response.reset()
			"typeSelection" == newVehicleFlow.enterDetails.on.back.to
			response.reset()
			"end" == newVehicleFlow.enterDetails.on.confirm.to
			
	}
	
	
	private Vehicle createVehicle(Map data) {
		def vehicle = new Vehicle(vin: 'aaa')
		vehicle.properties = data
		return vehicle
	}
}
