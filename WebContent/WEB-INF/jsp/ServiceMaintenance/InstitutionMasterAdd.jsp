<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add Institution</title>
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
		<style type="text/css"> </style>
	</head>
	
	<body>
	<jsp:include page="MenuLinks.jsp"/>	
		<form name="addInstitution" method="POST" action="locationMasterServlet" id="addLocation" class="form-inline">
		<div id="home" class="tab-pane fade in active" style="padding-top: 50px;padding-left: 400px;">
		<div style="width:540px;border: solid 3px #007297">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
		<input id="submitType"  type="hidden" name="submitType"/>
			<table border="0">
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
			        	<label style="font:22px arial;font-weight:bold;">
		       			<font color="white">Add Institution</font>
	      				</label>
     			    </td>	 
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
						<b>Directorate</b>&nbsp;&nbsp;
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<select id="directorateName" name="directorateName" class="dropDown" title="Select the name of the Directorate" onchange="changeHudName();">
							<option value="">--Select--</option>
							 <c:forEach var="directorate" items="${directorateList}">
							     <option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>District</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<select id="districtName" name="districtName" class="dropDown" title="Select the name of the District">
							<option value="">--Select--</option>
				 			<c:forEach var="district" items="${districts}">
				    	 		<option value='<c:out value="${district.id}"/>'>${district.name} </option>
				 			</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;">
			        	<b>HUD Name</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<select id="hudName" name="hudName" class="dropDown" title="Select the name of the HUD" onchange="changeBlockName();">
							<option value="">--Select--</option>
				 			<c:forEach var="hud" items="${hudList}">
				    			<option value='<c:out value="${hud.id}"/>'>${hud.name} </option>
				 			</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>Block Name</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<select id="blockName" name="blockName" class="dropDown" title="Select the name of the Location">
							<option value="">--Select--</option>
				 			<c:forEach var="location" items="${LocationList}">
				    			<option value='<c:out value="${location.id}"/>'>${location.name} </option>
				 			</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>Institution Name</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="institutionName" name="institutionName" size="16" title="Enter the name of the Institution you want to add" />
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>Institution Level</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="institutionLevel" name="institutionLevel" size="16" title="Enter the level of Institution (Eg:HQRS/Taluk/Non-Taluk)" />
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>Institution Speciality</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="institutionSpeciality" name="institutionSpeciality" size="16" title="Enter the speciality of Institution" />
					</td>
				</tr>
				<tr>
					<td align="left" class="rowstyle" width="210px;">
			        	<b>Institution Type</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="institutionType" name="institutionType" size="16" title="Enter the Type of Institution (Eg:NGO/Govt./Private)" />
					</td>
				</tr>
				<tr>
					<td width=140px; style="background:#E9FFDB;" ></td>
					<td width=140px; style="padding-top:15px; padding-bottom:15px;background:#E9FFDB;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="btn btn-primary" title="Add new Institution" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
						<button id="close" type="button" class="btn btn-primary" title="close Add Institution page" value="Close" onclick="doClose();">Close</button>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			</div>
			</div>
		</form>
		
		<script>
		function doSubmit(){
			var form = $('#addInstitution');
			//document.getElementById("submitType").value='add';
			var directorateId;
		   	var e1 = document.getElementById("directorateName");
			   if (e1 != 'undefined') {
				   directorateId = e1.options[e1.selectedIndex].value;
				   directorate = e1.options[e1.selectedIndex].text;
			   }	
			var districtId;
			var districtName="";
			var e2 = document.getElementById("districtName");
			   if (e2 != 'undefined') {
					districtId = e2.options[e2.selectedIndex].value;
					districtName= e2.options[e2.selectedIndex].text;
			   }	
			   var hudId;
				var hudName="";
				var e3 = document.getElementById("hudName");
				   if (e3 != 'undefined') {
					   hudId = e3.options[e3.selectedIndex].value;
					   hudName= e3.options[e3.selectedIndex].text;
				   }
			var institutionName = document.getElementById("institutionName").value;
			var talukName = document.getElementById("talukName").value;	
			var blockName = document.getElementById("blockName").value;	
			
			var regEx = /^[A-Za-z][-a-zA-Z ]+$/;
			formFlag=true;
			
			if(directorateId == ""){
				alert('Please select the Directorate Name to add the Location');
				document.getElementById('directorateName').focus();
				return false;
			}
			if(districtId == ""){
				alert('Please select the District Name to add the Location');
				document.getElementById('districtName').focus();
				return false;
			}
			if(hudId == ""){
				alert('Please select the Name of the HUD');
				document.getElementById('hudName').focus();
				return false;
			}
			if(talukName == ""){
				alert('Please enter the name of the Taluk you want to add');
				document.getElementById('talukName').focus();
				return false;
			}
			if(institutionName == ""){
				alert('Please enter the name of the institution you want to add');
				document.getElementById('institutionName').focus();
				return false;
			}
			else if(!regEx.test(talukName)){					
					alert('Taluk Name should only contain characters');
					document.getElementById('talukName').focus();
					return false;					
			}
			if(blockName == ""){
				alert('Please enter the name of the Block you want to add');
				document.getElementById('blockName').focus();
				return false;
			}
			else if(!regEx.test(blockName)){					
					alert('Block Name should only contain characters');
					document.getElementById('blockName').focus();
					return false;					
			}			
			
			if(formFlag){
				formFlag = confirm("Do you really want to add the Location?");
				   if(formFlag){
					   document.getElementById('submit').disabled=true;
						$.ajax({type: "POST",
							url: 'InstitutionMasterAddOnSubmit.do',
							'data':  form.serialize(),
							    success: function (result) {
							    	alert(result);
							    	var directorateId=document.getElementById('directorateId').value;
									window.location.assign(webUrl);
							      },
							      error: function () {
							    	  $("#errorMessage").text("Save Error");
							      }});
			      }
		    }
			return false;
		}
		
		function changeHudName(){
			var form = $('#addInstitution');
			var e1 = document.getElementById("directorateName");
			var directorateId = e1.options[e1.selectedIndex].value;
			$.ajax({type: form.attr('method'),
				url: form.attr('action'),
				'data':  { 
					submitType: 'directorateChange',directorateId:directorateId
				    },
				    success: function (result) {
				    	var jsonData = JSON.parse(result);
				    	var $select = $('#hudName');                           
			               $select.find('option').remove();  
			               $('<option>').val("").text("--Select--").appendTo($select);
			               $.each(jsonData, function(idx, obj) { 
			                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
			                    });
				        	
				      },
				      error: function () {
				    	  $errorMessage.text("Onchange Error");
				      }});			
		}
		
		function doClose(){
			formFlag=true;
			var directorateId=document.getElementById('directorateId').value;
			formFlag=confirm("Do you really want to close");
			if(formFlag){
			window.location.assign(webUrl);
			}
			return false;
		}
		
		<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath+"/"+"InstitutionMasterMaintenance.do";
		%>
		var webUrl='<%=webUrl%>';
		</script>
	</body>
</html>