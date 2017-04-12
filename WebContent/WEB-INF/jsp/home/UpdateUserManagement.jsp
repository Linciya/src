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
			
			/* .myTableStyle{
	        
                border: solid 3px #007297; 
	        } */
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
		<form name="modifyUser" id="modifyUser">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
			<div id="submit2" class="myTableStyle">
			<table border="0" align="center" style="border: solid 3px #007297;">			  
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
						<label style="font:22px arial;font-weight:bold;">
						<font color="white">User Details</font>
						</label>
					</td>    
				</tr>
				<tr><td></td>
				<td align="right"><a href="#" onclick="newUserMnagementPage();">Back</a></td>
				</tr>
			
				<tr>
					<td align="left" width="190px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>User Name</b>&nbsp;
					</td>
					<td style="width: 370px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="userName" id="userName" title="User Name" value="${userName}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>First Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="ufname" id="ufname" value="${userfirstName}">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Last Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="ulname" id="ulname" value="${userLastName}" >
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Directrate Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
					<input type="text" name="directrateName" id="directrateName" value="${deroctrateListName}" disabled="disabled"> 
					
					</td>
				</tr>
				
					<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
					<b>User Tier</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						
						<input type="tierCD" name="tierCD" id="tierCD" value="${tierCD}" disabled="disabled">
					</td>
				</tr>
		
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Email</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="email" id="email" value="${email}">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Mobile</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="mobile" id="mobile" maxlength="10" value="${phnNo}">
					</td>
				</tr> 
				<tr>
					<td align="left" width="170px;" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Designation</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="designation" id="designation" value="${disgnation}">
					</td>
				</tr>
				<tr>		
					<td width="170px;" ></td>
					 <div id="une"> </div>
					<td width="170px;" style="padding-top:30px; padding-bottom:25px; padding-left: 35px;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="btn btn-primary" onclick="doUpdate();">Submit</button>&nbsp;&nbsp;
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
	function newUserMnagementPage(){
		window.location.href = "editUserManagementDetails.do?DeroctrateListId=1";
	}
	function doUpdate()
	{
		var userName = document.getElementById('userName').value; 
		var firstName = document.getElementById('ufname').value; 
		var lastName = document.getElementById('ulname').value; 
		var email = document.getElementById('email').value;
		var mobile = document.getElementById('mobile').value;
		//var password = document.getElementById('upass').value;
		var designation =document.getElementById('designation').value;
		var UserId =document.getElementById('UserId').value;
		var derId =document.getElementById('derId').value;
		//var oldpassword = document.getElementById('oldpassword').value;
		
		
		
		
		
		var validateFlag=false;
		validateFlag=validation(firstName,lastName,email,mobile,designation);
	    
	    if(validateFlag){
	    	
          var formFlag = confirm("Do you really want to Update?");
				if(formFlag){
					//document.getElementById('submit').disabled=true;
					$.ajax(
							{type:"POST",
					url:'UpdateUserManagementValues.do',
					'data': {userName:userName,firstName:firstName,lastName:lastName,email:email,mobile:mobile,designation:designation,UserId:UserId,derId:derId},
					success: function (result) {
						alert(result);
						 /* document.getElementById('une').innerHTML = result; */
						
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
	
	
	function validation(firstName,lastName,email,mobile,designation){
		
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
			alert('Please enter Email ');
			document.getElementById('email').focus();
			return false;
		}
		else if (!isValidEmailPattern(email)){
			alert("Invalid EmailID");
			document.getElementById('email').value=" ";
			document.getElementById('email').focus();
			return false;
		}
		if( mobile == ""){
			alert('Please enter Phone Number ');
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
	</body>
</html>