<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-default">

<div class="panel-heading" >
<h3>Store Request History - All Department </h3>
</div>

<div class="panel-body">

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
<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
</div>
</div>
