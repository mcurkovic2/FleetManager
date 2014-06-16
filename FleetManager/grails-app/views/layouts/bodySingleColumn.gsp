<html>
<head>
<meta name="layout" content="main" />
<title><g:layoutTitle /></title>
<g:layoutHead />
</head>
<body>

	<div id="wrapper">

		<!--AAA RENDER TOP MENU -->
		<g:render template="/shared/topNavigation"></g:render>
		<!-- AAA SIDE NAV -->
		<g:render template="/shared/sideNavigation"></g:render>
		<!-- begin MAIN PAGE CONTENT -->
		<div id="page-wrapper">

			<div class="page-content">

				<!-- begin PAGE TITLE ROW -->
				<div class="row">
		
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<!-- end PAGE TITLE ROW -->
				<g:layoutBody />
			</div>
			<!-- /.page-content -->

		</div>
		<!-- /#page-wrapper -->
		<!-- end MAIN PAGE CONTENT -->

	</div>
	<!-- /#wrapper -->

	<!-- GLOBAL SCRIPTS -->
	<asset:javascript src="application.js" />
	<g:render template="/shared/logoutModule"></g:render>

</body>
</html>