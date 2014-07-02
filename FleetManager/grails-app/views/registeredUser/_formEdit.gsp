<%@ page import="hr.fleetman.users.RegisteredUser"%>


<fieldset disabled>
	<div
		class="form-group ${hasErrors(bean: registeredUserInstance, field: 'username', 'has-error')} ">
		<label class="control-label" for="username"> <g:message
				code="user.username.label" default="Username" />
		</label>
		<g:textField class="form-control disabled" name="username"
			value="${registeredUserInstance?.username}" />
	</div>
</fieldset>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'firstName', 'has-error')} ">
	<label class="control-label" for="firstName"> <g:message
			code="user.firstName.label" default="First Name" />
	</label>
	<g:textField class="form-control" name="firstName"
		value="${registeredUserInstance?.firstName}" />

</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'lastName', 'has-error')} ">
	<label class="control-label" for="lastName"> <g:message
			code="user.lastName.label" default="Last Name" />
	</label>
	<g:textField class="form-control" name="lastName"
		value="${registeredUserInstance?.lastName}" />

</div>

<div
	class="form-group 
	${hasErrors(bean: registeredUserInstance, field: 'description', 'has-error')} ">
	<label class="control-label" for="description"> <g:message
			code="user.description.label" default="Description" />
	</label>
	<g:textArea rows="3" cols="10" class="form-control" name="description"
		value="${registeredUserInstance?.description}" />
</div>


