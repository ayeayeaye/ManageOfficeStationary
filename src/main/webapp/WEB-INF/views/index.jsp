<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<div class="container">
	<h2>Hello world!</h2>

<P>  The time on the server is ${serverTime}. </P>

	<table class="table table-bordered">
	
		<tr>
			<td>All - <a class="btn btn-default"  href="${pageContext.request.contextPath}/all/view/items" >All</a></td>
		</tr>
	
		<tr>
			<td >Manager - 
			<a class="btn btn-default"  href="${pageContext.request.contextPath}/manager/dashboard" >dashboard</a>
			<a class="btn btn-default" href="${pageContext.request.contextPath}/manager/view/requested/request" >View Request </a></td>
		</tr>
		
		<tr>
			<td>Staff - 
			<a class="btn btn-default"  href="${pageContext.request.contextPath}/staff/dashboard" >dashboard</a></td>
		</tr>
		
		<tr>
			<td>Store - 
			<a class="btn btn-default"  href="${pageContext.request.contextPath}/store/dashboard" >dashboard</a>
			<a class="btn btn-default"  href="${pageContext.request.contextPath}/store/stock/view" >Stock</a>
			</td>
		</tr>
		
	</table>
</div>	
</body>
</html>
