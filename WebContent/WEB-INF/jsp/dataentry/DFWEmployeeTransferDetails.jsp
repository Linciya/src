
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.ShdrcConstants"%>
<%@page import="gov.shdrc.util.Demographic"%>
<%@page import="gov.shdrc.util.DFWEmployeeForm"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
	<title>DFW Employee Transfer Details</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="datatables/css/jquery.dataTables.css" rel="stylesheet">
    <link href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
    <link href="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet">
    
    <script src="js/script.js"></script>
	<script type="text/javascript">
	</script>	
</head>

<body onload="resizeTo();">
	<form name="dfwEmployeeTransferDetailsForm" id="dfwEmployeeTransferDetailsForm" class="form-inline">
	<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
	<input id="institutionId"  type="hidden" name="institutionId" value="<%= request.getAttribute("institutionId") %>"/>
	<div style="border: solid 3px #007297">
		<div id="search" class="tab-pane fade in active" style="background:  #007297;padding-top: 8px;padding-left: 8px;">
		  <table border="0">
		  	<tr>		  		
		  		<td>
		  			<button id="accept" type="button" class="btn btn-primary">Accept</button>&nbsp;
		  		</td>		  		
		  		<td>
		  			<button id="close" type="button" class="btn btn-primary"  onclick="redirectToEmployeeGrid();">Close</button>&nbsp;
		  		</td>
		  		<td style="padding-left: 450px;">
		  			<h3 style="color: white"><b>DFW Transfer Employee Grid</b></h3>
		  		</td>	
		  	</tr>
		  </table>
		  </div>
		<div id="section" class="filter_caption">
			<table id="example" class="display table table-bordered" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		            	<th class="center" >SNo</th>
		            	<th class="center" style="display: none;">Employee Id</th>
		                <th class="center" >Employee Name</th>
		                <th class="center" >GPF/CPS No</th>
		                <th class="center" >Designation</th>
		                <th class="center" >District</th>
		                <th class="center" >Institution</th>
		       	 	</tr>
		        </thead>
		        <tbody>
		        <%
		        	List<DFWEmployeeForm> employeeTransferDetailsList =null;
					if(request.getAttribute("employeeTransferDetailsList")!=null){
						employeeTransferDetailsList =(List<DFWEmployeeForm>)request.getAttribute("employeeTransferDetailsList");
						for(DFWEmployeeForm employeeTransferDetails:employeeTransferDetailsList){
						%>
							 <tr>
							 	<td align="center"></td>
							 	<td style="display: none;"><%=employeeTransferDetails.getEmployeeId() %></td>
				                <td align="center"><%=employeeTransferDetails.getEmployeeName() %></td>
				                <td align="center"><%=employeeTransferDetails.getGpfOrCpsNo() %></td>
				                <td align="center"><%=employeeTransferDetails.getDesignation() %></td>
				                <td style="display: none;"><%=employeeTransferDetails.getDistrictId() %></td>
				                <td align="center"><%=employeeTransferDetails.getDistrictName() %></td>
				                <td style="display: none;"><%=employeeTransferDetails.getInstitutionId() %></td>
				                <td align="center"><%=employeeTransferDetails.getInstitutionName() %></td>
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
    var dataTable ="";
$(document).ready(function() {
    var lastIdx = null;
    dataTable = $('#example').DataTable({
        "scrollX": "112%",
        "order": [[ 1, 'asc' ]],
        "bAutoWidth": false, // Disable the auto width calculation 
           "aoColumns": [
          { "sWidth": "1%" }, // SNO column width 
          { "sWidth": "1%" }, //Employee Id column
          { "sWidth": "2%" }, // EmployeeName column width
          { "sWidth": "2%" }, // GpfOrCpsNo column width
          { "sWidth": "3%" }, // Designation column width
          { "sWidth": "1%" }, //District Id column
          { "sWidth": "2%" }, // District column width
          { "sWidth": "1%" }, //Institution Id column
          { "sWidth": "2%" }, // Institution column width          
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
    
 
    $('#button').click( function () {
    	dataTable.row('.selected').remove().draw( false );
    } );
        
    $('#accept').click( function () {
    	var selectedRow=dataTable.row('.selected').data();
    	 if (typeof selectedRow != 'undefined') {
    		var employeeId=selectedRow[1];
    		var employeeName=selectedRow[2];
    		var gpfOrCpsNo=selectedRow[3];	    	
	    	var designation=selectedRow[4];
	    	var districtId=selectedRow[5];
	    	var institutionId=selectedRow[7];
	    	var controllerUrl='dfwEmployeeTransferAcceptForm.do';
	    	var url = webUrl+controllerUrl+
			 '?dirId=10'+
			'&employeeId='+employeeId+
			'&districtId='+districtId+
			'&institutionId='+institutionId+
			'&gpfOrCpsNo='+gpfOrCpsNo+
			'&employeeName='+employeeName+
			'&designation='+designation;
			window.open(url, null,
					"height=490,width=450,status=yes,toolbar=no,menubar=no,location=no");	    	
    	 }else{
    		 alert("Please select the employee details in grid");
    	 }	    
	} );
});
    	
	function redirectToEmployeeGrid(){
		districtId = document.getElementById("districtId").value;
    	institutionId = document.getElementById("institutionId").value;
		var contextPath='<%=request.getContextPath()%>';
		document.location.href=contextPath+'/dfwEmployeeDetails.do?districtId='+districtId+'&institutionId='+institutionId;
	}
	
	<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath+"/";
	%>
	var webUrl='<%=webUrl%>';

</script>
	</form>
</body>
</html>