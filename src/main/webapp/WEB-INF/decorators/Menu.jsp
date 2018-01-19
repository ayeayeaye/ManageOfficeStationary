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
a:link:active, a:visited:active { 
    color: (internal value);
    text-decoration: underline;
    cursor: auto;
}
</style>

<script>
window.onload = function() {
		 	var currentUrl = document.getElementById("mycurrentUrl").innerHTML;
		    var links = document.getElementsByClassName("menuA");
		    for(var i=0;i<links.length;i++)
		    {
	        	 if(links[i].href  == currentUrl )
		        	{
		        		 links[i].style.color = "white";   
		        	}		        	            
		    } 	  
};
</script>


 <c:if test="${sessionScope.USERSESSION.getSessionId() ne null}"> 

 <c:set value="${pageContext.request.requestURL}" var="currentPageUrl"></c:set>
<label id="mycurrentUrl" hidden="">${currentPageUrl}</label>
 
	<div class="sidenav">	
 	  <c:choose>
	  	<c:when test="${sessionScope.USERSESSION.user.uEmpModel.department == 'STOR'}">
			<div>
		  		<a href="${pageContext.request.contextPath}/store/dashboard" class="menuA">
		  		<span class="glyphicon glyphicon-plus glyphicon-menu"></span><br>Disburse Request</a>		
		  	</div>
		  	<div>	
	  			<a href="${pageContext.request.contextPath}/store/stock/view" class="menuA">
	  			<span class="glyphicon glyphicon-shopping-cart glyphicon-menu"></span><br>Stock</a> 
	  		</div>  
- 	  	</c:when>
	  	<c:otherwise>
	  		<c:if test="${sessionScope.USERSESSION.user.uEmpModel.designation == 'manager'}">
			  	<div>
			  		<a href="${pageContext.request.contextPath}/manager/dashboard" class="menuA">
			  		<span class="glyphicon glyphicon-plus glyphicon-menu"></span><br>Approve Request</a>	
			  	</div>	  		
	  		</c:if>
	  		<c:if test="${sessionScope.USERSESSION.user.uEmpModel.designation == 'staff'}">
				 <div>
				 	<a href="${pageContext.request.contextPath}/staff/dashboard" class="menuA">
			 	 	<span class="glyphicon glyphicon-plus glyphicon-menu"></span><br>Make Request</a>		  
			 	 </div>		
	  		</c:if>	
 	  	</c:otherwise>
	  </c:choose> 
	  <div>
	  	<a href="${pageContext.request.contextPath}/all/view/catalogue" class="menuA">
	  	<span class="glyphicon glyphicon-book glyphicon-menu"></span><br>Catalogue</a>
	  </div>
	  <div>
		  <a href="#" class="menuA">
		  <span class="glyphicon glyphicon-user glyphicon-menu"></span><br>Employee</a> 
	  </div>
</div>


 </c:if> 
</html>
	