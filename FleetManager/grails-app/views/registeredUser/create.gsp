<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<g:render template="/shared/validationMessage"
		model="[instance: registeredUserInstance]" />

	<div class="row">
		<div class="col-lg-4">

			<g:form url="[resource:registeredUserInstance, action:'save']">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<%--					<button type="button" class="btn btn-primary">${message(code: 'default.button.create.label', default: 'Create')}</button>--%>
					<g:submitButton name="create" class="btn btn-primary"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:link class="list" action="index" class="btn btn-default">
						<g:message code="general.text.cancel" args="[entityName]" />
					</g:link>
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
