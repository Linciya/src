<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%response.setHeader("X-Frame-Options", "DENY"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="css/login.css">
<title><spring:message code="label_login_console"/></title>
<script src="jquery/jquery-1.11.1.min.js"></script>
</head>
<body style="height:100%;width:100%">   
<div class="main-wrap">
<center><h1 style="margin-left:575px;margin-top:180px;"><spring:message code="label_login_console"/></h1></center>
        <div class="login-main">
        <form id="loginForm" action="login.do" onsubmit="return validateForm();" name="loginForm" method="POST">
            <input type="text" id="userName" name="userName" placeholder="user name" class="box1 border1">
            <input type="password" id="userPassword" name="userPassword" placeholder="password" class="box1 border2">/
            <input type="submit" id="send" class="send" value="Go">
           <%--  <p><b><spring:message code="label_login_forgotpassword"/><a href="#"><spring:message code="label_login_click"/></a></b></p> --%> 
            </form>   
            <input type="hidden" id="serverOut" name="serverOut" value="<%=request.getAttribute("credentialsResponse")%>">
            <p id="demo" style="color:red;font-weight: bold;font-size:16px;margin-left:-35px;margin-top:30px;width:450px;"></p>
</div>        
</div>
</body>
<script type="text/javascript">
function validateForm() {
	 var userName = $('#userName').val();
     var passWrd=$('#userPassword').val();
     var encryption = window.btoa(passWrd);
     $('#userPassword').val(encryption);
     if (userName.length == 0) {
        alert("Please input a user name");
        return false;
     } else if (passWrd.length == 0) {
        alert("Please input a password");
        return false;
     }
}
$(document).ready(function(){
	var tempData=$("#serverOut").val();
	if(tempData==='' || tempData==='null'){}else{
	document.getElementById('demo').innerHTML = tempData;
	}
});
</script>
</html>