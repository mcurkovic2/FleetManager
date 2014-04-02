package hr.fleetman

abstract class  Event {

	static mapping = {
        tablePerHierarchy false
    }
	
	Date occurenceDate = new Date()
	boolean active
	Integer id
	
    static constraints = {
		occurenceDate nullable: false
		id unique: true, nullable: false
    }
	
	
}
