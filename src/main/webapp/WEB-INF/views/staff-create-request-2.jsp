<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Insert title here</title>

	<script type="text/javascript">
	
	function addRow(tableID) {

		//get table
		var table = document.getElementById(tableID);

		//get row length,  rowCount=2(first time have default one row, 3, 4,...)
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount); //*get rows

		
		//Cell 1  = serial number 
		var cell1= row.insertCell(0);
		cell1.innerHTML = rowCount ;
		
		//Cell 2  
  		var cell2 = row.insertCell(1);		
			var colCount = table.rows[1].cells.length;//every second row from * =rows[1], colCount=6			
			for(var i=1; i<colCount; i++) //start from second column
			{							
			    var newcell	= row.insertCell(i); //**get a column from second row
				newcell.innerHTML = table.rows[1].cells[i].innerHTML; //SET = GET (**)
			} 

	}
/* 	
	function changemyCategorySelect() 
	{
		var s1 = document.getElementById("myCategorySelect");
		var strUser = s1.options[s1.selectedIndex].value;
		alert(strUser);		
		s1.value = strUser;
			
	}
 */
 
 	function removeRow(x) {
	 var selectRow = x.parentNode.parentNode.rowIndex;
   	 //alert(selectRow+"*");
   	 document.getElementById("dataTable").deleteRow(selectRow);
	}
	</script>	
	
</head>


<body>



	<h3>Request Item</h3>
<div>
<form:form action="${pageContext.request.contextPath}/staff/create/request.html" method="POST" modelAttribute="categoryList">
	<c:if test="${fn:length(itemList) gt 0}">
		<div class="table-responsive">							
			<table class="table table-hover " id="dataTable">
				<thead>
					<tr class="listHeading">
						<th>No</th>
						<th>Name</th>					
						<th>Quantity</th>
						<th>Unit</th>
					</tr>
				</thead>
				<tbody>	
				
				<!-- No change -->

					<tr class="listBody">

						<td>1</td>					     
					
						<td>
							<select name="reqItemC">
								<c:forEach items="${itemList}" var="itemList">
									<option value="${itemList.itemId}">${itemList.category}-${itemList.itemName}</option>
								</c:forEach>
							</select>
						</td>					
						<td> <INPUT TYPE="TEXT" name="reqQuantityC" ><br/></td>						
						<td>
							EA
						</td>						
						<td ><a  class="btn btn-danger" id="myRemoveBtn"  onclick="removeRow(this)" >Remove</a></td>						
				  </tr>				
					
				</tbody>
			</table>	
			<a  class="btn btn-primary" onclick="addRow('dataTable')" >Add New Item</a> <br /><br />
		</div>
	</c:if>

			
	<div class='col-lg-5'>
		<div class="row">
			<div class="panel panel-info">
				<div class="panel-heading">Reason To Request</div>	
				<div class="panel-body">		
					<textarea class="form-control" rows="4" ></textarea>	
				</div>				
			</div>
		</div>
	</div>

		<div class='col-lg-9'>
			<div class="row">
				<form:button class="btn btn-success" >Submit</form:button>
			</div>
		</div>
		
</form:form>
</div>
	<br><br>
		<div class='col-lg-12'>
			<div class="row">
				<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
			</div>
		</div>
	


</body>
</html>