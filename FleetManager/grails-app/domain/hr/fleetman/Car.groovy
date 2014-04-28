package hr.fleetman

import hr.fleetman.common.Country
import hr.fleetman.common.DrivingDistance
import hr.fleetman.events.InsurancePurchaseEvent;
import hr.fleetman.events.RegistrationEvent
import hr.fleetman.events.ServiceEvent
import hr.fleetman.events.TireChangeEvent


class Car {

	static constraints = {
		vin unique: true, nullable :false, size: 10..30
		currentRegistrationId nullable :true, size: 5..12
		description	nullable :true, size: 0..2000
		lastRegistrationEvent nullable :true
		power nullable :true, min:10, max:300
		make nullable :true
		type  nullable :true
		model nullable :true
		color nullable :true
		manufacturer nullable :true
		maufacturerCountry nullable :true
		inTrafficSinceDate nullable :true
		firstRegistrationDate nullable :true
		fuelType nullable :true
		currentDrivingDistance nullable :true
	}

	enum FuelType {
		GASOLINE,
		DIESEL,
		HIBRID,
		ELECTRIC_POWER
	}
	
	static hasMany = [serviceEvents: ServiceEvent, registrationEvents : RegistrationEvent, tireChangeEvents: TireChangeEvent, insurancePurchaseEvents: InsurancePurchaseEvent]
	static embedded = ['currentDrivingDistance']

	String vin, currentRegistrationId, description
	Date lastRegistrationEvent
	boolean active
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
