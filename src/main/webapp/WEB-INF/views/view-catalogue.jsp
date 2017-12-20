<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">


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


//check create new catedory is already exist or not
function checkCategoryExist() {
	var inputCatName = document.getElementById("newCatNameID").value;
	//alert(inputCatName);
	
	var cats = document.getElementById("di").value;
	alert(cats);
}
	
</script>

<div>
	<h3>Stock</h3>
</div>
	
<div class="row">
<!-- 1.1 -->	
	<div class="col-lg-7">
		<div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
			<div class="input-group-addon">Search</div>
			<input type="text"  class="form-control" id="inlineFormInputGroupUsername2" onkeyup="myFunction()" placeholder="Category or Item">
		</div>
	</div>
<!-- 1.2 -->
	<div class="link-menu">
		<p class="navbar-text navbar-right">
			<a href="${pageContext.request.contextPath}/store/stock/view">Stock</a>
			<span><a href="${pageContext.request.contextPath}/all/view/items">Item Catalogue</a></span>
			<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>	
			<a href="${pageContext.request.contextPath}/store/stock/view/log" >Stock Log</a>						
		</p>
	</div>
</div>
			
<div class="row">
<!-- 2.1 -->
	<div class="col-lg-8">
			<table id="myTable" class="table table-scroll">
				<thead>
					<tr class="bg-info">
						<th class="col-xs-2">#</th>
						<th class="col-xs-5">Category</th>
						<th class="col-xs-5">Item</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="items"  varStatus="counter">
					<tr>
						<td class="col-xs-2">${counter.count}</td>
						<td class="col-xs-5">${items.categoryModel.categoryName}</td>
						<td class="col-xs-5">${items.itemName}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	

	<br><br>

<!-- 2.2 -->
	<div class="col-lg-4 pull-right"> 
				
			  <!-- 2.1 -->
			  <div class="panel panel-default" >
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
						New Category</a>
					</h4>	
				</div>
			    
			    <div id="collapse1" class="panel-collapse collapse" style="height: 0px;">
			      	      
			     <div class="panel-body">
				 <form:form action="${pageContext.request.contextPath}/store/stock/create/category.html" modelAttribute="catList">				 
					<table class="table table-bordered">
							<tr>
								<td>Id</td>
								<td>:#</td>
							</tr>
							<tr>
								<td>Name</td>
								<td>:<input type="text" name="newCatName" id="newCatNameID" /></td>
							</tr>							
							<tr>
							<td colspan="2" ><form:button class="btn btn-success" >Submit</form:button></td>
							</tr>						
					</table>
				</form:form>
			    </div>
		      </div>
	        </div>					

						
<!-- 2.3 -->
			  <div class="panel panel-default" >
			      <div class="panel-heading">
			      	<h4 class="panel-title">
				        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				           Create New Item
				        </a>
			     	 </h4>
			      </div>
			      <div id="collapseTwo" class="panel-collapse collapse">
			      	      
			     <div class="panel-body">
			     <table class="table table-bordered">
					 <form:form action="${pageContext.request.contextPath}/store/stock/create/item.html" commandName="newItem" method="POST">				 
						 <tr>
						    <td>Name</td><td>:<form:input path="itemName"/></td>
						 </tr>	
						 <tr>
						    <td>Category</td>
						    <td>:
						    	<form:select path="category">
									<c:forEach items="${catList}" var="cat" >
						    		<form:option value="${cat.categoryId}" label="${cat.categoryName}"></form:option>
						    		</c:forEach>
						    	</form:select>
						    	</td>	
						    					     							     
						 </tr>	
						 <tr>
						    <td>Unit</td><td>:<form:input path="unit"/></td>
						 </tr>	
						 <tr>
						    <td colspan="2" ><form:button class= "btn btn-success" >Create</form:button> </td>
						 </tr>													 		     
						   
					</form:form>
				</table>
			    </div>
		      </div>
	        </div>							
					
				
	</div>
<!-- 2 -->
</div>	
