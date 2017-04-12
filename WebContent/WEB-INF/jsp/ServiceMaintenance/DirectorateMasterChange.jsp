<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modify Directorate</title>
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
          </style>
	</head>
	
	<body onload="onLoad();">
		<jsp:include page="MenuLinks.jsp"/>
		<form name="changeDirectorate" method="POST" action="directorateMasterServlet" id="changeDirectorate" class="form-inline">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
			<div id="home" class="tab-pane fade in active" align="center" style= "padding-top:10px;">
			<div style="width:40%;height:240%;background:#E9FFDB;border: solid 3px #007297; border-radius: 15px;">
			<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
			<!-- <input id="directorateActive"  type="hidden" name="directorateActive"/>  -->
			<input id="submitType"  type="hidden" name="submitType"/>
			<table border="0">
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
			        	<label style="font:22px arial;font-weight:bold;">
		       			<font color="white">Modify Directorate</font>
	      				</label>
     			    </td>	 
				</tr>
				<tr>
					<td align="left" class="required rowstyle" width="210px;" style="padding-top:30px;">
			        	<b>Directorate Name</b>
					</td>
					<td  style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<input type="text" id="directorateName" name="directorateName" size="16" title="Name of the Directorate" value="<%= request.getAttribute("directorateName") %>"/>
					</td>
				</tr>
				<tr>
					<td align="left" width="210px;" class="required rowstyle">
						<b>Directorate Level</b>
					</td>
					<td style="width: 350px;padding-left: 30px;padding-top:15px;background:#E9FFDB;">
						<select name="directorateLevel" id="directorateLevel" size="1" class="dropDown" title="Level of the Directorate">
							<option value="">--Select--</option>
							<option value="State">State</option>
							<option value="District">District</option>
						</select>
					</td>
				</tr>
				<!-- <tr>
					<td align="left" width="210px;" style="font:16px arial;font-weight:bold;padding-top:15px;padding-left: 20px;border-right: blue 1px solid;">
			        	<b>Active</b>
					</td>
					<td style="width: 350px;padding-left: 20px;padding-top:15px;">
						<c:choose>
		                    <c:when test="${directorateActive==1}">
		                    	<input type="checkbox" id="active" name="active" value="${directorateActive}" checked="checked"/>
		                    </c:when>
		                    <c:otherwise>
		                    	<input type="checkbox" id="active" name="active" value="${directorateActive}"/>
		                    </c:otherwise>
	                    </c:choose>
					</td>
				</tr>  -->
				<tr>
					<td width=160px; style="background:#E9FFDB;" ></td>
					<td width=140px; style="padding-top:25px; padding-left:15px;background:#E9FFDB;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="style-btn" style="background: #007297;color: white" title="Modify the Directorate details" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
						<button id="close" type="button" class="style-btn" style="background: #007297;color: white" title="Close Change Directorate page" value="Close" onclick="doClose();">Close</button>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			</div>
			</div>
		</form>
		
		<script>
		
			function onLoad(){
				var directorateLevel = document.getElementById('directorateLevel');
				var selectedDirectorateLevel='<%= request.getAttribute("directorateLevel")%>';
				for (var i = 0; i < directorateLevel.length; i++) {
				    if (directorateLevel.options[i].value == selectedDirectorateLevel) {
				    	directorateLevel.selectedIndex = i;
				        break;  
				    }
				}
			}
 
			function doSubmit(){
				var form = $('#changeDirectorate');
				var directorateName = document.getElementById("directorateName").value;	
				var directorateLevel=document.getElementById("directorateLevel").value;
				// var active = document.getElementById("active").checked;
				var regEx = /^[A-Za-z][-a-zA-Z ]+$/;
				formFlag=true;
				
				if(directorateName == ""){
					alert('Please enter the Name of the Directorate you want to add');
					document.getElementById('directorateName').focus();
					return false;
				}
				else if(!regEx.test(directorateName)){					
					alert('Directorate Name should only contain characters');
					document.getElementById('directorateName').focus();
					return false;					
				}
				if(directorateLevel == ""){
					alert('Please choose the level of the Directorate');
					document.getElementById('directorateLevel').focus();
					return false;
				}
				/* if(active){
					document.getElementById("directorateActive").value=1;
				}
				else{
					document.getElementById("directorateActive").value=0;
				} */
				
				if(formFlag){
					formFlag = confirm("Do you really want to change the Directorate details?");
					   if(formFlag){
						   document.getElementById('submit').disabled=true;
							$.ajax({type: "POST",
								url: 'DirectorateMasterChangeOnSubmit.do',
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
			
			function doClose(){
				window.location.assign(webUrl);
			}
			
			<% String requestURL=request.getRequestURL().toString();
			String contextPath=request.getContextPath();
			int urlIndex = requestURL.lastIndexOf(contextPath);
			String hostName=requestURL.substring(0,urlIndex);
			String webUrl =hostName+contextPath+"/"+"DirectorateMasterMaintenance.do";
			%>
			var webUrl='<%=webUrl%>';
			
		</script>
	
	</body>
</html>