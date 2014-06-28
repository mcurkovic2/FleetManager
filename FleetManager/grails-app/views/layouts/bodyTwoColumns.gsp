<g:applyLayout name="main">
	<html>
<head>
<title><g:layoutTitle default="FleetManager" /></title>
<g:layoutHead />
</head>
<body>

	<!-- begin PAGE TITLE ROW -->
	<div class="row">

		<!-- /.col-lg-12 -->
		<div class="col-lg-9">
			<g:pageProperty name="page.col1" />
		</div>
		<div class="col-lg-3">
			<g:pageProperty name="page.col2" />
		</div>
	</div>
	
	<content tag="javascript">
		<g:pageProperty name="page.javascript" />
<%--		<script src="${assetPath(src: 'passCheck.js')}"></script>--%>
	</content>
</body>
	</html>
</g:applyLayout>