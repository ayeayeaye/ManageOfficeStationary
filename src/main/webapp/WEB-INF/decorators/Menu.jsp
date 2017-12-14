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
    background-color: #35302E;
    overflow-x: hidden;
  	margin-top: 50px;
}

.sidenav a {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 16px;
    color: white;
    display: block;
    margin-bottom: 20px;
}

.glyphicon-menu {
    font-size: 25px;
}
 */

</style>
<!-- example -->
<%-- <c:set value="deptH" var="loginUser"></c:set>
<c:set value="deptS" var="loginUser"></c:set> --%>
<c:set value="store" var="loginUser"></c:set>

	<div class="sidenav">
	  <a href="${pageContext.request.contextPath}/home">
	  <span class="glyphicon glyphicon-home glyphicon-menu"></span><br><h5>Home</h5></a>
	  
<%-- 	  <!-- Department head -->
	  <c:if test="${loginUser == 'deptH'}">
	  	<a href="${pageContext.request.contextPath}/manager/dashboard">APprove Request</a>
	  </c:if>
	  
	  <!-- Department Staff -->
	  <c:if test="${loginUser == 'deptS'}">
	  	<a href="${pageContext.request.contextPath}/staff/dashboard">Make Request</a>
	  </c:if>
	  
	  <!-- Store -->
	  <c:if test="${loginUser == 'store'}">
	  	<a href="${pageContext.request.contextPath}/store/dashboard">Disburse Request</a>
	  </c:if> --%>
	  
	  <!-- example -->
	  <a href="${pageContext.request.contextPath}/manager/dashboard">
	  <span class="glyphicon glyphicon-plus glyphicon-menu"></span><br><h5>Approve Request</h5></a>
	  
	  <a href="${pageContext.request.contextPath}/staff/dashboard">
	  <span class="glyphicon glyphicon-plus glyphicon-menu"></span><br><h5>Make Request</h5></a>
	  
	  <a href="${pageContext.request.contextPath}/store/dashboard">
	  <span class="glyphicon glyphicon-plus glyphicon-menu"></span><br><h5>Disburse Request</h5></a> 
	  
	  <a href="${pageContext.request.contextPath}/store/stock/view">
	  <span class="glyphicon glyphicon-shopping-cart glyphicon-menu" style="background-color: y"></span><br><h5>Stock</h5></a>
	  <a href="${pageContext.request.contextPath}/all/view/catalogue">
	  <span class="glyphicon glyphicon-book glyphicon-menu"></span><br><h5>Catalogue</h5></a>
	  
<!-- 	  <a href="#">
	  <span class="glyphicon glyphicon-user glyphicon-menu"></span><br><h5>Employee</h5></a> -->
	</div>


</html>
	