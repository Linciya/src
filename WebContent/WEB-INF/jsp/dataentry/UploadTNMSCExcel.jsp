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
		document.getElementById('uploadBtn').disabled=true;
		var directorate = document.getElementById("directorateName");
		var directorateId = directorate.options[1].value;
		
		if(directorateId!=3 &&  directorateId!=8 && directorateId!=10 && directorateId!=6 && directorateId!=16 && directorateId!=7){
			document.getElementById('lblFileName').style.display = "inline";
			document.getElementById('fileNameDropDown').style.display = "inline";
		}
		/* enableHierarchyDropdown(directorateId); */
			
		getCalender();
		document.getElementById('month').disabled=true;
		document.getElementById('year').disabled=true;
		document.getElementById('week').style.display = "none";
		document.getElementById('lblWeek').style.display = "none";
		document.getElementById('quarter').style.display = "none";
		document.getElementById('lblQuarter').style.display = "none";
		
		/* if(directorateId==6){		
			var blockName = document.getElementById('hierarchyName2');
			blockName.options[blockName.selectedIndex].text="All";   
			blockName.options[blockName.selectedIndex].value=-99; 
		} */
 }
 
 function isAllowFileUpload(){
	 var directorateId = document.getElementById('directorateName').value;;
	 if(directorateId==""){
		 alert("Please select the Directorate");
		 return false;
	 }	 
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

function doUpload(){
	  var fileName = document.getElementById("uploadFile").textContent;
	  var directorateId = document.getElementById('directorateName').value;
	  document.getElementById('directorateId').value=directorateId;
	/*   document.getElementById("submitType").value='upload'; */
	  var frequency = document.getElementById('timePeriod').value;
	  var fileExtension = getFileExtension(fileName);
	  /* var hierarchyDropdown1 = document.getElementById('hierarchyName1');
	  var hierarchyDropdown1Name=hierarchyDropdown1.options[hierarchyDropdown1.selectedIndex].text;
	  var hierarchyDropdown2 = document.getElementById('hierarchyName2');
	  var hierarchyDropdown2Name=hierarchyDropdown2.options[hierarchyDropdown2.selectedIndex].text; */
	  var fileNameDistrict=fileName.substring(fileName.lastIndexOf("_")+1,fileName.indexOf("."));
	  
		if(validateMadatoryFields(directorateId,frequency,fileName,fileExtension)){ 
			if(directorateId==3||directorateId==6||directorateId==8||directorateId==10||directorateId==16||directorateId==7){
				  var timePeriod =document.getElementById('timePeriod');
				  var frequency=timePeriod.options[timePeriod.selectedIndex].text;
				    var fileNameDropDown = document.getElementById("fileNameDropDown");
				    var selectedDropdownFileName="";
				    var selectedIndex=fileNameDropDown.options[fileNameDropDown.selectedIndex];
				  if (typeof fileNameDropDown != 'undefined' && typeof selectedIndex != 'undefined') {
					  selectedDropdownFileName= selectedIndex.text;
		   		  }
				  if(!validateSelectedFile(fileName,selectedDropdownFileName)){
					  alert("Please select valid input file for " +frequency+" frequency");
				  	  return false;
				  }
				 /*  if(directorateId==10){
					  if(!validateDFWFile(directorateId,fileName)){
					  	  return false;
					  }
				  } */
				/*   //To validate the corresponding district file is uploaded for the district selected in Dropdown
				   if(directorateId==6 || directorateId==16){
					   var hierarchyDropdown2UpperName;
					   if(directorateId==6){
						   hierarchyDropdown2UpperName=hierarchyDropdown1Name;
					   }else{
						   hierarchyDropdown2UpperName=hierarchyDropdown2Name.toUpperCase();  
					   }
					  if(hierarchyDropdown2UpperName!=fileNameDistrict){
					  alert("Upload respective district file for the District chosen");
					  return false;
				  }
				 		  } */
			}
				  var formFlag = confirm("Do you really want to upload the selected file?");
				  if(formFlag){
					  document.fileUpload.submit();  
				  }else{
					  doDelete();
			}
	}		
}

function validateSelectedFile(fileName,selectedDropdownFileName){
	if(fileName==selectedDropdownFileName){
		return true;
	}
	return false;
}

/* function validateDFWFile(directorateId,fileName){
	var hierarchyName1 = document.getElementById('hierarchyName1');
	var districtName = hierarchyName1.options[hierarchyName1.selectedIndex].text;
	var districtId = hierarchyName1.options[hierarchyName1.selectedIndex].value;
	if(directorateId==10 && districtId!=-99 && fileName=='Annual Expected Level of Demand.xlsx'){
		alert("You cant not upload "+fileName+" file for "+districtName+" district.Please contact System Administrator!..");
		return false;
	}
	return true;
} */

function validateMadatoryFields(directorateId,frequency,fileName,fileExtension){
	var searchDate = document.getElementById('date').value;
	var e5 = document.getElementById('timePeriod');
	var frequency = e5.options[e5.selectedIndex].text;
	var e6 = document.getElementById('week');
	var week = e6.options[e6.selectedIndex].text;
	var e7 = document.getElementById('quarter');
	var quarter = e7.options[e7.selectedIndex].text;
	var month = document.getElementById('month').value;
	var year = document.getElementById('year').value;
	
	if(directorateId==""){
		  alert("Please select the Directorate");
		  return false;
	  }
	  if(frequency==""){
		  alert("Please select the frequency");
		  return false;
	  }if(fileName==""){
		  alert("Please select the uploaded file");
		  return false;
	  }if(!isValidFile(fileExtension)){
		  alert("Please select the 'xls or xlsx or csv' file");
		  return false;
	  }
	
	if(frequency=='Daily'){
		if(searchDate==""){
			alert("Please Select Date");
			return false;
		}
		week="";
		quarter="";
	}else if(frequency=='Weekly'){
		if(week =="" && month=="" && year==""){
			alert("Please Select Week,Month,Year");
			return false;
		}
		if(week !="" && month=="" && year==""){
			alert("Please Select Month & Year");
			return false;
		}
		if(week =="" && month!="" && year==""){
			alert("Please Select Week & Year");
			return false;
		}
		if(week =="" && month=="" && year!=""){
			alert("Please Select Week & Month");
			return false;
		}
		if(week !="" && month=="" && year!=""){
			alert("Please Select Month");
			return false;
		}
		if(week !="" && month!="" && year==""){
			alert("Please Select Year");
			return false;
		}
		if(!validateMonthAndYear())
			return false;
		quarter="";
	}else if (frequency=='Monthly'){
		if(month=="" && year==""){
			alert("Please Select Month & Year");
			return false;
		}
		if(month!="" && year==""){
			alert("Please Select Year");
			return false;
		}
		if(month=="" && year!=""){
			alert("Please Select Month");
			return false;
		}
		if(!validateMonthAndYear())
			return false;
		week="";
		quarter="";
	}else if (frequency=='Quarterly'){
		if(quarter=="" && year==""){
			alert("Please Select Quarter & Year");
			return false;
		}
		if(quarter!="" && year==""){
			alert("Please Select Year");
			return false;
		}
		if(quarter=="" && year!=""){
			alert("Please Select Quarter");
			return false;
		}
		week="";
		month="";
	}else if(frequency=='Yearly'){
		if(year==""){
			alert("Please Select Year");
			return false;
		}
		if(!validateYear())
			return false;
		week="";
		quarter="";
		month="";
		
	}
	return true;
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
function getFileNameWithoutExtention(fileName){
	var dot = fileName.lastIndexOf(".");
	return fileName.substring(0,dot);
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
<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>

<div style="background: #F0F6FF;width: 100%;height: 100%;" >
	 <div style="float: left; width: 69.5%;background: #E9FFDB;">	
		<div id="upload" style="border:solid 2px #007297;border-radius: 25px;height:755px; margin: 0px;">
		<div style="padding-left:210px;padding-top: 10px;" >
			<label style="font:16px arial;font-weight:bold;padding-left:10px;">Instructions to upload the file</label></br>
						<p style="font:14px arial;line-height: 25px;padding-left:10px;">1.Select the Directorate Name</br>
						2.Select the Frequency and file name</br>
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
						<select id="directorateName" name="directorateId"  class="dropDown"  onchange="changeDirectorate();">
							<option  value="">--Select-- </option>
							 <c:forEach var="directorate" items="${directorateList}">
							     <option  value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
							 </c:forEach>
						</select></div>
					</td>
					<td  width="50px;" style="font:16px arial;font-weight:bold;">	
						<b><label id="lblDate">Date</label><label id="lblWeek">Week</label></b>
						&nbsp;
					</td>
					<td>:</td>
					<td  colspan="3" width="200px;">&nbsp;&nbsp;		
						<input type="text" class="inputText" id="date" name="searchDate" readonly="true" onchange="compareDate();">
						<select name="week" id="week" size="1" class="dropDown" >
					     <c:forEach var="week" items="${weeksList}">
						     <option value='<c:out value="${week.id}"/>'>${week.name} </option>
						 </c:forEach>
						</select>
						&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td  height=50px; style="font:16px arial;font-weight:bold;">		
						<b>Frequency</b>&nbsp;&nbsp;
					</td>
					<td>:</td>
					<td width="250px;">&nbsp;&nbsp;	
						<select name="timePeriod" id="timePeriod" size="1" class="dropDown" onchange="enableFields();changeFrquency();">
							<option  value="">--Select-- </option>
							<c:forEach var="freuency" items="${freuencyList}">
							     <option value='<c:out value="${freuency.id}"/>'>${freuency.name} </option>
							 </c:forEach>
							 <option value='5'>Yearly</option>
						</select>
					</td>
					<td  width="50px;" style="font:16px arial;font-weight:bold;">
						<b><label id="lblMonth">Month</label><label id="lblQuarter">Quarter</label></b>
					</td>
					<td>:</td>
					<td  colspan="3" width="200px;">&nbsp;&nbsp;	
						<select name="month" id="month" class="dropDown" size="1">
							<option value="">--Select--</option>
						    <c:forEach var="month" items="${monthsList}">
						     	<option value='<c:out value="${month.name}"/>'>${month.name} </option>
						 	</c:forEach>
						</select>
						
						<select name="quarter" id="quarter" size="1" class="dropDown" >
					     <c:forEach var="quarter" items="${quarterList}">
						     <option value='<c:out value="${quarter.id}"/>'>${quarter.name} </option>
						 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td  height=50px; style="font:16px arial;font-weight:bold;">		
						<b><label id="lblFileName">File Name</label></b>&nbsp;&nbsp;
					</td>
					<td>:</td>
					<td width="250px;"><div class="col-lg-5">	
						<select name="fileNameDropDown" id="fileNameDropDown" class="dropDown" size="1">
						</select></div>
					</td>
					<td width="50px;" style="font:16px arial;font-weight:bold;">	
						<b>Year</b>
					</td>
					<td>:</td>
					<td width="250px;">	&nbsp;&nbsp;
						<select name="year" id="year"  class="dropDown" size="1" onchange="validateMonthAndYear();">
							<option value="">--Select--</option>
						     <c:forEach var="year" items="${yearList}">
							     <option value='<c:out value="${year}"/>'>${year} </option>
							 </c:forEach>
						</select>
					</td>
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
	<div style="float: right; width: 30%;background: #F0F8FF;">
		<div align="left" style="height:35px;border:solid 2px;background: linear-gradient(to bottom, #007297 49%,#005e7c 100%);border-top-left-radius:25px;border-top-right-radius: 25px;">
			<h4 style="padding-left:35px; color:white;"><b>Download Templates</b></h4>
		</div>
		<div style="border:solid 2px #007297;background: #E9FFDB;border-bottom-left-radius:25px;border-bottom-right-radius: 25px; padding-top:15px;padding-right:25px;padding-bottom:25px;width: 480px; height: 720px; overflow-x: hidden;overflow-y: auto;">
			<table height="670px;">
				<tr>
					<td valign="top">
			   			<%
						List<File> fileList=null;
						if(request.getAttribute("fileList")!=null){
							fileList=(List<File>)request.getAttribute("fileList");
						}
			   			if(fileList!=null){%>
			   				<p style="font-size: 14;font-weight:bold;padding-left:5px;color: #007297;font-family: sans-serif;">1.Daily</p>
			   				<% for(File file:fileList){
			   				   if("Daily".equalsIgnoreCase(file.getFrequency())){
			   					%> 	
			   				<p style="font-size: 12;color: #007297;font-family: sans-serif;padding-left:25px; padding-top: 7px;"><a id="linkId" href="<%=request.getContextPath()%>/fileDownload.do?fileName=<%=file.getFileName()%>&directorateId=<%=file.getDirectorateId()%>"><%=file.getFileName()%><img src="images/download.png" style="padding-left:7px;"></a></p>
			   				<%}}%>
			   				<p style="font-size: 14;font-weight:bold;padding-left:5px;color: #007297;font-family: sans-serif;">2.Monthly</p>
			   				<% for(File file:fileList){
			   				   if("Monthly".equalsIgnoreCase(file.getFrequency())){
			   					%> 	
			   				<p style="font-size: 12;color: #007297;font-family: sans-serif;padding-left:25px; padding-top: 7px;"><a id="linkId" href="<%=request.getContextPath()%>/fileDownload.do?fileName=<%=file.getFileName()%>&directorateId=<%=file.getDirectorateId()%>"><%=file.getFileName()%><img src="images/download.png" style="padding-left:7px;"></a></p>
			   				<%}}%>
			   				<p style="font-size: 14;font-weight:bold;padding-left:5px;color: #007297;font-family: sans-serif;">4.Quarterly</p>
			   				<% for(File file:fileList){
			   				   if("Quarterly".equalsIgnoreCase(file.getFrequency())){
			   					%> 	
			   				<p style="font-size: 12;color: #007297;font-family: sans-serif;padding-left:25px; padding-top: 7px;"><a id="linkId" href="<%=request.getContextPath()%>/fileDownload.do?fileName=<%=file.getFileName()%>&directorateId=<%=file.getDirectorateId()%>"><%=file.getFileName()%><img src="images/download.png" style="padding-left:7px;"></a></p>
			   				<%}}%>
			   				<p style="font-size: 14;font-weight:bold;padding-left:5px;color: #007297;font-family: sans-serif;">3.Yearly</p>
			   				<% for(File file:fileList){
			   				   if("Yearly".equalsIgnoreCase(file.getFrequency())){
			   					%> 	
			   				<p style="font-size: 12;color: #007297;font-family: sans-serif;padding-left:25px; padding-top: 7px;"><a id="linkId" href="<%=request.getContextPath()%>/fileDownload.do?fileName=<%=file.getFileName()%>&directorateId=<%=file.getDirectorateId()%>"><%=file.getFileName()%><img src="images/download.png" style="padding-left:7px;"></a></p>
			   				<%}}%>
			   				
			   			<%}%>
				   </td>
			   </tr>
			</table>
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
  
  function doDelete(){
		var fileName = document.getElementById("uploadFile").textContent;
		$.ajax({type:"POST",
			url: 'uploadExcelDelete.do',
			'data':  { 
				fileName:fileName
			    },
			    success: function (result) {
			      },
			      error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				    }});
	}
  
  function changeDirectorate(){
		 var directorateId = document.getElementById('directorateName').value;
		 document.getElementById("uploadFile").textContent ="";
		 clearMessage();
		 if(directorateId==""){
			 document.getElementById('uploadBtn').disabled=true;
			 document.getElementById('timePeriod').value="";
			 document.getElementById('fileNameDropDown').value="";		        
		 }
		 else if(directorateId!=3){
			 var contextPath='<%=request.getContextPath()%>';
			document.location.href=contextPath+'/uploadExcel.do';
		 }
		 /* else{
			 enableHierarchyDropdown(directorateId);
			 $.ajax({type: "POST",
					url:'uploadExcelChangeDirectorate.do',
					'data':  { 
						directorateId:directorateId
					    },
					    success: function (result) {
					    	var jsonData = JSON.parse(result);
					    	var $select = $('#hierarchyName1');                           
				               $select.find('option').remove();
				               var newOption = $('<option value="">--Select--</option>');
				               $select.append(newOption);
				               $select.trigger("chosen:updated");
				               
				               $.each(jsonData, function(idx, obj) { 
				                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
				                    });
					      },
					      error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				    }});
		 } */	 
	}
  
  /* function changeHierarchyDropdown1(){
		 var directorateId = document.getElementById('directorateName').value;
		 var hierarchyName1 = document.getElementById('hierarchyName1');
		 var hierarchyNameIndex=hierarchyName1.options[hierarchyName1.selectedIndex];
		 var hierarchyDropdown1Id = hierarchyNameIndex.value;
		 var hierarchyDropdown1Name = hierarchyNameIndex.text;
		 var corporationIndex = hierarchyDropdown1Name.indexOf("Corporation");
		 if(directorateId!=6 && corporationIndex==-1){
		 $.ajax({type:"POST",
				url: 'uploadExcelChangeHierarchyDropdown1.do',
				'data':  { 
					directorateId:directorateId,hierarchyDropdown1Id:hierarchyDropdown1Id,hierarchyDropdown1Name:hierarchyDropdown1Name
				    },
				    success: function (result) {
				    	var jsonData = JSON.parse(result);
				    	var $select = $('#hierarchyName2');                           
			               $select.find('option').remove();                          
			               $.each(jsonData, function(idx, obj) { 
			                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
			                    });
				      },
				      error: function () {
				      }});
		 }else{
			 $('#hierarchyName2').empty(); //remove all child nodes
		     var newOption = $('<option value="-99">All</option>');
		     $('#hierarchyName2').append(newOption);
		     $('#hierarchyName2').trigger("chosen:updated");
		 }		 
		 if(directorateId==7){
			 enableHierarchyDropdown(directorateId);
		 }
	} */
  
  function clearMessage(){
		$("#errorMessage").text("");
	  	$("#successMessage").text("");
	}
  
  function enableHierarchyDropdown(directorateId){
	/*   if(directorateId==3){
		 document.getElementById('hierarchyName2').textContent = "Institution";
		document.getElementById('lblHierarchy2').textContent = "Institution";
		document.getElementById('lblHierarchy1').textContent = "Warehouse Name";
		 document.getElementById('lblInstruction1').textContent = ",Warehouse Name";
		 var $select = $('#hierarchyName2');      
         $('<option>').val(-99).text("All").appendTo($select); 
		 	document.getElementById('hierarchyName2').style.display = "none";
			document.getElementById('lblHierarchy2').style.display = "none";
			document.getElementById('lblHierarchy1').style.display = "none";
			document.getElementById('hierarchyName1').style.display = "none";
		  }
	  else{
		    document.getElementById('hierarchyName2').style.display = "inline";
			document.getElementById('lblHierarchy2').style.display = "inline";
			document.getElementById('lblHierarchy1').style.display = "inline";
			document.getElementById('hierarchyName1').style.display = "inline"; */
	  		if(directorateId==10){
				document.getElementById('hierarchyName2').style.display = "none";
				document.getElementById('lblHierarchy2').style.display = "none";
				document.getElementById('lblHierarchy1').textContent = "District Name";
				document.getElementById('lblInstruction1').textContent = ",District Name";
		   }else if(directorateId==6){
			  document.getElementById('lblHierarchy1').textContent = "District Name";
			  document.getElementById('lblHierarchy2').textContent = "Block Name";
			  document.getElementById('lblInstruction1').textContent = ",District Name";
			  document.getElementById('lblInstruction2').textContent = ",Block Name";
		  }else if(directorateId==16){
			  document.getElementById('lblHierarchy1').textContent = "Lab Name";
			  document.getElementById('lblHierarchy2').textContent = "District Name";
			  document.getElementById('lblInstruction1').textContent = ",Lab Name";
			  document.getElementById('lblInstruction2').textContent = ",District Name";
		  }else if(directorateId==7){
			 	 document.getElementById('lblHierarchy1').textContent = "Region/Corporation";
			 	 document.getElementById('lblInstruction1').textContent = ",Region/Corporation";
			     var hierarchyName1 = document.getElementById('hierarchyName1');
				 var hierarchyNameIndex=hierarchyName1.options[hierarchyName1.selectedIndex];
				 var hierarchyDropdown1Name = hierarchyNameIndex.text;
				 var corporationIndex = hierarchyDropdown1Name.indexOf("Corporation");
				 if(corporationIndex==-1){
					 document.getElementById('lblHierarchy2').textContent = "Municipality";
					 document.getElementById('lblInstruction2').textContent = ",Municipality";
				 }else{
					 document.getElementById('lblHierarchy2').textContent = "Institution Name";
					 document.getElementById('lblInstruction2').textContent = ",Institution Name";
				 }			
		  }else{
			  document.getElementById('lblHierarchy1').textContent = "District Name";
			  document.getElementById('lblHierarchy2').textContent = "Institution Name";
			  document.getElementById('lblInstruction1').textContent = ",District Name";
			  document.getElementById('lblInstruction2').textContent = ",Institution Name";
		  }	  
  		}
	//}

  function changeFrquency(){
	  var frequencyElement = document.getElementById('timePeriod');
	  var frequency = frequencyElement.options[frequencyElement.selectedIndex].text;
	  var e1 = document.getElementById("directorateName");
	  var directorateId=""; 
	   if (e1 != 'undefined') {
			directorateId = e1.options[e1.selectedIndex].value;
			var directorateName= e1.options[e1.selectedIndex].text;
	   }
	   if(directorateId==""){
		   alert("Please select Directorate Name");
		   document.getElementById('timePeriod').value="";
		   return false;
	   }else{
		   document.getElementById('uploadBtn').disabled=false;
	   }
			var form = $('#fileUpload');
			$.ajax({type:"POST",
				url:'uploadExcelFrequencyChange.do',
				'data':  { 
					frequency:frequency,directorateId:directorateId
				    },
				    success: function (result) {
				    	var jsonData = JSON.parse(result);
				    	var $select = $('#fileNameDropDown');                           
			               $select.find('option').remove();                          
			               $.each(jsonData, function(idx, obj) { 
			                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
			                    });				        	
				      },
				      error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					    }});
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