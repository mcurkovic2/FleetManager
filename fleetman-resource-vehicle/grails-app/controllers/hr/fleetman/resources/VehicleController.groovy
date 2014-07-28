package hr.fleetman.resources

import grails.transaction.Transactional

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
		boolean cancelled = false 
		start {
			action {
				flow.newVehicleCommand = new NewVehicleCommand()
			}
			on("success").to("brandSelection") 
		}
		
		brandSelection {
			on("next"){
//				bindData(flow.newVehicleCommand, params)
//				def cmd = flow.newVehicleCommand
//				if (!cmd.validate()) {
//					return error()
//				}
			}.to "typeSelection"
			on("newBrand").to "newBrand"
			on("cancel").to("cancel")
			
		}

		typeSelection {
			on("next").to("enterDetails") 
			on("newType").to("newType") 
			on("back").to("brandSelection") 
			on("cancel").to "cancel"
		}
		
		enterDetails {
			on("confirm").to("end") 
			on("back").to("typeSelection") 
			on("cancel").to("cancel") 
		}
		
		newBrand {
			on("confirm").to("typeSelection") 
			on("cancel").to("cancel") 
		}

		newType {
			on("confirm").to "enterDetails"
			on("cancel").to("cancel")
		}

		end()
		
		cancel {
			//NOTICE: Redirect in action to avoid unitTest WebFlowUnitTestMixin redirect error
			action {
				redirect(action: "index")
			}
			on("success"){}
		}

	}
}

class NewVehicleCommand implements Serializable{
	String vin
	String brandId
	String typeId
	static constraints = {
		vin nullable: true, blank:false, size:17..17
		brandId nullable: true, blank:false, size:1..20
	}
}
