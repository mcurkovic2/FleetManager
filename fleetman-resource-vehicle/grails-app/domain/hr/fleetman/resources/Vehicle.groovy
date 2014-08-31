package hr.fleetman.resources

import hr.fleetman.events.InsurancePurchaseEvent
import hr.fleetman.events.RegistrationEvent
import hr.fleetman.events.ServiceEvent
import hr.fleetman.events.TireChangeEvent
import hr.fleetman.resources.vehicle.Brand
import hr.fleetman.resources.vehicle.Type

class Vehicle extends Resource {
	String vin
//	String brand
//	String type
	Brand brand
	Type type
	
	String currentRegistration
	
	int	year
	String	trim
	String	fuelDelivery
	String	fuelType
	int	noOfDoors
	String	bodyStyle
	String	transmission
	int	maxPowerBHP
	int	torqueLbsFeet
	int	torqueRPM
	int maxSpeedMPH
	String	tyreType
	float	height //mm
	float	lenght //mm
	float	width //mm
	float	weight //kg
	float	bootCapacityLitres
	int	acceleration
	float	fuelEconomyUrban
	float	fuelEconomyExtraUrban
	float	fuelEconomyCombined
	float	emissions //Emissions Data CO2 gm km
	

	static constraints = {
		vin nullable:false, blank:false, size: 17..17
//		brand nullable:false
//		type nullable:false
		trim nullable:true, blank:false, size: 3..50
		fuelDelivery nullable:true, blank:false, size: 3..50
		fuelType nullable:true, blank:false, size: 3..50
		bodyStyle nullable:true, blank:false, size: 3..50
		transmission nullable:true, blank:false, size: 3..50
		tyreType nullable:true, blank:false, size: 3..50
		currentRegistration nullable:true, blank:false, size: 3..20
	}
	
	static hasMany = [serviceEvents: ServiceEvent, registrationEvents : RegistrationEvent, tireChangeEvents: TireChangeEvent, insurancePurchaseEvents: InsurancePurchaseEvent]


}
