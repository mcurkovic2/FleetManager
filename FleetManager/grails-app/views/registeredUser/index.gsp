
<%@ page import="hr.fleetman.users.RegisteredUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodySingleColumn" />
<title><g:message code="title.homepage" /></title>
</head>
<body>
	<content tag="col1">
<%--	<div class="row">--%>
<%--		<div class="col-lg-8">--%>

			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><g:message code="user.users.panelTitle" /></h4>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="portlet-body">
					<div class="row">
						<div class="col-lg-12">
							<g:link action="create" class="btn btn-default">
								<g:message code="user.newUser.label"></g:message>
							</g:link>
							<%--<button type="button" class="btn btn-default">Show List</button>
							<div class="btn-group">
								<button type="button" class="btn btn-default">New
									Service</button>
								<button type="button" class="btn btn-default">New
									Registration</button>
								<button type="button" class="btn btn-default">New Tire
									Change</button>
							</div>
						--%>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">&nbsp;</div>
					</div>

					<div class="row">
						<div class="col-lg-12">

							<div class="table-responsive">
								<table class="table table-hover table-striped tablesorter">
									<thead>
										<tr>

											<th>
												${message(code: 'user.username.label', default: 'Username')} <i
												class="fa fa-sort"></i>
											</th>
											<th>
												${message(code: 'user.firstName.label', default: 'First Name')}
												<i class="fa fa-sort"></i>
											</th>
											<th>
												${message(code: 'user.lastName.label', default: 'Last Name')}
												<i class="fa fa-sort"></i>
											</th>
											<th>
												${message(code: 'user.description.label', default: 'Description')}
												<i class="fa fa-sort"></i>
											</th>
									</thead>
									<tbody>
										<g:each in="${registeredUserInstanceList}" status="i"
											var="registeredUserInstance">
											<tr>
												<td><g:link action="show"
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

<%--		</div>--%>
<%--	</div>--%>
	</content>
</body>
</html>
