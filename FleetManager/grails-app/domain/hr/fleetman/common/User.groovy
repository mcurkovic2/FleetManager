package hr.fleetman.common

class User {

	static mapping = {
		tablePerHierarchy false
	}
	
	String userId, firstName, lastName, description
	boolean active = 1

	static constraints = {
		userId(nullable: false, blank: false, unique: false)
		firstName(nullable: true, blank: true, unique: false)
		lastName(nullable: true, blank: true, unique: false)
		description(nullable: true, blank: true, unique: false)
		active(nullable: false)
	}
}
