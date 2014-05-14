package hr.fleetman.users

class RegisteredUser {
    String username
    String passwordHash
	String firstName, lastName, description
	boolean active = true
	
    static hasMany = [ roles: RegisteredRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		firstName(nullable: true, blank: true, unique: false)
		lastName(nullable: true, blank: true, unique: false)
		description(nullable: true, blank: true, unique: false)
    }
}
