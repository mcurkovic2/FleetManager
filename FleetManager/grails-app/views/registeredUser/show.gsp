
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
		<div class="col-lg-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<g:message code="user.details.panelTitle" />
				</div>
				<div class="panel-body">

					<table class="table">
						<thead>

						</thead>
						<tbody>
							<tr>
								<th><g:message code="user.username.label"
										default="Username" /></th>
								<td><g:fieldValue bean="${registeredUserInstance}"
										field="username" /></td>
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
						</tbody>
					</table>

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

				</div>
			</div>
		</div>
		<shiro:hasPermission permission="registeredUser:administration">
			<div class="col-lg-6">
				<%--				<div class="panel panel-primary">--%>
				<%--					<div class="panel-heading">--%>
				<%--						<g:message code="user.roles" />--%>
				<%--					</div>--%>
				<%--					<div class="panel-body">--%>
				<div class="row">

					<div class="col-lg-12">
						<g:link action="create" class="btn btn-default">
							<g:message args="[entityName]" code="default.new.label"></g:message>
						</g:link>
						<button type="button" class="btn btn-default">Show List</button>
						<div class="btn-group">
							<button type="button" class="btn btn-default">New
								Service</button>
							<button type="button" class="btn btn-default">New
								Registration</button>
							<button type="button" class="btn btn-default">New Tire
								Change</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
				</div>
				<div class="table-responsive">
					<table
						class="table table-bordered table-hover table-striped tablesorter">
						<thead>
							<tr>
								<th>
									${message(code: 'registeredRole.name.tableHeader', default: 'Name')}
									<i class="fa fa-sort"></i>
								</th>
								<th>
									${message(code: 'registeredRole.description.tableHeader', default: 'Description')}
									<i class="fa fa-sort"></i>
								</th>
						</thead>
						<tbody>
							<g:each in="${registeredUserInstance.roles}" status="i"
								var="registeredRoleInstance">
								<tr>
									<td>
										${fieldValue(bean: registeredRoleInstance, field: 'name')}
									</td>
									<td>
										${fieldValue(bean: registeredRoleInstance, field: 'description')}
									</td>
								</tr>
							</g:each>
						</tbody>
					</table>

					<div class="pagination">
						<g:paginate total="${registeredUserInstance.roles ?: 0}"></g:paginate>
					</div>


				</div>
				<%--					</div>--%>
				<%--				</div>--%>
			</div>
		</shiro:hasPermission>
	</div>


</body>

</html>
