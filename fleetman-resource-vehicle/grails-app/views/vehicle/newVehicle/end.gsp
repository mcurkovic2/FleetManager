<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
<%--	<h2>Success!</h2>--%>
	
		<g:form >

			<g:formPanel title="${message(code:'newVehicle.success.panelHeader.label') }" 
				formTemplate="success"
				formTemplatePlugin="fleetman-resource-vehicle"
				bottomActionsTemplate="successActions"
				bottomActionsTemplatePlugin="fleetman-resource-vehicle"></g:formPanel>
		
		<!-- Other fields -->
<%--		<g:actionSubmit action="index" value="Back to index"></g:actionSubmit>--%>
		<%--		<g:submitButton name="details" value="Details"></g:submitButton>--%>
		
		</g:form>
	 </content>

</body>
</html>