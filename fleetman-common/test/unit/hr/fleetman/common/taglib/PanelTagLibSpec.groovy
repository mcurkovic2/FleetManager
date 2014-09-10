package hr.fleetman.common.taglib

import grails.test.mixin.*
import hr.fleetman.components.LinkOptions
import hr.fleetman.components.TableColumnOptions
import hr.fleetman.components.TableOptions
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
				tableOptions="${tableOptions}"
				columnOptions="${columnOptions}"
				instanceList="${instanceList}" />
			 ''', 
		 [
			 instanceList:[new TestData(id:1, name: '12345')], 
			 columnOptions: [
				new TableColumnOptions(
					headerCode: "vehicle.vin.tableHeader", 
					cssClass:2,
					bindToProperty:"name", 
					linkOptions: new LinkOptions(controller:'car', action:"show", idProperty:"id"))],
			tableOptions: new TableOptions(tableId:'table1')	
		 ]
		 )
		
	}
	
	void "Panel footer template"(){
		expect:
			applyTemplate('<g:panelFooter />')
	}
	
	void "Panel header template"(){
		expect:
			applyTemplate('<g:panelHeader title="bla"/>')
	}
}
