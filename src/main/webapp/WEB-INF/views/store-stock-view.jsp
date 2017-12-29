<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">

<script>
function myMainSearchFunction() {
	var textBox, inputUpcase, dataTable, row, itemCol, i;
	
	textBox =  document.getElementById("inputSearch");
	inputUpcase = textBox.value.toUpperCase();
	
	dataTable=document.getElementById("myTable");
	row = dataTable.getElementsByTagName("tr");

	
	for (i = 0; i < row.length; i++) 
	{
		itemColCell = row[i].getElementsByTagName("td")[2];
		
		if(itemColCell)
			{
		      if (itemColCell.innerHTML.toUpperCase().indexOf(inputUpcase) > -1 )
		      {
		        row[i].style.display = "";
		      } 
		      else
		      {
		    	  row[i].style.display = "none";
		      }
			}
	}
	
}
var count=0;
 function myRowSelect(rowIndex) {
	   //alert(count);
	  count = parseInt(count)+parseInt(1);
	 
	//alert("***"+ itemId);
	var dataTable=document.getElementById("myTable");
	var rows = dataTable.getElementsByTagName("tr");
	
	
 	//Limit Let the user select only one row
	var rowCount = dataTable.getElementsByTagName("tr").length;
 	if(count > parseInt(1))
 		{
			if(rows[rowIndex].className != "active")
				{
				alert("Please select the only one item!")
				}
 		}
 	else
 		{
 			rows[rowIndex].className ="active";
 		}

	
 		//For Add Modal
		document.getElementById("inputItemVal").value = dataTable.rows[rowIndex].cells[1].innerHTML;
		document.getElementById("inputItemTxt").value = dataTable.rows[rowIndex].cells[2].innerHTML;		
		document.getElementById("inputQty").value = dataTable.rows[rowIndex].cells[3].innerHTML;		
		document.getElementById("inputUnit").value = dataTable.rows[rowIndex].cells[4].innerHTML
		document.getElementById("inputPrice").value = dataTable.rows[rowIndex].cells[5].innerHTML;
		
		//For Update Modal
		document.getElementById("upInputItemVal").value = dataTable.rows[rowIndex].cells[1].innerHTML;
		document.getElementById("upInputItemTxt").value = dataTable.rows[rowIndex].cells[2].innerHTML;		
		document.getElementById("upInputQty").value = dataTable.rows[rowIndex].cells[3].innerHTML;		
		document.getElementById("upInputUnit").value = dataTable.rows[rowIndex].cells[4].innerHTML
		document.getElementById("upInputPrice").value = dataTable.rows[rowIndex].cells[5].innerHTML;
	
}

</script>

<!-- 1 -->	
		<div >
			<h3>Item Stock</h3>
		</div>	
	 
	
		<div class="row" >
		<!-- 1.1 -->
			<div class="col-lg-5">
				<div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
					<div class="input-group-addon">Search</div>
					<input type="text"  class="form-control" id="inputSearch" onkeyup="myMainSearchFunction()" placeholder="Enter item">
				</div>
			</div>

		<!-- 1.2 -->	
			<div class="link-menu navbar-text navbar-right">			
				   <span><a href="${pageContext.request.contextPath}/store/stock/view">Stock</a></span>
						<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
						<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>	
						<a href="${pageContext.request.contextPath}/store/stock/view/log" >Stock Log</a>								
			</div>
			
	  </div>
		
	<!-- 2 -->	
			<div class="table-responsive">	
			<table id="myTable" class="table table-scroll">
				<thead>
					<tr>
						<th class="col-xs-1">#</th>
						<th class="col-xs-2">ItemCode</th>
						<th class="col-xs-3">Item</th>
						<th class="col-xs-2">TotalQuantity</th>
						<th class="col-xs-2">Unit</th>
						<th class="col-xs-2">Price(one unit)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="items" varStatus="counter">
						<tr onclick="myRowSelect('${counter.count}')" >
							<td class="col-xs-1">${counter.count}</td>
							<td class="col-xs-2">${items.itemId}</td>
							<td class="col-xs-3">${items.itemName}</td>
							<td class="col-xs-2">${items.totalQty}</td>
							<td class="col-xs-2">${items.unit}</td>
							<td class="col-xs-2">${items.price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
					
<!-- 3 -->			
			<div class="pull-right ">
					<a id="myAddLink" class="btn btn-success"  >
					<span class="glyphicon glyphicon-plus-sign"></span> Add New Stock
					</a>

					<a class="btn btn-success" id="myUpdateLink" >
					<span class="glyphicon glyphicon-pencil"></span> Update Stock
					</a>
				
			</div>	 



<!-- Add Modal popup Starts-->
<form:form id="formAdd"  modelAttribute="newStock" >

<div id="myAddModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <button type="button" class="close" aria-label="Close" onclick="document.getElementById('myAddModal').style.display='none'">
  				<span aria-hidden="true">&times;</span>
			</button>
		    
		  <div class="modal-header">
			  	<div class="modal-title">
			  		<p id="modalTitle">Add Item to Stock</p>  				  	
			  	</div>
	  	</div>

		<div class="modal-body">
				<!-- Add Table -->
				<table class="modal-table" id="addTable">
					<tbody>
					<tr>
						<td><label>Item</label></td>
						<td>:<form:hidden path="addedItem" id="inputItemVal"/><input id="inputItemTxt" disabled="disabled"></td>
					<tr>
						<td><label>Quantity</label></td>
						<td>:<form:input path="addedQty" id="inputQty" /></td>
					</tr>			
					<tr>
						<td><label>Price($)</label></td>
						<td>:<form:input path="addedPrice" id="inputPrice" /></td>
					</tr>
					<tr>
						<td><label>Unit</label></td>
						<td>:<input id="inputUnit" disabled="disabled"></input></td>
					</tr>							
					<tr id="suppRow">
						<td><label>Supplier</label><br><br><br><br><br><div>.</div></td>
						<td>:
							<span>
							<form:hidden path="supplier" id="inputSuppVal"/><input id="inputSuppTxt" style="margin-left: 10px">
							<br>
							<select id="mySuppSelect" size="5" style="margin-left: 18px; width: 89%" ondblclick="fillSelectedtoInput('mySuppSelect')">
								<c:forEach items="${supList}" var="supp">
								<option value="${supp.supplierId}">${supp.supName}</option>
								</c:forEach>
							</select>
							</span>
						</td>
					</tr>

				</tbody>
				</table>
				<!-- Update Table -->				
				</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-default" id="submitBtn" >Add</button>
			</div>
			
			</div>				
	</div>					  		
</div> 

</form:form>
<!-- Add Modal popup End-->

<!-- Update Modal popup Starts-->
<form:form id="formUpdate"  modelAttribute="aItem" >

<div id="myUpdateModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <button type="button" class="close" aria-label="Close" onclick="document.getElementById('myUpdateModal').style.display='none'">
  				<span aria-hidden="true">&times;</span>
			</button>
		    
		  <div class="modal-header">
			  	<div class="modal-title">
			  		<p id="modalTitle">Update Item</p>  				  	
			  	</div>
	  	</div>

		<div class="modal-body">
				<!-- Update Table -->
				<table class="modal-table" id="updateTable" >
					<tbody>
					<tr>
						<td><label>Item</label></td>
						<td>:<form:hidden path="itemId" id="upInputItemVal"/><input id="upInputItemTxt" disabled="disabled"/></td>
					<tr>				
						<td><label>Quantity</label></td>
						<td>:<form:input path="totalQty" id="upInputQty"/></td>
					</tr>	
					<tr>				
						<td><label>Unit</label></td>
						<td>:<input id="upInputUnit" disabled="disabled"/></td>
					</tr>							
					<tr>
						<td><label>Price($)</label></td>
						<td>:<form:input path="price" id="upInputPrice" /></td>
					</tr>		
				</tbody>
				</table>
				<!-- Update Table -->				
				</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-default" id="submitBtn" >Update</button>
			</div>
			
			</div>				
	</div>					  		
</div> 

</form:form>
<!--Update Modal popup End-->

<!-- Start script for modal -->

<script>
var addModal= document.getElementById('myAddModal');
var UpdModal= document.getElementById('myUpdateModal');
var formAdd = document.getElementById("formAdd");
var formUpd = document.getElementById("formUpdate");
var addTable = document.getElementById("addTable");
var updateTable = document.getElementById("updateTable");

//open Update Modal
var btnUpdate = document.getElementById("myUpdateLink");
btnUpdate.onclick = function() {	
	
	var itemId = document.getElementById("upInputItemVal").value;
	if(itemId == 0)
		{
			alert("Please select the item first to update stock.")
		}
	else
		{
			UpdModal.style.display = "block";
		}
 	formUpd.setAttribute('action',"${pageContext.request.contextPath}/store/stock/update"); 
}
//Open Add Modal
var btnAdd = document.getElementById("myAddLink");
btnAdd.onclick = function() {		
	
	var itemId = document.getElementById("inputItemVal").value;	
	if(itemId == 0)
		{
			alert("Please select the item first to add stock.")
		}
	else
		{
		addModal.style.display = "block";
		}
	
	formAdd.setAttribute('action',"${pageContext.request.contextPath}/store/stock/add/"+itemId); 
} 

function fillSelectedtoInput(mySelect) {
	var selectTxt = document.getElementById(mySelect).options[document.getElementById(mySelect).selectedIndex].text;	
	var selectVal= document.getElementById(mySelect).options[document.getElementById(mySelect).selectedIndex].value;
	document.getElementById("inputSuppTxt").value = selectTxt;
	document.getElementById("inputSuppVal").value = selectVal;
}
</script> 