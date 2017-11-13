<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-default">
	<h3>Store Dashboard</h3>
</div>

<link href="../css/styles.css" rel="STYLESHEET" type="text/css">


<div class="panel-body">

  <div class="panel-group" id="accordion" align="left" >
  
   <!-- #1 -->
  	<div class='col-xs-7' >
  		<div class='row margin-10'>
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
		          Request Pending 
		        </a>
		      </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse in">
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
		    </div>
		  </div>
		</div>
  	</div>

  
    <!-- #2 -->
<div class='col-xs-7'>
	<div class='row margin-10'>
		<div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		       <!--  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> -->
		        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
		          Request historry
		        </a>
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse">
		      <div class="panel-body">
		      				      	
				<table class="table">
				  <thead>
					  <tr >
					    <th>No</th>
					    <th>RequestID</th>
					    <th>Department</th>
					    <th>DisburseDate</th>
					    <th>Detail</th>
					  </tr>
				  </thead>
				  <c:forEach items="${storeReqDisbList}" var="reqDList" varStatus="counter">	
					  <tr> 
					  	<td>${counter.count}</td>
					  	<td>${reqDList.department}-${reqDList.drepCode}</td>
					    <td>${reqDList.departmentModel.departmentName}</td>
					    <td>${reqDList.disburseDate}</td>   
					    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqDList.requestId}.html" class="btn btn btn-primary">Detail</a></td> 
					  </tr>
				  </c:forEach>
				</table>	
				
		      </div>
		    </div> 
		  </div>
	</div>
  </div>
  
  
 </div> 
 
  </div>
  







