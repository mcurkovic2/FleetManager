package hr.fleetman.resources

import grails.test.mixin.*
import hr.fleetman.resources.vehicle.Brand
import hr.fleetman.resources.vehicle.Type
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(VehicleService)
@Mock([Brand, Type])
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
	   given: "one brand is in db"
	   		 createBrand()
	   when:"findBrands is called"
		   def brands = service.findBrands()
		   
	   then: "service returns list of Brand objects"
		   brands
	   	  
   }

	private createBrand() {
		def brand = new Brand(name:"Toyota")
		def model = new Type(name: "Corolla")
		brand.types = [model]
		brand.save()
	}
   
   
   void "findModelsForBrandId"() {
	   given: "brand is fetched fom db"
	   		createBrand()
			def brand = Brand.list().get(0)
	   when:"findModelsForBrandId is called for given brand id"
		   	def models = service.findModelsForBrandId(brand.id.toString())
		   
	   then: "service returns list of Model objects"
		   	models
			models.toList().get(0).name == "Corolla"
   }
   
   
   void "fetchBrandById"() {
	   given: "dummy brand inserted to db"
	   		createBrand()
			def brandId = Brand.list().get(0).id.toString()  
	   when: "fetchBrandById is called for given brandId"
	   		def brandName = service.fetchBrandById(brandId)
	   then: "brand name should be returned"
	   		brandName
	   
   }
   
    void "fetchModelById"() {
		given: "brand is mocked"
			createBrand()
			def typeId = Brand.list().get(0).types.toList().get(0).id.toString()
	   when: "fetchModelById is called for given brandId and modelId"
	   		def type = service.fetchModelById(typeId)
	   then: "brand name should be returned"
	   		type
	   
   }
   
}
