<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<script  type="text/javascript">
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

/* 	window.opener.document.getElementByName("0").innerHTML = choosingItem; */
	
	self.close();

}

</script>

<input type="text" value="${rowIndex}" id="myInput"/>

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
				<tr  class='clickable-row' onclick="closeWin('${items.itemName}')" >
					<%-- <td><a onclick="closeWin('${items.itemName}')"><label>${items.itemName}</label></a></td> --%>
					<td ><label onclick="closeWin('${items.itemName}')" >${items.itemName}</label></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>