<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">

<div class="container-fluid">
<h1>Welcome - Staff </h1>
</div>

<div class="container">

    <div class="row">
    
    <!-- Div 1 -->
        <div class="col-lg-9" style="background-color:yellow;">
		 
		  <!-- Panel -->
		  <div class="panel panel-default">
		      <div class="panel-heading">
				<div class="panel-title">
					Last Three Requests
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
				  <c:forEach items="${last3Req}" var="reqPList" varStatus="counter">		  
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
			      	<a href="${pageContext.request.contextPath}/staff/request/history.html" class="btn btn-primary">All Request History</a>
			      </span>
			      <span>
			      	<a href="${pageContext.request.contextPath}/store/request/today/history.html" class="btn btn-primary">Today Request History</a>
			      </span>
		      </div>
	      </div>
	      <!-- Panel 1 --> 
	      
        </div>
     <!-- Div 1 -->
 
     <!--Div 2  -->
        <div class="col-lg-3" style="background-color:pink;">
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
        <div class="col-lg-3" style="background-color:pink;">
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
    </div>
 <!--Div 3  -->
 
 
   
    </div>

   
</div>


</div>