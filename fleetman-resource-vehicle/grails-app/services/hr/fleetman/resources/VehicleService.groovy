package hr.fleetman.resources

import grails.plugins.rest.client.RestBuilder
import grails.transaction.Transactional

@Transactional
class VehicleService {
	String serviceUrl
	def brands = ['Skoda', 'Volswagen', 'Opel', 'Peugeot', 'Renault', 'Volvo', 'Saab', 'Kia', 'Honda', 'Hyndai']

	def fetchVehicle(String vin) {
		return Vehicle.findByVin(vin)
	}

	Vehicle populateDetails(String p_vin) {
		def vehicle = new Vehicle(vin:p_vin)
		vehicle
	}

	Vehicle populateDetailsFromService(String vin) {
		if(vin) {
			try {
				def restBuilder = new RestBuilder()
				def urlWithVIN =
						"${serviceUrl}&vin=${vin.encodeAsURL()}"
				def response = restBuilder.get(urlWithVIN)
				def json = response.json
				def records = json.results
				def matchingRecord = records.find { r ->
					new Vehicle(r)
				}
			} catch (Exception e) {
				log.error "Problem retrieving vehicle details: ${e.message}", e
			}
		}
	}
	
	
}
