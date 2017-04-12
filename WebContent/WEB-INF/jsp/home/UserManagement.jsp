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
	
	<body>
		<form name="userManagement" id="userManagement">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
			<div id="submit2" class="myTableStyle">
			<table border="0" align="center" style="border: solid 3px #007297;">			  
				<tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
						<label style="font:22px arial;font-weight:bold;">
						<font color="white">User Details</font>
						</label>
					</td>    
				</tr><tr><td></td>
				<td align="right"><a href="#" onclick="newUserMnagementPage();">New</a></td>
				</tr>
				<tr>
					<td align="left" width="190px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>User Name</b>&nbsp;
					</td>
					<td style="width: 370px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="userName" id="userName" title="User Name">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>First Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="ufname" id="ufname" title="Please Enter your First Name">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Last Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="ulname" id="ulname" title="Please Enter your Last Name" >
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Password</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="password" name="upass" id="upass" title="Password">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Retype Password</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="password" name="rupass" id="rupass" title="Password">
					</td>
				</tr>
						<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Directrate Name</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<select id="DeroctratelListId" name="DeroctratelListId" class="reportDropDown">
								<option value="0"><spring:message code="option_select"/></option> 
								<c:forEach var="List" items="${DeroctratelList}">
								
					     			<option value='<c:out value="${List.id}"/>'>${List.name} </option>
					 			</c:forEach>
							</select> 
					</td>
				</tr>
				
					<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
					<b>User Tier</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						
						<select id="tierId" name="dropdown" onchange="moveNumbers()">
						<option value="tier" selected>Please Select Tier</option>
						<option value="T1">Tier1</option>
						<option value="T2">Tier2</option>
						<option value="T3">Tier3</option>
						<option value="T4">Tier4</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
					<b>User Level</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						
						<input id="snName" name="dropdown">
						
                        
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Email</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="email" id="email" title="Please Enter your Email-Id">
					</td>
				</tr>
				<tr>
					<td align="left" width="170px;" class="required" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Mobile</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="mobile" id="mobile" maxlength="10" title="Please Enter your Mobile Number">
					</td>
				</tr> 
				<tr>
					<td align="left" width="170px;" style="font:16px arial;font-weight:bold;padding-top:20px;padding-left: 50px;">
						<b>Designation</b>&nbsp;
					</td>
					<td style="width: 375px;padding-left: 50px;padding-top:20px;">
						<input type="text" name="designation" id="designation" title="Please Enter your Designation">
					</td>
				</tr>
				<tr>		
					<td width="170px;" ></td>
					 <div id="une"> </div>
					<td width="170px;" style="padding-top:30px; padding-bottom:25px; padding-left: 35px;">&nbsp;&nbsp;&nbsp;
						<button id="submit" type="button" class="btn btn-primary" onclick="doSubmit();">Submit</button>&nbsp;&nbsp;
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
	function moveNumbers()
	{
		
	var tierId=document.getElementById("tierId");
	var tierIdVal=tierId.options[tierId.selectedIndex].text;

	if(tierIdVal == "Tier1"){ var option = "Data Entry"; }
	else if(tierIdVal == "Tier2"){ var option = "Nodel Officer"; }
	else if(tierIdVal == "Tier3"){ var option = "Joint Director"; }
	else if(tierIdVal == "Tier4"){ var option = "All Directory"; }
	document.getElementById("snName").value=option;
	}
	function newUserMnagementPage(){
		window.location.href = "userManagement.do";
	}
	function doSubmit(){	
		var userName = document.getElementById('userName').value; 
		var firstName = document.getElementById('ufname').value; 
		var lastName = document.getElementById('ulname').value; 
		var email = document.getElementById('email').value;
		var mobile = document.getElementById('mobile').value;
		var password = document.getElementById('upass').value;
		var rupass = document.getElementById('rupass').value;
		var DeroctrateListId = document.getElementById('DeroctratelListId').value;
		var tierVal = document.getElementById('tierId').value;
		var designation =document.getElementById('designation').value;
		var snName= document.getElementById('snName').value;
		var validateFlag=validation(userName,firstName,lastName,password,rupass,email,mobile,DeroctrateListId);
	    
	    if(validateFlag){
          var formFlag = confirm("Do you really want to save?");
				if(formFlag){
					//document.getElementById('submit').disabled=true;
					$.ajax(
							{type:"POST",
					url:'userManagementDetails.do',
					'data': {userName:userName,firstName:firstName,lastName:lastName,email:email,mobile:mobile,password:password,DeroctrateListId:DeroctrateListId,tierVal:tierVal,designation:designation,snName:snName},
					success: function (result) {
						alert(result);
						location.reload(true);
						/*  document.getElementById('une').innerHTML = result;  */
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
	function validation(userName,firstName,lastName,password,rupass,email,mobile,DeroctrateListId){
		if (DeroctrateListId != 0) {
		if(DeroctrateListId == 1){ var derVal = "DMS"; }
		else if(DeroctrateListId == 2){ var derVal = "DPH"; }
		else if(DeroctrateListId == 3){ var derVal = "TNMSC"; }
		else if(DeroctrateListId == 4){ var derVal = "TANSACS"; }
		else if(DeroctrateListId == 5){ var derVal = "NRHM"; }
		else if(DeroctrateListId == 6){ var derVal = "RNTCP"; }
		else if(DeroctrateListId == 7){ var derVal = "MA"; }
		else if(DeroctrateListId == 8){ var derVal = "DME"; }
		else if(DeroctrateListId == 9){ var derVal = "DRMGR"; }
		else if(DeroctrateListId == 10){ var derVal = "DFW"; }
		else if(DeroctrateListId == 11){ var derVal = "SHTO"; }
		else if(DeroctrateListId == 12){ var derVal = "COC"; }
		else if(DeroctrateListId == 13){ var derVal = "SBCS"; }
		else if(DeroctrateListId == 14){ var derVal = "DCA"; }
		else if(DeroctrateListId == 15){ var derVal = "MRB"; }
		else if(DeroctrateListId == 16){ var derVal = "DFS"; }
		else if(DeroctrateListId == 17){ var derVal = "CMCHIS"; }
		else if(DeroctrateListId == 18){ var derVal = "DIM"; }
		else if(DeroctrateListId == 19){ var derVal = "NLEP"; }
		else if(DeroctrateListId == 20){ var derVal = "SBHI"; }
		else if(DeroctrateListId == 21){ var derVal = "ESI"; }
		else if(DeroctrateListId == 22){ var derVal = "PVTSEC"; }
		 var derectorVal = derVal.substring(0, 3);
		 var userNames = userName.substring(0, 3);
		 
		 if(derectorVal!=userNames.toUpperCase())
			 {
			 alert('User Name should starts with Deroctrate Name');
				document.getElementById('userName').focus();
				return false;
			 }
		
		}
		if( userName == ""){
			alert('Please enter User Name ');
			document.getElementById('userName').focus();
			return false;
		} 
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
		
		if( password == ""){
			alert('Please enter password ');
			document.getElementById('password').focus();
			return false;
		} 
		if( rupass == ""){
			alert('Please enter Retype password ');
			document.getElementById('rupass').focus();
			return false;
		} 
		
		if(password!=rupass){
			alert('New Password and Retype New Password Should be same');
			document.getElementById('password').focus();
			return false;
			
		}
		
		if( document.userManagement.DeroctratelListId.value == "0" )
		   {
		     alert( "Please select Deroctrate Id!" );
		     return false;
		   }
		if( document.userManagement.tierId.value == "tier" )
		   {
		     alert( "Please select User Tier!" );
		     return false;
		   }
		if( document.userManagement.snName.value == "snName" )
		   {
		     alert( "Please select User Level!" );
		     return false;
		   }
		
		
		if( email == ""){
			alert('Please enter Email ID ');
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
	</body>
</html>