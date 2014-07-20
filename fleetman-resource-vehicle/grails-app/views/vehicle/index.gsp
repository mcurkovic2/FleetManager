
<%@ page import="hr.fleetman.resources.Vehicle"%>
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
					<fm:defaultButton action="newVehicleFlow"
						code="vehicle.action.new.label" />
					<%--					<g:link action="create" class="btn btn-default">--%>
					<%--						<g:message code="user.newUser.label"></g:message>--%>
					<%--					</g:link>--%>
				</div>
			</div>

<%--			<div class="row">--%>
<%--				<div class="col-lg-12">&nbsp;</div>--%>
<%--			</div>--%>
			<fm:emptyRow/>

			<div class="row">
				<div class="col-lg-12">

					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>

									<th class="col-md-2">
										${message(code: 'vehicle.vin.tableHeader', default: 'VIN')}
									</th>
									<th class="col-md-2">
										${message(code: 'vehicle.brand.tableHeader', default: 'BRAND')}

									</th>
									<th class="col-md-2">
										${message(code: 'vehicle.type.tableHeader', default: 'TYPE')}
									</th>
							</thead>
							<tbody>
								<g:each in="${vehicleInstanceList}" status="i" var="vehicle">
									<tr>
										<td><g:link action="show" id="${vehicle.id}">
												${fieldValue(bean: vehicle, field: 'vin')}
											</g:link></td>

										<td>
											${fieldValue(bean: vehicle, field: 'brand')}
										</td>
										<td>
											${fieldValue(bean: vehicle, field: 'type')}
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>

						<div class="pagination">
							<g:paginate total="${vehicleList ?: 0}"></g:paginate>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</content>
</body>
</html>
