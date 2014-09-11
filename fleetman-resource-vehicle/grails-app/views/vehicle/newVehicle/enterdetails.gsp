<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
		<g:form>
			<g:formPanel modelInstance="${enterDetailsCommand}"
				title="${message(code:'newVehicle.enterDetails.panel.title')}"
				formTemplate="enterDetailsForm"
				formTemplatePlugin="fleetman-resource-vehicle"
				bottomActionsTemplate="enterDetailsActions"
				bottomActionsTemplatePlugin="fleetman-resource-vehicle"></g:formPanel>
		</g:form> 
	</content>

</body>
</html>