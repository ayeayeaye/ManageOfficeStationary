<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h3>Staff Request Details </h3>

<c:set var = "sta"  value = "${aReq.deptStatus}"/>
<c:set var = "rId"  value = "${rd.requestId}"/>

<c:set value="${msg}" var="btnClick" ></c:set>

<form:form action="${pageContext.request.contextPath}/staff/request/edit/${aReq.requestId}" method="POST" modelAttribute="aReq">

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
		    <td>

<!-- Only Update -->		    
		    <c:choose>
			    <c:when test="${btnClick == 'updateB'}">
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
	
	<c:if test="${btnClick == 'updateB'}">
		<form:button value="Update" class="btn btn-warning" >Update</form:button>
	</c:if>
	
 </form:form>

<%-- <h5>For manager</h5>
	<c:choose>
	    <c:when test="${sta == 'Request' }">
			<a href="${pageContext.request.contextPath}/staff/request/approve/${rId.requestId}.html" class="btn btn-success">Approve</a>
			<a href="${pageContext.request.contextPath}/staff/request/reject/${rId.requestId}.html" class="btn btn-success">Reject</a>
	   	</c:when>
	    <c:otherwise>
				
	    </c:otherwise>
	</c:choose>  --%> 

			
		<br><br>
		
		<br><br>
	    <input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
	    	


