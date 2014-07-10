package hr.fleetman.resources

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
		respond new NewVehicleCommand()
	}

	def newVehicleFlow() {
		entervin {
			on("check"){
				def vehicle = new Vehicle(vin)
				if (vehicle.validate()) {
					vehicle = vehicleService.populateDetails(vin)
				} else {
					error()
				}
			}.to "showVehicleDetails"
			on("cancel").to "index"
		}

		showVehicleDetails {
			on("confirm"){
				def vehicle = new Vehicle(vin)
				if (vehicle.validate()) {
					vehicle.save()
				} else {
					error()
				}
			}.to "index"
			on("additional").to "manuallyEnter"
			on("back").to "showVinForm"
			on("cancel").to "index"
		}

		manuallyEnter {
			on("confirm"){
				def vehicle = new Vehicle(params)
				if (vehicle.validate()) {
					vehicle = vehicleService.populateDetails(vin)
				} else {
					error()
				}
			}.to "index"
			on("cancel").to "index"
		}
	}
}

class NewVehicleCommand {
	String vin
	static constraints = {
		vin nullable: true, blank:false, size:17..17
	}
}
