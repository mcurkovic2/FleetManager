package hr.fleetman.resources

import java.util.Date;

abstract class Resource {
	int active = 1
	Date dateCreated
	Date lastUpdated

	String userCreateId
	static constraints = {
		active(nullable:false)
		dateCreated()
		lastUpdated()
	}

	static mapping = { tablePerHierarchy false }
}
