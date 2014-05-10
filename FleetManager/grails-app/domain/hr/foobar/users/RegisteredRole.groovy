package hr.foobar.users

class RegisteredRole {
    String name

    static hasMany = [ users: RegisteredUser, permissions: String ]
    static belongsTo = RegisteredUser

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
