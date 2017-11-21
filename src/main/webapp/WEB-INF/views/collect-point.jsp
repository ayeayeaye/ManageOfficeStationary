<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

${collectPName}---

<div class="container">


<!-- panel 1 -->
<div class="col-lg-6" >
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>Collection Point</h4>
		</div>
		<div class="panel-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>Collection Point</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allCollectPointLsit}" var="cp">
						<tr>
							<td>${cp.collectPointId}</td>
							<td>${cp.collectPointName}</td>
							<td><button class="btn btn-danger">Delete</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
	
</div>
<!-- panel 1 -->

<!-- panel 2 -->
<%-- <form action="${pageContext.request.contextPath}/store/collectP.html" method="post" > --%>
<div class="col-lg-5  pull-right" >
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>Add New Collection Point</h4>
		</div>
		<div class="panel-body">
		
			<table class="table">
				<tbody>
						<tr>
							<td>Collection Point Name</td>
							<td><input type="text" name="cpName"></td>
						</tr>						
						<tr>
							<td>Reason</td>
							<td><textarea  rows="4" name="cpReason"></textarea></td>
						</tr>
						<tr>
							<td><input type="submit" value="Create" class="btn btn-primary"></td>
							<td></td>
						</tr>
				</tbody>
			</table>
		
		</div>
	</div>
	
</div>
<%-- </form> --%>
<!-- panel 2 -->



</div>