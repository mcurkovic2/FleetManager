package hr.fleetman.resources

import grails.transaction.Transactional
import grails.validation.Validateable

@Transactional(readOnly = true)
class VehicleController {
	def vehicleService


	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Vehicle.list(params), model:[vehicleInstanceCount: Vehicle.count()]
	}

	def show() {
		def vehicle = Vehicle.get(params.id)

		if (!vehicle) {
			response.sendError 404
			return
		}

		respond vehicle
	}

	def create() {
		redirect(action:"newVehicle")
	}
	
	def newVehicleFlow = {
		
		def cancel = false
		
		start {
		
			action {
				flow.brandSelectionCommand = new BrandSelectionCommand()
			}
			
			on("success").to "brandSelection"
		}
		
		brandSelection {
			
			on("next") { 
				
				bindData(flow.brandSelectionCommand, params)
				
				flow.brandSelectionCommand.validate()

				if (flow.brandSelectionCommand.hasErrors()) {
				  return error()
				}
				
				flow.typeSelectionCommand = new TypeSelectionCommand()

			}.to "typeSelection"
		
			on("newBrand").to "newBrand"
			on("cancel") .to "exit"
		}

		typeSelection {
			on("next"){
				
				bindData(flow.typeSelectionCommand, params)
				
				flow.typeSelectionCommand.validate()
				
				if (flow.typeSelectionCommand.hasErrors()) {
				  return error()
				}
				
			}.to "enterDetails"
		
			on("newType").to "newType"
			on("back").to "brandSelection"
			on("cancel").to "exit"
		}
		
		enterDetails {
			on("confirm"){
				bindData(flow.newVehicleCommand, params)
				
				if (flow.newVehicleCommand.hasErrors()) {
				  return error()
				}
				
			}.to "end"
		
			on("back").to "typeSelection"
			on("cancel").to "exit"
		}
		
		newBrand {
			on("confirm").to "typeSelection"
			on("cancel").to "exit"
		}

		newType {
			on("confirm").to "enterDetails"
			on("cancel").to "exit"
		}
		
		end()
		
		exit {
			redirect(action:"index")
		}
	}
}


@Validateable
class BrandSelectionCommand implements Serializable{
	String brandId
	String brandName
	
	static constraints = {
		brandId nullable: false, blank:false, size: 1..10
		brandName nullable: false, blank:false, size: 3..10
	}
}

@Validateable
class TypeSelectionCommand implements Serializable{
	String typeId
	String typeName
	
	static constraints = {
		typeId nullable: false, blank:false, size: 1..10
		typeName nullable: false, blank:false, size: 3..10
	}
}


@Validateable
class NewVehicleCommand2 implements Serializable{
	String brandId
	String brandName
	String typeId
	String typeName
	
	String vin
	String currentRegistration
	
	static constraints = {
		brandId nullable: true, blank:false, size: 1..10
		brandName nullable: true, blank:false, size: 3..10
		typeId nullable: true, blank:false, size: 1..10
		typeName nullable: true, blank:false, size: 3..10
		
		vin nullable: true, blank:false, size: 17..17
		currentRegistration nullable: true, blank:false, size: 3..20
	}
	
}
