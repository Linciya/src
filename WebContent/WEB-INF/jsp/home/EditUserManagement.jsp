<%@page import="gov.shdrc.util.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@ page import="gov.shdrc.util.ShdrcConstants" %>
<%@ page import="gov.shdrc.util.Util" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page import="gov.shdrc.util.UserManagement"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>Edit User Details</title>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="datatables/css/jquery.dataTables.css" rel="stylesheet">
	    <link href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
	    <link href="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet">
    	<script src="js/script.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />	
		<style type="text/css">
		.divClass{
		background-color: #F0F6FF;
		height: 755px;
		}
		#une{
	    background-color:rgba(66,139,202,0.51);
	    background-position:500px;
	    width: 675px;
	    text-align: center;
	    margin: 1 auto;
	    }
		</style>
	</head>
	<body onload="bodyOnLoad();">
	<form name="editUser" id="editUser">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<div id="submit2" class="myTableStyle">
		<table>			  
			<tr>
				<td>
					<b>Directrate Name</b>&nbsp;
				</td>
				<td>
				<select id="DeroctratelListId" name="DeroctratelListId" class="reportDropDown">
				<c:forEach var="List" items="${DeroctratelList}">
				<option value='<c:out value="${List.id}"/>'>${List.name} </option>
				</c:forEach>
				</select> 
				</td>
				<td>
				<button id="submit" type="button" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
				</td>
				<td>
		  		<button id="add" type="button" >Add</button>&nbsp;
		  		</td>
				<td>
		  		<button id="change" type="button" >Change</button>&nbsp;
		  		</td>
		  		<td>
		  		<button id="changePassword" type="button" >ReSet Password</button>&nbsp;
		  		</td>
				</tr>
		</table>
			<div id="search" class="tab-pane fade in active" style="background:  #007297;padding-top: 8px;padding-left: 8px;">
		<table border="0">
		  	<tr><h3 style="color: black;padding-left: 650px;"><b>User Management Details Grid</b></h3></tr>
		</table>
		  </div>
		  <div id="section" class="filter_caption">
		<table id="example" class="display table table-bordered" cellspacing="0" width="10%">
			<thead>
		    	<tr>
		        	<th class="center" >SNo</th>
		            <th class="center">User Name</th>
		            <th class="center" >First Name</th>
		            <th class="center" >Last Name</th>
		            <th class="center" >Mobile Number</th>
		            <th class="center" >Email</th>
		            <th class="center" >Designation</th>
		            <th class="center" style="display: none;">User Id</th>
		       </tr>
		   </thead>
		   <tbody>
		         <%
		         List<UserManagement> userManagementList =null;
					if(request.getAttribute("userManagementList")!=null){
						userManagementList =(List<UserManagement>)request.getAttribute("userManagementList");
						for(UserManagement userManagementDetails:userManagementList){
				%>
				<tr>
					<td class="sorting_1"></td>
					<td class="sorting_1"><%=userManagementDetails.getUserName() %></td>
				    <td class="sorting_1"><%=userManagementDetails.getUfname()%></td>
				    <td class="sorting_1"><%=userManagementDetails.getUlname() %></td>
				    <td class="sorting_1"><%=userManagementDetails.getPhnNum() %></td>
				    <td class="sorting_1"><%=userManagementDetails.getEmail() %></td>
				    <td class="sorting_1"><%=userManagementDetails.getDesignation() %></td>
				    <td class="sorting_1"  style="display: none;"><%=userManagementDetails.getUserId()%></td>
				 </tr>  
				<%}
				}
				%> 
		    </tbody>
		 </table>
		</div>
		</div>
<script src="datatables/js/jquery-1.11.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.js"></script>   
<script>
function bodyOnLoad(){
var DeroctrateListId = <%= request.getAttribute("DeroctrateListId") %>;
document.getElementById('DeroctratelListId').value=DeroctrateListId;
}
 var dataTable ="";
	$(document).ready(function() {
	    var lastIdx = null;
	    dataTable = $('#example').DataTable({
	        //"scrollY": 500,
	        //"sScrollY": "500px",
	        "scrollX": "100%",
	        "order": [[1, 'asc' ]],
	        "bAutoWidth": false, // Disable the auto width calculation 
	           "aoColumns": [
	          { "sWidth": "1%" }, // SNO column width 
	          { "sWidth": "10%" }, 
	          { "sWidth": "10%" }, 
	          { "sWidth": "10%" },
	          { "sWidth": "10%" },
	          { "sWidth": "10%" },
	          { "sWidth": "10%" },
	          { "sWidth": "10%" },
	          ]	    
	    });
	     $(window).bind('resize', function () {
	    	dataTable.fnAdjustColumnSizing();
	      } );
	    
	    dataTable.on( 'order.dt search.dt', function () {
	    	dataTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();   
	    
	    $('#example tbody').on( 'click', 'tr', function () {
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	        	dataTable.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	    } );
	    
	    $('#change').click( function () {
	    	
	    	 
	    	var selectedRow=dataTable.row('.selected').data();
	    	if (typeof selectedRow != 'undefined') {
	    	var userId=selectedRow[7];
    		var contextpath='<%=request.getContextPath()%>'; 
    		document.location.href=contextpath+"/"+'updateUserManagementDetails.do?userId='+userId; 
	    	}
	    	else{
	    		alert("Please select the User details in grid");	    	
	    		}
    		// document.location.href="updateUserManagementDetails.do?userId="userId; 
	    	// document.location.href="updateUserManagementDetails.do?"; 
		} );
	    $('#changePassword').click( function () {
	    	var selectedRow=dataTable.row('.selected').data();
	    	if (typeof selectedRow != 'undefined') {
    		var userId=selectedRow[7];
    		var contextpath='<%=request.getContextPath()%>'; 
    		document.location.href=contextpath+"/"+'changePasswordDetails.do?userId='+userId; 
	    	}
	    	else{
	    		alert("Please select the User details in grid");	    
	    		}
		} );
        $('#add').click( function () {
 	    window.location.href = "userManagement.do";
	   } );
	   });
    
	function doSubmit(){	
	var DeroctrateListId = document.getElementById('DeroctratelListId').value;	
	var contextpath='<%=request.getContextPath()%>'; 
	document.location.href=contextpath+"/"+'editUserManagementDetails.do?DeroctrateListId='+DeroctrateListId; 	
 	}
	
</script>
</form>
</body>
</html>