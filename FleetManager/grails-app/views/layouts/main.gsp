<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title><g:layoutTitle default="FleetManager" /></title>
<g:layoutHead />
<asset:javascript src="application.js" />
<asset:stylesheet src="application.css" />
</head>
<body>
	<div id="wrapper">
		<g:render template="/shared/mainMenu"></g:render>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<g:render template="/shared/pageTitle"></g:render>
					<g:render template="/shared/breadcrumbs"></g:render>
					<g:render template="/shared/flashMessage"></g:render>
				</div>
			</div>
			<g:layoutBody />
		</div>
	</div>
</body>
</html>