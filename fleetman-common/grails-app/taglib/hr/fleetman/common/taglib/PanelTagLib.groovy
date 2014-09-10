package hr.fleetman.common.taglib

import hr.fleetman.components.PanelOptions



class PanelTagLib {

		private static final String SHARED_COMPONENTS_PANEL_PANEL_FOOTER = '/shared/components/panel/panelFooter'

		private static final String SHARED_COMPONENTS_PANEL_PANEL_HEADER = '/shared/components/panel/panelHeader'

		private static final String SHARED_COMPONENTS_DATA_TABLE = '/shared/components/table/dataTable/dataTable'

		private static final String SHARED_COMPONENTS_DATA_TABLE_HEADER = '/shared/components/table/dataTable/dataTableHeader'

		private static final String SHARED_COMPONENTS_DATA_TABLE_BODY = '/shared/components/table/dataTable/dataTableBody'

	private static final String SHARED_COMPONENTS_DEFAULT_BUTTON = '/shared/components/button/defaultButton'

	private static final String SHARED_COMPONENTS_PANEL = "/shared/components/form/formPanel"

	private static final String PLUGIN_FLEETMAN_COMMON = "fleetman-common"

	private static final String SHARED_COMPONENTS_EMPTY_TABLE_MESSAGE = "/shared/components/table/emptyTableMessage"

	/**
	 * Renders form
	 * @attr modelInstance REQUIRED instance of domain/command used by template
	 * @attr formTemplate REQUIRED path to template
	 * @attr formTemplatePlugin REQUIRED plugin id where template is located
	 */
	def formPanel = { attrs, body ->
		def myInstance = attrs.get('modelInstance')
		assert attrs.formTemplate
		
		
		out << render(
				template: SHARED_COMPONENTS_PANEL,
				plugin: PLUGIN_FLEETMAN_COMMON,
				model:[
					data: new PanelOptions(
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
	 * Renders panel header
	 * @attrs title panel title
	 * @attrs actionButtonsTemplate path to template to render for lower action buttons
	 * @attrs actionButtonsTemplatePlugin id of plugin where template to render for lower action buttonssi 
	 */
	def panelHeader = {
		
		attrs, body->
		out << render(
				template: SHARED_COMPONENTS_PANEL_PANEL_HEADER, 
				plugin:PLUGIN_FLEETMAN_COMMON, 
				model:[title: attrs.title, actionButtonsTemplate: attrs.actionsButtonsTemplate, actionButtonsTemplatePlugin: attrs.actionButtonsTemplatePlugin]
			)
	}
	
	/**
	 * Renders panel footer
	 * @attrs actionButtonsTemplate path to template to render for lower action buttons
	 * @attrs actionButtonsTemplatePlugin id of plugin where template to render for lower action buttonssi
	 */
	def panelFooter = {
		
		attrs, body->
		out << render(
				template: SHARED_COMPONENTS_PANEL_PANEL_FOOTER, 
				plugin:PLUGIN_FLEETMAN_COMMON, 
				model:[actionButtonsTemplate: attrs.actionsButtonsTemplate, actionButtonsTemplatePlugin: attrs.actionButtonsTemplatePlugin])
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
	
	/**
	 * Renders jquery DataTables table
	 * @attrs columnOptions REQUIRED map of TableColumnOptions objects, used to define column details (data binding, link settings etc.)
	 * @attrs instanceList REQUIRED list of objects to bind table to
	 * @attrs tableId REQUIRED css3 selector id of table
	 * @attrs showPagination should pagination be visible
	 * @attrs panelTitle panel title
	 */
	def dataTable = {
		attrs, body -> 
			
			def columnOptions = attrs.columnOptions
			def instanceList = attrs.get('instanceList')
			def tableId= attrs.tableId
			def showPagination= attrs.showPagination
			def panelTitle= attrs.panelTitle
			
			assert columnOptions != null
			assert instanceList != null, "instanceList must me set for dataTable!"
			
			assert tableId != null
			
			out << render(
					
					template: SHARED_COMPONENTS_DATA_TABLE,
					plugin: PLUGIN_FLEETMAN_COMMON,
					model:[
						tableId: attrs.tableId,
						showPagination: attrs.showPagination,
						panelTitle: attrs.panelTitle,
						columnOptions: columnOptions, 
						instanceList: instanceList
					]) 
	}
	
	
	/**
	 * Used by dataTable taglib only. Do not use as standalone taglib.
	 */
	def dataTableHeader = {
		
		attrs, body ->
			def columnOptions = attrs.columnOptions
			
			assert columnOptions != null, "columnOptions must be set for tableOptions!"
			
			out << render(
				template: SHARED_COMPONENTS_DATA_TABLE_HEADER,
				plugin: PLUGIN_FLEETMAN_COMMON,
				model:[
					columns: attrs.columnOptions
				])
	}
	
	
	/**
	 * Used by dataTable taglib only. Do not use as standalone taglib.
	 */
	def dataTableBody = {
		
		attrs, body ->
			def columnOptions = attrs.columnOptions
			def instanceList = attrs.get('instanceList')
			assert columnOptions != null, "columnOptions must be set for tableOptions!"
			
			out << render(
				template: SHARED_COMPONENTS_DATA_TABLE_BODY,
				plugin: PLUGIN_FLEETMAN_COMMON,
				model:[
					columnOptions: attrs.columnOptions,
					instanceList: instanceList
				])
	}
}
