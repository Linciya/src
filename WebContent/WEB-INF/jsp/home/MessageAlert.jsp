<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@page import="java.util.List"%>
           <%@ page import="gov.shdrc.util.UserInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>Alert Message</title>
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
		  <%
		  List<String> userRoleList = UserInfo.getUserRoleList(); 
		  boolean isAllDirectorate=UserInfo.isAllDirectorate(userRoleList); %>
		<script src="js/script.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />	
		<style type="text/css">
		.divClass{
			background-color: #F0F6FF;
			height: 755px;
		}          			
		</style>
	</head>
	
	<body onload="bdyOnLoad();">
		<form name="messageAlert" id="messageAlert" class="form-inline">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<input id="sendSms"  type="hidden" name="sendSms"/>
			
		<div id="submit1" class="myTableStyle">
		<table border="0" align="center" style="border: solid 3px #007297;">
			<tr>
				<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
		        	<label style="font:22px arial;font-weight:bold;">
	       			<font color="white">Alert Message</font>
      				</label>
    			    </td>	 
			</tr>
			<tr>
				<td align="left" class="required" width="150px;" style="font:16px arial;font-weight:bold;padding-top:15px;padding-left: 20px;border-right: blue 1px solid;">
		        	<b>Directorate</b>
				</td>
				<td style="width: 440px;padding-left: 20px;padding-top:15px;">
					<select id="directorateName" name="directorateName" class="dropDown" style="width:343px;" multiple size="5" title="Select required Directorate name">
						<%if(isAllDirectorate){%>
							<option value=-99>All</option>
						<%} %>
				 		<c:forEach var="directorate" items="${directorateList}">					 		
				     	<option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
						 </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left" width="140px;" style="font:16px arial;font-weight:bold;padding-top:15px;padding-left: 20px;border-right: blue 1px solid;"><b>Message Type</b></td>
				<td  style="width: 440px;padding-left: 20px;padding-top:15px;">
					<input type="radio" name="messageType" id="notificationMessageType" title="Notification" onclick="enableFields()" value="N" Checked />Notification
		            <input type="radio" name="messageType" id="newsMessageType" title="News" onclick="enableFields()" value="NS" />News
		        </td>
			</tr>
			<tr>
				<td align="left" width="140px;" style="font:16px arial;font-weight:bold;padding-top:15px;padding-left: 20px;border-right: blue 1px solid;">
					<b><label id="lblSMS">Send SMS</label></b><label id="lblNews" class="required"><b>News Header</b></label>
				</td>
				<td style="width: 440px;padding-left: 20px;padding-top:15px;">
					<input type="checkbox" name="sms" id="sms" title="Check to send SMS">
					<textarea name="newsHeader" id="newsHeader" rows="3" cols="40" title="Enter News Header"></textarea>
				</td>
			</tr>
			<tr>
				<td align="left" class="required" width="140px;" style="font:16px arial;font-weight:bold;padding-top:15px;padding-left: 20px;border-right: blue 1px solid;">
					<b>Message</b>
				</td>
				<td style="width: 440px;padding-left: 20px;padding-top:15px;">
					<textarea id="message" name="message" rows="5" cols="40" title="Enter the Message to publish"></textarea>
				</td>
			</tr>
			<tr>
				<td width=140px; ></td>
				<td width=140px; style="padding-top:15px; padding-bottom:15px;">&nbsp;&nbsp;&nbsp;
					<button id="submit" type="button" class="btn btn-primary" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
					<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');">Close</button>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		</div>
		</form>
				
		<script>
 
			function doSubmit(){
				var form = $('#messageAlert');
				var selectedDirectorate = document.getElementById("directorateName");				
				if (selectedDirectorate != 'undefined') {
					var selectedDirectorateIndex=selectedDirectorate.options[selectedDirectorate.selectedIndex];
					if(typeof selectedDirectorateIndex != 'undefined'){
						directorateId = selectedDirectorateIndex.value;
						directorateName = selectedDirectorateIndex.text;
					}else{
						alert('Please select the Directorate name');
						document.getElementById('directorateName').focus();
						return false;
					}	
				}
				var newsMessageType = document.getElementById("newsMessageType").checked;
				var notificationMessageType = document.getElementById("notificationMessageType").checked;
				var sms = document.getElementById("sms").checked;
				var newsHeader= document.getElementById('newsHeader').value; 
				var message= document.getElementById('message').value; 
				formFlag=true;
				
				if(directorateName == 'All')
					{
					alert('Choose either All Directorate or the specific Directorate Names to publish the message');
					document.getElementById('directorateName').focus();
					return false;
					}
				if(newsMessageType){
					if(newsHeader == ""){
						alert('Please enter the News Headlines to publish');
						 document.getElementById('newsHeader').focus();
						return false;
					}
				}
				if(message == ""){
					alert('Please enter the message to publish');
					 document.getElementById('message').focus();
					return false;
				}
				if(sms){
					document.getElementById("sendSms").value='Y';
				}
				else{
					document.getElementById("sendSms").value='N';
				}
				
				if(formFlag){
					formFlag = confirm("Do you really want to submit the message?");
					   if(formFlag){
						   document.getElementById('submit').disabled=true;
							$.ajax({type:"POST",
								url:'submitnewsnotification.do',
								'data':  form.serialize(),
								    success: function (result) {
								    	alert(result);
								    	document.getElementById('submit').disabled=false;
								      },
								      error: function () {
								    	  $("#errorMessage").text("Save Error");
								      }});
				      }
			    }
				return false;
			}
			
			function bdyOnLoad(){
				document.getElementById('lblNews').style.display = "none";
				document.getElementById('newsHeader').style.display = "none";				
			} 
			
			function enableFields(){
				var notificationMessageType = document.getElementById("notificationMessageType").checked;
				var newsMessageType = document.getElementById("newsMessageType").checked;
				
				if(notificationMessageType){
					document.getElementById('newsHeader').value="";
					document.getElementById('lblNews').style.display = "none";
					document.getElementById('newsHeader').style.display = "none";
					document.getElementById('lblSMS').style.display = "inline";
					document.getElementById('sms').style.display = "inline";					
				}
				if(newsMessageType){
					document.getElementById('lblSMS').style.display = "none";
					document.getElementById('sms').style.display = "none";
					document.getElementById('lblNews').style.display = "inline";
					document.getElementById('newsHeader').style.display = "inline";
				}				
			}
		</script>
	</body>
</html>