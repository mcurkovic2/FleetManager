<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
	<h2>select type</h2>
	selected brandId=${brandSelectionCommand.brandId}
	<g:form>
	<g:select id="typeSelection" name='typeId'
			value="${typeSelectionCommand?.typeId}"
			noSelection="${['':'Select One...']}"
			from="${typeSelectionCommand.types}" 
			optionKey="id"
			optionValue="name"></g:select>
	
		<!-- Other fields -->
		<g:submitButton name="next" value="Next"></g:submitButton>
		<g:submitButton name="back" value="Back"></g:submitButton>
		<g:submitButton name="newType" value="New Type"></g:submitButton>
		<g:submitButton name="cancel" value="Cancel"></g:submitButton>
	</g:form> </content>
</body>
</html>