<div class="table-responsive">
	<table id="tblVehicles" class="table table-striped">
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
				<th class="col-md-2">
					${message(code: 'vehicle.currentRegistration.tableHeader', default: 'REGISTRATION')}
				</th>
				</tr>
		</thead>
		<tbody>
			<g:each in="${instanceList}" status="i" var="instance">
				<tr>
					<td><g:link action="show" id="${instance.id}">
							${fieldValue(bean: instance, field: 'vin')}
						</g:link></td>

					<td>
						${
							fieldValue(bean: instance, field: 'brand.name')
						}
					</td>
					<td>
						${fieldValue(bean: instance, field: 'type.name')}
					</td>
					<td>
						${fieldValue(bean: instance, field: 'currentRegistration')}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>

	<div class="pagination">
		<g:paginate total="${instanceList ?: 0}"></g:paginate>
	</div>
</div>



