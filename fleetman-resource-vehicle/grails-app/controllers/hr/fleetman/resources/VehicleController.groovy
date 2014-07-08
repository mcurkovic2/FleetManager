package hr.fleetman.resources

class VehicleController {

    def index(Integer max) { 
		params.max = Math.min(max ?: 10, 100)
		respond Vehicle.list(params), model:[vehicleInstanceCount: Vehicle.count()]
	}
}
