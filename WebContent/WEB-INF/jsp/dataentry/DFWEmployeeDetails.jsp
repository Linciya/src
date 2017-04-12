
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
	<title>DFW Employee Details</title>
	<link href="bootstrap-3.2.0-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="datatables/css/jquery.dataTables.css" rel="stylesheet">
    <link href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
    <link href="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet">
    
    <script src="js/script.js"></script>
	<script type="text/javascript">
	</script>	
</head>

<body onload="resizeTo();">
	
	<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
	<input id="institutionId"  type="hidden" name="institutionId" value="<%= request.getAttribute("institutionId") %>"/>
	<div style="border: solid 3px #007297">
		<div id="search" class="tab-pane fade in active" style="background:  #007297;padding-top: 8px;padding-left: 8px;">
		  <table border="0">
		  	<tr>
		  		<td>
		  			<button id="add" type="button" class="btn btn-primary">Add</button>&nbsp;
		  		</td>
		  		<td>
		  			<button id="change" type="button" class="btn btn-primary">Change</button>&nbsp;
		  		</td>
		  		<td>
		  			<button id="transfer" type="button" class="btn btn-primary">Transfer</button>&nbsp;
		  		</td>
		  		<td>
		  			<button id="buffer" type="button" class="btn btn-primary">Buffer</button>&nbsp;
		  		</td>
		  		<td>
		  			<button id="close" type="button" class="btn btn-primary"  onclick="redirectToDataEntry();">Close</button>&nbsp;
		  		</td>
		  		<td style="padding-left: 450px;">
		  			<h3 style="color: white"><b>DFW Employee Grid</b></h3>
		  		</td>	
		  	</tr>
		  </table>
		  </div>
		<div id="section" class="filter_caption">
			<!-- <table id="example" class="table table-striped table-bordered" width="100%"> -->
			<table id="example" class="display table table-bordered" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		            	<th class="center" >SNo</th>
		            	<th class="center" style="display: none;">Employee Id</th>
		                <th class="center" >Employee Name</th>
		                <th class="center" >GPF/CPS No</th>
		                <th class="center" >Gender</th>
		                <th class="center" >Designation</th>
		                <th class="center" >Pay band</th>
		                <th class="center" >Group</th>
		                <th class="center" >Duty Pay</th>
		                <th class="center" >Recruited by</th>
		                <th class="center" >Grade pay</th>
		                <th class="center" >Community</th>
		                <th class="center" >Date of Birth</th>
		               <!--  <th class="center">Qualification</th> -->
		                <th class="center" >First Appointment Post</th>
		                <th class="center"  >First Appointment DOJ</th>
		                <th class="center" >Regularisation</th>
		                <th class="center" >Probation Decleration</th>
		                <th class="center" >Retirement</th>
		                <th class="center" >Increment Due Month</th>
		               <!--  <th class="center">Recent Promotion</th>
		                <th class="center">Recent Promotion - DOJ</th> -->
		                <th class="center" >Punishments</th>
		                <th class="center" >Nominee Submitted </th>
		            </tr>
		        </thead>
		        <tbody>
		        <%
		        	List<DFWEmployeeForm> employeeDetailsList =null;
					if(request.getAttribute("employeeDetailsList")!=null){
						employeeDetailsList =(List<DFWEmployeeForm>)request.getAttribute("employeeDetailsList");
						for(DFWEmployeeForm employeeDetails:employeeDetailsList){
							String dateOfRegularisation=employeeDetails.getDateOfRegularisation();
							String dateOfProbationDecleration=employeeDetails.getDateOfProbationDecleration();
							String dateOfRetirement=employeeDetails.getDateOfRetirement();%>
							 <tr>
							 	<td></td>
							 	<td style="display: none;"><%=employeeDetails.getEmployeeId() %></td>
				                <td><%=employeeDetails.getEmployeeName() %></td>
				                <td><%=employeeDetails.getGpfOrCpsNo() %></td>
				                <td><%=employeeDetails.getGender() %></td>
				                <td><%=employeeDetails.getDesignation() %></td>
				                <td><%=employeeDetails.getPayBand() %></td>
				                <td><%=employeeDetails.getGroupCategory() %></td>
				                <td><%=employeeDetails.getDutyPay() %></td>
				                <td><%=employeeDetails.getRecruitedBy() %></td>
				                <td><%=employeeDetails.getGradePay() %></td>
				                <td><%=employeeDetails.getCommunity() %></td>
				                <td><%=employeeDetails.getDobDate() %></td>
				                <%-- <td><%=employeeDetails.getQualification() %></td> --%>
				                <td><%=employeeDetails.getFirstAppointmentPost() %></td>
				                <td><%=employeeDetails.getFirstAppointmentDOJ() %></td>
				                
				                <%if(dateOfRegularisation!=null){%>
				                	<td><%=employeeDetails.getDateOfRegularisation() %></td>
				                <%}else{%>
				                	<td></td>
				                <%}%>
				                
				                <% if(dateOfProbationDecleration!=null){%>
				                	<td><%=employeeDetails.getDateOfProbationDecleration() %></td>
				                <%}else{%>
				                	<td></td>
				                <%}%>	
				                
				                <%if(dateOfRetirement!=null){%>
				                	<td><%=employeeDetails.getDateOfRetirement() %></td>
				                <%}else{%>
				                	<td></td>
				                <%}%>
				                <td><%=employeeDetails.getIncrementDueMonth() %></td>
				                <td><%=employeeDetails.getPunishments() %></td>
				                <td><%=employeeDetails.getNomineeDetails() %></td>
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
        //"scrollY": 500,
        //"sScrollY": "500px",
        "scrollX": "200%",
        "order": [[ 1, 'asc' ]],
        "bAutoWidth": false, // Disable the auto width calculation 
           "aoColumns": [
          { "sWidth": "1%" }, // SNO column width 
          { "sWidth": "1%" }, 
          { "sWidth": "6%" }, // EmployeeName column width
          { "sWidth": "5%" }, // GpfOrCpsNo column width
          { "sWidth": "1%" }, // Gender column width
          { "sWidth": "12%" }, // Designation column width
          { "sWidth": "5%" }, // PayBand column width
          { "sWidth": "2%" }, // GroupCategory column width
          { "sWidth": "4%" }, // DutyPay() column width
          { "sWidth": "7%" }, // RecruitedBy column width
          { "sWidth": "4%" }, // GradePay column width
          { "sWidth": "3%" }, // Community column width
          { "sWidth": "5%" }, // DOB Date column width
          { "sWidth": "7%" }, // First Appointment post column width
          { "sWidth": "7%" }, // First Appointment DOJ column width
          { "sWidth": "5%" }, // Date of regularisation column width
          { "sWidth": "6%" }, // DateOfProbationDecleration column width
          { "sWidth": "4%" }, // DateOfRetirement column width
          { "sWidth": "6%" }, // IncrementDueMonth column width
          { "sWidth": "5%" }, // Punishments column width
          { "sWidth": "20%" }, // Nominations column width          
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
    
    $('#add').click( function () {
    	var controllerUrl='dfwEmployeeAddForm.do';
    	openEmployeFormwindow('','',controllerUrl);
    
	} );
    
    $('#change').click( function () {
    	var selectedRow=dataTable.row('.selected').data();
    	 if (typeof selectedRow != 'undefined') {
    		var employeeId=selectedRow[1];
	    	var gpfOrCpsNo=selectedRow[3];
	    	var controllerUrl='dfwEmployeeChangeForm.do';
	    	openEmployeFormwindow(gpfOrCpsNo,employeeId,controllerUrl);
    	 }else{
    		 alert("Please select the employee details in grid");
    	 }	    
	} );
    
    $('#transfer').click( function () {
    	districtId = document.getElementById("districtId").value;
    	institutionId = document.getElementById("institutionId").value;
    	var selectedRow=dataTable.row('.selected').data();
    	 if (typeof selectedRow != 'undefined') {
    		var employeeId=selectedRow[1];
	    	var gpfOrCpsNo=selectedRow[3];
	    	var employeeName=selectedRow[2];
	    	var designation=selectedRow[5];
	    	var controllerUrl='dfwEmployeeTransferForm.do';
	    	var url = webUrl+controllerUrl+
			'?dirId=10'+
			'&employeeId='+employeeId+
			'&districtId='+districtId+
			'&institutionId='+institutionId+
			'&gpfOrCpsNo='+gpfOrCpsNo+
			'&employeeName='+employeeName+
			'&designation='+designation;
			window.open(url, null,
					"height=340,width=450,status=yes,toolbar=no,menubar=no,location=no");
	    	
    	 }else{
    		 alert("Please select the employee details in grid");
    	 }	    
	} );
    
    $('#buffer').click( function () {
    	districtId = document.getElementById("districtId").value;
    	institutionId = document.getElementById("institutionId").value;
	    	var url = hostName+contextPath+"/"+"dfwEmployeeTransferDetails.do"+
	    	'?dirId=10'+
	    	'&districtId='+districtId+
			'&institutionId='+institutionId;
			window.location.assign(url, null,
					"height=280,width=450,status=yes,toolbar=no,menubar=no,location=no");
	   	} ); 
});
    
	function openEmployeFormwindow(gpfOrCpsNo,employeeId,controllerUrl){
		districtId = document.getElementById("districtId").value;
		institutionId = document.getElementById("institutionId").value;
		var url = webUrl+controllerUrl+
		'?dirId=10'+
		'&employeeId='+employeeId+
		'&districtId='+districtId+
		'&institutionId='+institutionId+
		'&gpfOrCpsNo='+gpfOrCpsNo;
		window.open(url, null,
				"height=900,width=1400,status=yes,toolbar=no,menubar=no,location=no");
	}
	
	function redirectToDataEntry(){
		var contextPath='<%=request.getContextPath()%>';
		document.location.href=contextPath+'/dfwDataEntry.do';
	}
	
	<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath+"/";
	%>
	var webUrl='<%=webUrl%>';
	var contextPath='<%=contextPath%>';
	var hostName='<%=hostName%>';

</script>

</body>
</html>