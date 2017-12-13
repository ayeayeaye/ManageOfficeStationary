<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">


<!-- auto complete(from table) by java script -->
<script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, nameCell,companyCell, row, col;
  
  input = document.getElementById("inlineFormInputGroupUsername2");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  td = table.getElementsByTagName("td");


  // Loop through all table rows, and hide those who don't match the search query
  for (row = 0; row < tr.length; row++)
  {	 
 	
	  // tr[row].getElementsByTagName("td")[0]; => # column
	    nameCell =  tr[row].getElementsByTagName("td")[1];
	    companyCell = tr[row].getElementsByTagName("td")[2];
	    if (nameCell || companyCell )
	    {
	      if (nameCell.innerHTML.toUpperCase().indexOf(filter) > -1 || companyCell.innerHTML.toUpperCase().indexOf(filter) > -1)
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
			<input type="text"  class="form-control" id="inlineFormInputGroupUsername2" onkeyup="myFunction()" placeholder="*****">
		</div>
	</div>
<!-- 1.2 -->
	<div class="link-menu">
		<p class="navbar-text navbar-right">
			<a href="${pageContext.request.contextPath}/store/stock/view">Stock</a>
			<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
			<span><a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a></span>						
		</p>
	</div>
</div>
			
<div class="row">
<!-- 2.1 -->
	<div class="col-lg-9">
			<table id="myTable" class="table table-scroll">
				<thead>
					<tr class="bg-info">
						<th class="col-xs-1">#</th>
						<th class="col-xs-1">Name</th>
						<th class="col-xs-2">Company</th>
						<th class="col-xs-2">Phone</th>
						<th class="col-xs-3">Email</th>
						<th class="col-xs-3">Address</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${supList}" var="sup" varStatus="counter">
					<tr>
						<td class="col-xs-1">${counter.count}</td>
						<td class="col-xs-1">${sup.supName}</td>
						<td class="col-xs-2">${sup.supCompany}</td>
						<td class="col-xs-2">${sup.supPhNo}</td>
						<td class="col-xs-3">${sup.supEmail}</td>
						<td class="col-xs-3">${sup.supAddres}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	

	<br><br>

<!-- 2.2 -->
	<div class="col-lg-3 pull-right"> 
				
			  <!-- 2.1 -->
			  <div class="panel panel-default" >
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
						New Supplier</a>
					</h4>	
				</div>
			    
			    <div id="collapse1" class="panel-collapse collapse" style="height: 0px;">
			      	      
			     <div class="panel-body">
					<table class="table table-bordered">
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>							
							<tr>
							<td></td>
							</tr>						
					</table>
			
			    </div>
		      </div>
	        </div>					
		
	</div>
</div>	
