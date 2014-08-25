<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
<g:set var="entityName"
	value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
</head>
<body>
	<content tag="validation" >
		<g:hasErrors bean="${newRegisteredUserCommandInstance}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">×</button>
				<ul>
					<g:eachError bean="${newRegisteredUserCommandInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</div>
		</g:hasErrors>
	</content>
    <content tag="col1">
	<div class="portlet portlet-default">
		<div class="portlet-heading">
			<div class="portlet-title">
				<h4>
					<g:message code="user.details.panelTitle" />
				</h4>
			</div>
			<div class="clearfix"></div>
		</div>

		<div class="portlet-body">
			<div class="row">
				<div class="col-lg-12">
					<g:form url="[resource:registeredUserInstance, action:'save']" autocomplete="off">
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-primary"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
							<g:link class="list" action="index" class="btn btn-default">
								<g:message code="general.text.cancel" args="[entityName]" />
							</g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
	</content>

</body>
</html>
