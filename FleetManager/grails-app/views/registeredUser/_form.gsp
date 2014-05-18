<%@ page import="hr.fleetman.users.RegisteredUser" %>



<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="registeredUser.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userId" required="" value="${registeredUserInstance?.userId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="registeredUser.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${registeredUserInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="registeredUser.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${registeredUserInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="registeredUser.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${registeredUserInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="registeredUser.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${registeredUserInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="registeredUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${registeredUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'error')} ">
	<label for="passwordHash">
		<g:message code="registeredUser.passwordHash.label" default="Password Hash" />
		
	</label>
	<g:textField name="passwordHash" value="${registeredUserInstance?.passwordHash}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'permissions', 'error')} ">
	<label for="permissions">
		<g:message code="registeredUser.permissions.label" default="Permissions" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="registeredUser.roles.label" default="Roles" />
		
	</label>
	<g:select name="roles" from="${hr.fleetman.users.RegisteredRole.list()}" multiple="multiple" optionKey="id" size="5" value="${registeredUserInstance?.roles*.id}" class="many-to-many"/>

</div>

