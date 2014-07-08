package hr.fleetman.resources

class Vehicle extends Resource {
	String vin
	String brand
	String	model
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
		vin(nullable:false, blank:false, size: 17..17)

		brand(nullable:true, blank:false, size: 3..50)
		model(nullable:true, blank:false, size: 3..50)

		trim(nullable:true, blank:false, size: 3..50)
		fuelDelivery(nullable:true, blank:false, size: 3..50)
		fuelType(nullable:true, blank:false, size: 3..50)
		bodyStyle(nullable:true, blank:false, size: 3..50)
		transmission(nullable:true, blank:false, size: 3..50)
		tyreType(nullable:true, blank:false, size: 3..50)

	}


}
