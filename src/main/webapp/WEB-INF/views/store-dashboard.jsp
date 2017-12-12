<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="../css/styles.css" rel="STYLESHEET" type="text/css">

<div class="container">
<h2 class="col-lg-12">Welcome - Store </h2>



    <div class="row">
   
    <!-- Div 1 -->
        <div class="col-lg-8 col-md-9 col-sm-9 col-xs-9" >
		  <!-- Panel -->
		  <div class="panel panel-default">
		      <div class="panel-heading">
				<div class="panel-title">
					Pending Request
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
 
<%--      <!--Div 2  -->
        <div class="col-lg-3 col-md-3 col-sm-3 ">
			<!-- Panel 2 -->
		  <div class="panel panel-default">
		      <div class="panel-heading">
		      	<div class="panel-title">
			          Active Collection Point 
		     	 </div>
		      </div>		      
	      
		      <div class="panel-body">
				<table class="table">
				  <c:forEach items="${allCollectPointLsit}" var="cp"  >
				  <c:forEach items="${cp.departModelList}" var="depL" varStatus="depCountForACollectP">	
					  <tr> 					  					  	
					  	<c:choose>					  					  	
            		  	<c:when test="${depCountForACollectP.count == 1 }" >
	            		  	<td>${cp.collectPointName}</td>       		  	
            		  	</c:when>
					  	<c:otherwise>
					  		<td></td>
					  	</c:otherwise>
					    </c:choose>	
					    				        
					    <td>${depL.departmentName}</td>					    	   
					  </tr>
		   					    
					</c:forEach>	  
				  </c:forEach>
				</table>
			 </div>
			 
			 <div class="panel-footer">
			 <a href="${pageContext.request.contextPath}/store/collectP" class="btn btn-info"> View All Collection Points</a>
			 </div>
	      </div>
	       <!--Panel 2  -->
        </div>      
    <!--Div 2  -->  --%>
               
     <!--Div 3  -->

        <div class="col-lg-4 col-md-3 col-sm-3  pull-right">
			<!-- Panel 3 -->
		  <div class="panel panel-default" >
		      <div class="panel-heading">
		      	<h4 class="panel-title">
			        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
			          Department Information
			        </a>
		     	 </h4>
		      </div>
		      <div id="collapseOne" class="panel-collapse collapse">
		      	      
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
    <!--Panel 3  -->       
    </div>
 <!--Div 3  -->
 
 
   
    </div>

   
</div>

