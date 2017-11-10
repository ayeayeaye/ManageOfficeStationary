<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>Store Request History - All Department </h3>




<table class="table table-hover ">
<thead>
  <tr class="bg-info">
    <th>No</th>
    <th>Request ID</th>
    <th>Department</th>
    <th>Employee</th>
    <th>Pending Date </th>
    <th>Disbursed Date</th>
    <th>Status</th>
    <th>-</th><th>-</th><th>-</th>
  </tr>
  </thead>
  <c:forEach items="${reqList}" var="reqList" varStatus="counter">	
  
  <tr> 
  	<td>${counter.count}</td>
  	<td>${reqList.department}-${reqList.drepCode}</td>
    <td>${reqList.departmentModel.departmentName}</td>
    <td>	
	${reqList.employeeModel.employeeName}
    </td>
    <td>${reqList.approveDate}</td>   
    <td>${reqList.disburseDate}</td>
    <td>${reqList.storeStatus}</td>
    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqList.requestId}.html" class="btn btn-success">Detail</a></td>
   
  </tr>
  </c:forEach>

</table>


