<%@ page import="hr.fleetman.common.User"%>

<div
	class="form-group ${hasErrors(bean: userInstance, field: 'userId', 'has-error')} ">
	<label class="control-label" for="userId"> <g:message
			code="user.userId.label" default="User Id" />
	</label>
	<g:textField class="form-control" name="userId"
		value="${userInstance?.userId}" />

</div>
<div
	class="form-group ${hasErrors(bean: userInstance, field: 'firstName', 'has-error')} ">
	<label class="control-label" for="firstName"> <g:message
			code="user.firstName.label" default="First Name" />
	</label>
	<g:textField class="form-control" name="firstName"
		value="${userInstance?.firstName}" />

</div>

<div
	class="form-group ${hasErrors(bean: userInstance, field: 'lastName', 'has-error')} ">
	<label class="control-label" for="lastName"> <g:message
			code="user.lastName.label" default="Last Name" />
	</label>
	<g:textField class="form-control" name="lastName"
		value="${userInstance?.lastName}" />

</div>

<div
	class="form-group 
	${hasErrors(bean: userInstance, field: 'description', 'has-error')} ">
	<label class="control-label" for="description"> <g:message
			code="user.description.label" default="Description" />
	</label>
	<g:textArea rows="10" cols="20" class="form-control" name="description"
		value="${userInstance?.description}" />
</div>

<div
	class="form-group ${hasErrors(bean: userInstance, field: 'active', 'error')} ">
	<label for="active"> <g:message code="user.active.label"
			default="Active" />
	</label>
	<g:checkBox name="active" value="${userInstance?.active}"
		checked="true" />
</div>

