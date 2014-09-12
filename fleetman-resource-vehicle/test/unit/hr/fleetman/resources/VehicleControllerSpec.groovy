
package hr.fleetman.resources

import grails.test.mixin.*
import grails.test.mixin.webflow.WebFlowUnitTestMixin
import hr.fleetman.resources.vehicle.Brand
import hr.fleetman.resources.vehicle.Type
import spock.lang.Specification



@TestMixin(WebFlowUnitTestMixin)
@TestFor(VehicleController)
@Mock([Vehicle, VehicleService, Brand, Type])
class VehicleControllerSpec extends Specification {
	
	def DUMMY_VIN = "12345678911234567"
	
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
			
			def vehicle = new Vehicle()
			vehicle.vin = "12345678911234567"
			vehicle.brand = new Brand(name:"Toyota")
			vehicle.type = new Type(name:"Corolla")
			
			def saved = vehicle.save()
			def id = vehicle.id
			params['id'] = id
			
			controller.show()

		then:"A model is populated containing the domain instance"
			vehicle.validate()
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
		given:
			def brand = new Brand(name:"Toyota")
			
			brand.types = [new Type(name: "Corolla")]
		
			brand.save()
			
		when:"start flow is executed"
			newVehicleFlow.start.action()
			
		then:"NewVehicleCommand is inserted in flow context"
			lastEventName == 'start'
			flow.brandSelectionCommand instanceof BrandSelectionCommand
			flow.brandSelectionCommand.brands
			flow.brandSelectionCommand.brands.size() > 0
			response.reset()
			
			
		when:"brand is not selected"
			params.brandId = '' 
			params.brandName = null
			newVehicleFlow.brandSelection.on.next.action()
			
		then:"transition back to brand selection"
			flow.brandSelectionCommand.hasErrors()
			stateTransition == 'brandSelection'
			response.reset()
	
					
		when:"brand is selected"
			params.brandId = brand.id.toString()
			newVehicleFlow.brandSelection.on.next.action()
			
		then:"transition id to typeSelection"
			flow.brandSelectionCommand.hasErrors() == false
			flow.typeSelectionCommand
			flow.typeSelectionCommand.brand
			response.reset()
			
			
		when:"type is NOT selected "
			params.typeId = ''
			params.typeName = ''
			newVehicleFlow.typeSelection.on.next.action()
			
		then:"transition back to type selection"
			flow.typeSelectionCommand.hasErrors()
			stateTransition == 'typeSelection'
			response.reset()
			
			
		when:"newVehicleFlow.typeSelection.on.next"
			params.typeId = brand.types.toList().get(0).id.toString()
			newVehicleFlow.typeSelection.on.next.action()
			
		then:"type selection has no errors"
			flow.typeSelectionCommand.hasErrors() == false
			flow.typeSelectionCommand.typeId == brand.types.toList().get(0).id.toString()
			lastTransitionName == 'next'
			
			flow.enterDetailsCommand
			flow.enterDetailsCommand.brand == brand
			response.reset()
			
			
		when: "newVehicleFlow.enterDetails.on.confirm"
			flow.enterDetailsCommand.vin = "12345678911234567"
			flow.enterDetailsCommand.currentRegistration = "ZG-1019-BA"
			newVehicleFlow.enterDetails.on.confirm.action()
			
		then: "enterDetails command is valid"
			flow.enterDetailsCommand.hasErrors() == false
			flow.enterDetailsCommand.brand
			flow.enterDetailsCommand.type
			response.reset()
			
		when: "newVehicleFlow.validateAndSaveVehicle"
			newVehicleFlow.validateAndSaveVehicle.action()
			
		then:"vehicle is saved"
			Vehicle.list()
	}
	
	void "Test new vehicle flow transitions" () {
		when:"flow is executed"
			
		then:"Correct transitions are executed"
			"brandSelection" == newVehicleFlow.start.on.success.to
			response.reset()
			"typeSelection" == newVehicleFlow.brandSelection.on.next.to
			response.reset()
			"newBrand" == newVehicleFlow.brandSelection.on.newBrand.to
			response.reset()
			"exit" == newVehicleFlow.brandSelection.on.cancel.to
			response.reset()
			"enterDetails" == newVehicleFlow.typeSelection.on.next.to
			response.reset()
			"brandSelection" == newVehicleFlow.typeSelection.on.back.to
			response.reset()
			"exit" == newVehicleFlow.typeSelection.on.cancel.to
			response.reset()
			"typeSelection" == newVehicleFlow.enterDetails.on.back.to
			response.reset()
			"validateAndSaveVehicle" == newVehicleFlow.enterDetails.on.confirm.to
			response.reset()
			"end" ==newVehicleFlow.validateAndSaveVehicle.on.success.to
			response.reset()
			
			newVehicleFlow.end.on.backToIndex
			controller.redirectedUrl == "index"
			response.reset()
			
			"end" ==newVehicleFlow.validateAndSaveVehicle.on.success.to
			response.reset()
			
			"exit" == newVehicleFlow.enterDetails.on.cancel.to
	}
	
	
	private Vehicle createVehicle(Map data) {
		def vehicle = new Vehicle(vin: 'aaa')
		vehicle.properties = data
		return vehicle
	}
}
