<%@ page import="hr.fleetman.users.RegisteredUser"%>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'has-error')} ">
	<label class="control-label" for="password1"> <g:message
			code="user.password1.label" default="Password" />
	</label>
	<g:passwordField class="form-control" id="password1"
		name="passwordHash1" value="" />
</div>

<div
	class="form-group ${hasErrors(bean: registeredUserInstance, field: 'passwordHash', 'has-error')} ">
	<label class="control-label" for="password2"> <g:message
			code="user.password2.label" default="Confirm Password" /></label>
	<g:passwordField class="form-control" id="password2"
		name="passwordHash" value="" />
</div>

<div id="passMatch" style="display: none;"
	class="alert alert-dismissable alert-danger">
	<span id="validate-status"></span>
</div>

<content tag="javascript"> <script
	src="${assetPath(src: 'passCheck.js')}"></script> <script>
		$(document)
				.ready(
						function() {
							passCheck
									.init(
											'<g:message code="user.passwordMatch.label"
				default="OK" />',
											'<g:message code="user.passwordDoesNotMatch.label"
				default="No match" />');
						});
	</script> </content>