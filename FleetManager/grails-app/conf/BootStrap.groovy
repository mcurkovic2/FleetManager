
import hr.fleetman.users.RegisteredRole
import hr.fleetman.users.RegisteredUser

import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

	def init = { servletContext ->
		log.debug("Creating dummy roles")

		//ROLES
		def adminRole = new RegisteredRole(name: "adminRole", description: "Role for administering application")
		adminRole.addToPermissions("*:*")

		def basicRole = new RegisteredRole(name: "basicRole")
		basicRole.addToPermissions("dashboard:*")


		log.debug("Creating dummy users")
		def adminUser = new RegisteredUser(userId:"12345", username: "admin", passwordHash: new Sha512Hash("admin").toHex())
		adminUser.addToPermissions("*:*")
		adminUser.addToRoles(adminRole)
		adminUser.save()

		def user = new RegisteredUser(userId: "22222", username: "user", passwordHash: new Sha512Hash("user").toHex())
		user.addToRoles(basicRole)
		user.save()
	}
	
	def destroy = {
		
	}
}
