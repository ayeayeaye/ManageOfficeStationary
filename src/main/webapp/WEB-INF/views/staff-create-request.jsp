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
	
	function changemyCategorySelect() 
	{
		var s1 = document.getElementById("myCategorySelect");
		var strUser = s1.options[s1.selectedIndex].value;
		alert(strUser);
		
		s1.value = strUser;
			

	}

	</script>	
	
</head>


<body>

<div class='container'>

	<h2>Request Item</h2>


	<c:if test="${fn:length(itemList) gt 0}">
		<div class="table-responsive">							
			<table class="table table-hover " id="dataTable">
				<thead>
					<tr class="listHeading">
						<th>No</th>
						<th>Category</th>
						<th>Name</th>					
						<th>Quantity</th>
						<th>Unit</th>
					</tr>
				</thead>
				<tbody>	
				
				<!-- No change -->
					<tr class="listBody" >

						<td>0</td>					     
						<td>				
							<select>													
								<option>Select--- </option>
								<c:forEach items="${categoryList}" var="categoryList">								
								<option value="${categoryList.categoryId}">${categoryList.categoryId} </option>
								</c:forEach>							
							</select>																					
						</td>					
						<td>
							<select size="5">
								<c:forEach items="${itemList}" var="itemList">
									<option value="${itemList.category}" id="itemName">${itemList.category}-${itemList.itemName}</option>
								</c:forEach>
							</select>
						</td>					
						<td> <INPUT TYPE="TEXT" NAME="text1"><br/></td>						
						<td>
							<select>
								<c:forEach items="${itemList}" var="itemList">
									<option value="${itemList.unit}" >${itemList.unit}</option>
								</c:forEach>
							</select>
						</td>						
						<td><INPUT type="button" value="Remove"  class="btn btn-danger"/></td>						
				  </tr>				
				<!-- No change-->
				
				<!-- Action here-->
				<tr class="listBody">
						<td>1 </td>					     
						<td>					
						   	<select id="myCategorySelect" onchange="changemyCategorySelect()">													
									<option>Select--- </option> 
									<c:forEach items="${categoryList}" var="categoryList">								
										<option value="${categoryList.categoryId}">${categoryList.categoryId} </option>
									</c:forEach>							
						     </select>								     																			
						</td>
												
						<td>													
							<select size="5">				
									<c:forEach items="${itemList}" var="itemList">															
												<option value="${itemList.category}" id="myItemOption">${itemList.category}-${itemList.itemName}</option>								
									</c:forEach>
							</select>
							
						</td>						
						<td> <INPUT TYPE="TEXT" NAME="text1"><br/></td>					
						<td>
							<select>
								<c:forEach items="${itemList}" var="itemList">
									<option value="${itemList.unit}" >${itemList.unit}</option>
								</c:forEach>
							</select>
						</td>					
						<td><INPUT type="button" value="Remove"  /></td>
						
						</tr>	
					<!-- Action here-->			
				</tbody>
			</table>

			<INPUT type="button" value="Add Row" onclick="addRow('dataTable')"  class="btn btn-success"/> <br /><br />
		
		</div>
	</c:if>
			
	<div class='col-xs-5'>
		<div class="row">
			<div class="panel panel-info">
				<div class="panel-heading">Reason To Request</div>	
				<div class="panel-body">		
					<textarea class="form-control" rows="4" ></textarea>	
				</div>				
			</div>
		</div>

		<div><a href ="${pageContext.request.contextPath}/staff/created.html" class="btn btn-success"> Submit </a></div>
		<br>
		<div><input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/></div>
	</div>

</div>

</body>
</html>