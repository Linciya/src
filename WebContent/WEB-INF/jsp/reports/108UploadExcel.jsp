<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="gov.shdrc.util.CommonStringList"%>
    <%@page import="java.util.List"%>
    <%@page import=" gov.shdrc.dataentry.fileupload.File"%>
    <%@page import="gov.shdrc.util.UserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.dropDown{
	width: 200px;
}
.tableclass{
	background-color: #E8DAF1;
	padding: 4px;
}
.ui-datepicker-trigger {
       margin-left:5px;
       margin-top: 1px;
       margin-bottom: -1px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
<script src="js/script.js"></script>
<!-- Bootstrap -->
<%
String userTier=UserInfo.getUserTier();
%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <script type="text/javascript">
 var contextPath= '<%=request.getContextPath()%>';
 function onLoad(){
 }
function doClose(){
	var fileName = document.getElementById("uploadFile").textContent;
	//var contextPath= '<%=request.getContextPath()%>';
	if(fileName!=""){
		var formFlag = confirm("Do you really want to cancel the selected file ' "+fileName+" '?");
		if(formFlag){
			document.location.href=contextPath+'/'+'shdrcHome.do';
		}	
	}else{
		document.location.href=contextPath+'/'+'shdrcHome.do';
	}		
}

function getFileExtension(fileName){
	var dot = fileName.lastIndexOf(".");
    return fileName.substring(dot + 1);
}
function isValidFile(fileExtension){
	if(fileExtension=='xls' || fileExtension=='xlsx' || fileExtension=='csv')
		return true;
	return false;
}

</script>
<style type="text/css">
.fileUpload {
	position: relative;
	overflow: hidden;
	margin-bottom: 7px;
	margin-top: 2px;
}
.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.divClass{
background-color: #F0F6FF;
 height: 755px;
}
</style>
</head>
<body onload="onLoad();resizeTo();">
<form id="fileUpload"  name="fileUpload" action='uploadExcelFile.do' method="POST" enctype="multipart/form-data">
<input type="hidden" id="fileName" name="fileName" value='<%=request.getAttribute("fileName")%>'/>
 <input type="hidden" id="submitType" name="submitType"/> 
<input type="hidden" id="directorateId" name="directorateId"/>
<input id="currentHours"  type="hidden" name="currentHours" value="<%= request.getAttribute("currentHours") %>"/>

<div style="background: #F0F6FF;width: 100%;height: 100%;margin-left: 200px;margin-top: 10px;margin-bottom: 10px;" >
	 <div style="float: left; width: 69.5%;background: #E9FFDB;">	
		<div id="upload" style="border:solid 2px #007297;border-radius: 25px;height:500px; margin: 0px;">
		<div style="padding-left:210px;padding-top: 10px;" >
			<label style="font:16px arial;font-weight:bold;padding-left:10px;">Instructions to upload the file</label></br>
						<p style="font:14px arial;line-height: 25px;padding-left:10px;">1.Select the Directorate Name<label id="lblInstruction1"></label><label id="lblInstruction2"></label></br>
						2.Select the Frequency of the data</br>
						3.Click on Browse Button and it displays the Screen to Browse the Files.</br>
						4.Select the file & click on Open to upload.</br>
						5.Click on Submit button and Popup message gets open with ok /cancel button.</br>
						6.Click on Ok button,the file status message will be displayed as 
						"The file has been uploaded successfully".</br>
						7.Click on Close button,the page will be redirected to home page.</p>
		</div>
	 <div style="padding-left:210px;">
			<div id="successMessage" style="color:green">${successMessage}</div>
			<div id="errorMessage" style="color:red">${errorMessage}</div> 
		</div>
		<div style="padding-left:210px;">
			<table border="0">
				<tr>
					<td height=50px; style="font:16px arial;font-weight:bold;">
						<b>Directorate</b>&nbsp;&nbsp;
					</td>
					<td>:</td>
					<td width="250px;"><div class="col-lg-5">
						<select id="directorateName" name="directorateId"  class="dropDown">
							<option  value="">--Select-- </option>
							 <c:forEach var="directorate" items="${directorateList}">
							     <option  value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
							 </c:forEach>
						</select></div>
					</td>
					
					<td  height=50px; style="font:16px arial;font-weight:bold;">		
						<b>Frequency</b>&nbsp;&nbsp;
					</td>
					<td>:</td>
					<td colspan="5" width="250px;">&nbsp;&nbsp;	
						<select name="timePeriod" id="timePeriod" size="1" class="dropDown" onchange="enableFields();changeFrquency();">
							
							<c:forEach var="freuency" items="${freuencyList}">
							     <option value='<c:out value="${freuency.id}"/>'>${freuency.name} </option>
							 </c:forEach>
							 <option value='5'>Yearly</option>
						</select>
					</td>
				</tr>
				
				<tr>
				<td  width="50px;" style="font:16px arial;font-weight:bold;">	
						<b><label id="lblDate">Date</label>
						&nbsp;
					</td>
					<td>:</td>
					<td><input id="currentDate"  type="text" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/></td>
			   </tr>
			
			
			</table>
			</div>
			<div style="padding-left:470px;padding-top: 20px;">
				<table border="0">
					<tr >
						<td width=90px; style="font:16px arial;font-weight:bold;padding-top:6px;"><b>Input File</b>&nbsp;&nbsp;</td>
						<td>:</td>
						<td width=500px; style="padding-top:6px;" colspan="4">&nbsp;&nbsp;&nbsp;
							<div class="fileUpload btn btn-primary">
				    			<span>Browse</span>
				    			<input id="uploadBtn" type="file" name="file" class="upload"/>
							</div>
							<label id="uploadFile"  name="uploadFile"></label>
						</td>
					</tr>
					<tr>
						<td width=90px; colspan="1"></td>
						<td></td>
						<td width=500px; style="padding-top:6px;" colspan="4">&nbsp;&nbsp;&nbsp;
							<button id="submitBtn" type="button" class="btn btn-primary" onclick="doUpload();">Submit</button>&nbsp;&nbsp;
							<%if(!"T4".equalsIgnoreCase(userTier)){ %>
							<button id="close" type="button" class="btn btn-primary" onclick="doClose();">Close</button>	&nbsp;&nbsp;
							<%} %>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>	 
</form>
  <script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
<script src="bootstrap/js/bootstrap.min.js"></script>
  <script>
  var form = $('#fileUpload');
  document.getElementById("uploadBtn").onchange = function () {
	  var strFileName = new String(this.value);
	  var fileName;
	  var fileNameIndex = strFileName.lastIndexOf("\\");
	  if(fileNameIndex!=-1)
	 	fileName = strFileName.substring(fileNameIndex + 1);
	  else
		  fileName =strFileName;
	  
	  var fileExtension = getFileExtension(fileName);
	  if(isValidFile(fileExtension)){
		  document.getElementById("uploadFile").textContent = fileName;
	      document.getElementById("submitType").value="";
	  }else{
		  alert("Please select the 'xls or xlsx or csv' file");
	  }	  
  };
   function clearMessage(){
		$("#errorMessage").text("");
	  	$("#successMessage").text("");
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