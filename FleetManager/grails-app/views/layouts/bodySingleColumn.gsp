<g:applyLayout name="main">
	<html>
<head>
<title><g:layoutTitle default="FleetManager" /></title>
<g:layoutHead />
</head>
<body>

	<%--	<!-- VALIDATION MESSAGE-->--%>
	<div class="row">
		<div class="col-lg-12">
			<g:pageProperty name="page.validation" />
		</div>
	</div>
	
	<%--	<!-- FLASH MESSAGE-->--%>
	<div class="row">
		<div class="col-lg-12">
			<g:pageProperty name="page.message" />
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<g:pageProperty name="page.mainContent" />
		</div>
	</div>
	
	
</body>
	</html>
</g:applyLayout>