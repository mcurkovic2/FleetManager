package hr.fleetman.common

import grails.test.mixin.TestFor
import hr.fleetman.common.User;
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "tes save not valid user"() {
		
		def user = new User(firstName: "test", lastName:"test")
		
		assertFalse user.validate()
    }
}
