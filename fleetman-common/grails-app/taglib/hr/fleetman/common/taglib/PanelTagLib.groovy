package hr.fleetman.common.taglib

import hr.fleetman.components.PanelData

class PanelTagLib {

	def panel = { attrs, body ->
		def myInstance = attrs.get('modelInstance')
		out << render(
				template: "/shared/components/panel",
				plugin: "fleetman-common",
				model:[
					data: new PanelData(
								title:attrs.title, 
								formTemplate: attrs.formTemplate, 
								formTemplatePlugin: attrs.formTemplatePlugin, 
								upperActionsTemplate: attrs.upperActionsTemplate,
								upperActionsTemplatePlugin: attrs.upperActionsTemplatePlugin,
								bottomActionsTemplate: attrs.bottomActionsTemplate,
								bottomActionsTemplatePlugin: attrs.bottomActionsTemplatePlugin,
								instance: myInstance
							  )
				] 
			)
	}
	
	def myForm = {attrs, body ->
		def instance = attrs.get('modelInstance')
		out << render(
				template: attrs.formTemplate,
				plugin: attrs.formTemplatePlugin,
				model:[modelInstance: instance] 
			)
	}
	
	/**
	 * Renders the bootstrap empty row.
	 */
	def emptyRow = {
		attrs, body ->
		out << '''
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>'''
	}
	
	def defaultButton = {
		
		attrs, body ->
		
		def result = g.link(action:attrs.action, class:"btn btn-default", title:g.message(code: attrs.code)) //'<g:link action="'+attrs.action+'" class="btn btn-default">'

		out << result
	}
}
