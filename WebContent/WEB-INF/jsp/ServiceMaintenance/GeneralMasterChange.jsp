<%@page import="gov.shdrc.servicemaintenance.util.GeneralMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modify General</title>
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
		<style type="text/css"> 
		h2{
		  font: normal normal normal 20px/1 Helvetica, arial, sans-serif;
		  font-weight:bold;
		  border-bottom: 2px solid #000;
		  background:#008000;
		  color:#fff;
		
		  display:inline-block;
		  padding:3px 15px;
		  margin-left:14px;
		}
		h2:after{ /* the line under H2 */
		  left:100px;
		  display:block;
		  position:absolute;
		  width:30%;
		  height:3px;
		  margin-top:8px;
		  content: " ";
		  background:#000;
		}
     </style>
	</head>
	
	<body onload="onLoad();">
	<jsp:include page="MenuLinks.jsp"/>
		<form name="changeGeneral" method="POST" action="GeneralMasterChangeOnSubmit.do" id="changeGeneral" class="form-inline">
		<div id="home" class="tab-pane fade in active" style="height: 800px;padding-top: 30px;padding-left: 30px;">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
		<input id="indicatorId"  type="hidden" name="indicatorId" value="<%= request.getAttribute("indicatorId") %>"/>
		<input id="prevServlet"  type="hidden" name="prevServlet" value="<%= request.getAttribute("prevServlet") %>"/>
		<input id="indicatorName"  type="hidden" name="indicatorName" value="<%= request.getAttribute("indicatorName") %>"/>
		<input id="prevSubmitType"  type="hidden" name="prevSubmitType" value="<%= request.getAttribute("prevSubmitType") %>"/>
		<input id="submitType"  type="hidden" name="submitType"/>
		<div class="container" style="width:95%;border: solid 3px #007297;border-radius: 15px;">
		<table>
			<tr >
				<td style="background:#FFFFCC;">
					<h2>GENERAL DETAILS</h2><img src="images/general.png" width="35" height="40"/>    	
				</td>
				<td width="930px;" align="right" style="background:#FFFFCC;padding-right: 70px;padding-top: 10px;">
					<button id="gridButton" type="button" class="style-grid-btn" title="Show Indicator details grid" onclick="showGrid();">Indicator Grid</button>
				</td>
			</tr>
		</table>
		 	<ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297;background: #BDEDFF">
				    <li ><a data-toggle="tab" href="#home">Indicator Basic Details <img src="images/indic.jpg" width="35" height="35"/></a></li>
				     <li ><a data-toggle="tab" href="#menu1">Dashboard Threshold  <img src="images/performance-indicator.jpg" width="35" height="35"/></a></li>
				    <li ><a data-toggle="tab" href="#menu2">Indicator Calculation <img src="images/calculator.png" width="35" height="35"/></a></li>
				    <li class="active"><a data-toggle="tab" href="#menu3">General Details <img src="images/general.jpg" width="35" height="35"/></a></li>
				    <li><a data-toggle="tab" style="font-weight:bold;" href="#menu4">Indicator Summary <img src="images/summary.gif" width="35" height="35"/></a></li>
			  </ul>
			  <div class="tab-content">
			  	<div id="home" class="tab-pane fade in active" style="height: 590px;background:#E9FFDB;padding-top: 8px;padding-left: 8px;">
			<table align="center" border="0">
				<tr>
					<td width=1140px; height=30px; colspan="2" align="center" style="background:#C6E2FF;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Directorate : <%= request.getAttribute("directorateName") %></font>
	      				</label>
	      			</td>
				</tr>
				<tr>
					<td width=1350px; height=30px; colspan="2" align="center" style="background:#C6E2FF;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Indicator Name : <%= request.getAttribute("indicatorName") %></font>
	      				</label>
	      			</td>
	      			
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>General Category</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="generalCategory" name="generalCategory" size="16" title="Enter the General Category of the Indicator (Eg:HR)" value="${generalDetails.generalCategory}"/>
					</td>	
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>General Type</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<select id="type" name="type" class="dropDown" title="Select the General Type of the Indicator (Eg:Speciality/Administrative staff)" onchange="changeType();">
							 <option value="">--Select--</option>
							  <option value=others>Others</option>
							 <c:forEach var="type" items="${typeList}">
							     <option value='<c:out value="${type.name}"/>'>${type.name} </option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>Other Type</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="otherType" name="otherType" size="16" title="Enter the new General Type of Indicator that is not available in the above dropdown" />
					</td>
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>General Name</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="generalName" name="generalName" size="16" title="Enter the General Name (Eg:Physiotherapist,ECG Technician,Radiographer for General Type-Speciality)" value="${generalDetails.generalName}"/>
					</td>
				</tr>				
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>General SubCategory</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="subCategory" name="subCategory" size="16" title="Enter the General SubCategory (Eg:'HR')" value="${generalDetails.generalSubCategory}"/>
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>General SubSubCategory</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="subSubCategory" name="subSubCategory" size="16" title="Enter the General SubSubCategory (Eg:'HR')" value="${generalDetails.generalSubSubCategory}"/>
					</td>
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>General Classification</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="classification" name="classification" size="16" title="Enter the General Classification (Eg:Posts)" value="${generalDetails.generalClassification}"/>
					</td>
				</tr>
				<tr>
					<td style="background:#E9FFDB;" width=300px; ></td>
					<td width=300px; style="padding-top:15px; padding-bottom:15px;background:#E9FFDB;">&nbsp;&nbsp;&nbsp;
						<button id="submitbtn" type="button" class="style-btn" style="background: #007297;color: white" title="Proceed to next page" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
						<button id="back" type="button" class="style-btn" style="background: #007297;color: white" title="Go back to previous page" onclick="goBack();">Back</button>&nbsp;
						<button id="close" type="button" class="style-btn" style="background: #007297;color: white" title="Close change Indicator page" onclick="doClose();">Close</button>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			</div>
			</div>
			</div>
			</div>
		</form>
		
		<script type="text/javascript">
		var form = $('#changeGeneral');
		
		function onLoad(){
			<%
			GeneralMaster generalDetails =null;
			if(request.getAttribute("generalDetails")!=null)
				generalDetails =(GeneralMaster)request.getAttribute("generalDetails");
	        %>

	        <%if(generalDetails!=null){%>
				var generalType = document.getElementById('type');
				var selectedGeneralType ='<%= generalDetails.getGeneralType()%>';
				for (var i = 0; i < generalType.length; i++) {
				    if (generalType.options[i].value == selectedGeneralType) {
				    	generalType.selectedIndex = i;
				        break;  
				    }
				}
			<%}%>
		
			document.getElementById('otherType').disabled=true;
		}
	  	
		function changeType(){
	  		var e2 = document.getElementById("type");
			type= e2.options[e2.selectedIndex].value;
			if(type=='others')
				document.getElementById('otherType').disabled=false;
			else
				document.getElementById('otherType').disabled=true;
		}
		
		function doClose(){
			formFlag=true;
			var directorateId=document.getElementById('directorateId').value;
			formFlag=confirm("Do you really want to close");
			if(formFlag){
			window.location.assign("\IndicatorMasterMaintenance.do?directorateId="+directorateId);
			}
			return false;
		}
		
		function goBack() {
			var prevServlet=document.getElementById("prevServlet").value;
			var directorateId=document.getElementById("directorateId").value;
			var indicatorId=document.getElementById("indicatorId").value;
			var indicatorName=document.getElementById("indicatorName").value;
			var url = webUrl+"/"+prevServlet;						
			var submitType="change";
			var prevSubmitType="change";
			window.location.assign(url+
					'?submitType='+submitType+
					'&indicatorId='+indicatorId+
					'&indicatorName='+indicatorName+
					'&directorateId='+directorateId+
					'&prevSubmitType='+prevSubmitType);
		}
		
		   function doSubmit(){
				document.getElementById("submitType").value='change';

				var generalCategory="";
				var type="";
				var otherType="";
				var generalName="";
				var subCategory="";
				var subSubCategory="";
				var classification="";
				
				var generalCategory = document.getElementById("generalCategory").value;
				var e2 = document.getElementById("type");
				if (e2 != 'undefined') {
					type= e2.options[e2.selectedIndex].value;
				   }
				var otherType = document.getElementById("otherType").value;
				var generalName = document.getElementById("generalName").value;
				var subCategory = document.getElementById("subCategory").value;
				var subSubCategory = document.getElementById("subSubCategory").value;
				var classification = document.getElementById("classification").value;
				var csrfToken=document.getElementById('CSRF_TOKEN').value;
				var directorateId=document.getElementById('directorateId').value;
				var indicatorId=document.getElementById('indicatorId').value;
				var prevSubmitType=document.getElementById('prevSubmitType').value;
				var prevServlet=document.getElementById('prevServlet').value;
				
				formFlag=true;
				
				if(generalCategory == ""){
					alert('Please Enter the General Category of the Indicator you want to add');
					document.getElementById('generalCategory').focus();
					return false;
				}	
				if(type == ""){
					alert('Please select the General Type');
					document.getElementById('type').focus();
					return false;
				}
				else if(type=='others'){
					if(otherType == ""){
						alert('Please Enter the General Type');
						document.getElementById('otherType').focus();
						return false;
					}
				}
				if(generalName == ""){
					alert('Please Enter the General Name');
					document.getElementById('generalName').focus();
					return false;
				}	
				if(subCategory == ""){
					alert('Please enter General SubCategory of the Indicator');
					document.getElementById('subCategory').focus();
					return false;
				}	
				if(subSubCategory == ""){
					alert('Please enter General Sub Sub Category of the Indicator');
					document.getElementById('subSubCategory').focus();
					return false;
				}	
				if(classification == ""){
					alert('Please choose the Classification of the Indicator');
					document.getElementById('classification').focus();
					return false;
				}			
				
				if(formFlag){
					formFlag = confirm("Do you really want to change the General details?");
					   if(formFlag){
						 document.getElementById('submitbtn').disabled=true; 						
						   document.changeGeneral.submit(); 
						/*  $.ajax({type: form.attr('method'),
								url: form.attr('action'),
								'data':  { 
									submitType:'change',directorateId:directorateId,indicatorId:indicatorId,generalCategory:generalCategory,
									type:type,otherType:otherType,generalName:generalName,subCategory:subCategory,subSubCategory:subSubCategory,
									classification:classification,CSRF_TOKEN:csrfToken,prevSubmitType:prevSubmitType,prevServlet:prevServlet
									},
								    success: function (result) {
								    	alert(result);
								    	window.location.assign("\indicatorMasterServlet?directorateId="+directorateId);
								      },
								      error: function () {
								    	  $("#errorMessage").text("Save Error");
								      }});  */
				      }
			    }
				return false;
			}  
		
			<% String requestURL=request.getRequestURL().toString();
					String contextPath=request.getContextPath();
					int urlIndex = requestURL.lastIndexOf(contextPath);
					String hostName=requestURL.substring(0,urlIndex);
					String webUrl =hostName+contextPath;
					%>
				var webUrl='<%=webUrl%>';
	  
		
		</script>
		<script src="js/commonHandsontable.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>