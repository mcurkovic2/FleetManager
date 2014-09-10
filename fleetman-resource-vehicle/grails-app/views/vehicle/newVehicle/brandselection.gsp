<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
		
<%--		<g:hasErrors bean="${brandSelectionCommand}">--%>
<%--			<ul>--%>
<%--				<g:eachError var="err" bean="${brandSelectionCommand}">--%>
<%--					<li>--%>
<%--						${err}--%>
<%--					</li>--%>
<%--				</g:eachError>--%>
<%--			</ul>--%>
<%--		</g:hasErrors> --%>
		
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