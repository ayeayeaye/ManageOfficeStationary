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
     <th>Disbursed Quantity</th>
     <th>Unit</th>
  </tr>
</thead>
  
  <c:forEach items="${reqDetList}" var="rd" varStatus="counter">  
  <tbody>
  
	  
	  	<tr> 
	    <td>${counter.count}</td>
	    <td>${rd.itemModel.itemName}</td>
	    <td>${rd.reqQuantity}</td>
	    
	    <td>    
	    <!-- if Store_Status equals 'Disursed' ==> text box is disable -->
	    <c:set var = "storeStatus"  value = "${rd.requestModel.storeStatus}"/>
	    
	    <c:choose>
	    	<c:when test="${storeStatus == 'Disbursed' }">
	    	    <label>${rd.receiveQuantity}</label>
	        	<%-- <input type="text"  value="${rd.reqQuantity}" name="receiveQuantities" disabled /> --%>
	   		 </c:when>
	    	<c:otherwise>
	       		<input type="text"  value="${rd.reqQuantity}" name="receiveQuantities"/>
	    	</c:otherwise>
		</c:choose> 	    
	    </td>
	    
	    <td>${rd.itemModel.unit}</td>	  
	    </tr>
	  	  
  </tbody>

   </c:forEach>
</table>

	    <c:choose>
	    	<c:when test="${storeStatus == 'Pending' }">
	    		<input type="submit" value="Disburse" class="btn btn-primary" />
	    	</c:when>
	    	<c:otherwise>       		
	    	</c:otherwise>
		</c:choose> 
		

	<%-- 	<c:choose>
	    	<c:when test="${storeStatus == 'Pending' }"> --%>
	    	<%-- 	<a href="${pageContext.request.contextPath}/store/request/pending.html" class="btn btn-primary" >Back</a> --%>
	    	<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
	    	
<%-- 	    	</c:when>
		    	<c:when test="${storeStatus == 'Disbursed' }">
		       		<a href="${pageContext.request.contextPath}/store/request/history.html" class="btn btn-primary" >Back</a>
		    	</c:when>
		</c:choose>  --%>




 </form:form>

