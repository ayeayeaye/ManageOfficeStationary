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
			
	
			
/* 		var cell2 = row.insertCell(1); 	
		var length = document.getElementById('mySelect').length;
	
		var array = [];
		
		var a = document.getElementById('mySelect').options[0].text;
		array.push(a);
		for (var i = 1; i < length  ; i++) {
		
				var t= document.getElementById('mySelect').options[i].text ;
				array.push(t);
		}
		
		alert(array) */;
		  
/* 		for(var i=0; i<array.length; i++) //start from second column
		{							
		    var newcell	= row.insertCell(1); //**get a column from second row
			var r = r + array[i]; //SET = GET (**)
			 
		}
 		
		newcell.innerHTML = r; */
 		  
		
		
/* 		var cell3 = row.insertCell(2);	cell3.innerHTML = rowCount ;	
 
		
		var cell4 = row.insertCell(3);		
		var colCount = table.rows[1].cells.length;//every second row from * =rows[1], colCount=6
		for(var i=3; i<colCount; i++) //start from second column
		{							
		    var newcell	= row.insertCell(i); //**get a column from second row
			newcell.innerHTML = table.rows[1].cells[i].innerHTML; //SET = GET (**)
		}  */


	}
	
	function oneCatItemFunction(selectID) {
	    var x = document.getElementById("myCatSelect").selectedIndex;
	    var y = document.getElementById("myCatSelect").options;
	    var seleCatIndex = y[x].index;
	    var seleCatText = y[x].text;
	   alert(seleCatText);
	    	
	    var length = document.getElementById("myItemSelect").length;
		var selectItem=document.getElementById("myItemSelect") 
		//alert(selectItem.options[0].value +"---"+selectItem.options[1].value+"---"+selectItem.options[2].value);
		
		for (var j = 0; j < length  ; j++)
		{
			if(seleCatText != selectItem.options[j].value  )
			{
				selectItem.remove(j); 
				//alert(i+"-->"+"No");				 
			}
			
		}
	}
	</SCRIPT>
	
</head>


<body>

<div class='container'>

	<h3>Request Item</h3>


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
						<tr class="listBody">

						  <td>1
							<%-- <c:forEach items="${itemList}" var="itemList" varStatus="counter">
										<c:out value="${counter.count}"> ${counter.count}</c:out>
							     </c:forEach> --%> 						
					     </td>
					     
						<td>				
<%-- 						<form:form  method="POST" action="${pageContext.request.contextPath}/staff/create/request.html" commandName="category">																		
 								<select id="mySelect" name="selectCategory" onchange="this.form.submit()">	
 	--%>						<select id="myCatSelect" name="selectCategory" onchange="oneCatItemFunction('dataSelect')">													
									<option>Select--- </option>
									<c:forEach items="${categoryList}" var="categoryList">								
										<option value="${categoryList.categoryId}">${categoryList.categoryId} </option>
									</c:forEach>							
							    </select>				
<%-- 						</form:form> --%>						
					   <%--  <c:forEach items="${itemList}" var="itemList">
								<option value="${itemList.categoryModel.categoryName}" id="categoryName">${itemList.categoryModel.categoryName}</option>
							</c:forEach> --%>																	
						</td>
						
						<td>
								<select size="5" id="myItemSelect">
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
						
						<td><INPUT type="button" value="Remove"  /></td>
						
						</tr>				
				</tbody>
			</table>
			
			<!--   <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />  -->
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