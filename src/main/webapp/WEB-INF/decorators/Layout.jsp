<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript for JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<%@include file="Header.jsp"%>

<dec:head />

<style>
h2{

	line-height: 60px;
	padding: 15px 15px 15px 15%;
	box-shadow: inset 0 0 0 1px rgba(53, 86, 129, 0.4);
	
}
</style>

</head>
<body>
	<div class="container-fluid">
				
		<div class="row">
			
			<div>
				<div class="col-md-2"><%@ include file="Menu.jsp"%></div>
			</div>
			
			<div class="col-md-10">
				<spring:message code="${bodyTitle}" />
				<dec:body />
			</div>
		</div>
		
	   </div>


	<!-- ======== Footer ======== -->
	<div id="footer" align="center">
		<hr>
		<small> &copy; YinThuAye - ISS NUS SA44 2017  </small>
	</div>
</body>
</html>
