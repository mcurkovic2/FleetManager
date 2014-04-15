<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#create-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h1>
				<g:message code="default.create.label" args="[entityName]" />
			</h1>
		</div>
	</div>

	<g:render template="/shared/flashMessage"></g:render>

	<div class="row">
		<div class="col-lg-4">
			<g:hasErrors bean="${carInstance}">
				<div class="alert alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<ul class="errors" role="alert">
						<g:eachError bean="${carInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}" /></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
		</div>
	</div>

	<div class="row">

		<div class="col-lg-4">
			<g:form url="[resource:carInstance, action:'save']">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
