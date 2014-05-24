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
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'username', 'has-error')} ">
	<label class="control-label" for="username"> <g:message code="user.username.label"
			default="Username" />
	</label>
	<g:textField class="form-control" name="username"
		value="${registeredUserInstance?.username}" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'has-error')} ">
	<label class="control-label" for="password1"> <g:message code="user.password1.label"
			default="Password" />
	</label>
	<g:passwordField class="form-control" id="password1" name="passwordHash1"
		value="" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'has-error')} ">
	<label class="control-label" for="password2"> <g:message code="user.password2.label"
			default="Confirm Password" /></label>
	<g:passwordField class="form-control" id="password2" name="passwordHash"
		value="" />
</div>

<%--<div--%>
<%--	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'has-error')} ">--%>
<%--	<span id="validate-status"></span>--%>
<%--</div>--%>

<div id="passMatch" style="display:none;" class="alert alert-dismissable alert-danger">
    <span id="validate-status"></span>
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
	<g:textArea rows="3" cols="10" class="form-control" name="description"
		value="${registeredUserInstance?.description}" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'active', 'has-error')} ">
	<label for="active"> <g:message code="user.active.label"
			default="Active" />
	</label>
	<g:checkBox name="active" value="${registeredUserInstance?.active}"
		checked="true" />
</div>

<script>
	$(document).ready(function() {
		$("#password2").keyup(validate);
	});

	$(document).ready(function() {
		$("#password1").keyup(validate);
	});

	function validate() {
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();

		var isPopulated = function(val) {
			return ((typeof val === 'string') && (val !== ''));
		};
		
		if (isPopulated(password1) || isPopulated(password2)) {

			$("#passMatch").show();
			
			if (password1 == password2) {
				$("#passMatch").removeClass("alert-danger");
				$("#passMatch").addClass("alert-success");
				$("#validate-status")
						.text(
								'<g:message code="user.passwordMatch.label"
				default="OK" />');
			} else {
				$("#passMatch").removeClass("alert-success");
				$("#passMatch").addClass("alert-danger");
				$("#validate-status")
						.text(
								'<g:message code="user.passwordDoesNotMatch.label"
				default="No match" />');
			}
		} else {
			console.log('bbb');
			$("#passMatch").hide();
		}
	}
</script>
