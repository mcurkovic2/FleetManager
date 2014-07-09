package hr.fleetman.resources

import grails.transaction.Transactional

@Transactional
class VehicleService {

	
	def fetchVehicle(String vin) {
		return Vehicle.findByVin(vin)
	}
	
	Vehicle populateDetails(String p_vin) {
		def vehicle = new Vehicle(vin:p_vin)
		vehicle
		
				
	}
}
