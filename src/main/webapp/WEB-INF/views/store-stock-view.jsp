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

</script>


<!-- 1 -->	

	
		<div >
			<h3>Item Stock</h3>
		</div>	
	 
	
		<div class="row">
		
			<div class="col-lg-4">
			<div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
				<div class="input-group-addon"><span class="glyphicon glyphicon-search"></span> Search</div>
				<input type="text"  class="form-control" id="inputSearch" onkeyup="mySearchFunction()" placeholder="Enter Item">
			</div>
			</div>
				
				<div class="link-menu">
				<p class="navbar-text navbar-right">
					<span><a href="${pageContext.request.contextPath}/store/stock/view">Stock</a></span>
					<a href="${pageContext.request.contextPath}/all/view/items">Item Catalogue</a>
					<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>						
				</p>
				</div>
		</div>
		
			
			<div>	
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
						<tr>
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

					<a href="${pageContext.request.contextPath}/store/stock/add" class="btn btn-success">
					<span class="glyphicon glyphicon-plus-sign"></span> Add Stock
					</a>
			</div>	 
		

<!-- 1 -->



