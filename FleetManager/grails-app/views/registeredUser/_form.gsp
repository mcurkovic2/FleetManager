<%@ page import="hr.fleetman.users.RegisteredUser"%>



<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'userId', 'has-error')} ">
	<label class="control-label" for="userId"> <g:message
			code="user.userId.label" default="User Id" />
	</label>
	<g:textField class="form-control" name="userId"
		value="${registeredUserInstance?.userId}" />

</div>
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
	<g:textArea rows="5" cols="10" class="form-control" name="description"
		value="${registeredUserInstance?.description}" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'active', 'error')} ">
	<label for="active"> <g:message code="user.active.label"
			default="Active" />
	</label>
	<g:checkBox name="active" value="${registeredUserInstance?.active}"
		checked="true" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'username', 'error')} ">
	<label for="active"> <g:message code="user.username.label"
			default="Active" />
	</label>
	<g:textField class="form-control" name="username"
		value="${registeredUserInstance?.username}" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'error')} ">
	<label for="active"> <g:message code="user.password1.label"
			default="Password" />
	</label>
	<g:textField class="form-control" id="password1" name="password1" value="" />
</div>


<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'error')} ">
	<label for="active"> <g:message code="user.password2.label"
			default="Confirm Password" />
	</label>
	<g:textField class="form-control" id="password2" name="password2" value="" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'error')} ">
	<span id="validate-status"></span>
</div>


<script>
	$(document).ready(function() {
		$("#password2").keyup(validate);
	});

	function validate() {
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();

		if (password1 == password2) {
			$("#validate-status").removeClass("text-danger");
			$("#validate-status").addClass("text-success");
			$("#validate-status")
					.text(
							'<g:message code="user.passwordMatch.label"
			default="OK" />');
		} else {
			$("#validate-status").removeClass("text-success");
			$("#validate-status").addClass("text-danger");
			$("#validate-status").text(
							'<g:message code="user.passwordDoesNotMatch.label"
			default="No match" />');
		}

	}
</script>
