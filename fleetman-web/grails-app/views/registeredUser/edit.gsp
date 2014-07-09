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

	<g:render template="/shared/validationMessage"
		model="[instance: registeredUserInstance]"></g:render>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<g:message code="user.users.panelTitle" />
				</div>
				<div class="panel-body">

					<div class="row">
						<div class="col-lg-12">
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>
