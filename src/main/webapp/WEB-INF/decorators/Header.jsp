<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.head
{
	height: 100px;
	width : 100%;
    position: fixed;
    z-index: 1;
    left: 0;
    overflow-x: hidden;
}
h3
{
	color: white;
	font:bolder;
	margin-left: 100px;
}

</style>


		
<div class="head">	

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <h3>Office Supply Management</h3>
    </div>
    <ul class="nav navbar-nav navbar-right">
    	 <c:if test="${sessionScope.USERSESSION.getSessionId() ne null}"> 
    	 	<li><a href="#"  style="color: white;"><span class="glyphicon glyphicon-user"></span> ${sessionScope.USERSESSION.user.userName}</a></li>
    	 	<li><a href="${pageContext.request.contextPath}/logout" ><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    	 </c:if>		
    </ul>
  </div>
</nav>
</div>	
