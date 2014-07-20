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

	

	def newVehicleFlow() {
		brandSelection {
			on("next"){
				def vehicle = new NewVehicleCommand(params)
				if (vehicle.validate()) {
					vehicle = vehicleService.populateDetails(vin)
				} else {
					error()
				}
			}.to "typeSelection"
			on("newBrand"){
				
			}.to("newBrand")
			on("cancel").to "index"
		}

		typeSelection {
			on("confirm"){
			}.to "index"
			on("newType").to "newType"
			on("back").to "showVinForm"
			on("cancel").to "index"
		}
		
		newType {
			on("confirm"){
				
			}.to "index"
			on("cancel").to "index"
		}

		newType {
			on("confirm"){
				
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
