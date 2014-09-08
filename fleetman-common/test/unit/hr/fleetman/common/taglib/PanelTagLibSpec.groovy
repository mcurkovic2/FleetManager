package hr.fleetman.common.taglib

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(PanelTagLib)
class PanelTagLibSpec extends Specification {

	def setup() {
	}

	def cleanup() {
	}

	void "panel tag with dummy form"() {
		expect:
		applyTemplate('<g:panel formTemplate="/shared/components/empty" fromTemplatePlugin="fleetman-common" title="TEST"/>') 
	}

	
	void "emptyTableMessage tag"() {
		expect:
		 assertOutputMatches (/.*TITLE.*/, '<g:emptyTableMessage title="TITLE" message="MESSAGE"/>') 
		
	}
}
