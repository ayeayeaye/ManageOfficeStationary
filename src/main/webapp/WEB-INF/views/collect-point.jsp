<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
<div class="row">

	<div class="col-lg-7">
		<div class="panel panel-default">
		<div class="panel panel-heading"><h4>All Collection Point</h4></div>
		<div class="panel panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>No</th>
							<th>Collection Point</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allCollectPointLsit}" var="collectP" varStatus="counter"> <tr>
						<tr>
							<td>${collectP.collectPointId}</td>
							<td>${collectP.collectPointName}</td>
							<td><a href="${pageContext.request.contextPath}/store/collectP/delete/${collectP.collectPointId}" class="btn btn-danger">Delete</a></td>
						</tr>
						</c:forEach>	
					</tbody>
				</table>
		</div>	
		</div>
	</div>

	

	<div class="col-lg-4 pull-right" >
		<!-- panel 2 -->
		<div class="panel panel-default">
		<div class="panel panel-heading"><h4>Create New Collection Point</h4></div>
		<div class="panel panel-body">
		
			<form:form action="${pageContext.request.contextPath}/store/collectP/Created" method="POST"  >			
					<table class="table">
							<tbody>
								<!-- to protect auto-increment after delete CP -->

								<tr>
									<td>Name</td>
									<td><form:input path="collectPointName" /></td>
								</tr>
								<tr>
									<td><input type="submit" value="Create"/></td>
									<td></td>
								</tr>		
							</tbody>
					</table>		
			</form:form> 
		</div>
		</div>
<!-- panel 2 -->
</div>

</div>
</div>

