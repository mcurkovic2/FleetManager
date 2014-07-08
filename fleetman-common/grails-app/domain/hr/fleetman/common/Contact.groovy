package hr.fleetman.common


class Contact {

	static constraints = {
		email email: true, blank: true
		phone blank: true
	}
	
	static belongsTo = [user:User]

	String email
	String phone
}
