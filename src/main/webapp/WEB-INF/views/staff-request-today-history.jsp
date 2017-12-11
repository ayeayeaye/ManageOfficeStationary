<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-default">

<div class="panel-heading" >
<h2>Staff Requesting Request (These request)</h2>
</div>

<div class="panel-body">

<table class="table">
		<thead>
			  <tr>
			    <th>No</th>
			    <th>RequestID</th>
			    <th>RequestDate </th>
			    <th>Detail</th>
			  </tr>
		  </thead>
		  <tbody>		
		  <c:forEach items="${todayReqList}" var="reqPList" varStatus="counter">
				  <tr> 
				  	<td>${counter.count}</td>
				  	<td>${reqPList.department}-${reqPList.drepCode}</td>
				    <td>${reqPList.reqDate}</td>  
				    <td><a href="${pageContext.request.contextPath}/store/request/detail/${reqPList.requestId}.html" class="btn btn btn-primary">Detail</a></td>	   
				  </tr>
		  </c:forEach>	
		  </tbody>
	</table>
<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
</div>
</div>
