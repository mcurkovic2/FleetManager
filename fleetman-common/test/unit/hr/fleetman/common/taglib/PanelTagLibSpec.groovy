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

	void "test panel-header tag"() {
		expect:
		applyTemplate('<fm:panelHeader title="bla"/>') ==
				'''<div>bla</div>'''
	}

	void "test default button"() {
		expect:
		applyTemplate('<fm:defaultButton action="bla" code="mycode"/>') ==
				'''<g:link action="bla" class="btn btn-default"><g:message code="mycode"></g:message></g:link>'''
	}
}
