<%@page import="gov.shdrc.util.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@ page import="gov.shdrc.util.ShdrcConstants" %>
<%@ page import="gov.shdrc.home.dao.jdbc.CommonDAO" %>
<%@ page import="gov.shdrc.util.Util" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>Modify User Details</title>
		
		<!-- Bootstrap -->
		  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">  
		  <script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
		  <script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
		  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css"> 
		  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css"> 
		  <script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>
		  <script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script> 
		  <link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">  
		  <link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
		  <script src="js/script.js"></script>
		  <link rel="stylesheet" type="text/css" href="css/style.css"  />	
		  
		<style type="text/css">
			.divClass{
				background-color: #F0F6FF;
				 height: 755px;
			}
			
			/* .myTableStyle{
	        
                border: solid 3px #007297; 
	        } */
		</style>		
	</head>
	
	<body>
		<form name="modifyUser" id="modifyUser">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
			<div id="submit2" class="myTableStyle">
			<table border="0" align="center" style="border: solid 3px #007297;">			  
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
						<label style="font:22px arial;font-weight:bold;">
						<font color="white">Modify : User Details</font>
						</label>
					</td>    
				</tr>
				<tr>
					<td align="left" width="190px;" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;border-right: blue 1px solid;">
						<b>User Name</b>&nbsp;
					</td>
					<td style="width: 370px;padding-left: 50px;padding-top:20px;">
						<input type="text" disabled name="userName" id="userName" title="User Name" value="<%= request.getAttribute("userName") %>">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;border-right: blue 1px solid;">
						<b>First Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="ufname" id="ufname" title="Please Enter your First Name" value="${user.ufname}">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;border-right: blue 1px solid;">
						<b>Last Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="ulname" id="ulname" title="Please Enter your Last Name" value="${user.ulname}">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;border-right: blue 1px solid;">
						<b>Password</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="password" disabled name="upass" id="upass" title="Password" value="${user.upass}">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;border-right: blue 1px solid;">
						<b>Email</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="email" id="email" title="Please Enter your Email-Id" value="${user.email}">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;border-right: blue 1px solid;">
						<b>Mobile</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="mobile" id="mobile" maxlength="10" title="Please Enter your Mobile Number" value="${user.mobile}">
					</td>
				</tr> 
				<tr>		
					<td width="170px;" ></td>
					<td width="170px;" style="padding-top:30px; padding-bottom:25px; padding-left: 35px;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="btn btn-primary" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
						<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');">Close</button>&nbsp;&nbsp;
					</td>
				</tr>
			
			</table>
			</div>
		</form>
		
	 <script>	 
	 <%
		User user =null;
		if(request.getAttribute("user")!=null)
			user =(User)request.getAttribute("user");	
	%>
	 
	 	var form = $('#modifyUser');
	 	function doSubmit(){		  
			var firstName = document.getElementById('ufname').value; 
			var lastName = document.getElementById('ulname').value; 
			var email = document.getElementById('email').value;
			var mobile = document.getElementById('mobile').value;
			var validateFlag=validation(firstName,lastName,email,mobile);
			if(validateFlag){
					var formFlag = confirm("Do you really want to save?");
					if(formFlag){
						document.getElementById('submit').disabled=true;
						$.ajax({type:"POST",
						url:'modifyUserDetails.do',
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
	 	}
	 	
		function validation(firstName,lastName,email,mobile){
			if( firstName == ""){
				alert('Please enter First Name ');
				document.getElementById('ufname').focus();
				return false;
			} 
			if( lastName == ""){
				alert('Please enter Last Name ');
				document.getElementById('ulname').focus();
				return false;
			} 
			if( email == ""){
				alert('Please enter Email ID ');
				document.getElementById('email').focus();
				return false;
			} 
			else if (!isValidEmailPattern(email)){
				alert("Invalid EmailID");
				document.getElementById('email').focus();
				return false;
			}
			if( mobile == ""){
				alert('Please enter Mobile Number ');
				document.getElementById('mobile').focus();
				return false;
			} 
			else if(!isNumeric(mobile)){
				alert("Invalid Mobile Number");
				document.getElementById('mobile').focus();
				return false;
			} 
			else if(document.getElementById('mobile').value.length<10){	
				alert('Mobile Number should contain 10 digits');
				document.getElementById('mobile').focus();
		        return false;
			}
			var subStr = mobile.toString().substr(0, 1);
			if (subStr==0){
				alert('Mobile Number cannot start with 0');
				document.getElementById('mobile').focus();
			  	return false;
			}
			return true;
		}
	
		function isNumeric(value) {
	    	if (!value.toString().match(/^[-]?\d*\.?\d*$/)){
				return false;
			}
	    	return true;
		}
	
		function isValidEmailPattern(str) {
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;   
			return emailPattern.test(str);   							
		}
		
		
	</script>
	
	<script src="js/commonHandsontable.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
	<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"> 
	<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>