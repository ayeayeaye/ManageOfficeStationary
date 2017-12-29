<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">

<script>

var count=0;
var n=2;
function fillToTable( ) {
	
	count=parseInt(count)+parseInt(1);
		
	var myTable2 = document.getElementById("myTable1");
	var myRow = myTable2.getElementsByTagName("tr").length;
	
	var my1 = document.getElementById("mySelectItem").value;
	var my2 = document.getElementById("myInputQty").value;
	var my3 = document.getElementById("myInputPrice").value;
	var my4 = document.getElementById("mySelectSupp").value;
	

	if(count>myRow-1)
	{
	    var row = myTable2.insertRow(myRow);
	    var cell0 = row.insertCell(0);
	    var cell1 = row.insertCell(1);
	    var cell2 = row.insertCell(2);
	    var cell3 = row.insertCell(3);
	    var cell4 = row.insertCell(4);
	    cell0.innerHTML = count;
 	    cell1.innerHTML = my1;
	    cell2.innerHTML = my2;
	    cell3.innerHTML = my3;
	    cell4.innerHTML = my4;	    
	}
	else
	{
		myTable2.rows[count].cells[1].innerHTML = my1;
		myTable2.rows[count].cells[2].innerHTML = my2;
		myTable2.rows[count].cells[3].innerHTML = my3;
		myTable2.rows[count].cells[4].innerHTML = my4; 
	}
	
}

function showSelectBox(mySelect) 
{	
	var sel = document.getElementById(mySelect); 
	sel.removeAttribute("hidden");
}
function fillInput(mySelect,myInput) 
{
	var selectVal = document.getElementById(mySelect).value;	
	document.getElementById(myInput).value = selectVal;
	var sel = document.getElementById(mySelect); 
	sel.setAttribute("hidden","");
}

</script>

<div class="row col-lg-12">
	<!-- start 1 -->
	<div>
		<table class="table table-bordered col-lg-7" style="border-color: black;"  id="myTable1" >
			<thead>
				<tr>
					<th>#</th>
					<th>Item</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Supplier</th>
				</tr>
			</thead>
			
			<c:forEach var="number" varStatus="counter" begin="1" end="3">
			<tbody>
				<tr>
					<td>${counter.count}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>					
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<!-- end 1 -->
	
	
	<!-- start 2 -->
	<div>
		<table class="table table-bordered col-lg-4" id="myTable2">
			<tr>
				<td >Item</td>
				<td>
					<input id="myInputItem" onfocus="showSelectBox('mySelectItem')"  style="width: 150px"/>
					<br>									
					<select  id="mySelectItem"  hidden="" ondblclick="fillInput('mySelectItem','myInputItem')" size="5" style="width: 150px">
						<c:forEach items="${itemList}" var="item">
						<option value="${item.itemName}">${item.itemName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><input size="5" id="myInputQty" /></td>
			</tr>
			<tr>
				<td>Price($)</td>
				<td><input size="5" id="myInputPrice"/></td>
			</tr>
			<tr>
				<td>Supplier</td>
				<td>
					<input id="myInputSupp" onfocus="showSelectBox('mySelectSupp')"  style="width: 150px"/>
					<br>
					<select id="mySelectSupp" hidden="" ondblclick="fillInput('mySelectSupp','myInputSupp')" size="5" style="width: 150px" >
						<c:forEach items="${supList}" var="supp">
						<option value="${supp.supName}">${supp.supName}</option>
						</c:forEach>
					</select>					
				</td>
			</tr>	
			<tr>
				<td colspan="2"><button onclick="fillToTable( )">Add</button></td>
			</tr>											
		</table>		
	</div>
	<!-- end 2 -->

</div>