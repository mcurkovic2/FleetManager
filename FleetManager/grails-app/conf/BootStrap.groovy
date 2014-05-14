
import hr.fleetman.users.RegisteredUser
import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

	def init = { servletContext ->
		log.debug("Creating dummy user")
		def user = new RegisteredUser(username: "admin", passwordHash: new Sha512Hash("admin").toHex())
		user.addToPermissions("*:*")
		user.save()
	}
	def destroy = {
	}
}
