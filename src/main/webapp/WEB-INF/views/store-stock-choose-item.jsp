<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
/* Search text box - from the value of table  */
function mySearchFunction() {
	var textBox, inputUpcase, dataTable, row, itemCol, i;
	
	textBox =  document.getElementById("inputSearch");
	inputUpcase = textBox.value.toUpperCase();
	
	dataTable=document.getElementById("myTable");
	row = dataTable.getElementsByTagName("tr");

	
	for (i = 0; i < row.length; i++) 
	{
		itemColCell = row[i].getElementsByTagName("td")[0];
		
		if(itemColCell)
			{
		      if (itemColCell.innerHTML.toUpperCase().indexOf(inputUpcase) > -1 )
		      {
		        row[i].style.display = "";
		      } 
		      else
		      {
		    	  row[i].style.display = "none";
		      }
			}
	}
	
}

/* close this window */
function closeWin(choosingItem)
{
	//set the value of Parent(defined) window's element
	window.opener.document.getElementById("myParentItem").value= choosingItem;
	window.close();
}

</script>

<div class="row">
	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
		<div class="input-group"> <!-- to combine search & input box -->
			<div class="input-group-addon">Search</div>
			<input type="text"  class="form-control" id="inputSearch" onkeyup="mySearchFunction()" placeholder="Enter Item">
		</div>	
	</div>
</div>

<br>

<div class="row">
	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
		<table class="table table-bordered" id="myTable">
			<c:forEach items="${itemLists}" var="items">
				<tr>
					<td><a href="${pageContext.request.contextPath}/store/stock/after/choosedItem" onclick="closeWin('${items.itemName}')"><label id="choosingItemLb">${items.itemName}</label></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>