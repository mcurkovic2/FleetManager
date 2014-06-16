<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="logon" />
<title>Login</title>
</head>
<body>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>
	<%--	<g:form action="signIn">--%>
	<%--		<input type="hidden" name="targetUri" value="${targetUri}" />--%>
	<%--		<table>--%>
	<%--			<tbody>--%>
	<%--				<tr>--%>
	<%--					<td>Username:</td>--%>
	<%--					<td><input type="text" name="username" value="${username}" /></td>--%>
	<%--				</tr>--%>
	<%--				<tr>--%>
	<%--					<td>Password:</td>--%>
	<%--					<td><input type="password" name="password" value="" /></td>--%>
	<%--				</tr>--%>
	<%--				<tr>--%>
	<%--					<td>Remember me?:</td>--%>
	<%--					<td><g:checkBox name="rememberMe" value="${rememberMe}" /></td>--%>
	<%--				</tr>--%>
	<%--				<tr>--%>
	<%--					<td />--%>
	<%--					<td><input type="submit" value="Sign in" /></td>--%>
	<%--				</tr>--%>
	<%--			</tbody>--%>
	<%--		</table>--%>
	<%--	</g:form>--%>

	<div class="container">
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
									<input type="text" class="form-control" placeholder="Username" name="username"
										value="${username}" />
									<%--                    <input class="form-control" placeholder="E-mail" name="email" type="text">--%>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="Password" name="password"
										value="" />
									<%--                    <input class="form-control" placeholder="Password" name="password" type="password" value="">--%>
								</div>
								<div class="checkbox">
									<label> <g:checkBox name="rememberMe"
											value="${rememberMe}" /> <g:message
											code="login.checbox.rememberme.label" />
									</label>
								</div>
								<br> <a href="index.html"
									class="btn btn-lg btn-green btn-block">Sign In</a>
								<hr>
								<a class="btn btn-block btn-social btn-facebook"> <i
									class="fa fa-facebook"></i> Sign in with Facebook
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
<%--<g:applyLayout name="bodyLogon">--%>
<%--	<content tag="logonForm"> --%>
<%--	<g:form action="signIn">--%>
<%--		<fieldset>--%>
<%--			<div class="form-group">--%>
<%--				<input type="text" placeholder="Username" name="username"--%>
<%--					value="${username}" />--%>
<%--<input class="form-control" placeholder="E-mail" name="email"--%>
<%--	type="text">--%>
<%--			</div>--%>
<%--			<div class="form-group">--%>
<%--				<input type="password" placeholder="Password" name="password"--%>
<%--					value="" />--%>
<%--<input class="form-control" placeholder="Password" name="password"--%>
<%--	type="password" value="">--%>
<%--			</div>--%>
<%--			<div class="checkbox">--%>
<%--				<label> <g:checkBox name="rememberMe" value="${rememberMe}" />--%>
<%--					<g:message code="login.checbox.rememberme.label" />--%>
<%--				</label>--%>
<%--			</div>--%>
<%--			<br> <a href="index.html" class="btn btn-lg btn-green btn-block">Sign--%>
<%--				In</a>--%>
<%--			<hr>--%>
<%--			<a class="btn btn-block btn-social btn-facebook"> <i--%>
<%--				class="fa fa-facebook"></i> Sign in with Facebook--%>
<%--			</a> <a class="btn btn-block btn-social btn-twitter"> <i--%>
<%--				class="fa fa-twitter"></i> Sign in with Twitter--%>
<%--			</a> <a class="btn btn-block btn-social btn-google-plus"> <i--%>
<%--				class="fa fa-google-plus"></i> Sign in with Google--%>
<%--			</a>--%>
<%--		</fieldset>--%>
<%--		<br>--%>
<%--		<p class="small">--%>
<%--			<a href="#">Forgot your password?</a>--%>
<%--		</p>--%>
<%--	</g:form> </content>--%>
<%--</g:applyLayout>--%>



