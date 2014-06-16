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
<asset:stylesheet src="login/application.css" />
<link
	href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic'
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
      <script src="${assetPath(src: 'js/html5shiv.js')}"></script>
      <script src="${assetPath(src: 'js/respond.min.js')}"></script>
    <![endif]-->
<g:layoutHead />
</head>
<body class="login">
	<g:layoutBody />
	<!-- GLOBAL SCRIPTS -->
	<asset:javascript src="application.js" />
</body>
</html>
