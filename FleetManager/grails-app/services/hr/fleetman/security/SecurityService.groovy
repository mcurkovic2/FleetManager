package hr.fleetman.security

import grails.transaction.Transactional
import hr.fleetman.users.RegisteredUser

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject

@Transactional
class SecurityService {

    def getLoggedRegisteredUser() {
		Subject currentUser = SecurityUtils.getSubject();
		RegisteredUser registeredUserInstance = RegisteredUser.findByUsername(currentUser.getPrincipal())
    }
}
