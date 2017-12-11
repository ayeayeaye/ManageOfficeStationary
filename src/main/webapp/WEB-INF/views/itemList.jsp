<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>Item List</h2>


	<c:if test="${fn:length(itemList) gt 0}">
		<div >
		
				<a href="${pageContext.request.contextPath}/staff/create/request.html"class="btn btn-success">Create New Request</a>
								
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Category</th>
						<th>Unit</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${itemList}">
						<tr>
							<td>${item.itemId}</td>
							<td>${item.itemName}</td>
							<td>${item.category}</td>
							<td>${item.unit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>

</body>
</html>