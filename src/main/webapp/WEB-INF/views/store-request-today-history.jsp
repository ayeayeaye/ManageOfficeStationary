<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<br/>
<div class="panel panel-default">

<div class="panel-heading" >
<h4>Today Request History</h4>
</div>

<div class="panel-body">
<c:if test="${!empty (todayReqList) }">
	<table class="table">
			<thead>
				  <tr>
				    <th>No</th>
				    <th>RequestID</th>
				    <th>Department</th>
				    <th>PendingDate </th>
				    <th>DisbursedDate</th>
				    <th>Status</th>
				    <th>Detail</th>
				  </tr>
			  </thead>
			  <tbody>		
			  <c:forEach items="${todayReqList}" var="reqPList" varStatus="counter">
					  <tr> 
					  	<td>${counter.count}</td>
					  	<td>${reqPList.department}-${reqPList.drepCode}</td>
					    <td>${reqPList.departmentModel.departmentName}</td>
					    <td>${reqPList.approveDate}</td>  
					    <td>${reqPList.disburseDate}</td>
					    <td>${reqPList.storeStatus}</td> 
					    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqPList.requestId}.html" class="btn btn btn-primary">Detail</a></td>	   
					  </tr>
			  </c:forEach>	
			  </tbody>
		</table>
</c:if>
<c:if test="${empty (todayReqList) }">
There is no request on Today.
</c:if>
</div>

<div class="panel-footer">
<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
</div>

</div>
