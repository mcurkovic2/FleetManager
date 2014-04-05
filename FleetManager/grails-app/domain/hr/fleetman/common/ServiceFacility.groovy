package hr.fleetman.common


class ServiceFacility {

    static constraints = {
    }
	static embedded = ['address']
	
	String name
	Address address
}
