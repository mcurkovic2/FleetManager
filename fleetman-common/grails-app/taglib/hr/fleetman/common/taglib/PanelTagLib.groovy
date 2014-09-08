package hr.fleetman.common.taglib

import hr.fleetman.components.PanelData

class PanelTagLib {

		private static final String SHARED_COMPONENTS_DEFAULT_BUTTON = '/shared/components/defaultButton'

		private static final String SHARED_COMPONENTS_PANEL = "/shared/components/panel"

		private static final String PLUGIN_FLEETMAN_COMMON = "fleetman-common"

		private static final String SHARED_COMPONENTS_EMPTY_TABLE_MESSAGE = "/shared/components/emptyTableMessage"

	/**
	 * Renders form
	 * @attr modelInstance REQUIRED instance of domain/command used by template
	 * @attr formTemplate REQUIRED path to template
	 * @attr formTemplatePlugin REQUIRED plugin id where template is located
	 */
	def panel = { attrs, body ->
		def myInstance = attrs.get('modelInstance')
		out << render(
				template: SHARED_COMPONENTS_PANEL,
				plugin: PLUGIN_FLEETMAN_COMMON,
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
	
	/**
	 * Renders template form 
	 * @attr modelInstance REQUIRED instance of domain/command used by template
	 * @attr formTemplate REQUIRED path to template
	 * @attr formTemplatePlugin REQUIRED plugin id where template is located 
	 */
	def myRenderTemplate = {attrs, body ->
		def instance = attrs.get('modelInstance')
		out << render(
				template: attrs.formTemplate,
				plugin: attrs.formTemplatePlugin,
				model:[modelInstance: instance] 
			)
	}
	
	/**
	 * Renders empty table placeholder
	 * 
	 * @attr title controllers action name after click
	 * @attr message REQUIRED message to display inside placeholder
	 * @attr newItemButtonControllerAction controller action to dispatch when click on new item button
	 * @attr newItemButtonTitle title of new item button 
	 */	 
	def emptyTableMessage = {
		attrs, body -> 
		assert attrs.message!=null, "message must be defined" 
		out << render(
				template: SHARED_COMPONENTS_EMPTY_TABLE_MESSAGE,
				plugin: PLUGIN_FLEETMAN_COMMON,
				model: [
					title: attrs.title, 
					message: attrs.message, 
					newItemButtonControllerAction: attrs.newItemButtonControllerAction, 
					newItemButtonTitle: attrs.newItemButtonTitle
				]
			)
	}
	
	/**
	 * Renders the bootstrap empty row.
	 * 
	 */
	def emptyRow = {
		attrs, body ->
		out << '''
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>'''
	}
	
	/**
	 * Creates basic button.
	 *
	 * @attr action REQUIRED controllers action name after click
	 * @attr controller name of controller
	 * @attr title REQUIRED button title
	 * @attr type class name of btn extension e.g. default, red, green, red, blue. If empty defaults to 'default' 
	 */
	def defaultButton = {
		
		attrs, body ->
		assert attrs.action != null, 'Action is reqruired'
		assert attrs.title != null, 'Title is reqruired'
		
		out << render(
			template: SHARED_COMPONENTS_DEFAULT_BUTTON,
			plugin: PLUGIN_FLEETMAN_COMMON,
			model:[
				action: attrs.action, 
				controller:attrs.controller, 
				title:attrs.title,
				type: attrs.type]
			)
	}
}
