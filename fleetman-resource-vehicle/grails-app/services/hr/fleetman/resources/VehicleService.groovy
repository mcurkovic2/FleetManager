package hr.fleetman.resources

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.transaction.Transactional
import hr.fleetman.resources.vehicle.Brand
import hr.fleetman.resources.vehicle.Type

@Transactional
class VehicleService {
	String serviceUrl

	def fetchVehicle(String vin) {
		return Vehicle.findByVin(vin)
	}

	Vehicle populateDetails(String p_vin) {
		def vehicle = new Vehicle(vin:p_vin)
		vehicle
	}
	
	def findBrands() {
		def brands = Brand.list()
		return brands
	}
	
	def findModelsForBrandId(String brandId) {
		def brand = Brand.findById(brandId)
		if (brand){
			def types = brand.types
			return types
		} else {
			return null
		}
	}
	
	Brand fetchBrandById(String brandId){
		return Brand.findById(brandId)
	}

	
	Type fetchModelById(String typeId){
		return Type.findById(typeId)
	}

	Vehicle populateDetailsFromService(String vin) {
		throw new IllegalStateException("not supported")
	}
	
	def brandsAndTypes =["Alfa Romeo" :
		[
			"Alfa Romeo 33",
			"Alfa Romeo 75",
			"Alfa Romeo 145",
			"Alfa Romeo 146",
			"Alfa Romeo 147",
			"Alfa Romeo 155",
			"Alfa Romeo 156",
			"Alfa Romeo 156 SW",
			"Alfa Romeo 159",
			"Alfa Romeo 159 SW",
			"Alfa Romeo 164",
			"Alfa Romeo 166",
			"Alfa Romeo Brera",
			"Alfa Romeo Cross Wagon",
			"Alfa Romeo Giulietta",
			"Alfa Romeo GT",
			"Alfa Romeo GTV",
			"Alfa Romeo MiTo",
			"Alfa Romeo Spider",
			"Alfa Romeo Sprint"
		],

		"Volkswagen":

		[
			"VW Amarok",
			"VW Beetle",
			"VW Bora",
			"VW Bora Variant",
			"VW Buggy",
			"VW Caddy",
			"VW Caravelle",
			"VW Corrado",
			"VW CrossGolf",
			"VW Eos",
			"VW Fox",
			"VW Golf Cabrio",
			"VW Golf I",
			"VW Golf II",
			"VW Golf III",
			"VW Golf III Variant",
			"VW Golf IV",
			"VW Golf IV Variant",
			"VW Golf Plus",
			"VW Golf V",
			"VW Golf V Variant",
			"VW Golf VI",
			"VW Golf VI Variant",
			"VW Golf VII",
			"VW Jetta",
			"VW LT-35",
			"VW Lupo",
			"VW Multivan",
			"VW Passat",
			"VW Passat Variant",
			"VW Passat CC",
			"VW Phaeton",
			"VW Polo",
			"VW Polo Classic",
			"VW R32",
			"VW Polo Variant",
			"VW Scirocco",
			"VW Sharan",
			"VW Tiguan",
			"VW Touareg",
			"VW Touran",
			"VW Transporter",
			"VW Up!",
			"VW Vento"
		],

		"Škoda":
		[
			"Škoda105",
			"Škoda 120",
			"Škoda 135",
			"Škoda Citigo",
			"Škoda Fabia",
			"Škoda Fabia Combi",
			"Škoda Fabia Sedan",
			"Škoda Favorit",
			"Škoda Felicia",
			"Škoda Felicia Combi",
			"Škoda Felicia Pick Up",
			"Škoda Forman",
			"Škoda Octavia",
			"Škoda Octavia Combi",
			"Škoda Pick Up",
			"Škoda Rapid",
			"Škoda Roomster",
			"Škoda Superb",
			"Škoda Yeti"
		],
		"Peugeot":
		[
			"Peugeot 104",
			"Peugeot 106",
			"Peugeot 107",
			"Peugeot 205",
			"Peugeot 205 Cabrio",
			"Peugeot 206",
			"Peugeot 206 Break",
			"Peugeot 206 CC",
			"Peugeot 207",
			"Peugeot 207 CC",
			"Peugeot 207 SW",
			"Peugeot 208",
			"Peugeot 301",
			"Peugeot 304",
			"Peugeot 305",
			"Peugeot 306",
			"Peugeot 306 Break",
			"Peugeot 306 Cabrio",
			"Peugeot 307",
			"Peugeot 307 Break",
			"Peugeot 307 CC",
			"Peugeot 307 SW",
			"Peugeot 308",
			"Peugeot 308 CC",
			"Peugeot 308 SW",
			"Peugeot 309",
			"Peugeot 405",
			"Peugeot 406",
			"Peugeot 406 Break",
			"Peugeot 406 Coupe",
			"Peugeot 407",
			"Peugeot 407 Coupe",
			"Peugeot 407 SW",
			"Peugeot 504",
			"Peugeot 508",
			"Peugeot 605",
			"Peugeot 607",
			"Peugeot 806",
			"Peugeot 807",
			"Peugeot 1007",
			"Peugeot 2008",
			"Peugeot 3008",
			"Peugeot 4007",
			"Peugeot 5008",
			"Peugeot Boxer",
			"Peugeot Expert",
			"Peugeot Partner",
			"Peugeot RCZ"
		],
		"Ford" :
		[
			"Ford Aerostar",
			"Ford B-Max",
			"Ford Bronco",
			"Ford C-Max",
			"Ford Capri",
			"Ford Cougar",
			"Ford Escort",
			"Ford Escort Cabriolet",
			"Ford Escort Karavan",
			"Ford Escort Van",
			"Ford Explorer",
			"Ford F",
			"Ford Fiesta",
			"Ford Fiesta Courier",
			"Ford Focus",
			"Ford Focus C-Max",
			"Ford Focus Karavan",
			"Ford Fusion",
			"Ford Galaxy",
			"Ford Ghia",
			"Ford Granada",
			"Ford GT",
			"Ford Kuga",
			"Ford Ka",
			"Ford Maverick",
			"Ford Mondeo",
			"Ford Mondeo Karavan",
			"Ford Mustang",
			"Ford Orion",
			"Ford Probe",
			"Ford Puma",
			"Ford Ranger",
			"Ford Scorpio",
			"Ford Sierra",
			"Ford Sierra Karavan",
			"Ford S-Max",
			"Ford StreetKa",
			"Ford Taunus",
			"Ford Taurus",
			"Ford Tourneo",
			"Ford Transit",
			"Ford Windstar"
		]]
	
}
