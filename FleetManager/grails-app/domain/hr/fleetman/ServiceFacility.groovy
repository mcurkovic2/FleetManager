package hr.fleetman

class ServiceFacility {

    static constraints = {
    }
	static embedded = ['homeAddress', 'workAddress']
	
	String name
	Address address
}
