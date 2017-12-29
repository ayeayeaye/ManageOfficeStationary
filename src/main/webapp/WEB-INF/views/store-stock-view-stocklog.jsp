<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">


<div >
	<h3>Item Stock</h3>
</div>	

<!-- 1 Row -->
<div class="row" >
	<!-- 1.1 -->
	<div class="col-lg-5">
		Filter, Sort
	</div>

		<!-- 1.2 -->	
	<div class="link-menu navbar-text navbar-right">			
		<a href="${pageContext.request.contextPath}/store/stock/view">Stock</a>
		<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
		<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>	
		<span><a href="${pageContext.request.contextPath}/store/stock/view/log" >Stock Log</a></span>								
	</div>
</div>

<!-- 2 Row -->
			<div class="table-responsive">	
			<table id="myTable" class="table table-scroll">
				<thead>
					<tr>
						<th class="col-xs-1">#</th>
						<th class="col-xs-1">StockCode</th>
						<th class="col-xs-2">Item</th>
						<th class="col-xs-1">Quantity</th>
						<th class="col-xs-1">Price(one unit)</th>
						<th class="col-xs-2">Employee</th>
						<th class="col-xs-2">Date</th>
						<th class="col-xs-2">Supplier</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stockLogList}" var="stLg" varStatus="counter">
						<tr >
							<td class="col-xs-1">${counter.count}</td>
							<td class="col-xs-1">${stLg.stockId}</td>
							<td class="col-xs-2">${stLg.addedItem}</td>
							<td class="col-xs-1">${stLg.addedQty}</td>
							<td class="col-xs-1">${stLg.addedPrice}</td>
							<td class="col-xs-2">${stLg.addedEmployee}</td>
							<td class="col-xs-2">${stLg.addedDate}</td>
							<td class="col-xs-2">${stLg.supplier}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>