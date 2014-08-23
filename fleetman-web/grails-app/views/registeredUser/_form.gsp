<%@ page import="hr.fleetman.users.NewRegisteredUserCommand"%>

<div
	class="form-group ${hasErrors(bean: newRegisteredUserCommandInstance, field: 'username', 'has-error')} ">
	<label class="control-label" for="username"> <g:message
			code="user.username.label" default="Username" />
	</label>
	<g:textField autocomplete="off" autocapitalize="off"
		class="form-control" name="username"
		value="${newRegisteredUserCommandInstance?.username}" />
</div>

<div
	class="form-group ${hasErrors(bean: newRegisteredUserCommandInstance, field: 'newPassword', 'has-error')} ">
	<label class="control-label" for="password1"> <g:message
			code="user.password1.label" default="Password" />
	</label>
	<g:passwordField autocomplete="off" autocapitalize="off"
		class="form-control" id="password1" name="newPassword" />
</div>

<div
	class="form-group ${hasErrors(bean: newRegisteredUserCommandInstance, field: 'confirmedPassword', 'has-error')} ">
	<label class="control-label" for="password2"> <g:message
			code="user.password2.label" default="Confirm Password" /></label>
	<g:passwordField autocomplete="off" class="form-control" id="password2"
		name="confirmedPassword" />
</div>

<div id="passMatch" style="display: none;"
	class="alert alert-dismissable alert-danger">
	<span id="validate-status"></span>
</div>

<div
	class="form-group ${hasErrors(bean: newRegisteredUserCommandInstance, field: 'firstName', 'has-error')} ">
	<label class="control-label" for="firstName"> <g:message
			code="user.firstName.label" default="First Name" />
	</label>
	<g:textField autocomplete="off" class="form-control" name="firstName"
		value="${newRegisteredUserCommandInstance?.firstName}" />

</div>

<div
	class="form-group ${hasErrors(bean: newRegisteredUserCommandInstance, field: 'lastName', 'has-error')} ">
	<label class="control-label" for="lastName"> <g:message
			code="user.lastName.label" default="Last Name" />
	</label>
	<g:textField autocomplete="off" class="form-control" name="lastName"
		value="${newRegisteredUserCommandInstance?.lastName}" />

</div>

<div
	class="form-group 
	${hasErrors(bean: newRegisteredUserCommandInstance, field: 'description', 'has-error')} ">
	<label class="control-label" for="description"> <g:message
			code="user.description.label" default="Description" />
	</label>
	<g:textArea rows="3" cols="10" class="form-control" name="description"
		value="${newRegisteredUserCommandInstance?.description}" />
</div>

<content tag="javascript"> 

<%--<script--%>
<%--	src="${assetPath(src: 'passCheck.js')}"></script> <script>--%>
<%--		$(document)--%>
<%--				.ready(--%>
<%--						function() {--%>
<%--							passCheck--%>
<%--									.init(--%>
<%--											'<g:message code="user.passwordMatch.label"--%>
<%--				default="OK" />',--%>
<%--											'<g:message code="user.passwordDoesNotMatch.label"--%>
<%--				default="No match" />');--%>
<%--						});--%>
<%--	</script> --%>
	
	</content>

