<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="css/login.css">
<title><spring:message code="label_login_console"/></title>
</head>
<body style="height:100%;width:100%">    
<div class="main-wrap">
<center><h1 style="margin-left:575px;margin-top:180px;"><spring:message code="label_login_console"/></h1></center>
        <div class="login-main">
        <form action="Login.do" method="POST">
            <input type="text" name="userName" placeholder="user name" class="box1 border1">
            <input type="password" name="userPassword" placeholder="password" class="box1 border2">
            <input type="submit" class="send" value="Go">
            <p><b><spring:message code="label_login_forgotpassword"/><a href="#"><spring:message code="label_login_click"/></a></b></p> 
        </form>   
</div>        
</div>
</body>
</html>
</body>
</html>