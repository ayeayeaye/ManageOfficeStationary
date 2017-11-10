<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Store Request Details </h3>

<%-- <form:form action="${pageContext.request.contextPath}/store/disburse/${aRqId}" method="POST"  modelAttribute="RequestDetail" >--%>


<form:form action="${pageContext.request.contextPath}/store/request/detail/${aRqId}" method="POST"  modelAttribute="requestDetail">


<%-- <form:form method="POST" commandName="RequestDetail"
	action="${pageContext.request.contextPath}/store/disburse/.html"> --%>
	
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
	        	<input type="text"  value="${rd.reqQuantity}" name="receiveQuantities" disabled />
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

<input type="submit" value="Disburse" class="btn btn-primary" />


 </form:form>


