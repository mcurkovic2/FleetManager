package hr.fleetman.common

class User {

	static mapping = {
		tablePerHierarchy false
	}
	
	String  firstName, lastName, description
	boolean active = 1
	Contact contact
	Date dateCreated
	Date lastUpdated
	
	
	static constraints = {
		firstName(nullable: true, blank: true, unique: false)
		lastName(nullable: true, blank: true, unique: false)
		description(nullable: true, blank: true, unique: false)
		active(nullable: false)
		contact(nullable: true)
		dateCreated()
		lastUpdated()
	}
}
