
<%@ page import="hr.fleetman.users.RegisteredUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'RegisteredUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:message code="user.details" />
				</div>
				<div class="panel-body">
					<dl>
						<dt>
							<g:message code="user.userId.label" default="Id" />
						</dt>

						<dd>
							<g:fieldValue bean="${registeredUserInstance}" field="userId" />
						</dd>
						<br>
						<dt>
							<g:message code="user.active.label" default="Active" />
						</dt>
						<dd>
							<g:checkBox name="active " value="true"
								checked="${registeredUserInstance?.active == true}" disabled="true" />
						</dd>
						<br>
						<dt>
							<g:message code="user.firstName.label" default="First Name" />
						</dt>
						<dd>
							<g:fieldValue bean="${registeredUserInstance}" field="firstName" />
						</dd>
						<br>
						<dt>
							<g:message code="user.lastName.label" default="Last Name" />
						</dt>
						<dd>
							<g:fieldValue bean="${registeredUserInstance}" field="lastName" />
						</dd>
						<br>
						<dt>
							<g:message code="user.description.label" default="Descritption" />
						</dt>
						<dd>
							<g:fieldValue bean="${registeredUserInstance}" field="description" />
						</dd>

					</dl>
				</div>
			</div>
		</div>
	</div>

	<div>
		<g:form url="[resource:registeredUserInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${registeredUserInstance}">
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
