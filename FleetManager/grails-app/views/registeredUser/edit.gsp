<%@ page import="hr.fleetman.users.RegisteredUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<%--<a href="#edit-registeredUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-registeredUser" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${registeredUserInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${registeredUserInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:registeredUserInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${registeredUserInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	--%>
	<g:render template="/shared/validationMessage"
		model="[instance: registeredUserInstance]"></g:render>
	<div class="row">
		<div class="col-lg-4">
			<g:form url="[resource:registeredUserInstance, action:'update']"
				method="PUT">
				<g:hiddenField name="version"
					value="${registeredUserInstance?.version}" />
				<fieldset>
					<g:render template="formEdit" />
				</fieldset>
				<fieldset>
					<g:actionSubmit class="save" action="update"
						value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link action="show" id="${registeredUserInstance.id}">
						<g:message code="default.back.label" />
					</g:link>
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
