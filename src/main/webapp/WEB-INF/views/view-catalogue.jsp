<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- auto complete(from table) by java script -->
<script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, categoryCell,itemCell, row, col;
  
  input = document.getElementById("inlineFormInputGroupUsername2");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  td = table.getElementsByTagName("td");

/* var z = tr[7].getElementsByTagName("td") //*[object HTMLCollection]*
  //var z = tr[1].getElementsByTagName("td")[1] //*[object HTMLTableCellElement]*
  alert("*" + z +"*" ) */
  
  // Loop through all table rows, and hide those who don't match the search query
  for (row = 0; row < tr.length; row++)
  {	 
 	
	  // tr[row].getElementsByTagName("td")[0]; => # column
	    categoryCell =  tr[row].getElementsByTagName("td")[1];
	    itemCell = tr[row].getElementsByTagName("td")[2];
	    if (categoryCell || itemCell )
	    {
	      if (categoryCell.innerHTML.toUpperCase().indexOf(filter) > -1 || itemCell.innerHTML.toUpperCase().indexOf(filter) > -1)
	      {
	        tr[row].style.display = "";
	      } 
	      else
	      {
	        tr[row].style.display = "none";
	      }
	    }
      
	
  }
}
</script>

<h1>All</h1>

<div class="panel panel-default">
	<div class="panel panel-heading"><h4>View Catalogue</h4></div>
	<div class="panel panel-body">  
		<div class="row col-lg-5">
			 <div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
			    <div class="input-group-addon">Search</div>
			    <input type="text"  class="form-control" id="inlineFormInputGroupUsername2" onkeyup="myFunction()" placeholder="Category or Item">
			</div>
		</div>
		
		<br><br><br>
		
		<div>
		<table id="myTable" class="table table-striped">
			<thead>
				<tr class="bg-info">
					<th>#</th>
					<th>Category</th>
					<th>Item</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${itemList}" var="items"  varStatus="counter">
				<tr>
					<td>${counter.count}</td>
					<td>${items.categoryModel.categoryName}</td>
					<td>${items.itemName}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
	</div>
</div>