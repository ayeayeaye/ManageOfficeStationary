<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">

<div class="container-fluid">
<h1>Welcome - Staff </h1>
</div>

<div class="container">

<div class="container">
 <div class="row">
 	<a href="${pageContext.request.contextPath}/staff/request/create.html" class="btn btn-success" >Make New Request</a>
 </div>
 </div><br>



<div class="row">
    
    <!-- Div 1 -->
        <div class="col-lg-9">
	 
	 		<c:forEach items="${last3Req}" varStatus="counter">  					
					<c:set value="${counter.count}" var="z"></c:set>
			</c:forEach>
			
		  <!-- Panel -->
		  <div class="panel panel-default">
		      <div class="panel-heading">
				<div class="panel-title">
					Last ${z} Requests 
				</div>
			 </div>
		      <div class="panel-body">
		      
		      <c:if test="${empty last3Req}">${erMsg}</c:if>
		        <c:if test="${not empty last3Req}">
		      	<table class="table">
				<thead>
				  <tr>
				    <th>RequestID</th>
				    <th>Date(Req/Rej/App)</th>
				    <th>Employee</th>
				    <th>Department</th>
				    <th>Status</th>
				  </tr>
		  		</thead>
				 <tbody>
				  <c:forEach items="${last3Req}" var="reqPList" varStatus="counter">		  
					  <tr> 
					  	<td>${reqPList.department}-${reqPList.drepCode}</td>
					  	
					  <!-- 	Department - status is "Request", show "Request Date", status is "Approve/Reject", show "approve Date" -->
					  	
					  	<td>
						  	<c:choose>
						  		<c:when test="${reqPList.deptStatus == 'Request' }">
						  			${reqPList.reqDate}
						  		</c:when>
						  		<c:otherwise>
						  			${reqPList.approveDate}
						  		</c:otherwise>
						  	</c:choose>	
					  	</td>
					  	
					  	<td>${reqPList.employeeModel.employeeName}</td>
					    <td>${reqPList.departmentModel.departmentName}</td>  
					    <td>${reqPList.deptStatus}</td>
					 </tr>
				  </c:forEach>	
				 				  			  
				 </tbody>
		       </table>  
		        </c:if>
		         	
		      </div>
		      <div class="panel-footer">
			      <span>
			      	<a href="${pageContext.request.contextPath}/staff/request/history.html" class="btn btn-primary">All Request History</a>
			      </span>
			      <span>
			      	<a href="${pageContext.request.contextPath}/staff/request/today/history.html" class="btn btn-primary">Today Request History</a>
			      </span>
		      </div>
	      </div>
	      <!-- Panel 1 --> 
	      
        </div>
     <!-- Div 1 -->
 
<%--      <!--Div 2  -->
        <div class="col-lg-3">
			<!-- Panel 2 -->
		  <div class="panel panel-default">
		      <div class="panel-heading">
		      	<div class="panel-title">
			          Collection Point Information
		     	 </div>
		      </div>		      
	      
		      <div class="panel-body">
				<table class="table">
				  <thead>
					  <tr >
					    <th>CollectionPoint</th>
					    <th>Department</th>
					  </tr>
				  </thead>	
					  <tr> 
					  	<td>-</td>
					    <td>-</td>
					  </tr>
				</table>
			 </div>
	      </div>
	       <!--Panel 2  -->
        </div>      
    <!--Div 2  --> 
               
    <!--Div 3  -->
        <div class="col-lg-3">
			<!-- Panel 3 -->
		  <div class="panel panel-default">
		      <div class="panel-heading">
		      	<h4 class="panel-title">
			        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
			          Department Information
			        </a>
		     	 </h4>
		      </div>
		      <div id="collapseThree" class="panel-collapse collapse">
		      
	      
		      <div class="panel-body">
				<table class="table">
				  <thead>
					  <tr >
					    <th>No</th>
					    <th>Department</th>
					    <th>Phone</th>
					  </tr>
				  </thead>
				  <c:forEach items="${storeReqDisbList}" var="reqDList" varStatus="counter">	
					  <tr> 
					  	<td>${counter.count}</td>
					    <td>${reqDList.departmentModel.departmentName}</td>
					    <td></td>
					  </tr>
				  </c:forEach>
				</table>
			 </div>
	      </div>
        </div>      
    <!--Panel 3  -->        
    </div> --%>
 <!--Div 3  -->
 
 
   
</div>


</div>
