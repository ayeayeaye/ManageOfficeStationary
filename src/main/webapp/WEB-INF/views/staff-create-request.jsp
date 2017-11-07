<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Insert title here</title>

	<SCRIPT language="javascript">
	function addRow(tableID) {

		//get table
		var table = document.getElementById(tableID);

		//get row length,  rowCount=2(first time have default one row, 3, 4,...)
		var rowCount = table.rows.length
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
	</SCRIPT>
	
</head>


<body>
	<h3>Item List aaaaaaaaaaaaaaa</h3>


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
		
		
						<tr class="listHBody">

						  <td>1
							<%-- <c:forEach items="${itemList}" var="itemList" varStatus="counter">
										<c:out value="${counter.count}"> ${counter.count}</c:out>
								 </c:forEach> --%> 						
					     </td>
					     
						<td>
								<select id="mySelect">							
									<c:forEach items="${categoryList}" var="categoryList">
										<option value="${categoryList.categoryId}">${categoryList.categoryName} </option>
									</c:forEach>
							    </select>
							 <%--  <c:forEach items="${itemList}" var="itemList">
								<option value="${itemList.categoryModel.categoryName}" id="categoryName">${itemList.categoryModel.categoryName}</option>
							</c:forEach> --%>												
						</td>
						
						<td>
								<select size="5">
									<c:forEach items="${itemList}" var="itemList">
										<option value="${itemList.itemName}" id="itemName">${itemList.itemName}</option>
									</c:forEach>
								</select>
						</td>
						
						<td> 
									<INPUT TYPE="TEXT" NAME="text1"><br/>
						</td>
						
						<td>
								<select>
									<c:forEach items="${itemList}" var="itemList">
										<option value="${itemList.unit}" >${itemList.unit}</option>
									</c:forEach>
								</select>
						</td>
						
						<td>
						 	<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
						</td>
						
						</tr>
				
				</tbody>
			</table>
		</div>
	</c:if>

</body>
</html>