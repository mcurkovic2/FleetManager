package hr.fleetman.resources

import java.awt.FlowLayout;

import grails.transaction.Transactional
import grails.validation.Validateable
import hr.fleetman.resources.vehicle.Brand
import hr.fleetman.resources.vehicle.Type

@Transactional(readOnly = true)
class VehicleController {
	def vehicleService

	def index(Integer max) {
		params.max = Math.min(max ?: 100, 100)
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
	
	def findBrands() {
		def br = vehicleService.findBrands()
		redirect(action: "index")
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
				
				def brand = vehicleService.fetchBrandById(flow.brandSelectionCommand.brandId)
				flow.typeSelectionCommand.brand = brand
								
				def types = vehicleService.findModelsForBrandId(brand.id.toString())
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
				flow.enterDetailsCommand.brand = flow.typeSelectionCommand.brand
				flow.enterDetailsCommand.type = vehicleService.fetchModelById(flow.typeSelectionCommand.typeId)

			}.to("enterDetails")
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
		
		validateAndSaveVehicle {
			action {
		
				def vehicleInstance = new Vehicle()
				bindData(vehicleInstance, flow.enterDetailsCommand)
				
				vehicleInstance.validate()
				
				if (vehicleInstance.hasErrors()) {
					return error()
				}
				
				def savedVehicle = vehicleInstance.save(flush:true)
				if (savedVehicle) {
					//clears flow
					flow.persistenceContext.flush()
					flow.persistenceContext.persistenceContext.clear()
					//end clears flow
					
					flow.newVehicleId = savedVehicle.id
					return success()
				} else {
					log.error "error occured while saving vehicle"
					vehicleInstance.errors.each {
						log.error it
					}
				}
			}
			
			on("success").to "end"
			on("error").to "enterDetails"
			
		}
		
		newBrand {
			on("confirm").to "brandSelection"
			on("cancel").to "brandSelection"
		}

		newType {
			on("confirm").to "typeSelection"
			on("cancel").to "typeSelection"
		}
		
		end{
			on("backToIndex").to "redirectToIndex"
			on("showDetails").to "redirectToDetails"
			on("new").to "start"
		}
		
		redirectToIndex{
			redirect(action:"index")
		}
		
		redirectToDetails{
			redirect (action:"show", params: [id: flow.newVehicleId])
		}
		
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
	Brand brand
	def types
	
	static constraints = {
		typeId(nullable: false, blank:false, size: 1..10)
		brand nullable : true
	}
}

@Validateable
class EnterDetailsCommand implements Serializable{
	Brand brand
	Type type
	
	String vin
	String currentRegistration
	
	static constraints = {
		brand nullable: false
		type nullable: false
		
		importFrom Vehicle
	}
}
