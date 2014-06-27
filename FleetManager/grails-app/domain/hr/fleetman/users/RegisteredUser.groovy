package hr.fleetman.users

import hr.fleetman.common.Contact;
import hr.fleetman.common.User
import hr.fleetman.users.RegisteredRole;

class RegisteredUser extends User{
	String username
    String passwordHash
	Contact contact
	
    static hasMany = [ roles: RegisteredRole, permissions: String ]

	static constraints = {
		username(nullable: false, blank: false, unique: true, maxLength: 50, minLength: 3)
		passwordHash(nullable: false, blank: false, unique: false, maxLength: 100, minLength:3)
		contact(nullable: true)
	}
}
