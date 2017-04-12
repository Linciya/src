<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
     <%@page import="gov.shdrc.util.UserInfo"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="label_login_console"/></title>
<style>
body {
  font: 300 86% helvetica,arial,sans-serif;
  color: #000;
  background: #fff;
}

header {
  width: 100%;
  height: 150px;
  font-size: 1.3em;
  line-height: 150px;
  color: #222;
 /*  margin: 0 auto; */
}
#mainDiv {
  width: 100%;
  min-height: 600px;
 /*  margin: 0 auto; */
 /*  margin-left:-5px; */
}

nav {
  position: relative;
  width: 100%;
  height: 10px;
  margin: 0 auto;
  background: #8dc63f;
}

header, nav { 
  display: block; 
  width:100%;
  height: 30px;
}
nav ul#menu {
  display: block;
  margin: 0;
  height:30px;
  padding: 0;
  list-style: 0;
} 
nav ul#menu li {
  position: relative;
  display: inline-block;
  height:10px; 
}
nav ul#menu li a {
	display: block;
  	height: 30px;
  	line-height: 30px;    
  	font-size: 14px;
  	color: #fff;  
  	text-decoration: none;
  	padding: 0 15px;  	
}

nav ul#menu li a:hover, nav ul#menu li:hover > a {
  background: #333;  
}
nav ul#menu li:hover > #mega {
  display: block;
}

#mega {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  height: auto;
  padding: 20px 30px;
  background: #333;
  display: none;
  z-index: 2;
}

ul#menu ul {
  float: left;
  width: 23%;
  /* margin: 0 2% 15px 0; */
  padding: 0;
  list-style: none;
}

ul#menu ul li {
  display: block;
}

ul#menu ul li a {
  float: left;
  display: block;
  width: 100%;
  height: auto;
  line-height: 1em;
  color: #888;
  text-decoration: none;
  padding: 6px 0;
}

ul#menu ul li:first-child a {
  font-size: 1.2em;
  color: #8dc63f;
}
ul#menu ul li a:hover {
  color: #fff;
  background: none;
}

ul#menu ul li:first-child a:hover {
  color: #fff;
}

/* clearfix */
nav ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}

nav ul {
  display: inline-block;
} 

html[xmlns] nav ul {
  display: block;
}
 
* html nav ul {
  height: 1%;
}

#content {
  padding: 30px 0;
}
img{
width:100%;
margin-left:-10px;
}
ul#menu li:last-child a:HOVER{
color:red;
cursor: pointer;
background: #333;
height: 30px;
}
ul#menu li:last-child a{
color:red;
height: 30px;
background: #C0C0C0;
}
/*background-image: linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
background-image: -o-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
background-image: -moz-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
background-image: -webkit-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
background-image: -ms-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
} */
</style>
</head>
<body style="width:100%;" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<img class="identifierLogo" alt="" src="images/shdrc top2.png" style="margin-top:-12px;height:50%;">
<div id="mainDiv">	
	<nav>
		<ul id="menu">
			<c:if test="${directorateId!=23}">
			<li><a href="<spring:message code="shdrc_dashboard_zone${directorateId}_action"/>?directorateId=${directorateId}">Dashboard Zone</a>
			</c:if>
				<!-- <div id="mega">
					<ul>
						<li><a href="#">Menu1</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">iMacs</a></li>
						<li><a href="#">Laptops &amp; Macbooks</a></li>
						<li><a href="#">Monitors</a></li>
						<li><a href="#">Software &amp; Accessories</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu2</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Plasma TVs</a></li>
						<li><a href="#">LCD TVs</a></li>
						<li><a href="#">LED TVs</a></li>
						<li><a href="#">Portable TVs</a></li>
						<li><a href="#">Accessories</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu3</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Vacuum Cleaners</a></li>
						<li><a href="#">Kitchenware</a></li>
						<li><a href="#">Lighting</a></li>
						<li><a href="#">Air Conditioners</a></li>
						<li><a href="#">Chamberpots</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu4</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Movies</a></li>
						<li><a href="#">DVD &amp; Blu-Ray Players</a></li>
						<li><a href="#">CDs</a></li>
						<li><a href="#">Home Stereos</a></li>
						<li><a href="#">Etch-A-Sketches</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu5</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Sofas &amp; Love Seats</a></li>
						<li><a href="#">Reclining Chairs</a></li>
						<li><a href="#">Lamps &am; Tables</a></li>
						<li><a href="#">Dressers &amp; Armoires</a></li>
						<li><a href="#">Flooring</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu6</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Workspaces</a></li>
						<li><a href="#">Tables</a></li>
						<li><a href="#">Chairs</a></li>
						<li><a href="#">Shelving &amp; Storage</a></li>
						<li><a href="#">Lighting</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu7</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Women's Fashions</a></li>
						<li><a href="#">Men's Wear</a></li>
						<li><a href="#">Children's Wear</a></li>
						<li><a href="#">Footwear</a></li>
						<li><a href="#">Hats-A-Plenty!</a></li>
					</ul>
					<ul>
						<li><a href="#">Menu8</a></li>
						<li><a href="#">sub menu</a></li>
						<li><a href="#">Tony "Iron Man" Stark</a></li>
						<li><a href="#">Bruce "Hulk" Banner</a></li>
						<li><a href="#">Steve Rogers (Captain America)</a></li>
						<li><a href="#">Natasha Romanoff (Black Widow)</a></li>
						<li><a href="#">Hawkeye, I guess</a></li>
					</ul>
				</div> -->
			</li>
			<c:if test="${directorateId!=5 && directorateId!=4}">
				<li><a href="<spring:message code="shdrc_report_zone${directorateId}_action"/>?directorateId=${directorateId}">Reports Zone</a></li>
			</c:if>
			<c:if test="${directorateId!=5 && directorateId!=23}">
			<li><a href="<spring:message code="shdrc_indicator_zone${directorateId}_action"/>?directorateId=${directorateId}">Indicator Zone</a></li>
			</c:if>
			<c:if test="${directorateId!=5 && directorateId!=23}">
			<li><a href="<spring:message code="shdrc_analysis_zone${directorateId}_action"/>?directorateId=${directorateId}">Analysis Zone</a></li>
			</c:if>
			<li><a href="<spring:message code="shdrc_freehand_zone${directorateId}_action"/>?directorateId=${directorateId}">Freehand Zone</a></li>
		 	<li><a href="IMRPredictiveZone.do" >Predictive Zone</a></li>   
			<li><a href="statistics.do" >Data Statistics</a></li>  			
			<!-- <li><a href="#">Analytics(Draft)</a></li>
			<li><a href="#">Send SMS</a></li> -->
			<li><a href="shdrcHome.do">Home Page</a></li>
			<li><label style="display: block;color:white;font-size:14px;">User: <%=UserInfo.getLoggedInUserName() %></label></li>
			<li id="logoutButton"><!-- <label id="logoutButton" class="logoutButton" onclick="location.href='userSessionInvalidate.do';" class="btn btn-default btn-sm" style="font: normal 18px thahoma;margin-top:10px;width:100px;">
            Logout</label> -->
            <a href="userSessionInvalidate.do" class="logoutButton">Logout</a>
           </li>
		</ul>		
	</nav>
</div>
</body>
<script type="text/javascript">
window.history.forward();
function noBack() { window.history.forward(); }
</script>
</html>