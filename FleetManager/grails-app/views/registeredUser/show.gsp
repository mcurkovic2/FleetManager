
<%@ page import="hr.fleetman.users.RegisteredUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'RegisteredUser')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<g:message code="user.details" />
				</div>
				<div class="panel-body">

					<table class="table">
						<thead>

						</thead>
						<tbody>
							<tr>
								<th><g:message code="user.userId.label" default="Id" /></th>
								<td><g:fieldValue bean="${registeredUserInstance}"
										field="userId" /></td>
							</tr>

							<tr>
								<th><g:message code="user.active.label" default="Active" />
								</th>
								<td><g:checkBox name="active " value="true"
										checked="${registeredUserInstance?.active == true}"
										disabled="true" /></td>
							</tr>
							<tr>
								<th><g:message code="user.firstName.label"
										default="First Name" /></th>
								<td><g:fieldValue bean="${registeredUserInstance}"
										field="firstName" /></td>
							</tr>
							<tr>
								<th><g:message code="user.lastName.label"
										default="Last Name" /></th>
								<td><g:fieldValue bean="${registeredUserInstance}"
										field="lastName" /></td>
							</tr>
							<tr>
								<th><g:message code="user.description.label"
										default="Descritption" /></th>
								<td><g:fieldValue bean="${registeredUserInstance}"
										field="description" /></td>
							</tr>
							<shiro:hasPermission permission="registeredUser:administration">
								<tr>
									<th><g:message code="user.username.label"
											default="Username" /></th>
									<td><g:fieldValue bean="${registeredUserInstance}"
											field="username" /></td>
								</tr>
							</shiro:hasPermission>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div>
		<g:form url="[resource:registeredUserInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit"
					resource="${registeredUserInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>

</html>
