<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" >
/* function popupItem( ) {
	
    window.open("../stock/popup/chooseItem/"+rowIndex, 'window', 'width=600,height=400');
}

function popupSupplier() {
    window.open("../stock/popup/chooseSupplier", 'window', 'width=600,height=400');
} */


function addNewRole(tableID) {

	
	//get table
	var myTable = document.getElementById(tableID);

	var noOfRow = myTable.rows.length;
	var newRow = myTable.insertRow(noOfRow); 

	var cell1= newRow.insertCell(0);
	cell1.innerHTML = noOfRow;
 
	//var cell2 = newRow.insertCell(1);		
	var noOfCol = myTable.rows[1].cells.length;	
		for(var i=1; i<noOfCol; i++) 
		{							
			    var newcell	= newRow.insertCell(i); 
				newcell.innerHTML = myTable.rows[1].cells[i].innerHTML;					
		} 

}

</script>


		<c:out value="">-</c:out>

<div class="container col-lg-12">

<h2>Store</h2>

<form:form action="${pageContext.request.contextPath}/store/stock/add" method="POST" modelAttribute="stockLists">
<!-- 	<div class="col-lg-12"> -->
	<div class="panel panel-default">
		<div class="panel panel-heading"><h4>Add New Stock</h4></div>
		<div class="panel panel-body"> 
		
		<div >
				<p class="pull-right" >Date</p>
		</div>
			<br>

		
<!-- table -->				
				<table class="table table-bordered" id="myTable">				
					<thead>
						<tr class="bg-info">
							<th>No</th>
							<th>Item</th>
							<th>Quantity</th>
							<th>Price(per unit)</th>
							<th>Supplier</th>
						</tr>
					</thead>
					<tbody>	
					<!-- 2	 -->		
						<tr>
							<td class="col-lg-1">
								1
							</td>							
							<td>							
								<input type="text" id="myParentItemId"/> 
								<a class="btn"><span class="glyphicon glyphicon-search"></span></a>
							</td>
							<td>
								<input type="text" size="5" name="stockQty"/> 
							</td>
							<td>
								<input type="text" size="5" name="stockPrice" />
							</td>
							
							<td>
								<input type="text" name="stockSup" id="myParentSup"  />
								<a class="btn"><span class="glyphicon glyphicon-search"></span></a>
							</td>						
						</tr>

					</tbody>
				</table>

<!-- table -->		

	</div>	
	<div class="panel panel-footer">
	<a class="btn btn-primary" onclick="addNewRole('myTable')"><span class="glyphicon glyphicon-plus-sign"></span> Add New Item</a>
 	</div>	
	
	</div>	
<!-- </div> -->

<div>
	<form:button class="btn btn-success" >Submit</form:button>
</div>
</form:form>

</div>


<!-- Item Modal popup Starts-->

<div id="myItemModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    
		  <div class="modal-header">
			  	<p class="modal-title">Item</p>

			  	
			 	<div class="modal-body">
			 		
					AAA

		  		</div> 
		  		
			 	<div class="modal-footer">
		  			<a class="btn btn-warning " id="myBtnAdd">Add</a>
		  		</div> 		  		
		  </div> 
	    
		  </div>
  	</div>
</div>
<!-- Item Modal popup End-->

<script>
var itemModal = document.getElementById('myItemModal');

var myTable = document.getElementById('myTable');
var noOfRow = myTable.rows.length;
for(var i=1; i< noOfRow; i++) 
	{
		var btnItemSearch = document.getElementById("myItemSearchLink");
		btnItemSearch.onclick = function()
		{
			itemModal.style.display = "block";
		}
	}

//close Update Modal
var spanClose = document.getElementsByClassName("close")[0];
spanClose.onclick = function() {
	itemModal.style.display = "none";
}
</script>