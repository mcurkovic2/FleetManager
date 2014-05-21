package hr.fleetman.users

class RegisteredRole {
    String name
	String description

    static hasMany = [ users: RegisteredUser, permissions: String ]
    static belongsTo = RegisteredUser

    static constraints = {
        name(nullable: false, blank: false, unique: true)
		description(nullable: true, blank: true, maxSize: 1000)
    }
}
