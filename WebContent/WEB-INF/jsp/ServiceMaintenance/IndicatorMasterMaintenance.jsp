<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.ShdrcConstants"%>
<%@page import="gov.shdrc.servicemaintenance.util.IndicatorMaster"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
		<title>Indicator Maintenance</title>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="datatables/css/jquery.dataTables.css" rel="stylesheet">
	    <link href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
	    <link href="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet">
	    
	    <style type="text/css">
	    	#table th {
			    background-color: yellow;
			}
	    </style>
	    
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
	<body >
	<jsp:include page="MenuLinks.jsp"/>	
		<form name="indicatorMaintenance" method="POST" action="indicatorMasterServlet" id="indicatorMaintenance" class="form-inline">
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
			  		<td style="padding-left: 300px;">
			  			<h3 style="color: white"><b>Indicator Maintenance</b></h3>
			  		</td>	
			  		<td width="490px;" align="right">
			  			<!-- <button id="backButton" type="button" class="btn btn-primary" title="Go to previous page" onclick="goToPrevious();">Back</button>&nbsp; -->
			  		</td>
			  	</tr>
			</table>
			</div>	
			<div id="section" class="filter_caption">
			<table id="indicator" class="display table table-bordered" cellspacing="0" width="100%">
				<thead>
			    	<tr>
		            	<th class="center" >SNo</th>
		            	<th style="display: none;">Indicator Id</th>
		            	<th style="display: none;">Directorate Id</th>
		            	<th>Directorate Name</th>
		                <th>Indicator Name</th>
		                <th>Indicator Classification</th>
		                <th>Indicator Category</th>
		                <th >Indicator SubCategory</th>
		                <th>Indicator SubSubCategory</th>
		                <th>Indicator Level</th>
		                <th>Indicator FactMap</th>
		                <th>Indicator Frequency</th>
		                <th>Indicator Calculation</th>
		                <th>Mode of Source</th>
		                <th>Indicator Hierarchy</th>
		               <!--  <th class="center" >Added On</th>
		                <th class="center" >Updated On</th> -->
			        </tr>
			    </thead>
			    <tbody>
			        <%
			        	List<IndicatorMaster> indicatorDetailsList =null;
						if(request.getAttribute("indicatorDetailsList")!=null){
							indicatorDetailsList =(List<IndicatorMaster>)request.getAttribute("indicatorDetailsList");
							for(IndicatorMaster indicatorDetails:indicatorDetailsList){
								String indicatorSubSubCategory=indicatorDetails.getIndicatorSubSubCategory();
								String indicatorHierarchy=indicatorDetails.getIndicatorHierarchy();
								%>
								 <tr>
								 	<td></td>
								 	<td style="display: none;"><%=indicatorDetails.getIndicatorId() %></td>
								 	<td style="display: none;"><%=indicatorDetails.getDirectorateId() %></td>
								 	<td><%=indicatorDetails.getDirectorateName() %></td>
					                <td><%=indicatorDetails.getIndicatorName() %></td>
					                <td><%=indicatorDetails.getIndicatorClassification() %></td>
					                <td><%=indicatorDetails.getIndicatorCategory() %></td>
					                <td><%=indicatorDetails.getIndicatorSubCategory() %></td>
					                <%if(indicatorSubSubCategory!=null){%>
				                		<td><%=indicatorDetails.getIndicatorSubSubCategory() %></td>
				                	<%}else{%>
				                		<td></td>
				               		<%}%>					                
					                <td><%=indicatorDetails.getIndicatorLevel() %></td>
					                <td><%=indicatorDetails.getIndicatorFactMap() %></td>
					                <td><%=indicatorDetails.getIndicatorFreq() %></td>
					                <td><%=indicatorDetails.getIndicatorCalc() %></td>
					                <td><%=indicatorDetails.getModeOfSource() %></td>
					                 <%if(indicatorHierarchy!=null){%>
				                		 <td><%=indicatorDetails.getIndicatorHierarchy() %></td>
				                	<%}else{%>
				                		<td></td>
				               		<%}%>						               
					                <%-- <td><%=indicatorDetails.getAddedOn() %></td>
					                <td><%=indicatorDetails.getUpdatedOn() %></td> --%>
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
		    dataTable = $('#indicator').DataTable({
		        "scrollX": "100%",
		        "order": [[ 1, 'asc' ]],
		        "bAutoWidth": true/* , // Disable the auto width calculation 
		           "aoColumns": [
		          { "sWidth": "1%" }, // SNO column width 
		          { "sWidth": "1%" },
		          { "sWidth": "1%" },
		          { "sWidth": "3%" }, //Directorate Name column width
		          { "sWidth": "10%"}, //Indicator Name column width
		          { "sWidth": "1%" }, // Indicator Classification column width
		          { "sWidth": "2%" }, // Indicator Category column width
		          { "sWidth": "2%" }, // Indicator SubCategory column width
		          { "sWidth": "1%" }, // Indicator SubSubCategory column width
		          { "sWidth": "1%" }, // Indicator Level column width
		          { "sWidth": "1%" }, // Indicator Fact Map column width
		          { "sWidth": "1%" }, // Indicator Frequency column width
		          { "sWidth": "1%" }, // Indicator Calculation column width
		          { "sWidth": "1%" }, // Indicator Data Entry column width
		          { "sWidth": "1%" }, // Indicator Hierarchy column width
		       /*    { "sWidth": "3%" }, // AddedOn column width
		          { "sWidth": "3%" }, // UpdatedOn column width		         
		          ]		     */
		    });
		    
		    $(window).bind('resize', function () {
		    	dataTable.fnAdjustColumnSizing();
		      } );
		    
		    dataTable.on( 'order.dt search.dt', function () {
		    	dataTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		            cell.innerHTML = i+1;
		        } );
		    } ).draw();
		    
		    $('#indicator tbody').on( 'click', 'tr', function () {
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
		    	var controllerUrl='IndicatorMasterAdd.do';
		    	var directorateId = document.getElementById('directorateId').value;
		    	openDirectoratewindow('',directorateId,'add',controllerUrl);
		    
			} ); 
		    
		    $('#change').click( function () {
		    	var controllerUrl='IndicatorMasterChange.do';
		    	var selectedRow=dataTable.row('.selected').data();
		    	 if (typeof selectedRow != 'undefined') {
		    		 var indicatorId=selectedRow[1];
		    		 var directorateId=selectedRow[2];
		    	openDirectoratewindow(indicatorId,directorateId,'change',controllerUrl);
		    	 }else{
		    		 alert("Please select the Indicator details in grid");
		    	 }		    
			} );
		});
		
		function openDirectoratewindow(indicatorId,directorateId,submitType,controllerUrl){
			var url = webUrl+controllerUrl+
			'?indicatorId='+indicatorId+
			'&directorateId='+directorateId+
			'&submitType='+submitType;
			window.location.assign(url, null,
					"height=700,width=670,status=yes,toolbar=no,menubar=no,location=no");
		}
		
		function doRefresh(){
			location.reload();	
		}
		
		function goToPrevious(){
			window.history.back();
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
		