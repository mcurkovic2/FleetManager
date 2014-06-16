<html>
<head>
<meta name="layout" content="main" />
<title><g:layoutTitle /></title>
<g:layoutHead />
</head>
<body>
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
						<g:pageProperty name="page.logonForm" />
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- GLOBAL SCRIPTS -->
	<asset:javascript src="application.js" />

</body>
</html>
