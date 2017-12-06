<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">

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

<div class="container">

<h1>All</h1>
	
<div class="row">
	
	<div class="panel panel-default">
		<div class="panel panel-heading"><h3>Catalogue</h3></div>
		<div class="panel panel-body"> 
		
			<div class="col-lg-5">
				 <div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
				    <div class="input-group-addon">Search</div>
				    <input type="text"  class="form-control" id="inlineFormInputGroupUsername2" onkeyup="myFunction()" placeholder="Category or Item">
				</div>
			</div>
			
			<br><br>
				
			<div class="col-lg-7">
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
			
	            
<%-- 	     <!--Div 2  -->
	
	        <div class="col-lg-4  pull-right">
			  <div class="panel panel-default" >
			      <div class="panel-heading">
			      	<h4 class="panel-title">
				        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
				           Create New Category
				        </a>
			     	 </h4>
			      </div>
			      <div id="collapseOne" class="panel-collapse collapse">
			      	      
			      <div class="panel-body">
			      <form action="${pageContext.request.contextPath}/store/catalogue/create/category.html">
					<table class="table">
							<tr>
								<td>Id</td>
								<td>#</td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="newCatName"/></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" class="btn btn-success" value="Create Category"></td>
							</tr>						
					</table>
				  </form>
				 </div>
		      </div>
	        </div>            
	    </div>
	 <!--Div 2  --> --%>
	
 <%--     <!--Div 3  -->

        <div class="col-lg-4  pull-right">
		  <div class="panel panel-default" >
		      <div class="panel-heading">
		      	<h4 class="panel-title">
			        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseItem">
			          Create New Item
			        </a>
		     	 </h4>
		      </div>
		      <div id="collapseItem" class="panel-collapse collapse">
		      	      
		      <div class="panel-body">
		       <form action="${pageContext.request.contentType}/store/create/item">
					<table class="table">	
						  <tr> 
						    <td>Name</td>
						    <td><input type="text" name="newItemName"/></td>
						  </tr>
						  <tr> 
						    <td>Category</td>
						    <td>
						    	<select>
						    		<c:forEach items="${catList}" var="cat">
						    		<option>${cat.categoryName}</option>
						    		</c:forEach>
						    	</select>
						    </td>
						  </tr>	
						  <tr> 
						    <td>Unit</td>
						    <td><input type="text" name="newUnitName"/></td>
						  </tr>
						  <tr> 
						    <td>Price</td>
						    <td><input type="text" name="newItemPrice"/></td>
						  </tr>	
						  <tr>
						  	<td><input type="submit" value="Create Item" class="btn btn-success" /></td>
						  </tr>					  	  
					</table>
			</form>
			 </div>
	      </div>
        </div>       
    </div>
 <!--Div 3  -->  --%>
	 
	</div>
	</div>
</div>

</div>