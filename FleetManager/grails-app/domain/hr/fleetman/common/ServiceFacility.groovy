package hr.fleetman.common


class ServiceFacility {

    static constraints = {
    }
	static embedded = ['homeAddress', 'workAddress']
	
	String name
	Address address
}
