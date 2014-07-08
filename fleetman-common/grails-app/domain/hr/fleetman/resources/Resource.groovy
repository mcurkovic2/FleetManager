package hr.fleetman.resources

import java.util.Date;

abstract class Resource {
	boolean active = true
	Date dateCreated
	Date lastUpdated
	String userCreateId

		static constraints = {
		active(nullable:false)
		userCreateId(nullable:true, balnk:false, size:1..20)
		dateCreated()
		lastUpdated()
	}

	static mapping = { tablePerHierarchy false }
}
