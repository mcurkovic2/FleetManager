
<%@ page import="hr.fleetman.users.RegisteredUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
	<div class="portlet portlet-default">
		<div class="portlet-heading">
			<div class="portlet-title">
				<h4>
					<g:message code="user.users.panelTitle" />
				</h4>
			</div>
			<div class="clearfix"></div>
		</div>

		<div class="portlet-body">
			<div class="row">
				<div class="col-lg-12">
					<g:link action="create" class="btn btn-default">
						<g:message code="user.newUser.label"></g:message>
					</g:link>
				</div>
			</div>

<%--			<div class="row">--%>
<%--				<div class="col-lg-12">&nbsp;</div>--%>
<%--			</div>--%>

			<fm:emptyRow></fm:emptyRow>

			<div class="row">
				<div class="col-lg-12">

					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>

									<th class="col-md-2">
										${message(code: 'user.username.label', default: 'Username')} 
									</th>
									<th class="col-md-2">
										${message(code: 'user.firstName.label', default: 'First Name')}
										
									</th>
									<th class="col-md-2">
										${message(code: 'user.lastName.label', default: 'Last Name')}
									</th>
									<th class="col-md-6">
										${message(code: 'user.description.label', default: 'Description')}
										
									</th>
							</thead>
							<tbody>
								<g:each in="${registeredUserInstanceList}" status="i"
									var="registeredUserInstance">
									<tr>
										<td><g:link action="profileById"
												id="${registeredUserInstance.id}">
												${fieldValue(bean: registeredUserInstance, field: 'username')}
											</g:link></td>

										<td>
											${fieldValue(bean: registeredUserInstance, field: 'firstName')}
										</td>
										<td>
											${fieldValue(bean: registeredUserInstance, field: 'lastName')}
										</td>
										<td>
											${fieldValue(bean: registeredUserInstance, field: 'description')}
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>

						<div class="pagination">
							<g:paginate total="${registeredUserInstance ?: 0}"></g:paginate>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</content>
</body>
</html>
