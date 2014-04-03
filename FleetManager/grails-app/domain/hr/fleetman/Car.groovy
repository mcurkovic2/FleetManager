package hr.fleetman

import hr.fleetman.common.Country
import hr.fleetman.common.DrivingDistance
import hr.fleetman.events.RegistrationEvent
import hr.fleetman.events.ServiceEvent
import hr.fleetman.events.TireChangeEvent


class Car {

    static constraints = {
		vin unique: true, nullable :false
    }
	
	enum FuelType {
		GASOLINE,
		DIESEL,
		HIBRID,
		ELECTRIC_POWER
	}
	
	static hasMany = [serviceEvents: ServiceEvent, registrationEvents : RegistrationEvent, tireChangeEvents: TireChangeEvent]
	
	String vin, currentRegistrationId, description
	Date lastRegistrationEvent
	Integer active
	Integer power
	String make
	String type
	String model
	String color
	String manufacturer
	Country maufacturerCountry
	Date inTrafficSinceDate
	Date firstRegistrationDate
	FuelType fuelType
	DrivingDistance currentDrivingDistance
	
}
