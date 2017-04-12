<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.ShdrcConstants"%>
<%@page import="gov.shdrc.servicemaintenance.util.GeneralMaster"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
		<title>General Master Maintenance</title>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="datatables/css/jquery.dataTables.css" rel="stylesheet">
	    <link href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
	    <link href="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet">
	    
	    <script src="js/script.js"></script>
	    <link rel="stylesheet" href="ServiceMaintenance/menulinks/bootstrap.min.css">
		  <link rel="stylesheet" href="ServiceMaintenance/menulinks/menulinks.css">
		  <script src="ServiceMaintenance/menulinks/jquery.min.js"></script>
		  <script src="ServiceMaintenance/menulinks/bootstrap.min.js"></script>
		  <!--   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
		  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
		  <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		<script type="text/javascript">
		</script>	
	</head>
	<body>
		<jsp:include page="MenuLinks.jsp"/>	
		<form name="generalMaintenance" method="POST" action="generalMasterServlet" id="generalMaintenance" class="form-inline">
			<div style="border: solid 3px #007297">
			<div id="search" class="tab-pane fade in active" style="background:  #007297;padding-top: 8px;padding-left: 8px;">
			<table border="0">
				<tr>
			  		<!-- <td>
			  			<button id="add" type="button" class="btn btn-primary">Add</button>&nbsp;
			  		</td>
			  		<td>
			  			<button id="change" type="button" class="btn btn-primary">Change</button>&nbsp;
			  		</td> -->
			  		<td>
			  			<button id="refresh" type="button" class="btn btn-primary" onclick="doRefresh();">Refresh</button>&nbsp;
			  		</td>
			  		<td>
			  			<button id="close" type="button" class="btn btn-primary"  onclick="doClose('<%=request.getContextPath()%>');">Close</button>&nbsp;
			  		</td>
			  		<td style="padding-left: 450px;">
			  			<h3 style="color: white"><b>General Maintenance</b></h3>
			  		</td>	
			  	</tr>
			</table>
			</div>	
			<div id="section" class="filter_caption">
			<table id="general" class="display table table-bordered" cellspacing="0" width="100%">
				<thead>
			    	<tr>
		            	<th class="center" >SNo</th>
		            	<th style="display: none;">General Id</th>
		            	<th style="display: none;">Directorate Id</th>
		            	<th>Directorate Name</th>
		                <th>General Name</th>
		                <th>General Type</th>
		                <th>General Classification</th>
		                <th>General Category</th>
		                <th >General SubCategory</th>
		                <th>General SubSubCategory</th>
		                <th class="center" >Added On</th>
		                <th class="center" >Updated On</th>
			        </tr>
			    </thead>
			    <tbody>
			        <%
			        	List<GeneralMaster> generalDetailsList =null;
						if(request.getAttribute("generalDetailsList")!=null){
							generalDetailsList =(List<GeneralMaster>)request.getAttribute("generalDetailsList");
							for(GeneralMaster generalDetails:generalDetailsList){
								String generalClassification=generalDetails.getGeneralClassification();
								String generalSubCategory=generalDetails.getGeneralSubCategory();
								String generalSubSubCategory=generalDetails.getGeneralSubSubCategory();
								%>
								 <tr>
								 	<td></td>
								 	<td style="display: none;"><%=generalDetails.getGeneralId() %></td>
								 	<td style="display: none;"><%=generalDetails.getDirectorateId() %></td>
								 	<td><%=generalDetails.getDirectorateName() %></td>
					                <td><%=generalDetails.getGeneralName() %></td>
					                <td><%=generalDetails.getGeneralType() %></td>
					                 <%if(generalClassification!=null){%>
				                		  <td><%=generalDetails.getGeneralClassification() %></td>
				                	<%}else{%>
				                		<td></td>
				               		<%}%>					               
					                <td><%=generalDetails.getGeneralCategory() %></td>
					                <%if(generalSubCategory!=null){%>
				                		  <td><%=generalDetails.getGeneralSubCategory() %></td>
				                	<%}else{%>
				                		<td></td>
				               		<%}%>						                
					                <%if(generalSubSubCategory!=null){%>
				                		   <td><%=generalDetails.getGeneralSubSubCategory() %></td>
				                	<%}else{%>
				                		<td></td>
				               		<%}%>						               
					                <td><%=generalDetails.getAddedOn() %></td>
					                <td><%=generalDetails.getUpdatedOn() %></td>
					             </tr>
					        <%}
						}%>
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
		    dataTable = $('#general').DataTable({
		        "scrollX": "100%",
		        "order": [[ 1, 'asc' ]],
		        "bAutoWidth": false, // Disable the auto width calculation 
		           "aoColumns": [
		          { "sWidth": "1%" }, // SNO column width 
		          { "sWidth": "1%" },
		          { "sWidth": "1%" },
		          { "sWidth": "3%" }, //Directorate Name column width
		          { "sWidth": "10%" }, //General Name column width
		          { "sWidth": "2%" }, //General Type column width
		          { "sWidth": "2%" }, // General Classification column width
		          { "sWidth": "2%" }, // General Category column width
		          { "sWidth": "2%" }, // General SubCategory column width
		          { "sWidth": "2%" }, // General SubSubCategory column width
		          { "sWidth": "3%" }, // AddedOn column width
		          { "sWidth": "3%" }, // UpdatedOn column width		         
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
		    
		    $('#general tbody').on( 'click', 'tr', function () {
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
		    	var controllerUrl='GeneralMasterAdd.do'
		    	openDirectoratewindow('','',controllerUrl);
		    
			} );
		    
		    $('#change').click( function () {
		    	var controllerUrl='GeneralMasterChange.do'
		    	var selectedRow=dataTable.row('.selected').data();
		    	 if (typeof selectedRow != 'undefined') {
		    		 var generalId=selectedRow[1];
		    		 var directorateId=selectedRow[2];
		    	openDirectoratewindow(generalId,directorateId,controllerUrl);
		    	 }else{
		    		 alert("Please select the General details in grid");
		    	 }		    
			} );
		});
		
		function openDirectoratewindow(generalId,directorateId,submitType){
			var url = webUrl+controllerUrl+
			'?generalId='+generalId+
			'&directorateId='+directorateId+
			'&submitType='+submitType;
			window.open(url, null,
					"height=700,width=630,status=yes,toolbar=no,menubar=no,location=no");
		}
		
		function doRefresh(){
			location.reload();	
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
		