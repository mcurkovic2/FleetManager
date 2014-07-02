package hr.fleetman.security

import grails.transaction.Transactional
import hr.fleetman.users.RegisteredUser
import hr.fleetman.utils.Utils

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject

@Transactional
class SecurityService {
	
    def getLoggedRegisteredUser() {
		Subject currentUser = SecurityUtils.getSubject();
		RegisteredUser registeredUserInstance = RegisteredUser.findByUsername(currentUser.getPrincipal())
    }
	
	def checkPassword(username, password) {
		RegisteredUser registeredUserInstance = RegisteredUser.findByUsername(username)
		return registeredUserInstance.passwordHash == Utils.encrypt(password)
	}
}
