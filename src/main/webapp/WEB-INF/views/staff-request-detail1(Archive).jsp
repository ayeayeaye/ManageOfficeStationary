<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h2>Staff Request Details </h2>

<c:set value="${aReq}" var="rq" ></c:set>
<c:set var = "sta"  value = "${rq.deptStatus}"/>

<c:set value="${msg}" var="btnClick" ></c:set>


<dl class="row">
  <dt class="col-sm-3">Request Id</dt>
  <dd class="col-sm-9">:${rq.department}-${rq.drepCode}</dd>

   <dt class="col-sm-3">Department</dt>
  <dd class="col-sm-9">:${rq.departmentModel.departmentName}</dd>

  <dt class="col-sm-3">Contact Number</dt>
  <dd class="col-sm-9">:+65${rq.departmentModel.contactNumber}</dd>
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
		    <td>
<!-- Only Update -->		    
		    <c:choose>
			    <c:when test="${btnClick == 'clickUpdate'}">
			    	<input type="text" value="${rd.reqQuantity}"/>
			   	</c:when>
			    <c:otherwise>
					${rd.reqQuantity}	
			    </c:otherwise>
			</c:choose>		    
		    </td>
			<td>${rd.receiveQuantity}</td>
		    <td>${rd.itemModel.unit}</td>	  
		    </tr>		  	  
	  </tbody>
	  </c:forEach>
</table>

<!-- Only Update -->
	<c:if test="${btnClick == 'clickUpdate'}">
		<a href="${pageContext.request.contextPath}/staff/request/edit/${rq.requestId}" class="btn btn-warning">Update</a>
	</c:if>
	


<%-- <h5>For manager</h5>
	<c:choose>
	    <c:when test="${sta == 'Request' }">
			<a href="${pageContext.request.contextPath}/staff/request/approve/${rq.requestId}.html" class="btn btn-success">Approve</a>
			<a href="${pageContext.request.contextPath}/staff/request/reject/${rq.requestId}.html" class="btn btn-success">Reject</a>
	   	</c:when>
	    <c:otherwise>
				
	    </c:otherwise>
	</c:choose>  --%> 

			
		<br><br>
		
		<br><br>
	    <input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
	    	


