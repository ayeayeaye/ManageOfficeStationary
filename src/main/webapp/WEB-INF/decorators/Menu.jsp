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
    margin-bottom: 30px;
}

</style>
<!-- example -->
<%-- <c:set value="deptH" var="loginUser"></c:set>
<c:set value="deptS" var="loginUser"></c:set> --%>
<c:set value="store" var="loginUser"></c:set>

	<div class="sidenav">
	  <a href="${pageContext.request.contextPath}/home">Home</a>
	  
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
	  <a href="${pageContext.request.contextPath}/manager/dashboard">Approve Request</a>
	  <a href="${pageContext.request.contextPath}/staff/dashboard">Make Request</a>
	  <a href="${pageContext.request.contextPath}/store/dashboard">Disburse Request</a>
	  <a href="${pageContext.request.contextPath}/store/stock/view">Stock</a>
	  <a href="${pageContext.request.contextPath}/all/view/items">Catalogue</a>
	  <a href="#">Employee</a>
	</div>


</html>
	