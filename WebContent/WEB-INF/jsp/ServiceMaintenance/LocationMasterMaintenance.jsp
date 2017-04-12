<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.ShdrcConstants"%>
<%@page import="gov.shdrc.servicemaintenance.util.LocationMaster"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
		<title>Location Maintenance</title>
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
		<form name="locationMaintenance" method="POST" action="locationMasterServlet" id="locationMaintenance" class="form-inline">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
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
			  			<button id="refresh" type="button" class="btn btn-primary" onclick="doRefresh();">Refresh</button>&nbsp;
			  		</td>
			  		<td>
			  			<button id="close" type="button" class="btn btn-primary"  onclick="doClose('<%=request.getContextPath()%>');">Close</button>&nbsp;
			  		</td>
			  		<td style="padding-left: 450px;">
			  			<h3 style="color: white"><b>Location Maintenance</b></h3>
			  		</td>	
			  	</tr>
			</table>
			</div>	
			<div id="section" class="filter_caption">
			<table id="location" class="display table table-bordered" cellspacing="0" width="100%">
				<thead>
			    	<tr>
		            	<th class="center" >SNo</th>
		            	<th class="center" style="display: none;">Location Id</th>
		                <th class="center" >HUD Type</th>
		                <th class="center" >Block Name</th>
		                <th class="center" >Taluk Name</th>
		                <!-- <th class="center" >Added On</th>
		                <th class="center" >Updated On</th> -->
		                <!-- <th class="center" >Active</th>  -->
			        </tr>
			    </thead>
			    <tbody>
			        <%
			        	List<LocationMaster> locationDetailsList =null;
						if(request.getAttribute("locationDetailsList")!=null){
							locationDetailsList =(List<LocationMaster>)request.getAttribute("locationDetailsList");
							for(LocationMaster locationDetails:locationDetailsList){
								String talukName=locationDetails.getTalukName();
								%>
								 <tr>
								 	<td></td>
								 	<td style="display: none;"><%=locationDetails.getLocationId() %></td>
					                <td><%=locationDetails.getHudType() %></td>
					                <td><%=locationDetails.getBlockName() %></td>
					                 <%if(talukName!=null){%>
				                		<td><%=locationDetails.getTalukName() %></td>
				                	<%}else{%>
				                		<td></td>
				               		<%}%>					                
					                <%-- <td class="center" ><%=locationDetails.getAddedOn() %></td>
					                <td class="center" ><%=locationDetails.getUpdatedOn() %></td> 
					                 <td class="center" ><%=locationDetails.getActive() %></td> --%>
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
		    dataTable = $('#location').DataTable({
		        "scrollX": "100%",
		        "order": [[ 1, 'asc' ]],
		        "bAutoWidth": false, // Disable the auto width calculation 
		           "aoColumns": [
		          { "sWidth": "1%" }, // SNO column width 
		          { "sWidth": "1%" },
		          { "sWidth": "7%" }, //Hud Type column width
		          { "sWidth": "6%" }, // Block Name column width
		          { "sWidth": "3%" }, // Taluk Name column width
		          /* { "sWidth": "3%" }, // AddedOn column width
		          { "sWidth": "3%" }, // UpdatedOn column width */
		        //  { "sWidth": "1%" }, // Active column width
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
		    
		    $('#location tbody').on( 'click', 'tr', function () {
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
		    	var controllerUrl = 'LocationMasterAdd.do';
		    	openDirectoratewindow('','',controllerUrl);
		    
			} );
		    
		    $('#change').click( function () {
		    	var controllerUrl = 'LocationMasterChange.do';
		    	var selectedRow=dataTable.row('.selected').data();
		    	 if (typeof selectedRow != 'undefined') {
		    		 var locationId=selectedRow[1];
		    		 var directorateId=document.getElementById('directorateId').value;
			    	openDirectoratewindow(locationId,directorateId,controllerUrl);
		    	 }else{
		    		 alert("Please select the Location details in grid");
		    	 }		    
			} );
		});
		
		function openDirectoratewindow(locationId,directorateId,controllerUrl){
			var directorateId=document.getElementById('directorateId').value;
			var url = webUrl+controllerUrl+
			'?locationId='+locationId+
			'&directorateId='+directorateId;
			window.location.assign(url, null,
					"height=320,width=600,status=yes,toolbar=no,menubar=no,location=no");
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
		