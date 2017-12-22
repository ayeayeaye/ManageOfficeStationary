<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">


<script spellcheck="">
var count=0;
function fillToTable( ) {
	
	count=parseInt(count)+parseInt(1);
		
	var myTable2 = document.getElementById("myTable2");
	var myRowCount = myTable2.getElementsByTagName("tr").length;
	var myRowIndex = parseInt(myRowCount)-1;
	var myColCount = myTable2.getElementsByTagName("td").length;
	
	var my1 = document.getElementById("myInputItem").value;
	var my2 = document.getElementById("myInputQty").value;
	var my3 = document.getElementById("myInputPrice").value;
	var my4 = document.getElementById("myInputSupp").value;
	
	/* create link */
	var newlink = document.createElement('a');
	newlink.setAttribute('class', 'glyphicon glyphicon-trash');
	newlink.style.color = "red";
/* 	var linkText = document.createTextNode("Remove");
	newlink.appendChild(linkText); */
	
	/* create label*/
	var lbItemVal= myCreateElementLabel('input',my1, "myLbItem")
	var lbQtyVal= myCreateElementLabel('input',my2, "myLbQty")
	var lbPriceVal= myCreateElementLabel('input',my3, "myLbPrice")
	var lbSuppVal= myCreateElementLabel('input',my4, "myLbSupp")

	if(count>myRowCount-1)
	{
	    var row = myTable2.insertRow(myRowCount);
	    
	    var cell0 = row.insertCell(0);
	    var cell1 = row.insertCell(1);
	    var cell2 = row.insertCell(2);
	    var cell3 = row.insertCell(3);
	    var cell4 = row.insertCell(4);
	    var cell5 = row.insertCell(5);
	    
	    //*To protect ==> After "delete" row, "add" row again, remember the deleted last row (error).
	    //*Solution => Get present last row.
		for(var i=1; i<myRowCount; i++)
		{							
			var lastNo = myTable2.rows[i].cells[0].innerHTML;
		} 	
	    var rowNumber = parseInt(lastNo)+1;
	    cell0.innerHTML = rowNumber;
 	    cell1.appendChild(lbItemVal);
	    cell2.appendChild(lbQtyVal);
	    cell3.appendChild(lbPriceVal);
	    cell4.appendChild(lbSuppVal);	
		cell5.appendChild(newlink);
	}
	else
	{	
		
		myTable2.rows[myRowIndex].cells[1].appendChild(lbItemVal);	
		myTable2.rows[myRowIndex].cells[2].appendChild(lbQtyVal);		
		myTable2.rows[myRowIndex].cells[3].appendChild(lbPriceVal);		
		myTable2.rows[myRowIndex].cells[4].appendChild(lbSuppVal);
		myTable2.rows[myRowIndex].cells[5].appendChild(newlink);
	}
	
	newlink.setAttribute('onClick', 'removeRow(this)');	
}

function removeRow(x)
{
	//get click row index
	var selectRow = x.parentNode.parentNode.rowIndex;
	//get table
	var myTable2 = document.getElementById("myTable2");	
	//delete row
	myTable2.deleteRow(selectRow);
	
 	//*Everytime click "delete" row, To protect => Origin=1,2,3,4,5. Delete=2. Error=1,3,4,5. 
 	//*Everytime click "delete" row, Solution => rearrange the number.
	var myRowCount = myTable2.getElementsByTagName("tr").length;	
	for(var r=1; r<myRowCount; r++)
		{
			myTable2.rows[r].cells[0].innerHTML = r;
		} 
}

function fillInput(mySelect,myInput) 
{
	var selectVal = document.getElementById(mySelect).options[document.getElementById(mySelect).selectedIndex].text;;	
	document.getElementById(myInput).value = selectVal;
}

/* function myCreateElementInput(name,readOnlyYN,styleColorCode,sizeNo,value) {
	
	var input = document.createElement(name);
	input.readOnly = readOnlyYN;
	input.style.backgroundColor=styleColorCode;
	input.size = sizeNo;
	input.value = value;
	
	return input;
} */

function myCreateElementLabel(elementType,value, name) {

	var elementLb = document.createElement(elementType);
	elementLb.setAttribute("Type","text");
	elementLb.name = name;
	elementLb.setAttribute("value",value);

	return elementLb;
}

/* function showTestVal() {
	var myTable2 = document.getElementById("myTable2");
	var ddd = myTable2.rows[1].cells[1].innerHTML;
	alert(ddd);
	var eee = ddd.value;
	alert(document.getElementById("myLbItem").value);
} */
</script>
 
	<div class="row">

<!-- Start panel	-->
<div class="panel panel-default">	

<div class="panel panel-heading">
	<h3>
		Add Items To Stock
	</h3>
</div>

<!-- Start Panel Body -->
<div class="panel panel-body">
		<!--Start Table 2 -->	
<div class="col-lg-7">				
		<table class="table table-bordered" id="myTable2" >
			<thead>
				<tr>
					<th>#</th>
					<th>Item</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Supplier</th>
					<th></th>
				</tr>
			</thead>		
			<tbody>
				<tr>				
					<td>1</td>
					<td></td>
					<td></td>				
					<td></td>
					<td></td>	
					<td></td>						
				</tr>
			</tbody>			
		</table>
	

		<a href="${pageContext.request.contextPath}/store/stock/added" class="btn btn-success">Save</a>
		<%-- <a href="#" class="btn btn-success" onclick="showTestVal()">Save</a> --%>
		<a href="#" class="btn btn-danger">Cancel</a>
		
</div>

		<!--End Table 2 -->		
	
		<!-- Start Table 1 -->
	
<div class="col-lg-4 pull-right" >
<!-- Start Loop Panel Body  -->
<div class="panel panel-body" style="background-color: #f5f5f5;">
			<table class="table table-bordered">
			<tr >
				<td>Item</td>
				<td>
					<input id="myInputItem" style="width: 150px"/>
					<select  id="mySelectItem"  ondblclick="fillInput('mySelectItem','myInputItem')" size="5" style="width: 150px">
							<c:forEach items="${itemList}" var="item">
							<option value="${item.itemId}">${item.itemName}</option>
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
				<td><input id="myInputSupp"  style="width: 150px"/>
					<select id="mySelectSupp"  ondblclick="fillInput('mySelectSupp','myInputSupp')" size="5" style="width: 150px" >
						<c:forEach items="${supList}" var="supp">
						<option value="${supp.supplierId}">${supp.supName}</option>
						</c:forEach>
					</select>					
				</td>
			</tr>	
			<tr>
				<td colspan="2"><button onclick="fillToTable( )">Add</button></td>
			</tr>
			</table>
</div>
<!-- End Loop Panel Body  -->
</div>
<!-- End Table 1  -->	

</div>
<!-- End Panel Body  -->			
</div>


<!-- End Panel  -->
		
	</div>
