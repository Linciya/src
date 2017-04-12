<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://crypto-js.googlecode.com/svn/tags/3.0.2/build/rollups/md5.js"></script>
		<script type="text/javascript" src="js/hex_md5.js"></script>
		<script src="js/script.js"></script>
		
		<script language="javascript">
		function encrypteUserPassword(password){
			     /* MessageDigest digest = MessageDigest.getInstance("MD5");
			     digest.update(password.getBytes("UTF-8"));
			     encrypteUserPassword = new BASE64Encoder().encode(digest.digest()); */
			     var encrypteUserPassword=hex_md5(password);
			return encrypteUserPassword;
		}
		</script>
		
		<style type="text/css">
		.divClass{
		background-color: #F0F6FF;
		 height: 755px;
		}
		
		.myTableStyle
		        {
		           position:absolute;
		           top:250px;
		           left:490px;
		           border: solid 3px #007297;
		           /* border-radius:20px; */ 
		           }
		</style>	
	</head>
	
	<body onload="resizeTo();">
		<form name="ChangePassword" id="changePassword">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<input type="hidden" id="submitType" name="submitType"/>
		<div id="submit" class="divClass">
		<table border="0">
			<tr>
				<td style="padding-left: 490px;padding-top: 10px;">
					<label style="font:16px arial;font-weight:bold;">Password Policy:</label></br>
					<p style="font:14px arial;line-height: 25px;">1.Passwords must have min 8 characters and max 15 characters.</br>
					2.The New password must contain at least one lower case letter, one upper case letter,</br> one digit and one special character</br>
					3.Passwords can contain characters from the following four categories.</br>
					4.English uppercase alphabet characters (A-Z).</br>
					5.English lowercase alphabet characters (a-z)</br>
					6.Base 10 digits (0-9).</br>
					7.Non-alphanumeric characters (Ex:!,@,$,#,%,&,*,+,=)</br></p>
				</td>
			</tr>
		</table>
		<div id="submit" class="myTableStyle">
		<table border="0" align="center">
		  <tr> </tr>
		  <tr>
		      <td width=500px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
				  <label style="font:22px arial;font-weight:bold;">
			       	<font color="white">Change Password</font>
		      	</label>
		      </td>
		  </tr>
		  <tr>
		     <td width=250px; align="right" class="required" style="font:16px arial;font-weight:bold;padding-top:15px;">
		         <b>Current Password</b>&nbsp;&nbsp;&nbsp;&nbsp;
		      </td>
		      <td width=250px; style="padding-top:15px;">
		         <input name="currentpassword" type="password" id="curpass" title="Enter Current Password" maxlength="15">
		      </td>
		  </tr>
		  <tr>
		     <td width=250px; align="right" class="required" style="font:16px arial;font-weight:bold;padding-top:15px;">
		         <b>New Password</b>&nbsp;&nbsp;&nbsp;&nbsp;
		      </td>
		      <td width=250px; style="padding-top:15px;">
		         <input name="newpassword" type="password" id="newpass" title="Enter New Password" maxlength="15">
		      </td>
		  </tr>
		  <tr>
		     <td width=250px; align="right" class="required" style="font:16px arial;font-weight:bold;padding-top:15px;">
		         <b>Retype New Password</b>&nbsp;&nbsp;&nbsp;&nbsp;
		      </td>
		      <td width=250px; style="padding-top:15px;">
		         <input name="retypepassword" type="password" id="retpass" title="Retype New Password" maxlength="15">
		      </td>
		  </tr>
		  <tr>
		     <td width=250px; ></td>
				<td width=250px; style="padding-top:15px; padding-bottom:15px;">&nbsp;&nbsp;&nbsp;
					<button  type="button" class="btn btn-primary" onclick="doSubmit();"/>Submit</button>&nbsp;&nbsp;
					<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');"/>Close</button>&nbsp;&nbsp;
				</td>
		  </tr>
		
		</table>
		</div>
		</div>
		</form>
		
		  <script>		 
		  function doSubmit(){
			var form = $('#changePassword');
			var currentpassword = document.getElementById('curpass').value; 
			var newpassword = document.getElementById('newpass').value; 
			var retypepassword = document.getElementById('retpass').value; 
			 formFlag=true;
			if(currentpassword == ""){
				alert('Please enter Current password');
				 document.getElementById('curpass').focus();
				return false;
			}else if(currentpassword.length<8){
				   alert('Please enter atleast 8 char in password');
				   document.getElementById('curpass').focus();
		           return false;
			}else if(currentpassword.length>15){
				alert('The Current password should not exceed more than 15 characters');
				 document.getElementById('curpass').focus();
		        return false;
			}
			
			if(newpassword == ""){
				alert('Please enter New Password');
				document.getElementById('newpass').focus(); 
				return false;
			}else if(newpassword.length<8){
				   alert('Please enter atleast 8 char in password');
				   document.getElementById('newpass').focus(); 
		           return false;
			}else if(newpassword.length>15){
				alert('The New password should not exceed more than 15 characters');
				document.getElementById('newpass').focus(); 
		        return false;
			} else if(!isValidSplCharacter(newpassword)){
				alert('The New password must contain at least one lower case letter, one upper case letter, one digit and one special character');
				document.ChangePassword.newpassword.focus();
		        return false;
			}
		
			if(retypepassword == ""){
				alert('Please enter Re-Type New Password');
				document.getElementById('retpass').focus(); 
				return false;
			}else if(retypepassword.length<8){
			   alert('please enter atleast 8 char in password');
			   document.getElementById('retpass').focus(); 
		          return false;
			}else if(retypepassword.length>15){
				alert('The Retype password should not exceed more than 15 characters');
				document.getElementById('retpass').focus(); 
		        return false;
			}else if(!isValidSplCharacter(retypepassword)){
				alert('The New password must contain at least one lower case letter, one upper case letter, one digit and one special character');
				document.ChangePassword.retypepassword.focus();
		        return false;
			}
			if(newpassword!= retypepassword){
				alert('New Password does not match with retype password');
				document.ChangePassword.retypepassword.focus(); 
				return false;
			 }
			
			 if(formFlag){
				$.ajax({type:"POST",
						url:'changeUserPassword.do',
						'data':  form.serialize(),
							success: function (result) {	
								var output=result.trim();
						    	if(output=="Success"){
						    		alert("Password has been changed successfully");
							    	document.getElementById('curpass').value=""; 
							    	document.getElementById('newpass').value=""; 
							    	document.getElementById('retpass').value=""; 
							    	var contextPath = '<%=request.getContextPath()%>';
							    	document.location.href=contextPath+'/'+'shdrcLogin.do';
						    	}
						    	else if(output=="Failure"){
						    		alert("Password has not been changed. Contact system administrator");
							    	document.getElementById('curpass').value=""; 
							    	document.getElementById('newpass').value=""; 
							    	document.getElementById('retpass').value=""; 
						    	}
						    },
						      error: function () {
						    	  $("#errorMessage").text("Password has not been changed.Please contact system administrator.");
						      }});			
			  	}
		    }
		  
		</script>
		<script src="js/commonHandsontable.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>