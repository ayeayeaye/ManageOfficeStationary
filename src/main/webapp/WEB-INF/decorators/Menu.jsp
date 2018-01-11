<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>

<style>
.sidenav {
    height: 100%;
    width: 100px;
    position: fixed;
    z-index: 1;
    left: 0;
    background-color: #2d2c2c;
    overflow-x: hidden;
    padding-top: 100px;
}

.sidenav a {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 16px;
    color: gray;
    display: block;
    margin-bottom: 20px;
}

.glyphicon-menu {
    font-size: 25px;
}


</style>

 <c:if test="${sessionScope.USERSESSION.getSessionId() ne null}"> 

	<div class="sidenav">
	  
 	  <c:choose>
	  	<c:when test="${sessionScope.USERSESSION.user.uEmpModel.department == 'STOR'}">
	  		<a href="${pageContext.request.contextPath}/store/dashboard">
	  		<span class="glyphicon glyphicon-plus glyphicon-menu"></span><br>Disburse Request</a> 
	  		<a href="${pageContext.request.contextPath}/store/stock/view">
	  		<span class="glyphicon glyphicon-shopping-cart glyphicon-menu"></span><br>Stock</a> 
- 	  	</c:when>
	  	<c:otherwise>
	  		<c:if test="${sessionScope.USERSESSION.user.uEmpModel.designation == 'manager'}">
			  	<a href="${pageContext.request.contextPath}/manager/dashboard">
			  	<span class="glyphicon glyphicon-plus glyphicon-menu"></span><br>Approve Request</a>		  		
	  		</c:if>
	  		<c:if test="${sessionScope.USERSESSION.user.uEmpModel.designation == 'staff'}">
				 <a href="${pageContext.request.contextPath}/staff/dashboard">
			 	 <span class="glyphicon glyphicon-plus glyphicon-menu"></span><br>Make Request</a>		  		
	  		</c:if>	
 	  	</c:otherwise>
	  </c:choose> 
	  <!-- example -->

	  
	  <a href="${pageContext.request.contextPath}/all/view/catalogue">
	  <span class="glyphicon glyphicon-book glyphicon-menu"></span><br>Catalogue</a>
	  
	  <a href="#">
	  <span class="glyphicon glyphicon-user glyphicon-menu"></span><br>Employee</a> 
</div>


 </c:if> 
</html>
	