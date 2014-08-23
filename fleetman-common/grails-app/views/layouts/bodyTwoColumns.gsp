<g:applyLayout name="main">
	<html>
<head>
<title><g:layoutTitle default="FleetManager" /></title>
<g:layoutHead />
</head>
<body>

<!-- begin VALIDATION ROW2 -->
	<div class="row">
		<div class="col-lg-12">
			<g:pageProperty name="page.validation" />
		</div>
	</div>
	<!-- begin PAGE TITLE ROW -->
	<div class="row">

		<!-- /.col-lg-12 -->
		<div class="col-lg-10">
			<g:pageProperty name="page.col1" />
		</div>
		<div class="col-lg-2">
			<g:pageProperty name="page.col2" />
		</div>
	</div>
	
	<content tag="javascript">
		<g:pageProperty name="page.javascript" />
	</content>
</body>
	</html>
</g:applyLayout>