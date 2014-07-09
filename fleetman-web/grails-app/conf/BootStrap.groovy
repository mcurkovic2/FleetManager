
import hr.fleetman.common.Contact
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
		 
		def adminUser = new RegisteredUser(
				username: "admin",
				passwordHash: new Sha512Hash("admin").toHex(),
				firstName : "James",
				lastName : "Hetfield",
				description: "James Alan Hetfield is the main songwriter, co-founder, lead vocalist, rhythm guitarist and lyricist for the American heavy metal band Metallica.",
				contact: new Contact(email: "test@gmail.com", phone:"0993100144")
				);
			
		
		adminUser.addToPermissions("*:*")
		adminUser.addToRoles(adminRole)
		adminUser.save()

		def user = new RegisteredUser(
			username: "user", 
			passwordHash: new Sha512Hash("user").toHex(),
			firstName : "Lars",
			lastName : "Ulrich",
			description: "Lars Ulrich is a Danish-American drummer and one of the founding members of American heavy metal band Metallica. He was born in Gentofte, Denmark to an upper-middle-class family.");
		
		user.addToRoles(basicRole)
		user.save()
	}

	def destroy = {
	}
}
