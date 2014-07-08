package hr.fleetman.resources

import grails.transaction.Transactional

@Transactional
class VehicleService {

    def serviceMethod() {

    }
	
	def findVehicles() {
		
	}
	
	def fetchVehicle(String vin) {
		return Vehicle.findByVin(vin)
	}
}
