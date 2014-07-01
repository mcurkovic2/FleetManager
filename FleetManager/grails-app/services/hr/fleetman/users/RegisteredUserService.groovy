package hr.fleetman.users

import grails.transaction.Transactional

@Transactional
class RegisteredUserService {

    def findByUsername(String username) {
		return RegisteredUser.findByUsername(username)
    }
}
