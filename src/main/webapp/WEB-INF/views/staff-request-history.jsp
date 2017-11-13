<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>Department Request History - One Department </h3>

<a href="${pageContext.request.contextPath}/staff/create/request.html"class="btn btn-success">Create New Request</a>


<table class="table table-hover ">
  <tr>
    <th>No</th>
    <th>Request Id</th>
    <th>Employee</th>
    <th>Status </th>
    <th>Request Date</th>
    <th>Approve/Reject Date</th>
    <th>Receive Date</th>
    <th>Details</th>
  </tr>
  <c:forEach items="${deptReqList}" var="deptReqList" varStatus="counter">	
  
  <tr> 
  	<td>${counter.count}</td>
    <td>${deptReqList.department}-${deptReqList.requestId}</td>
    <td>${deptReqList.employee} </td>
    <td>${deptReqList.deptStatus}</td>   
    <td>${deptReqList.reqDate}</td>
    <td>${deptReqList.approveDate}</td>
    <td>${deptReqList.disburseDate}</td>
    <td><a href="${pageContext.request.contextPath}/staff/request/detail/${deptReqList.requestId}.html" class="btn btn-success">Detail</a></td>
  </tr>
  </c:forEach>
  
   

</table>


