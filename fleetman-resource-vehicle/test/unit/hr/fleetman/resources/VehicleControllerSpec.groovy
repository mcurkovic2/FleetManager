package hr.fleetman.resources

import grails.test.mixin.*
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(VehicleController)
@Mock(Vehicle)
class VehicleControllerSpec extends Specification {

	def setup() {
	}

	def cleanup() {
	}

	void "Test index page"() {
		when:"The index action is executed"
			controller.index()

		then:"The model is correct"
			model.vehicleInstanceList != null
			model.vehicleInstanceCount == 0
	}
}
