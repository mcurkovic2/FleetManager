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
		redirect(action:'newVehicle')
	}

	def newVehicleFlow = {
		brandSelection {
			on("next").to "typeSelection"
			on("newBrand").to "newBrand"
			on("cancel").to "exit"
		}

		typeSelection {
			on("next").to "enterDetails"
			on("newType").to "newType"
			on("back").to "brandSelection"
			on("cancel").to "exit"
		}
		
		enterDetails {
			on("confirm").to "exit"
			on("back").to "typeSelection"
			on("cancel").to "exit"
		}
		
		newBrand {
			on("confirm").to "typeSelection"
			on("cancel").to "exit"
		}

		newType {
			on("confirm").to "exit"
			on("cancel").to "exit"
		}
		
		exit {
			redirect(controller: "vehicle", action: "index")
		}
	
	}
}


class NewVehicleCommand {
	String vin
	static constraints = {
		vin nullable: true, blank:false, size:17..17
	}
}
