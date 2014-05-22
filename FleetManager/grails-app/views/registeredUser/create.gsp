<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="row">
		<div class="col-lg-4">
			<div id="create-user" class="content scaffold-create" role="main">
				<h1>
					<g:message code="default.create.label" args="[entityName]" />
				</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${registeredUserInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${registeredUserInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<g:form url="[resource:registeredUserInstance, action:'save']">
					<fieldset class="form">
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
						<g:link class="list" action="index">
							<g:message code="general.text.cancel" args="[entityName]" />
						</g:link>
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
	</body>
</html>
