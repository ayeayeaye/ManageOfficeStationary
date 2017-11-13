<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h3>Store Request Details </h3>


<form:form action="${pageContext.request.contextPath}/store/request/detail/${aReq.requestId}" method="POST"  modelAttribute="requestDetail">

<dl class="row">
  <dt class="col-sm-3">Request Id</dt>
  <dd class="col-sm-9">:${aReq.department}-${aReq.drepCode}</dd>

  <dt class="col-sm-3">Request Department</dt>
  <dd class="col-sm-9">:${aReq.departmentModel.departmentName}</dd>

  <dt class="col-sm-3">Contact Number</dt>
  <dd class="col-sm-9">:+65${aReq.departmentModel.contactNumber}</dd>
</dl>


<table class="table table-hover ">
<thead>
  <tr class="bg-info">
    <th>No</th>
    <th>Item Name</th>
     <th>Request Quantity</th>
     <th>ReceiveQuantity</th>
     <th>Unit</th>
  </tr>
</thead>
  
  <c:forEach items="${reqDetList}" var="rd" varStatus="counter">  
  <tbody>
    
	  	<tr> 
	    <td>${counter.count}</td>
	    <td>${rd.itemModel.itemName}</td>
	    <td>${rd.reqQuantity}</td>
		<td>${rd.receiveQuantity}</td>
	    <td>${rd.itemModel.unit}</td>	  
	    </tr>
	  	  
  </tbody>

   </c:forEach>
</table>

<%-- <c:set var = "departtStatus"  value = "${rd.requestModel.deptStatus}"/>
<c:set var = "rId"  value = "${rd.requestId}"/>
		<c:choose>
	    	<c:when test="${departtStatus == 'Request' }">
				<a href="${pageContext.request.contextPath}/staff/request/approve/${rId.requestId}.html" class="btn btn-success">Approve</a>
				<a href="${pageContext.request.contextPath}/staff/request/reject/${rId.requestId}.html" class="btn btn-success">Reject</a>
	   		 </c:when>
	    	<c:otherwise>
				
	    	</c:otherwise>
		</c:choose>  --%>

			
		<br><br>
	    	<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
	    	

 </form:form>

