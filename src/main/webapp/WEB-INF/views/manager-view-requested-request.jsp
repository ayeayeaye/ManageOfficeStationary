<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h1>Manager</h1>


<div class="panel panel-default">
	<div class="panel panel-heading"><h3>Pending Request</h3></div>
	<div class="panel panel-body">

<c:if test="${not empty requestedReqList}">		
<table class="table">
	<thead>
		<tr class="bg-info">
			<th>#</th>
			<th>Request Date</th>
			<th>Request Id</th>
			<th>Request Staff</th>
			<th>View</th>			
		</tr>
	</thead>
	<tbody>				
		<c:forEach items="${requestedReqList}" var="reqs" varStatus="counter">
			<tr>
				<td>${counter.count}</td>
				
				<c:set var="fmtReqDate">
					<fmt:formatDate value="${reqs.reqDate}" pattern="dd-MM-yyyy" />
				</c:set>
			
				<td>${fmtReqDate}</td>
				<td>${reqs.departmentModel.departmentCode}${reqs.drepCode}</td>
				<td>${reqs.employeeModel.employeeName}</td>
				<td><a href="${pageContext.request.contextPath}/manager/request/detail/${reqs.requestId}.html" class="btn btn-primary">View</a></td>
			</tr>
		</c:forEach>
		
		</tbody>
		
</table>		
</c:if>

		<p>There are no request to approve/reject at this moment.</p>


</div>
</div>