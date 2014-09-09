package hr.fleetman.common.taglib

import grails.test.mixin.*
import hr.fleetman.components.LinkOptions
import hr.fleetman.components.TableColumnOptions
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(PanelTagLib)
class PanelTagLibSpec extends Specification {

	def setup() {
		log.debug "START TEST"
	}

	def cleanup() {
	}

	void "panel tag with dummy form"() {
		expect:
		applyTemplate('<g:panel formTemplate="/shared/components/empty" fromTemplatePlugin="fleetman-common" title="TEST"/>') 
	}

	
	void "emptyTableMessage tag"() {
		expect:
		 log.info applyTemplate('<g:emptyTableMessage title="TITLE" message="MESSAGE"/>') 
		
	}
	
	void "dataTable tag"() {
		expect:
		 log.info applyTemplate('''
			 <g:dataTable 
			columnOptions="${options}"
			instanceList="${instanceList}" />
			 '''
		 , [instanceList:[new TestData(id:1, name: '12345')], options: [
				new TableColumnOptions(
					headerCode: "vehicle.vin.tableHeader", 
					cssClass:2,
					bindToProperty:"name", 
					linkData: new LinkOptions(action:"show", idProperty:"id"))]] )
		
	}
}
