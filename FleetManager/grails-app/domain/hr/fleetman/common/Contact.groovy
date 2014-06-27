package hr.fleetman.common

import hr.fleetman.users.RegisteredUser

class Contact {

	static constraints = {
		email email: true, blank: true
		phone blank: true
	}
	
	static belongsTo = [user:RegisteredUser]

	String email
	String phone
}
