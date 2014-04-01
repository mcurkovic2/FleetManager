package hr.fleetman

class Car {

    static constraints = {
    }
	
	static hasMany = [serviceEvents: ServiceEvent, registrationEvents : RegistrationEvent]
	
	String vin, currentRegistrationId
	Integer active
	
}
