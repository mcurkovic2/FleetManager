<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
	<h2>select brand</h2>
	<g:hasErrors bean="${brandSelectionCommand}">
		<ul>
			<g:eachError var="err" bean="${brandSelectionCommand}">
				<li>
					${err}
				</li>
			</g:eachError>
		</ul>
	</g:hasErrors> <g:form>


		<g:select id="brandSelection" name='brandId'
			value="${brandSelectionCommand?.brandId}"
			noSelection="${['':'Select One...']}"
			from="${brandSelectionCommand.brands}" 
			optionKey="id"
			optionValue="name"></g:select>

		<!-- Other fields -->
		<g:submitButton name="next" value="Next"></g:submitButton>
		<g:submitButton name="newBrand" value="New Brand"></g:submitButton>
		<g:submitButton name="cancel" value="Cancel"></g:submitButton>
	</g:form> </content>
</body>
</html>