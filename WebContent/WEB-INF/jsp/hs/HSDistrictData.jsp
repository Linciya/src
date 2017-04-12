<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
	</head>
	<style>
	body
		{
		    width:300px;
		    background-color: #f2f2f2;
		    height:300px;
		}
		
		@media screen and (min-width: 500px) {
		   body {
		      width:720px;
		   }
		}
		
		@media screen and (min-width: 800px) {
		   body {
		      width:1348px;
		   }
		}
	div#fixedheader {
			position:fixed;
			top:0px;
			left:0px;
			width:100%;
			color:white;
			background:#007297;
			font-size:20px;
			padding:20px;
		}
		
		tr:nth-child(even){
			color:black;
			background-color: #f2f2f2;
		}
		
		tr:nth-child(odd){
			color:black;
			background-color: #E9FFDB;
		}
		
		th, td {
		    text-align: left;
		    padding: 4px;
		} 
	</style>
	<body>
		<form name="hsDistrictData" id="hsDistrictData" method="POST" action="hsDashboardServlet">
		<div id="fixedheader">Health Secretary Dashboard</div>
		<input id="dashIndName"  type="hidden" name="dashIndName" value="<%= request.getAttribute("dashIndName") %>">
		<input id="year"  type="hidden" name="year" value="<%= request.getAttribute("year") %>">
		<input id="month"  type="hidden" name="month" value="<%= request.getAttribute("month") %>">
		<input id="districtData"  type="hidden" name="districtData">
		<!-- <div style="width:100%;height:100%;"> -->
		<div style="width:30%; float:left;padding-top:70px">
		<select id="districtList" name="districtList" onchange="doSubmit();">
			<option value="">----select----</option>
			<option value="All Districts">All Districts</option>
			<c:forEach items="${districtList}" var="district">
				<option value='<c:out value="${district}"/>'>${district}</option>
			</c:forEach>
		</select>
		</div>
		<label id="dataMsg"></label>
		<div id="distDataTable" style="padding-top:70px;width:100%;">
			
			<table cellpadding="1" >
				<tr ><th colspan="2" style="font-family:sans-serif;font-size:16px;background:#007297;color:white;">Indicator value</th></tr>
				<tr id ="projectTable"> </tr>
			</table> 
		</div>
		
		<%-- <div id="section" class="filter_caption">
			<table id="indicator" class="display table table-bordered" cellspacing="0" width="100%">
				<thead>
			    	<tr>
		            	<th class="center" >District/Institution Name</th>
		            	<th>Indicator Value</th>
		            </tr>
		            </thead>
		              <tbody>
			        <%
			        	var districtData=document.getElementById('districtData').value
								%>
								 <tr>
								 	<td><%=indicatorDetails.getDirectorateName() %></td>
					                <td><%=indicatorDetails.getIndicatorName() %></td>
					                </tr>
					                </tbody>
		            </table>
		            </div> --%>
		            
		
		<script>
		var form = $('#hsDistrictData');
		function doSubmit(){
			var sel = document.getElementById('districtList'),
		    myVar = sel.options[sel.selectedIndex].value;
			var districtName=myVar;
			var dashIndName=document.getElementById('dashIndName').value;
			var year=document.getElementById('year').value;
			var month=document.getElementById('month').value;
			var submitType="ViewAllData";
			if(districtName=="All Districts"){
				document.getElementById("dataMsg").innerHTML="Showing values for All Districts";
			}
			else{
				document.getElementById("dataMsg").innerHTML="Showing values for Institutions";
			}
			
			$.ajax({/*type:form.attr('method'),
				url: form.attr('action'),
				'data':  { 
					dashIndName:dashIndName,year:year,month:month,districtName:districtName,submitType:submitType
				}, */
				type: "POST",		
				//url: form.attr('action'),					
                contentType: "application/json; charset=utf-8", 
				url: "getInstitutionByDistrict.do?dashIndName="+dashIndName+"&year="+year+"&month="+month+"&districtName="+districtName,
				/* url: "getInstitutionByDistrict.do",
				data: { 
					dashIndName:dashIndName,year:year,month:month,districtName:districtName,submitType:submitType
				}, */
				success: function (output) {
					var gridData = JSON.parse(output);	
					document.getElementById('districtData').value=gridData;
					/*  var title = '<tr><th style="float:right;background:#007297;color:white;" colspan="2">'+ "Value of "+ districtName +'</th></tr>'  */
					$('#projectTable').empty();
					 /* $("#projectTable").append(title);  */
					/*  $("#projectTable").append('<br>'); */
					 for(var i=0;i<gridData.length;i++){
						   var inserRow='<tr><td onclick=""> '+gridData[i].label+' </td><td> '+gridData[i].value+'</td></tr><br>'
						   $("#projectTable").append(inserRow);			  
					     /*   $("#projectTable").append('<tr style="height:10%;"><td>&nbsp;</td></tr>'); */
					      }  
			   	    },
			    error: function () {
			    $("#errorMessage").text("Save Error");				    
		    }});				
		}
		
		</script>
		
		</form>
	</body>
</html>