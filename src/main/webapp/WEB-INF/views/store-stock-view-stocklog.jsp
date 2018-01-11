<meta charset="utf-8">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<link  href="${pageContext.request.contextPath}/css/simple.css" rel="stylesheet" type="text/css">

<!--  jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
<link href="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css" rel="stylesheet"/>

<script>
/*  Define serialno */
window.onload = function(){
	
	var table = document.getElementById("myTable");
	var rowCount = table.getElementsByTagName("tr").length-1; /* not include title */
			
	var currentPage = document.getElementById("lbCurPage").innerHTML;
	var currentPgInt = parseInt(currentPage);
	
	var pageNo = document.getElementById("lbLPages").innerHTML;

		for (var i = 1; i <= rowCount ; i++)  /*Loop until number of row in this page */
		{	
			for (var p = 1; p <= pageNo ; p++) /* This data have how many page */
			{
				if(currentPage == p )
				{
					table.rows[i].cells[0].innerHTML = ((currentPgInt-1)*10)+i;		
				}
			}
	    }
}

/* function selectFunction(mySelect)
{
	var select = document.getElementById(mySelect);
	var selectVal = select.options[select.selectedIndex].value;
	var selectValUp = selectVal.toUpperCase();
	
	var table, row, rowCount, itemColCell;
	table = document.getElementById("myTable");
	row = table.getElementsByTagName("tr");
	rowCount = row.length ;
	
	for (i = 1; i < rowCount ; i++) 
	{
		itemColCell = row[i].getElementsByTagName("td")[2];
		
		if(itemColCell)
		{
			if(itemColCell.innerHTML.toUpperCase().indexOf(selectValUp) > -1)
			{
				row[i].style.display = " ";
			}
		    else
		    {
		    	row[i].style.display = "none";
		    }
			
		}
	}
} */
</script>

<label id="lbCurPage" hidden="">${currentPage}</label>
<label id="lbLPages" hidden="">${pageNo}</label>


<div >
	<h3>Item Stock</h3>
</div>	

<!-- 1 Row -->
<div class="row" >

	<!-- 1.1 -->
	<div class="col-lg-5">
				<input type="text" name="userSearch"  placeholder="Enter Item">
				<button >Search</button>							
	</div>
	<!-- 1.2 -->
	<div class="link-menu navbar-text navbar-right col-lg-3">			
		<a href="${pageContext.request.contextPath}/store/stock/view">Stock</a>
		<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>	
		<span><a href="${pageContext.request.contextPath}/store/stock/view/alllog/1" >Stock Log</a></span>								
	</div>
</div>

<!-- 2 Row -->

<div class="row" >
		<form>
			<div class="form-group col-sm-2 col-xs-6">

			</div>
			<div class="form-group col-sm-2 col-xs-6">
	
			</div>
			<div class="form-group col-sm-2 col-xs-6">

			</div>
			<div class="form-group col-sm-2 col-xs-6">

			</div>
			<div class="form-group col-sm-2 col-xs-6">

			</div>				
		</form>
</div>

<script>
$(function () {
    $('#datetimepicker1').datetimepicker();
    dateFormat : "dd-mm-yyyy"
});
</script>


<!-- 3.1 -->
<div>
			
			<table id="myTable" class="table table-striped">
				<thead>
					<tr>
						<th class="col-xs-1">#</th>
						<th class="col-xs-1">StockId</th>
						<th class="col-xs-2">Item</th>
						<th class="col-xs-1">Quantity</th>
						<th class="col-xs-1">Price/unit</th>
						<th class="col-xs-2">Employee</th>
						<th class="col-xs-2">Date</th>
						<th class="col-xs-2">Supplier</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tenStockLogList}" var="stLg">		
						<tr >
							<td class="col-xs-1"></td>
							<td class="col-xs-1">${stLg.stockId}</td>
							<td class="col-xs-2">${stLg.itemModel.itemName}</td>
							<td class="col-xs-1">${stLg.addedQty}</td>
							<td class="col-xs-1">$${stLg.addedPrice}</td>
							<td class="col-xs-2">${stLg.empModel.employeeName}</td>
							<td class="col-xs-2">${stLg.addedDate}</td>
							<td class="col-xs-2">${stLg.supModel.supName}</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
			
			<c:forEach begin="1" end="${pageNo}" var="number" >
				<a href="${pageContext.request.contextPath}/store/stock/view/alllog/${number}">${number}</a>
			</c:forEach>
		
<!-- 2.2 -->
<!-- <div class="col-lg-3" >
   <br><br>
	<div class="panel panel-default">
		<div  class="panel panel-heading">
			<h5  class="panel panel-title"> </h5>
		</div>
		<div  class="panel panel-body">
		
		</div>
	</div>

</div> -->

</div>