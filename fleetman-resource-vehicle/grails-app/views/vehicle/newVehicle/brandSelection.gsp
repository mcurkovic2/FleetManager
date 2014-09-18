<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">

	<g:form>
		
			<g:formPanel showValidationMessage="true" title="${message(code:'newVehicle.brandSelection.panel.title', default:'PANEL HEADER') }" 
				formTemplate="brandSelectionForm" 
				formTemplatePlugin="fleetman-resource-vehicle" 
				modelInstance="${brandSelectionCommand}" 
				bottomActionsTemplate="brandSelectionActions"
				bottomActionsTemplatePlugin="fleetman-resource-vehicle"	>
			</g:formPanel>

		</g:form> 
	</content>
</body>
</html>