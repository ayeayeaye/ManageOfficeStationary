<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<br/>
<div class="panel panel-default">

<div class="panel-heading" >
<h4>All Request History </h4>
</div>

<div class="panel-body"  style="padding:0;border:0px;height:450px;overflow-y:auto">
<table class="table table-hover ">
<thead>
  <tr class="bg-info">
    <th>No</th>
    <th>Request ID</th>
    <th>Department</th>
    <!-- <th>Employee</th> -->
    <th>Pending Date </th>
    <th>Disbursed Date</th>
    <th>Status</th>
    <th>Details</th>
  </tr>
  </thead>
  <tbody>
	  <c:forEach items="${reqList}" var="reqList" varStatus="counter">	
	  <tr> 
	  	<td>${counter.count}</td>
	  	<td>${reqList.department}-${reqList.drepCode}</td>
	    <td>${reqList.departmentModel.departmentName}</td>
	    <%-- <td>${reqList.employeeModel.employeeName}</td> --%>
	    <td>${reqList.approveDate}</td>   
	    <td>${reqList.disburseDate}</td> 
	    <td>${reqList.storeStatus}</td>
	    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqList.requestId}.html" class="btn btn-primary">Detail</a></td> 
	  </tr>
	  </c:forEach>
  </tbody>
</table>

</div>
<div class="panel-footer">
	<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
</div>
</div>
