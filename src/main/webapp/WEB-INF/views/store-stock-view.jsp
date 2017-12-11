<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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

<div class="container">

<h2>Store -Stock </h2>

	
<div class="row">

<!-- 1 -->	
	<div class="col-lg-12">
	<div class="panel panel-default">
		<div class="panel panel-heading"><h3>Item Stock</h3></div>
		<div class="panel panel-body"> 
		
		<div class="row">
		
			<div class="col-lg-4">
			<div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
				<div class="input-group-addon"><span class="glyphicon glyphicon-search"></span> Search</div>
				<input type="text"  class="form-control" id="inputSearch" onkeyup="mySearchFunction()" placeholder="Enter Item">
			</div>
			</div>
			
			<div class="col-lg-1 pull-right">
			<div class="pull-right">
				<a href="${pageContext.request.contextPath}/store/stock/add" class="btn btn-success">
					<span class="glyphicon glyphicon-plus-sign"></span> Add Stock
				</a>
			</div>
			</div>
		
		</div>
		
			<br>
			
			<div>	
			<table id="myTable" class="table table-striped">
				<thead>
					<tr class="bg-info">
						<th>#</th>
						<th>Id</th>
						<th>Item</th>
						<th>Total Quantity</th>
						<th>Unit</th>
						<th>Price(one unit)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="items" varStatus="counter">
						<tr>
							<td>${counter.count}</td>
							<td>${items.itemId}</td>
							<td>${items.itemName}</td>
							<td>${items.totalQty}</td>
							<td>${items.unit}</td>
							<td>${items.price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			</div>	 
	</div>	
	</div>	
<!-- 1 -->

</div>
</div>
