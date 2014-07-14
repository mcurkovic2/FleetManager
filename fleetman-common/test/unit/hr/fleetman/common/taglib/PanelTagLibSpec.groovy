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

    void "test something"() {
    }
	
	void "test panel-header tag"() {
		expect:
		applyTemplate('<fm:panelHeader title="bla"/>') ==
		 		'''
				 <div class="row">
				 	<div class="col-lg-12">
						<g:link action="create" class="btn btn-default">
							bla
						</g:link>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>'''
//		applyTemplate('<s:bye author="${author}" />', [author: new Author(name: 'Fred')]) == 'Bye Fred'
	}

//	void "test tag calls"() {
//		expect:
//		tagLib.hello().toString() == 'Hello World'
//		tagLib.hello(name: 'Fred').toString() == 'Hello Fred'
//		tagLib.bye(author: new Author(name: 'Fred')).toString == 'Bye Fred'
//	}
}
