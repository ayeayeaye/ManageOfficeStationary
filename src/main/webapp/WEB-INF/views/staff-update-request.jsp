<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script type="text/javascript">
	
 	function removeRow(x) {
	 var selectRow = x.parentNode.parentNode.rowIndex;
   	 //alert(selectRow+"*");
   	 document.getElementById("dataTable").deleteRow(selectRow);
	}
	</script> 

<h3>Edit request </h3>
<c:set value="${aReq}" var="r"></c:set>

 <form:form action="${pageContext.request.contextPath}/staff/request/update/${r.requestId}.html" method="POST" modelAttribute="reqDetList" >

	<table class="table" id="dataTable">
		<thead>
			<tr>
				<th>No</th>
				<th>Item</th>
				<th>Request Quantity</th>
				<th>Unit</th>
				<td>Remove</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reqDetList}"  var="rqd" varStatus="counter">
			<tr>
				<td>${counter.count} </td>		
				<td>
					<select name="reqItemC" >
						<option >${rqd.itemModel.itemName}</option>
					</select>			
				</td>		
				<td><input type="text" value="${rqd.reqQuantity}" name="reqQuantityC"> </td>	
				<td>${rqd.itemModel.unit} </td>
				<td><a class="btn btn-danger" id="myRemoveBtn"  onclick="removeRow(this)" >Remove</a></td>	
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<form:button class="btn btn-success" >Save Changes</form:button>
	<br><br>
		
</form:form>

<a class="btn btn-info" onclick="history.back()">Back</a>
