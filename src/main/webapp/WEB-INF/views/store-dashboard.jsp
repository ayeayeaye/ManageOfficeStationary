<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">

<br/>
   <div class="row"> 
    <!-- Div 1 -->
        <div class="col-lg-8 col-md-9 col-sm-9 col-xs-9" >
		  <!-- Panel -->
		  <br/>
		  <div class="panel panel-default">
		      <div class="panel-heading">
				<div class="panel-title">
					<h4>Pending Request</h4>
				</div>
			 </div>
		      <div class="panel-body">
		      	<table class="table">
				<thead>
				  <tr>
				    <th>No</th>
				    <th>RequestID</th>
				    <th>Department</th>
				    <th>PendingDate </th>
				    <th>Detail</th>
				  </tr>
		  		</thead>
				 <tbody>
				  <c:forEach items="${storeReqPendList}" var="reqPList" varStatus="counter">		  
					  <tr> 
					  	<td>${counter.count}</td>
					  	<td>${reqPList.department}-${reqPList.drepCode}</td>
					    <td>${reqPList.departmentModel.departmentName}</td>
					    <td>${reqPList.approveDate}</td>   
					    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqPList.requestId}.html" class="btn btn btn-primary">Detail</a></td>	   
					  </tr>
				  </c:forEach>	
				 </tbody>
		       </table>    	
		      </div>
		      <div class="panel-footer">
			      <span>
			      	<a href="${pageContext.request.contextPath}/store/request/history.html" class="btn btn-info">All Request History</a>
			      </span>
			      <span>
			      	<a href="${pageContext.request.contextPath}/store/request/today/history.html" class="btn btn-info">Today Request History</a>
			      </span>
		      </div>
	      </div>
	      <!-- Panel 1 --> 
	      
        </div>
     <!-- Div 1 -->

	<br>
	 <!--  2 Start -->             
	<div class="col-lg-4 pull-right"> 			
			  <!-- 2.1 -->
			  <div class="panel panel-default" >
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
							<c:if test="${empty (lowStitemList)}">
								No Item in Low Stock
							</c:if> 
							<c:if test="${!empty (lowStitemList)}">
								Low level Stock - <span style="color: red;">${fn: length(lowStitemList)}</span> Items!
							</c:if> 							 
						</a>
					</h4>	
				</div>
			    
			    <div id="collapse1" class="panel-collapse collapse in">
			      	      
			     <div class="panel-body">
				<table class="table">
				  <thead>
					  <tr >
					    <th>Item</th>
					    <th>Quantity</th>					
					  </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${lowStitemList}" var="lowStitem" >	
					  <tr> 
					    <td>${lowStitem.itemName}</td>
					    <td><span style="color: red;">${lowStitem.totalQty}</span></td>
					  </tr>
				  </c:forEach>			
				  </tbody>
				</table>			
			 						
			    </div>
		      </div>
	        </div>	
   

 <!--  2 End  -->  
 <!--3 Start -->
			
			  <div class="panel panel-default" >
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" href="#collapse2">
						Department Contact</a>
					</h4>	
				</div>
			    
			    <div id="collapse2" class="panel-collapse collapse">
			      	      
			     <div class="panel-body">
			 
				<table class="table">
				  <thead>
					  <tr >
					    <th>Department</th>
					    <th>Phone</th>
					  </tr>
				  </thead>
				  <c:forEach items="${deptList}" var="dept" varStatus="counter">	
					  <tr> 
					    <td>${dept.departmentName}</td>
					    <td>+65 ${dept.contactNumber}</td>
					  </tr>
				  </c:forEach>
				</table>			

			    </div>
		      </div>
	        </div>	
    </div>
 <!--3 End --> 

 </div>
