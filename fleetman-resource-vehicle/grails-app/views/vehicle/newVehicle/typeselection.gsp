<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1"> <%--	<h2>select type</h2>--%> <%--	selected brandId=${brandSelectionCommand.brandId}--%>

	<g:form>

		<g:formPanel formTemplate="typeSelectionForm"
			modelInstance="${typeSelectionCommand}"
			formTemplatePlugin="fleetman-resource-vehicle"
			title="${message(code:'newVehicle.typeSelection.panel.title')}"
			bottomActionsTemplate="typeSelectionActions"
			bottomActionsTemplatePlugin="fleetman-resource-vehicle"></g:formPanel>
	</g:form> </content>
</body>
</html>