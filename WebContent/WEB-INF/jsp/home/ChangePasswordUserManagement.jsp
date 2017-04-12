<%@page import="gov.shdrc.util.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@ page import="gov.shdrc.util.ShdrcConstants" %>
<%@ page import="gov.shdrc.home.dao.jdbc.CommonDAO" %>
<%@ page import="gov.shdrc.util.Util" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>User Details</title>
		
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
			
	        #une{
	        background-color:rgba(66,139,202,0.51);
	      
	        background-position:500px;
	       
	       width: 675px;
    text-align: center;
    margin: 1 auto;
	      
	        }
		  </style>		
	</head>
	
	<body onload="onLoad();">
	<input type="text" name="UserId" id="UserId" value="${UserId}" style="visibility:hidden">
	<input type="password" name="oldpassword" id="oldpassword" value="${oldpassword}" type="hidden" style="visibility:hidden">
	<input type="text" name="derId" id="derId" value="${derId}" style="visibility:hidden"> 
	<input type="password" name="cpass" id="cpass" style="visibility:hidden">
		<form name="modifyUser" id="modifyUser">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
			<div id="submit2" class="myTableStyle">
			<table border="0" align="center" style="border: solid 3px #007297;">			  
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
						<label style="font:22px arial;font-weight:bold;">
						<font color="white">Reset Password</font>
						</label>
					</td>    
				</tr>
				<tr><td></td>
				<td align="right"><a href="#" onclick="editUserManagementDetails();">back</a></td>
				</tr>
			     <tr>
					<td align="left" width="190px;" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>User Name</b>&nbsp;
					</td>
					<td style="width: 370px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="userName" id="userName" title="User Name" value="${userName}" disabled="disabled">
					</td>
				</tr>
				<tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>New Password</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="password" name="npass" id="npass" title="Password">
					</td>
				</tr>
					<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Retype New Password</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="password" name="rnpass" id="rnpass" title="Password">
					</td>
				</tr>
				<tr>		
					<td width="170px;" ></td>
					
					<td width="170px;" style="padding-top:30px; padding-bottom:25px; padding-left: 35px;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="btn btn-primary" onclick="doChangePwd();">Submit</button>&nbsp;&nbsp;
						<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');">Close</button>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			</div>
		</form>
		
<div class="portlet-msg-success" style:"display:none" id="successMsg">
<saved>
</div>
    <script src="js/commonHandsontable.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script>
	function onLoad(){
		var directrateId=<%= request.getAttribute("directorateId") %>;
	}
	function editUserManagementDetails(){
		window.location.href = "editUserManagementDetails.do?DeroctrateListId=1";
	}
	function doChangePwd()
	{
		var userName = document.getElementById('userName').value; 
		var oldpassword = document.getElementById('oldpassword').value;
	    var npass = document.getElementById('npass').value;
		var rnpass = document.getElementById('rnpass').value;
		var UserId =document.getElementById('UserId').value;
		var derId =document.getElementById('derId').value;
        var validateFlag=false;
		validateFlag=validation(npass,rnpass);
	    if(validateFlag){
	    var formFlag = confirm("Do you really want to Reset Password?");
				if(formFlag){
					//document.getElementById('submit').disabled=true;
					$.ajax(
							{type:"POST",
					url:'ChangePwdValues.do',
					'data': {userName:userName,oldpassword:oldpassword,npass:npass,rnpass:rnpass,UserId:UserId,derId:derId},
					success: function (result) {
						alert(result);
						/*  document.getElementById('une').innerHTML = result;  */
						 var contextpath='<%=request.getContextPath()%>'; 
				    		document.location.href=contextpath+"/"+'editUserManagementDetails.do?DeroctrateListId='+derId; 
						//alert("succefully submitted"); // make the div visible 
						//document.getElementById("successMsg").style.display="block";
						//document.getElementById('submit').disabled=false;
				    },
				    error: function () {
				    	$("#errorMessage").text("Save Error");
					}});					
				} 
		}   
		
	}
	
	
	function validation(npass,rnpass){
	        if( npass == ""){
			alert('Please enter New Password ');
			document.getElementById('npass').focus();
			return false;
		} 
		if( rnpass == ""){
			alert('Please enter Retype New Password ');
			document.getElementById('rnpass').focus();
			return false;
		} 
		 if(npass!=rnpass){
				alert('New Password and Retype New Password Should be same');
				document.getElementById('password').focus();
				return false;
			} 
		
		return true;
	}
	</script>
	</body>
</html>