<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-default">

<div class="panel-heading" >
<h3>Store Request Pending - All Department </h3>
</div>

<div class="panel-body">
<table class="table table-hover ">
<thead>
  <tr class="bg-info">
    <th>No</th>
    <th>Request ID</th>
    <th>Department</th>
    <th>Pending Date </th>
    <th>Detail</th>
  </tr>
  </thead>
  <c:forEach items="${storeReqPendList}" var="reqList" varStatus="counter">	
  
  <tr> 
  	<td>${counter.count}</td>
  	<td>${reqList.department}-${reqList.drepCode}</td>
    <td>${reqList.departmentModel.departmentName}</td>
   <%--  <td>	${reqList.employeeModel.employeeName} </td> --%>
    <td>${reqList.approveDate}</td>   
    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqList.requestId}.html" class="btn btn btn-primary">Detail</a></td>
   
  </tr>
  </c:forEach>

</table>
</div>
</div>
