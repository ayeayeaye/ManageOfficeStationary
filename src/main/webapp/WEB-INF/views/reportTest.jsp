<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table border="1">
	<tr>
		<td>ID</td>
		<td>NAME</td>
	</tr>
		<c:forEach items="${testList}" var="test">		
		<tr>
			<td>${test.id}</td>
			<td>${test.name}</td>
		</tr>	
		</c:forEach>

</table>

<spring:url value="/report/rtest/?type=xls" var="xlsURL"></spring:url>
<spring:url value="/report/rtest/?type=pdf" var="pdfURL"></spring:url>

<a href="${xlsURL}">Download Excel</a>
<a href="${pdfURL}">Download Pdf</a>