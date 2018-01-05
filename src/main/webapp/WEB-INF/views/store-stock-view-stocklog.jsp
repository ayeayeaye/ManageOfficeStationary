<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">

<script>
/* Define serial no */
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
		Search
	</div>

		<!-- 1.2 -->	
	<div class="link-menu navbar-text navbar-right">			
		<a href="${pageContext.request.contextPath}/store/stock/view">Stock</a>
		<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
		<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>	
		<span><a href="${pageContext.request.contextPath}/store/stock/view/log/1" >Stock Log</a></span>								
	</div>
</div>

<!-- 2 Row -->
<div>
<!-- 2.1 -->
<div class="col-lg-9">
			<div class="table-responsive">	
			<table id="myTable" class="table">
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
							<td class="col-xs-1">${stLg.addedPrice}</td>
							<td class="col-xs-2">${stLg.empModel.employeeName}</td>
							<td class="col-xs-2">${stLg.addedDate}</td>
							<td class="col-xs-2">${stLg.supModel.supName}</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
			
			<c:forEach begin="1" end="${pageNo}" var="number" >
				<a href="${pageContext.request.contextPath}/store/stock/view/log/${number}">${number}</a>
			</c:forEach>
			</div>
</div>
<!-- 2.2 -->
<div class="col-lg-3" >
   <br><br>
	<div class="panel panel-default">
		<div  class="panel panel-heading">
			<h5  class="panel panel-title"> </h5>
		</div>
		<div  class="panel panel-body">
		
		</div>
	</div>

</div>

</div>