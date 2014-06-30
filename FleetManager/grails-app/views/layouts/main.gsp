<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title><g:layoutTitle default="FleetManager" /></title>

<!-- PACE LOAD BAR PLUGIN - This creates the subtle load bar effect at the top of the page. -->
<link href="${assetPath(src: 'css/plugins/pace/pace.css')}"
	rel="stylesheet">
<script src="${assetPath(src: 'js/plugins/pace/pace.js')}"></script>

<!-- GLOBAL STYLES - Include these on every page. -->
<asset:stylesheet src="application.css" />
<%--<link--%>
<%--	href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic'--%>
<%--	rel="stylesheet" type="text/css">--%>
<%--<link--%>
<%--	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'--%>
<%--	rel="stylesheet" type="text/css">--%>

<!--[if lt IE 9]>
      <script src="${assetPath(src: 'js/html5shiv.js')}"></script>
      <script src="${assetPath(src: 'js/respond.min.js')}"></script>
    <![endif]-->
<g:layoutHead />
</head>
<body>
	<div id="wrapper">

		<!--RENDER TOP MENU -->
		<g:render template="/shared/topNavigation"></g:render>
		<!-- SIDE NAV -->
		<g:render template="/shared/sideNavigation"></g:render>
		<!-- begin MAIN PAGE CONTENT -->
		<div id="page-wrapper">

			<div class="page-content page-content-ease-in">
			
				<!-- begin PAGE TITLE ROW -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-title">
                            <g:render template="/shared/pageTitle"></g:render>
                            <g:render template="/shared/breadcrumbs"></g:render>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <!-- end PAGE TITLE ROW -->
                
                <!-- VALIDATION MESSAGE-->
				<div class="row">
					<div class="col-lg-12">
						<g:pageProperty name="page.validation" />
					</div>
				</div>
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
	<!-- Custom Page JavaScript  -->
	<g:pageProperty name="page.javascript"/>

	<g:render template="/shared/logoutModule"></g:render>
	
</body>
</html>
