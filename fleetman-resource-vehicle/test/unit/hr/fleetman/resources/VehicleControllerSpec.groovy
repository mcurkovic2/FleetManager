package hr.fleetman.resources

import grails.test.mixin.*
import grails.test.mixin.webflow.WebFlowUnitTestMixin
import hr.fleetman.resource.Brand
import spock.lang.Specification



@TestMixin(WebFlowUnitTestMixin)
@TestFor(VehicleController)
@Mock([Vehicle, VehicleService])
class VehicleControllerSpec extends Specification {
	
	def DUMMY_VIN = "12345678911234567"

	def setup() {
		MockFor(VehicleService)
	}

	def cleanup() {
		
	}
	
	void "Test stubbed service2"() {
		given:
			def vehicleServiceMock = mockFor(VehicleService)
			vehicleServiceMock.demand.findBrands  {
				def brand = new Brand()
				brand.id = 0
				brand.name = 'aaa'
				return [brand]
			}
		
			controller.vehicleService = vehicleServiceMock.createMock()
			
		when:"findBrands is executed"
			controller.findBrands()
			
		then:"The model is correct"
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
	
	void "Create and populate vehicle"() {
		when:"create action is executed"
			controller.create()
			
		then:"new vehicle command is returned"
			response.redirectUrl == '/vehicle/newVehicle'
			
	}
	
	/*All of the default unit test controller properties are available + flow,
	conversation, lastTransitionName, lastEventName, currentEvent*/
	void "Test of new vehicle flow"() {
//		given:
//		def vehicleServiceMock = mockFor(VehicleService)
//		vehicleServiceMock.demand.findBrands {
//			def brand = new Brand()
//			brand.id = 0
//			brand.name = 'aaaa'
//			return [brand]
//		}
//		controller.vehicleService = vehicleServiceMock.createMock()
		when:"start flow is executed"
			newVehicleFlow.start.action()
			
		then:"NewVehicleCommand is inserted in flow context"
			lastEventName == 'start'
			flow.brandSelectionCommand instanceof BrandSelectionCommand
			flow.brandSelectionCommand.brands
			flow.brandSelectionCommand.brands.size() > 0
			
		when:"brand is not selected"
			params.brandId = '' 
			params.brandName = null
			newVehicleFlow.brandSelection.on.next.action()
			
		then:"transition back to brand selection"
			flow.brandSelectionCommand.hasErrors()
			stateTransition == 'brandSelection'
			
		when:"brand is selected"
			params.brandId = '12345'
			params.brandName = 'Peugeot'
			newVehicleFlow.brandSelection.on.next.action()
			
		then:"transition id to typeSelection"
			flow.brandSelectionCommand.hasErrors() == false
			
		when:"type is NOT selected "
			params.typeId = ''
			params.typeName = ''
			newVehicleFlow.typeSelection.on.next.action()
			
		then:"transition back to type selection"
			flow.typeSelectionCommand.hasErrors()
			stateTransition == 'typeSelection'
			
		when:"type is selected "
			params.typeId = '12'
			params.typeName = '308 SW'
			newVehicleFlow.typeSelection.on.next.action()
			
		then:"transition back to type selection"
			flow.typeSelectionCommand.hasErrors() == false
			stateTransition == 'typeSelection'
	}
	
	void "Test new vehicle flow transitions" () {
		when:"flow is executed"
			
		then:"Correct transitions are executed"
			"brandSelection" == newVehicleFlow.start.on.success.to
			
			"typeSelection" == newVehicleFlow.brandSelection.on.next.to
			"newBrand" == newVehicleFlow.brandSelection.on.newBrand.to
			"exit" == newVehicleFlow.brandSelection.on.cancel.to
			
			"enterDetails" == newVehicleFlow.typeSelection.on.next.to
			"brandSelection" == newVehicleFlow.typeSelection.on.back.to
			"exit" == newVehicleFlow.typeSelection.on.cancel.to
			
			"typeSelection" == newVehicleFlow.enterDetails.on.back.to
			"validateAndSaveVehicle" == newVehicleFlow.enterDetails.on.confirm.to
			"exit" == newVehicleFlow.enterDetails.on.cancel.to
	}
	
	
	private Vehicle createVehicle(Map data) {
		def vehicle = new Vehicle(vin: 'aaa')
		vehicle.properties = data
		return vehicle
	}
}
