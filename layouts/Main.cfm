<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to ColdBox & VueJS!</title>
	<meta name="description" content="">
    <meta name="author" content="Ortus Solutions, Corp">
	<!---Base URL --->
	<!--- <base href="#event.getHTMLBaseURL()#" /> --->
	<!---css --->
	<link href="includes/css/App.css" rel="stylesheet">
	<!--- vendor js --->
	<cfif getSetting( "environment" ) == "development">
		<script src="includes/js/vendor-dev.js"></script>
	<cfelse>
		<script src="includes/js/vendor.min.js"></script>
	</cfif>
</head>
<body>
	<!---Container And Views --->
	<div class="container">#renderView()#</div>

	<footer class="footer">
		<p class="pull-right">
			<a href="##"><i class="glyphicon glyphicon-arrow-up"></i> Back to top</a>
		</p>
		<p>
			<a href="http://www.coldbox.org">ColdBox Platform</a> is a copyright-trademark software by
			<a href="http://www.ortussolutions.com">Ortus Solutions, Corp</a>
		</p>
		<p>
			Design thanks to
			<a href="http://twitter.github.com/bootstrap">Twitter Boostrap</a>
		</p>
	</footer>
	<!--- App JS --->
	<script src="includes/js/App.js"></script>
</body>
</html>
</cfoutput>