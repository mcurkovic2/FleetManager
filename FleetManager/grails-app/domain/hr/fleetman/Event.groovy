package hr.fleetman

abstract class  Event {

	static mapping = {
        tablePerHierarchy false
    }
	
    static constraints = {
    }
	
	Date occurenceDate
	Integer active
}
