<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">

<script>
function mySearchFunction() {
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

function myRowSelect(itemId) {
	//alert("***"+ itemId);
	var dataTable=document.getElementById("myTable");
	var rows = dataTable.getElementsByTagName("tr");
	rows[itemId].className ="active";
	
 	var colCount = dataTable.rows[0].cells.length;
	for(var i=1; i<colCount; i++) 
	{	
		document.getElementById(i+"modal").value = dataTable.rows[itemId].cells[i].innerHTML;
	}
	
  	document.getElementById("myBtnUpdate").href = "${pageContext.request.contextPath}/store/stock/update/"+itemId;
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
					<input type="text"  class="form-control" id="inputSearch" onkeyup="mySearchFunction()" placeholder="*****">
				</div>
			</div>

		<!-- 1.2 -->	
			<div class="link-menu navbar-text navbar-right">			
				   <span><a href="${pageContext.request.contextPath}/store/stock/view">Stock</a></span>
						<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
						<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>									
			</div>
			
		</div>
		
	<!-- 2 -->	
			<div class="table-responsive">	
			<table id="myTable" class="table table-scroll">
				<thead>
					<tr >
						<th class="col-xs-1">#</th>
						<th class="col-xs-2">Id</th>
						<th class="col-xs-3">Item</th>
						<th class="col-xs-2">TotalQuantity</th>
						<th class="col-xs-2">Unit</th>
						<th class="col-xs-2">Price(one unit)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="items" varStatus="counter">
						<tr onclick="myRowSelect('${items.itemId}')" >
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

					<a class="btn btn-success" id="myUpdateLink" >
					<span class="glyphicon glyphicon-pencil"></span> Update Stock
					</a>
					
					<a class="btn btn-success" id="myAddLink" >
					<span class="glyphicon glyphicon-plus-sign"></span>Add Stock
					</a>
					
					<a href="${pageContext.request.contextPath}/store/stock/add"> Add Stock</a>
			</div>	 


<!-- Update Modal popup Starts-->

<div id="myUpdateModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    
		  <div class="modal-header">
			  	<p class="modal-title">Update Stock</p>

			  	
			 	<div class="modal-body">
			 		
					<table class="modal-table">
						<tbody>
							<tr>
								<td><label>Id</label></td>
								<td>:<input id="1modal" /></td>
							</tr>
							<tr>
								<td><label>Name</label></td>
								<td>:<input id="2modal" /></td>
							</tr>
							<tr>
								<td><label>Quantity</label></td>
								<td>:<input id="3modal" /></td>
							</tr>
							<tr>
								<td><label>Unit</label></td>
								<td>:<input id="4modal" /></td>
							</tr>
							<tr>
								<td><label>Price</label></td>
								<td>:<input id="5modal" /></td>
							</tr>														
						</tbody>
					</table>

		  		</div> 
		  		
			 	<div class="modal-footer">
		  			<a class="btn btn-warning " id="myBtnUpdate">Update</a>
		  		</div> 		  		
		  </div> 
	    
		  </div>
  	</div>
</div>
<!-- Update Modal popup End-->


<!-- Add Modal popup Starts-->
<div id="myAddModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close" onclick="closeModalF('myAddModal')">&times;</span>
		    
		  <div class="modal-header">
			  	<p class="modal-title">Add Stock</p>
	  	
			 	<div class="modal-body">
 		
					<table class="modal-table">
						<tbody>
							<tr>
								<td><label>Id</label></td>
								<td>:<input /></td>
							</tr>
							<tr>
								<td><label>Name</label></td>
								<td>:<input /></td>
							</tr>
							<tr>
								<td><label>Quantity</label></td>
								<td>:<input/></td>
							</tr>
							<tr>
								<td><label>Unit</label></td>
								<td>:<input /></td>
							</tr>
							<tr>
								<td><label>Price</label></td>
								<td>:<input /></td>
							</tr>														
						</tbody>
					</table>

		  		</div> 
		  		
			 	<div class="modal-footer">
		  			<a class="btn btn-warning " id="myBtnAdd">Add</a>
		  		</div> 		  		
		  </div> 
	    
		  </div>
  	</div>
</div>
<!-- Add Modal popup End-->


<script>
//open Update Modal
var modalUpdate = document.getElementById('myUpdateModal');
var btnUpdate = document.getElementById("myUpdateLink");
btnUpdate.onclick = function() {
	modalUpdate.style.display = "block";
}
//close Update Modal
var spanClose = document.getElementsByClassName("close")[0];
spanClose.onclick = function() {
	modalUpdate.style.display = "none";
}

//Open Add Modal
var modalAdd = document.getElementById('myAddModal');
var btnAdd = document.getElementById("myAddLink");
btnAdd.onclick = function() {
	modalAdd.style.display = "block";
}
//Close Add Modal
var spanClose = document.getElementsByClassName("close")[1];
spanClose.onclick = function() {
	modalAdd.style.display = "none";
}
</script> 