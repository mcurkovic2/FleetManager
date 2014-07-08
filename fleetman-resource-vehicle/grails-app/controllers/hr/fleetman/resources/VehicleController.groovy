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
}
