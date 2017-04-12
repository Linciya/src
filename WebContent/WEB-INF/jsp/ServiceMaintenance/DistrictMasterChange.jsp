<%@page import="gov.shdrc.servicemaintenance.util.DistrictMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modify District</title>
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!--Loading Handsontable (full distribution that includes all dependencies apart from jQuery)-->
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css">
		
		<!--Loading demo dependencies. They are used here only to enhance the examples on this page-->
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css">
		<script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>
		<script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script>
		<link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
		
		<link rel="stylesheet" href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="js/script.js"></script>
		 <link rel="stylesheet" href="ServiceMaintenance/menulinks/bootstrap.min.css">
		  <link rel="stylesheet" href="ServiceMaintenance/menulinks/menulinks.css">
		  <script src="ServiceMaintenance/menulinks/jquery.min.js"></script>
		  <script src="ServiceMaintenance/menulinks/bootstrap.min.js"></script>
		  <!--   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
		  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
		  <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		<link rel="stylesheet" type="text/css" href="css/style.css"  />	
		<style type="text/css"></style>
	</head>
	
	<body onload="onLoad();">
		<jsp:include page="MenuLinks.jsp"/>	
		<form name="changeDistrict" method="POST" action="districtMasterServlet" id="changeDistrict" class="form-inline">
		<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>	
			<div id="home" class="tab-pane fade in active" style="padding-top: 30px;padding-left: 30px;">
			<div style="width:540px;border: solid 3px #007297">
			<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
			<!-- <input id="districtActive"  type="hidden" name="districtActive"/>  -->
			<input id="submitType"  type="hidden" name="submitType"/>
			<table border="0">
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
			        	<label style="font:22px arial;font-weight:bold;">
		       			<font color="white">Modify District</font>
	      				</label>
     			    </td>	 
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>District Name</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<input type="text" id="districtName" name="districtName" size="16" title="Enter the District name" value="${districtDetails.districtName}"/>
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>District HeadQuarters</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<input type="text" id="districtHeadQuarters" name="districtHeadQuarters" size="16" title="Enter the District HeadQuarters name" value="${districtDetails.districtHeadQuarters}"/>
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>State</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<select name="state" id="state" size="1" class="dropDown" title="Select State for the District added">
							<!-- <option value="">--Select--</option>  -->
							<option value="TamilNadu">TamilNadu</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" width="210px;" class="required rowstyle">
			        	<b>Year of Population Count</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">	
						<select name="year" id="year"  class="dropDown" size="1" title="Choose Year of Population count">
							<option value="">--Select--</option>
			    		    <c:forEach var="year" items="${yearList}">
				     			<option value='<c:out value="${year}"/>'>${year} </option>
				 			</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" width="210px;" class="required rowstyle">
			        	<b>Total Population</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<input type="text" id="population" name="population" size="16" title="Enter the District Population" value="${districtDetails.population}"/>
					</td>
				</tr>
				<!-- <tr>
					<td align="left" width="210px;" class="rowstyle">
			        	<b>Active</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<c:choose>
		                    <c:when test="${districtDetails.active==1}">
		                    	<input type="checkbox" id="active" name="active" checked="checked" value="${districtDetails.active}" />
		                    </c:when>
		                    <c:otherwise>
		                    	<input type="checkbox" id="active" name="active" value="${districtDetails.active}"/>
		                    </c:otherwise>
	                    </c:choose>
					</td>  
				</tr> -->
				<tr>
					<td width=140px; ></td>
					<td width=140px; style="padding-top:15px; padding-bottom:15px;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="btn btn-primary" title="submit" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
						<button id="close" type="button" class="btn btn-primary" title="close" value="Close" onclick="doClose();">Close</button>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			</div>
			</div>
		</form>
		
		<script>
		function onLoad(){
			<%
			DistrictMaster districtDetails =null;
			if(request.getAttribute("districtDetails")!=null)
				districtDetails =(DistrictMaster)request.getAttribute("districtDetails");
		%>
			var state = document.getElementById('state');
			var selectedState='<%= districtDetails.getState()%>';
			for (var i = 0; i < state.length; i++) {
			    if (state.options[i].value == selectedState) {
			    	state.selectedIndex = i;
			        break;  
			    }
			}	
			
			var year = document.getElementById('year');
			var selectedYear='<%= districtDetails.getYearOfPopulationCount()%>';
			for (var i = 0; i < year.length; i++) {
			    if (year.options[i].value == selectedYear) {
			    	year.selectedIndex = i;
			        break;  
			    }
			}
		}
		
		function doSubmit(){
			var form = $('#changeDistrict');
			//document.getElementById("submitType").value='change';
			var districtName = document.getElementById("districtName").value;	
			var year = document.getElementById("year").value;			
			var population=document.getElementById("population").value;
			// var active = document.getElementById("active").checked;
			var regEx = /^[A-Za-z][-a-zA-Z ]+$/;
			formFlag=true;
			
			if(districtName == ""){
				alert('Please enter the Name of the District you want to add');
				document.getElementById('districtName').focus();
				return false;
			}
			else if(!regEx.test(districtName)){					
					alert('District Name should only contain characters');
					document.getElementById('districtName').focus();
					return false;					
			}
			if(year == ""){
				alert('Please choose the Year of Population Count of the District');
				document.getElementById('year').focus();
				return false;
			}
			else if(!validateYear()){
				document.getElementById('year').focus();
				return false;
			}
			if(population == ""){
				alert('Please choose the Population of the District');
				document.getElementById('population').focus();
				return false;
			}
			else if(!isNumeric(population)){
				alert("Total Population should be numeric");
				document.getElementById('population').focus();
				return false;
			}
			/* if(active){
				document.getElementById("districtActive").value=1;
			}
			else{
				document.getElementById("districtActive").value=0;
			} */
			
			if(formFlag){
				formFlag = confirm("Do you really want to change the District details?");
				   if(formFlag){
					   document.getElementById('submit').disabled=true;
						$.ajax({type: "POST",
							url: 'DistrictMasterChangeOnSubmit.do',
							'data':  form.serialize(),
							    success: function (result) {
							    	alert(result);
							    	window.location.assign(webUrl);
							      },
							      error: function () {
							    	  $("#errorMessage").text("Save Error");
							      }});
			      }
		    }
			return false;
		}
		
		function isNumeric(value) {
	    	if (!value.toString().match(/^[-]?\d*\.?\d*$/)){
				return false;
			}
	    	return true;
		}
		
		function doClose(){
			window.location.assign(webUrl);
		}
		
		<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath+"/"+"DistrictMasterMaintenance.do";
		%>
		var webUrl='<%=webUrl%>';
		</script>
	</body>
</html>