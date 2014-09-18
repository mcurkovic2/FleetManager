<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="logon" />
<title>Login</title>
<style>
img.bg {
	/* Set rules to fill background */ 
	min-height: 100%;
	min-width: 1024px;
	/* Set up proportionate scaling */
	width: 100%;
	height: auto;
	/* Set up positioning */
	position: fixed;
	top: 0;
	left: 0;
}

@media screen and (max-width: 1024px) {
	/* Specific to this particular image */
	img.bg {
		left: 50%;
		margin-left: -512px; /* 50% */
	}
}
</style>
</head>
<body>
	<asset:image class="bg" src="taxi.jpg" />
	<div class="container">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-banner text-center">
					<h1>
						<i class="fa fa-gears"></i>
						<g:message code="default.application.name" />
					</h1>
				</div>
				<div class="portlet portlet-green">
					<div class="portlet-heading login-heading">
						<div class="portlet-title">
							<h4>
								<strong><g:message code="login.invitation.text" />&nbsp;<g:message
										code="default.application.name" />!</strong>
							</h4>
						</div>
						<div class="portlet-widgets">
							<button class="btn btn-white btn-xs">
								<g:message code="login.button.signup.label" />
							</button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="portlet-body">
						<g:form action="signIn">
							<fieldset>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Username"
										name="username" value="${username}" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Password" name="password" value="" />

								</div>
								<div class="checkbox">
									<label> <g:checkBox name="rememberMe"
											value="${rememberMe}" /> <g:message
											code="login.checbox.rememberme.label" />
									</label>
								</div>
								<br> <input name="signIn" type="submit"
									value="${message(code:'login.button.login.label')}"
									class="btn btn-lg btn-green btn-block"> </input>

								<hr>
								<a class="btn btn-block btn-social btn-linkedin"> <i
									class="fa fa-linkedin"></i> Sign in with Facebook
								</a> <a class="btn btn-block btn-social btn-twitter"> <i
									class="fa fa-twitter"></i> Sign in with Twitter
								</a> <a class="btn btn-block btn-social btn-google-plus"> <i
									class="fa fa-google-plus"></i> Sign in with Google
								</a>
							</fieldset>
							<br>
							<p class="small">
								<a href="#">Forgot your password?</a>
							</p>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

