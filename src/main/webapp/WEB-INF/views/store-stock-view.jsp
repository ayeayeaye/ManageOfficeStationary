<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">


<script type="text/javascript">
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

 
/* 	document.getElementById("0modal").value = dataTable.rows[rowNo].cells[1].innerHTML;
	document.getElementById("1modal").value = dataTable.rows[rowNo].cells[2].innerHTML;
	document.getElementById("2modal").value = dataTable.rows[rowNo].cells[3].innerHTML;
	document.getElementById("3modal").value = dataTable.rows[rowNo].cells[4].innerHTML;
	document.getElementById("4modal").value = dataTable.rows[rowNo].cells[5].innerHTML; */
	
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
					<input type="text"  class="form-control" id="inlineFormInputGroupUsername2" onkeyup="myFunction()" placeholder="*****">
				</div>
			</div>

		<!-- 1.2 -->	
			<div class="link-menu navbar-text navbar-right">
				
				   <span><a href="${pageContext.request.contextPath}/store/stock/view">Stock</a></span>
						<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
						<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>						
				
			</div>
		</div>
		
			
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
			
		
			
			<div class="pull-right ">

					<a class="btn btn-success" id="myUpdateLink" >
					<span class="glyphicon glyphicon-pencil"></span> Update Stock
					</a>
					
					<a href="${pageContext.request.contextPath}/store/stock/add" class="btn btn-success">
					<span class="glyphicon glyphicon-plus-sign"></span> Add Stock
					</a>
			</div>	 
		

<!-- 1 -->

<!-- Modal popup -->

<a href="#myModal">Test</a>

<div id="myModal" class="modal">
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

<script>
//Get the modal
var modal = document.getElementById('myModal');
//Get the button that opens the modal
var btn = document.getElementById("myUpdateLink");
//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
//When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}
</script> 