import hr.foobar.users.RegisteredUser

import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

		def init = { servletContext ->
		def user = new RegisteredUser(username: "admin", passwordHash: new Sha512Hash("admin").toHex())
		user.addToPermissions("*:*")
		user.save()
	}
    def destroy = {
    }
}
