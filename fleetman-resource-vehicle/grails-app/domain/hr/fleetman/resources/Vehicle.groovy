package hr.fleetman.resources

class Vehicle {
	String VIN
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
		VIN(nullable:false, blank:false, size: 17..17)
    }
	

}
