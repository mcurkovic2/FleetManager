package hr.fleetman.users

import hr.fleetman.common.Contact
import hr.fleetman.common.User

class RegisteredUser extends User {
	String username
    String passwordHash
	
    static hasMany = [ roles: RegisteredRole, permissions: String ]

	static constraints = {
		username(size: 4..20,nullable: false, blank: false, unique: true) 
		passwordHash(nullable: false, blank: false, unique: false)
	}
}
