<%@page import="gov.shdrc.servicemaintenance.util.HUDMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modify HUD</title>
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
	
	<body onload="load();">
		<jsp:include page="MenuLinks.jsp"/>	
		<form name="changeHud" method="POST" action="hudMasterServlet" id="changeHud" class="form-inline">	
		<div id="home" class="tab-pane fade in active" align="center" style="padding-top:10px;">
		<div style="width:40%;height:240%;background:#E9FFDB;border: solid 3px #007297; border-radius: 15px;">
			<input id="hudId"  type="hidden" name="hudId" value="<%= request.getAttribute("hudId") %>"/>
			<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
			<input id="submitType"  type="hidden" name="submitType"/>
			<table border="0">
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
			        	<label style="font:22px arial;font-weight:bold;">
		       			<font color="white">Modify HUD</font>
	      				</label>
     			    </td>	 
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
						<b>Directorate</b>&nbsp;&nbsp;
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<select id="directorateName" name="directorateName" class="dropDown" disabled="true" style="width:250px;">
							 <option value="">--Select--</option>
							 <c:forEach var="directorate" items="${directorateList}">
							     <option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>HUD Name</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<input type="text" id="hudName" name="hudName" size="16" title="Enter the HUD name" value="${hudDetails.hudName}"/>
					</td>
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>HUD Type</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<input type="text" id="hudType" name="hudType" size="16" title="Enter the Type of HUD" value="${hudDetails.hudType}" />
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>HUD Group</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<input type="text" id="hudGroup" name="hudGroup" size="16" title="Enter HUD Group" value="${hudDetails.hudGroup}"/>
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
		
		<%
		HUDMaster hudDetails =null;
		if(request.getAttribute("hudDetails")!=null)
			hudDetails =(HUDMaster)request.getAttribute("hudDetails");
		%>
		
		function load(){
			var directorateName = document.getElementById('directorateName');
			var selectedDirectorateName='<%= hudDetails.getDirectorateId()%>';
			for (var i = 0; i < directorateName.length; i++) {
			    if (directorateName.options[i].value == selectedDirectorateName) {
			    	directorateName.selectedIndex = i;
			        break;  
			    }
			}
		}
		
		
		function doSubmit(){
			var form = $('#changeHud');
			document.getElementById("submitType").value='change';
			var directorateId=document.getElementById("directorateId").value;
		  /*  	var e1 = document.getElementById("directorateName");
			   if (e1 != 'undefined') {
				   directorateId = e1.options[e1.selectedIndex].value;
				   directorate = e1.options[e1.selectedIndex].text;
			   } */	
			var hudName = document.getElementById("hudName").value;	
			var hudType = document.getElementById("hudType").value;	
			//var active = document.getElementById("active").checked;
			var regEx = /^[A-Za-z][-a-zA-Z ]+$/;
			formFlag=true;
			
			if(directorateId == ""){
				alert('Please choose the Directorate Name to change the HUD');
				document.getElementById('directorateName').focus();
				return false;
			}
			if(hudName == ""){
				alert('Please enter the Name of the HUD you want to change');
				document.getElementById('hudName').focus();
				return false;
			}
			else if(!regEx.test(hudName)){					
					alert('HUD Name should only contain characters');
					document.getElementById('hudName').focus();
					return false;					
			}
			if(hudType == ""){
				alert('Please enter the Type of the HUD you want to change');
				document.getElementById('hudType').focus();
				return false;
			}
			/* if(active){
				document.getElementById("hudActive").value=1;
			}
			else{
				document.getElementById("hudActive").value=0;
			} */
			
			if(formFlag){
				formFlag = confirm("Do you really want to change the HUD?");
				   if(formFlag){
					   $('#directorateName').prop('disabled', false);
					   document.getElementById('submit').disabled=true;
						$.ajax({type: "POST",
							url: 'HUDMasterChangeOnSubmit.do',
							'data':  form.serialize(),
							    success: function (result) {
							    	alert(result);
							    	window.location.assign("\HUDMasterMaintenance.do?directorateId="+directorateId);
							      },
							      error: function () {
							    	  $("#errorMessage").text("Save Error");
							      }});
			      }
		    }
			return false;
		}
		
		function doClose(){
			formFlag=true;
			var directorateId=document.getElementById('directorateId').value;
			formFlag=confirm("Do you really want to close");
			if(formFlag){
			window.location.assign("\HUDMasterMaintenance.do?directorateId="+directorateId);
			}
			return false;
		}
		
		<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath+"/"+"HUDMasterMaintenance.do";
		%>
		var webUrl='<%=webUrl%>';
		</script>
	</body>
</html>