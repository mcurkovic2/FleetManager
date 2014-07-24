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
		start {
			action {
				flow.newVehicleCommand = new NewVehicleCommand()
			}
			on 'success' to 'brandSelection'
		}
		
		brandSelection {
			on "next" to "typeSelection"
			on("newBrand").to "newBrand"
			on("cancel").to "end"
		}

		typeSelection {
			on("next").to "enterDetails"
			on("newType").to "newType"
			on("back").to "brandSelection"
			on("cancel").to "end"
		}
		
		enterDetails {
			on("confirm").to "end"
			on("back").to "typeSelection"
			on("cancel").to "end"
		}
		
		newBrand {
			on("confirm").to "typeSelection"
			on("cancel").to "end"
		}

		newType {
			on("confirm").to "enterDetails"
			on("cancel").to "end"
		}
		
		end {
			redirect(controller: "vehicle", action: "index")
		}
	}
}


class NewVehicleCommand implements Serializable{
	String vin
	static constraints = {
		vin nullable: true, blank:false, size:17..17
	}
}
