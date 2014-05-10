package hr.foobar.users

class RegisteredUser {
    String username
    String passwordHash
    
    static hasMany = [ roles: RegisteredRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
}
