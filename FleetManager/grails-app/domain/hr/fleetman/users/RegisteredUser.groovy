package hr.fleetman.users

import hr.fleetman.common.User
import hr.fleetman.users.RegisteredRole;

class RegisteredUser extends User{
	String username
    String passwordHash
	
    static hasMany = [ roles: RegisteredRole, permissions: String ]

	static constraints = {
		username(nullable: false, blank: false, unique: true)
	}
}
