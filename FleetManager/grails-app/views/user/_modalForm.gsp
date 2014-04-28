<%@ page import="hr.fleetman.common.User" %>

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<h3>General Details</h3>
							<dl>
								<dt>Vin Number</dt>
								<dd>VWVZZZ1234567891234</dd>
								<dt>Current Registration</dt>
								<dd>ZG-8284-BA</dd>
								<dt>In traffic since Date</dt>
								<dd>12.10.2014</dd>
								<dt>Current Driving Distance</dt>
								<dd>35.125 Km</dd>
							</dl>
						</div>
						<div class="col-lg-6">
							<h3>Engine</h3>
							<dl>
								<dt>Engine Power KW</dt>
								<dd>112</dd>
								<dt>Torque</dt>
								<dd>230/4000 Nm/rev</dd>
								<dt>Fuel Type</dt>
								<dd>DIESEL</dd>
								<dt>Last Registration Date</dt>
								<dd>12.10.2014</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<h3>Manufacturer</h3>
							<dl>
								<dt>Make</dt>
								<dd>Peugeot</dd>
								<dt>Model</dt>
								<dd>308 SW</dd>
								<dt>Type</dt>
								<dd>112 Hdi</dd>
							</dl>
						</div>
						<div class="col-lg-6">
							<h3>Maintenance</h3>
							<dl>
								<dt>Last Service Date</dt>
								<dd>12.04.2013</dd>
								<dt>Last Tire Change</dt>
								<dd>15.11.2013</dd>
								<dt>Last Insurance</dt>
								<dd>12.10.2014</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="user.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${userInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="user.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${userInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${userInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="user.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" value="${userInstance?.userId}"/>

</div>

