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
				def brands = vehicleService.findBrands()
				flow.brandSelectionCommand.brands = brands
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
				def types = vehicleService.findModels(Integer.valueOf(flow.brandSelectionCommand.brandId))
				flow.typeSelectionCommand.types = types
				
				
			}.to "typeSelection"
		
			on("newBrand").to "newBrand"
			on("cancel") .to "exit"
		}

		typeSelection {
			on("next") {
				
				bindData(flow.typeSelectionCommand, params)
				flow.typeSelectionCommand.validate()
				
				if (flow.typeSelectionCommand.hasErrors()) {
				  return error()
				}
				
				flow.enterDetailsCommand = new EnterDetailsCommand()
				flow.enterDetailsCommand.brandId = flow.brandSelectionCommand.brandId
				flow.enterDetailsCommand.typeId = flow.typeSelectionCommand.typeId
				
			}.to "enterDetails"
		
			on("newType").to "newType"
			on("back").to "brandSelection"
			on("cancel").to "exit"
		}
		
		enterDetails {
			on("confirm"){
				
				bindData(flow.enterDetailsCommand, params)
				flow.enterDetailsCommand.validate()
				
				if (flow.enterDetailsCommand.hasErrors()) {
				  return error()
				}
				
			}.to "validateAndSaveVehicle"
		
			on("back").to "typeSelection"
			on("cancel").to "exit"
		}
		
		validateAndSaveVehicle{
			action {
		
				def vehicleInstance = new Vehicle()
				def brand = vehicleService.fetchBrandById(flow.enterDetailsCommand.brandId)
				def type = vehicleService.fetchModelById(flow.enterDetailsCommand.brandId, flow.enterDetailsCommand.typeId)
				
				bindData(vehicleInstance, flow.enterDetailsCommand)
				bindData(vehicleInstance, [brand: brand])
				bindData(vehicleInstance, [type: type])
				
				vehicleInstance.validate()
				
				if (vehicleInstance.hasErrors()) {
					return error()
				}
				
				if (vehicleInstance.save(flush:true)) {
					return success()
				} else {
					vehicleInstance.errors.each {
						log.error it
					}
				}
			}
			
			on("success").to "end"
			on("error").to "enterDetails"
			
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
class BrandSelectionCommand implements Serializable {
	String brandId
	def brands 
	
	static constraints = {
		brandId(nullable: false, blank:false, size: 1..10)
	}
}

@Validateable
class TypeSelectionCommand implements Serializable {
	String typeId
	def types
	
	static constraints = {
		typeId(nullable: false, blank:false, size: 1..10)
	}
}

@Validateable
class EnterDetailsCommand implements Serializable{
	String brandId
	String typeId
	String vin
	String currentRegistration
	
	static constraints = {
		brandId(nullable: false, blank:false, size: 1..10)
		typeId(nullable: false, blank:false, size: 1..10)
		
		importFrom Vehicle
	}
}
