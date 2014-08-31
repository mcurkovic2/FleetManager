package hr.fleetman.resources

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(VehicleService)
class VehicleServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

   void "populateDetails - mocked"() {
		when:"broken VIN is provided"
			def vehicle = service.populateDetails "DUMMYVIN"
			
		then: "service returns null"
			vehicle
		
    }
   
   
   void "findBrands"() {
	   when:"findBrands is called"
		   def brands = service.findBrands()
		   
	   then: "service returns list of Brand objects"
		   brands
	   	   brands.size == 1
		   brands[0].name
   }
   
   
   void "findModels"() {
	   when:"findModels is called for given brand id"
		   def models = service.findModels(1)
		   
	   then: "service returns list of Model objects"
		   models
		   models.size == 20
		   models[0].name == "Alfa Romeo 33"
   }
   
   
   void "fetchBrandById"() {
	   when: "fetchBrandById is called for given brandId"
	   	def brandName = service.fetchBrandById("1")
	   then: "brand name should be returned"
	   	brandName
	   
   }
   
    void "fetchModelById"() {
	   when: "fetchModelById is called for given brandId and modelId"
	   	def modelName = service.fetchModelById("1", "1")
	   then: "brand name should be returned"
	   	modelName
	   
   }
   
}
