<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="gov.shdrc.util.UserInfo"%>
    <%@page import="gov.shdrc.util.ShdrcConstants"%>
    <%@page import="java.util.List"%>
    <%@ page import="org.json.JSONArray" %>
	<%@ page import="org.json.JSONException" %>
    <%@page import="org.json.JSONObject"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
 <!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>108 GPS Status</title>
<script src="js/script.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-1.11.1.min.js"></script>
<!-- 	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_UN3281vLu65MNaK-y6w2XFxN_Wvo97M&libraries=visualization" type="text/javascript"> -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeZt8_jdE79lYb_YNd1UiUvEf8UcGLsf4&libraries=visualization" type="text/javascript">
	</script>
	
		
        <link rel="stylesheet" href="css/pausingscroller.css" />
        <script type="text/javascript" src="js/pausingscroller.js"></script>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
<%
String userTier=UserInfo.getUserTier();
List<String> userRoleList=UserInfo.getUserRoleList();
JSONArray jsonUserRole=new JSONArray(userRoleList);
%>
<style>
.subMenu{/* color:#A52A2A; */
width:100%;
background: #87CEFA;
height:32px;
}
.dropDownMenu li.parent:HOVER{
    color: yellow;	
}
.logoutButton:HOVER{
color:red;
font-weight:bold;
cursor: pointer;
}
.logoutButton{
color:yellow;
}
</style>
<script type="text/javascript">
var contextpath = '<%=request.getContextPath()%>';
//var ldapRoleArr = <%= new JSONArray(userRoleList)%>;
var userRoleArr = <%= jsonUserRole %>;
function doDataEntry()
{
	for(i=0;i<userRoleArr.length;i++){
		var role=userRoleArr[i];
		var directorateServlet=getDirectorateServlet(role);
		if(directorateServlet!=""){
			document.location.href = contextpath+directorateServlet;
			return;
		}

	}
}

function getDirectorateServlet(role){
	 var directorateServlet='';
       switch (role) {
       	case "<%= ShdrcConstants.Role.DMS %>" : directorateServlet= "/dmsDataEntry.do";
           		break;
       	case "<%= ShdrcConstants.Role.DPH %>":  directorateServlet= "/dphDataEntry.do";
        		break;
       	case "<%= ShdrcConstants.Role.TNMSC %>": directorateServlet= "/tnmscDataEntry.do";
           		break;
       	case "<%= ShdrcConstants.Role.TANSACS %>": directorateServlet="/tansacsDataEntry.do";
           		break;
       	case "<%= ShdrcConstants.Role. NRHM %>":  directorateServlet= "/nrhmDataEntry.do";
                  break;
       	case "<%= ShdrcConstants.Role.RNTCP %>": directorateServlet= "/rntcpDataEntry.do";
                   break;
        case "<%= ShdrcConstants.Role.MA %>":  directorateServlet= "/maDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DME %>":  directorateServlet= "/dmeDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DRMGR %>":  directorateServlet= "/drmgrDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DFW %>":  directorateServlet= "/dfwDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.SHTO %>":  directorateServlet= "/shtdDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.COC %>":  directorateServlet= "/cocDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.SBCS %>":  directorateServlet= "/sbcsDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DCA %>":  directorateServlet= "/dcaDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.MRB %>":  directorateServlet= "/mrbDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DFS %>":  directorateServlet= "/dfsDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.CMCHIS %>":  directorateServlet= "/cmchisDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DIM %>":  directorateServlet= "/dimDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.NLEP %>":  directorateServlet= "/nlepDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.SBHI %>":  directorateServlet= "/sbhiDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.ESI %>":  directorateServlet= "/esiDataEntry.do";
                    	break;			
		case "<%= ShdrcConstants.Role.ALLDIRECTORATE %>":  directorateServlet= "/dmsDataEntry.do";
                    	break;
       }
	 return directorateServlet;
   }

</script>   		
<Style>
#headerTable {
    padding:0px;
    border-collapse: collapse;
}
.selected {
    background-color:#F7DC6F;
}
#indTable1{
 	width: 30em;
}
#indTable {
    width: 30em;
    margin: 5em auto;
    background: #ccc;
}

#indTable1 thead {
    background: #000;
    color: #fff;
}
#indTable1 td {
    width: auto;
    padding: 0.3em;
}
#indTable td {
    width: auto;
    padding: 0.3em;
}

#indTable tbody {
    background: #ccc;
}

div.pager {
    text-align: center;
    margin: 2em auto;
}

div.pager span {
    display: inline-block;
    width: 1.8em;
    height: 1.8em;
    line-height: 1.8;
    text-align: center;
    cursor: pointer;
    background: #000;
    color: #fff; 
    margin-right: 0.5em;
}

div.pager span.active {
    background: #c00;
}

			.createNewTableMap{
					    display: none; /* Hidden by default */
					    position: fixed; /* Stay in place */
					    z-index: 150; /* Sit on top */
					    left: 15%;
					    top: 25%;
					    width: 55%; /* Full width */
					    height: 70%; /* Full height */
					    overflow: auto; /* Enable scroll if needed */
					    background-color: rgb(0,0,0); /* Fallback color */
					    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
					    -webkit-animation-name: fadeIn; /* Fade in the background */
					    -webkit-animation-duration: 0.4s;
					    animation-name: fadeIn;
					    animation-duration: 0.4s;

			}
			

		.createNewTable-contentMap{
				position: absolute;
			    background-color: #fefefe;
			    margin: auto;
			    /* left: 20px; */
				top: 25px; 
			    padding: 0;
			    border: 1px solid #888;
			    width: 90%;
			    height: 90%;
			    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
			    -webkit-animation-name: animatetop;
			    -webkit-animation-duration: 0.4s;
			    animation-name: animatetop;
			    animation-duration: 0.4s
			} 
			
			/* Add Animation */
			@-webkit-keyframes animatetop {
			    from {top:-300px; opacity:0}
			    to {top:0; opacity:1}
			}
			
			@keyframes animatetop {
			    from {top:-300px; opacity:0}
			    to {top:0; opacity:1}
			}
			
			/* The Close Button */
			.createNewTable-reportClose{
			    color: red;
			    float: right;
			    font-size: 28px;
			    font-weight: bold;
			    line-height: 20px;
			}
			.createNewTable-reportCloseMap{
			    color: red;
			    float: right;
			    font-size: 28px;
			    font-weight: bold;
			    line-height: 20px;
			}
			

			.createNewTable-reportCloseMap:hover,
			.createNewTable-reportCloseMap:focus {
			    color: white;
			    text-decoration: none;
			    cursor: pointer;
			}
			

			.createNewTable-headerMap {
			    padding: 2px;
			    background-color: #3fadb5;
			    /* color: white; */
			    height:22px;   
			    line-height: 12px;
			    margin-top:-20px; 

			    width:110%;    
			}
			

			.createNewTable-bodyMap {
				/* padding: 2px 16px; */
				 height: 600px;
				width:110%;

			}
			

			
			.createNewTable-footerMap {
			
			    	padding: 2px 16px;
    				background-color: #3fadb5;
    				/* color: white; */
    			    height:22px;
			        width:110%; 
			}
			
			

		#map {
				height: 400px;
			}
			
			#msg {
				font-weight: bold;
			}
			
			#map.note {
			  margin: 20px 0px 10px;
			  padding-left: 20px;
			  width: 100%;
			  height: 100%;
			  position: relative;
			  font-style: italic;
			}
			
			
			/* pulsating blue dot from: https://github.com/stedman/GeoLocateMe */			
			#map div.gmnoprint[title="Current Location"] {
			  box-shadow: inset 0 0 5px #06f, inset 0 0 5px #06f, inset 0 0 5px #06f, 0 0 5px #06f, 0 0 5px #06f, 0 0 5px #06f;
			  margin: -18px 0 0 -18px;
			  height: 51px !important;
			  width: 51px !important;
			  border: 1pt solid #fff;
			  border-radius: 51px;
			  animation: pulsate 1.5s ease-in-out infinite;
			}
			
			#map div.gmnoprint[title="Current Location"] img {
			  display: none;
			  z-index: 99999;
			}
			
			@keyframes pulsate {
			  from {
			    transform: scale(0.3) translateZ(0);
			    opacity: 1.0;
			  }
			  95% {
			    transform: scale(1.3) translateZ(0);
			    opacity: 0;
			  }
			  to {
			    transform: scale(0.3) translateZ(0);
			    opacity: 0;
			  }
			}
			
			/* compensate for iPhone and Android devices with high DPI, add iPad media query */
			
			@media only screen and (-webkit-min-device-pixel-ratio: 1.5),
			only screen and (device-width: 768px) {
			  #map div.gmnoprint[title="Current Location"] {
			    margin: -10px 0 0 -10px;
			  }
			}
			
			#legend img {
			  vertical-align: middle;
			}
			
			html,
			body,
			#map {
			  margin: 0;
			  padding: 0;
			  height: 100%;
			}
			
			#legend {
			  font-family: Arial, sans-serif;
			  background: #fff;
			  padding: 10px;
			  margin: 10px;
			  border: 3px solid #000;
			}
			
			#pathMap {
  height: 400px;
  width: 50px;
}

#pscroller1{
	width: 100%;
	max-width: 400px;
	height: 120px;
	border: 1px solid black;
	background-color: #B2B2B2;
	margin-bottom: 1em;
}

#pscroller1 > div.innerDiv{
	padding: 8px;
}

#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 15px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

/* Toggle Menu CSS Start */
div#dm{
	width:1000px;
}
.dropdown{
	margin-left: 100px;
}
div#drop{
	margin-top:-29px;
	margin-right:30px;
}
.row{
	padding-left:25px; 
	margin:5px 5px;
}
a#click{
  	background:none;
  	outline: none;
	cursor: pointer;
 	font-family: Arial, Helvetica, sans-serif;
	font-size:16px;
  	color:black;
  	text-decoration: none;
}
a#click:hover{
	color:#d43653;
}
a#click:onclick{
	color:#f2f2f2;
}
.col-xs-4{  
	width:140px;
	height:45px;
	color:#737373;
}
.col-xs-4:hover{
	color:#fff;
	background:#ff9933;
}
.arrow{
  	color:#ff9933;
}
.ex-link .arrow{
  	float:left;
  	margin-left: 8px;
}
.row a:hover .arrow{color:#999;}

/* Toggle Menu End*/

.loader {
					position: fixed;
					left: 0px;
				 	top: 0px;
					width: 100%;
					height: 100%;
					z-index: 9999;
					background: url('images/Load_img.gif') 50% 50% no-repeat rgb(249,249,249);
				    opacity: .8;
					}
	

</Style>
<link rel="stylesheet" type="text/css" href="css/dropdown.css">
<script>
       var pausecontent1 = new Array();
       	pausecontent1[0]='Prediction data for next 2 hours'
       	pausecontent1[1]='Prediction data for next 2 hours'
	   var scroller1 = new pausescroller(pausecontent1, "pscroller1", 4000, 1500)
</script>
</head>
<body onload="onLoad();">
<input id="distName"  type="hidden" name="distName"/>
<div id="mainDIV">
<img alt="" src="images/shdrc top2.png" style="margin-top:-12px; width:100%; height:60%;" width="100%" height="45%">
<div id="subMenu" class="subMenu">
<ul class="dropDownMenu">
<li class="parent"><a id="refClass" href="" style="margin-left:-40px;width:150px;text-align:center;color:black">User Menu</a>
  <ul class="children">
  <%
		if(ShdrcConstants.UserTier.TIER3.equalsIgnoreCase(userTier) 
				|| ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)
				||(userRoleList.contains("AllDirectorate") )){%>
      <li><a href="#" onclick="doDataEntry();" >Data Entry Forms</a></li>
      <li><a href="#" onclick="location.href='uploadExcel.do';">Upload Data Files</a></li>
   <%} %>   
      <!-- <li><a href="#" >Brows Files</a></li> -->
      <li><a href="#" onclick="location.href='changePassword.do';" >Change Password</a></li>
    <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  
      <li><a href="#" onclick="location.href='messageAlert.do';">Notification/News</a></li>
     <%} %>
     <%
		if((userRoleList.contains("AllDirectorate") )){%>
     <li><a href="userManagement.do" >Add User</a></li>
   <%} %>      
      <li><a href="#" onclick="location.href='modifyUser.do';">Modify User</a></li>
      <!-- <li><a href="#" >Manage Data Source</a></li> -->
    <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  
       <li><a href="#" onclick="location.href='IMRPredictiveZone.do';">Predictive Zone</a></li> 
       <li><a href="shdrcPredictionSlider.do" >On Demand Prediction</a></li>   
      <li><a href="#" >Service&nbsp;Maintenance</a></li>
    <%} %>  
      <li><a href="#" onclick="location.href='statistics.do';">Data Statistics</a></li>  
      <li><a href="#" onclick="location.href='documentation.do';">Documentation</a></li>
      <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %> 
       <li><a href="#" onclick="location.href='userAudit.do?directorateId=10';">User Login Audit</a></li>  
    <%} %>
    </ul>
  </li> 
  </ul>
  <div id="userInfo" class="userInfo"><% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  <label style="font-weight:none;font: normal 18px thahoma;font-size:15px;margin-left:200px;margin-top:7px;" onclick="location.href='shdrcHome.do';" >Home Page</label><%} %>  <label style="font-weight:none;font: normal 18px thahoma;font-size:15px;margin-left:800px;margin-top:7px;">Logged User: <%=UserInfo.getLoggedInUserName() %></label>
 <label id="logoutButton" class="logoutButton" onclick="location.href='userSessionInvalidate.do';" class="btn btn-default btn-sm" style="font: normal 18px thahoma;height:100px;margin-left:50px;">
            Logout</label></div>
</div>
</div>

	<div style="width:100%;background:white; height:40%; margin-left: 10px;">	
	    <div><P style="font-size:13px;font-weight:bold;background-color: #b3e6cc;" >GPS Status</P></div>
	    <div class="nav navbar-nav navbar-right" id="drop">
    <div class="dropdown">
 		 <a id="click" href="#" data-toggle="dropdown" style="font-size: 13px;margin-left: -50px;font-weight: bold;color:blue;"><u>BROWSE ALL DASHBOARD  &#9776;</u></a>
   	<div class="dropdown-menu" id="dm">
         <div class="row"> 
             <a class="ex-link" href="<%=request.getContextPath()%>/108LiveGPSStatus.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">GPS Status</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/totalCaseAvailed.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Total Cases Availed</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108TotalTrips.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Total Trips</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108cycleTime.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Cycle Time</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/kilometersCovered.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Kilometers Covered</div></a>
             <!-- <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Hot Spot Alert</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Ambulance @Base Location</div></a> -->
         </div>
         <!-- <div class="row">
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Ambulance on Case</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Ambulance @ Hot Spot</div></a> 
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Vehicles Down</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Idle Time</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Cycle Time</div></a>
         </div> -->
         <div class="row">                
         	<a class="ex-link" href="<%=request.getContextPath()%>/ambulanceReport.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">360 View</div></a> 
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Trauma (Vehicular)"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Trauma Emergency</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Pregnancy related"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Pregnancy</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Fire/Burns"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Fire Burn</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Neonatal(upto 1 month)"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Neonatal</div></a>            
         </div>
         <div class="row">   
         <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Accidental Poisoning"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Poison</div></a>              
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Allergic Reactions"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Allergy Alert</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Disasters due to Natural elements"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Natural Disaster</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Animal Attack"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Animal Bite</div></a>  
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Epilepsy"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Epilepsy</div></a>            
         </div>
         <div class="row">  
         <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Paediatric(1-12years)"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Paediatric-Emergencies</div></a>               
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Diabetes"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Diabetes</div></a> 
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Fevers / Infections"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Fever</div></a>
          </div>
          </div>
    </div>
    </div>
	    
		<div id="chart-container0" style="float:left;width:16%;height:350px;overflow:auto;overflow-x:hidden;">
		<table id="indTable1" style="width:100%;font-size:small;height:350px; border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
		<thead>
		<tr style="font-size:small">Ambulance By District</tr>
		<tr style="font-size:small">
		<td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white ">District Name</td>
		<td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white ">Amb_count </td>
		</tr>
		</thead>
				<tbody id="indTable" style="height:350px;" name="jsonData"  >
		<%
		JSONObject row=null;
		Object jsonDataObj=request.getAttribute("jsonData");
		if(jsonDataObj!=null){
			JSONArray data=(JSONArray)jsonDataObj;
			 for(int i=0;i<data.length();i++){
			 row=data.getJSONObject(i);%>
		 <tr id=<%=row.get("districtName")%> style="font-size:small;overflow: scroll;">
		 <td onclick="showBaseLocation(this,0);" style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:10px;"><%=row.get("districtName")%></td>
		 <td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:10px;"><%=row.get("noOfAmb")%></td>
		 </tr>
		 <%}}%>
		 </tbody>
		</table>
		</div>
		
		
		
		<div id="chart-container0" style="float:left;width:11%;height:350px;overflow:auto;margin-left: 10px;">
		<table id="ambLocTable" style="width:100%;height:350px;font-size:small;border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
		<thead>
		<tr style="font-size:small">
		<td>Amb Details-<span style="font-size: 11px;color: blue;" id='districtName'></span></td>
		</tr>
		<tr style="font-size:small">
		<td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white ">Vehicle No</td>
		</tr>
		</thead>
		<tbody id="indTable2"  name="baseLocAmbList" style="font-size:10px;" >
	
		 </tbody>
		</table>
		</div>
	
	
	<div style="width:34%;float:left; margin-left: 10px;">		
				<div id="topLeft" align="center" style="width:100%;height:360px;float:left;margin-top:1px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<label>Ambulance Base Location Plot in <span style="font-size: 11px;color: blue;" id='districtNameVal'></span></label>
					<i id="zoomIcon" class="glyphicon glyphicon-zoom-in" onclick="showMapPopupDetails();" style="font-size:12px;cursor: pointer; color:black; padding-left: 10px;"></i>	
					<button onclick="myFunction()">View in TNega_Map</button>
					<div id="map" class="col-md-6" style="width:99%;height:320px;"></div>
					
					
				</div>
				
			</div>
			
			<div style="width:34%;float:right; margin-right: 20px;">		
				<div id="topLeft" align="center" style="width:100%;height:360px;float:left;margin-top:1px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<label>GPS Tracking-<span style="font-size: 11px;color: blue;" id='vehicleNoVal'></span></label>
					
					<div id="pathMap" class="col-md-6" style="width:93%;height:320px;"></div>
					
					
				</div>
				
			</div> </div>
	<!-- <div><div id="pathMap"></div></div> -->
<!-- 	<div id="floating-panel">
  <button onclick="toggleHeatmap()">Toggle Heatmap</button>
  <button onclick="changeGradient()">Change gradient</button>
  <button onclick="changeRadius()">Change radius</button>
  <button onclick="changeOpacity()">Change opacity</button>
</div>

    <div id="pathMap"></div> -->
    
    <%-- <div style="background:#006080;height:40px;font-size:11px;color: white;line-height:35px;margin-top:-4px;margin-right:3px;margin-left:-1px;width:100% "><center>© SHDRC All Rights Reserved. Best Viewed using Chrome or Firefox 3.0 and above. Screen Resolution 1140 x 900</center></div> --%>
<input type="hidden" id="selectedDistVal" value="<%= request.getAttribute("districtName") %>">

 	<!-- Map POP-UP -->   
	   <div id="createNewTableMap" class="createNewTableMap" align="center"  >
	    	<div class="createNewTable-contentMap" align="center" >
	        	<div class="createNewTable-headerMap">
	            	<span class="createNewTable-reportCloseMap">×</span>
	                <label  id="createNewMapPopUpHeadingMap">Ambulance Base Location Plot </span></label>
	            </div>
	           	<div class="createNewTable-bodyMap">	           	
	            	<div id="mapPop" class="col-md-6" align="center" style="height:600px;width:110%;">
	            	</div>
	            </div>
	            <div class="createNewTable-footerMap"></div>
	        </div>                             
	   	</div> 
	   	
	   	<div class="loader"></div> 
	   		<div style="float:left;width:50%;">
		<div id="tickerData"  style="width:100%;height:280px;border:1px solid black; margin-left: 10px;margin-top: 10px;margin-bottom: 10px;overflow: auto;">
		<table id="tickerTable"  align="center" style="width:99%;font-size:small;height:auto;background-color:black ;margin-top: 10px;">
			<thead>
			<tr style="font-size:small">
			<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color: black; color: #CCFFFF; "> District Name</td>
			<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Total Ambulance </td>
			<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Amb in base location </td>
			<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Amb in case</td>
			<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; ">Vehicle down</td>
			</tr>
			</thead>
			<tbody>
			
			</tbody>		
		</table>		
		</div>
	</div>
	<div style="background:#e0ebeb;height:280px;margin-top:96px;margin-left:815px;width:47%;border:0.1px solid black;">
	<div>
	<label id="talukMarqueHeader" style="font-weight:bold;font-size:12px;color:black;margin-left:8px;"></label>
	<marquee id="marqueeTaluk"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="margin-top:5px;float:right;height:15px;width:99%;position:relative;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
	</div>
	<div>
	<label id="villageMarqueHeader" style="font-weight:bold;font-size:12px;color:black;margin-left:8px;"></label>
	<marquee id="marqueeVillage"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="margin-top:5px;float:right;height:15px;width:99%;position:relative;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
	</div>
	<div style="margin-top:30px;">
		<label id="predictionScrollHeader" style="font-weight:bold;margin-top:20px;font-size:12px;color:black;margin-left:8px;">Prediction data for next 2 hours</label>
		<div id="pscroller1" class="pausescroller" style="margin-top:5px;font-size:10px;color:black;margin-left:8px;">
		</div>
	</div> 
	</div>
</body>

<div class="loader"></div>   

<script>


var all_tr = $('#indTable tr');
$('#indTable td').on('click', function () {
   all_tr.removeClass('selected');
   $(this).closest('#indTable tr').addClass('selected');
});

 function onLoad(){
	 $(".loader").fadeIn();
	var districtName = "<%= request.getAttribute("districtName") %>";
	var baseLocAmbList = <%= request.getAttribute("baseLocAmbList") %>;
	var gisBaseList = <%= request.getAttribute("gisBaseList") %>;
	var gisAmbCurrentLoc = <%= request.getAttribute("gisAmbCurrentLoc") %>;
	var gisPathStatusList = <%= request.getAttribute("gisPathStatusList") %>;
	var parentJSON = <%= request.getAttribute("parentJSON") %>;
	var vehicleNo = "<%= request.getAttribute("vehicleNo") %>";
	document.getElementById("distName").value = districtName;
	document.getElementById("selectedDistVal").value="ARIYALUR"
	 displayTopMiddleTableData(parentJSON); 
	InstitutionMap(gisBaseList,parentJSON,vehicleNo,10,'map');
	getAmbulancePath(gisPathStatusList);		

	$('#indTable1 tbody.paginated').each(function() {
		   var currentPage = 0;
		   var numPerPage = 12;
		   var $table = $(this);
		   $table.bind('repaginate', function() {
		       $table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
		   });
		   $table.trigger('repaginate');
		   var numRows = $table.find('tr').length;
		   var numPages = Math.ceil(numRows / numPerPage);
		   var $pager = $('<div class="pager"></div>');
		   for (var page = 0; page < numPages; page++) {
		       $('<span class="page-number"></span>').text(page + 1).bind('click', {
		           newPage: page
		       }, function(event) {
		           currentPage = event.data['newPage'];
		           $table.trigger('repaginate');
		           $(this).addClass('active').siblings().removeClass('active');
		       }).appendTo($pager).addClass('clickable');
		   }
		   $pager.insertAfter($table).find('span.page-number:first').addClass('active');
		});
	document.getElementById('districtNameVal').innerHTML = districtName;
	document.getElementById('vehicleNoVal').innerHTML = vehicleNo;
	document.getElementById('districtName').innerHTML = districtName;
	
	

	var ambBaseLocTickerData = <%= request.getAttribute("ambBaseLocTickerData")%>;
	displayTickerTable(ambBaseLocTickerData);
	
	var talukScrollData = "<%= request.getAttribute("talukScrollData") %>";
	var villageScrollData = "<%= request.getAttribute("villageScrollData") %>";
	var predictionScrollData = <%= request.getAttribute("predictionScrollData")%>;
	
	document.getElementById("talukMarqueHeader").innerText = "Taluk-wise case count in "+districtName+" for last 2 hours";
	document.getElementById("villageMarqueHeader").innerText = "Village-wise case count in "+districtName+" for last 2 hours";
	
	if(talukScrollData == "null"){
		talukScrollData = "No case is recorded in "+districtName+" for last 2 hours";
	}
	if(villageScrollData == "null"){
		villageScrollData = "No case is recorded in "+districtName+" for last 2 hours";
	}
	
	document.getElementById("marqueeTaluk").innerText = talukScrollData;
	document.getElementById("marqueeVillage").innerText = villageScrollData;
	
	var pausecontent = new Array();
    var arrowupRedIcon = '<i class="fa fa-caret-up" style="color:red;font-size:15px;padding-left: 10px;"></i>';
    var arrowupAmberIcon = '<i class="fa fa-caret-up" style="color:#F5F500;font-size:15px;padding-left: 10px;"></i>';
    var arrowdownGreenIcon = '<i class="fa fa-caret-down" style="color:green;font-size:15px;padding-left: 10px;"></i>';
    var noDataIcon = '<i class="fa fa-exclamation-triangle" style="color:blue;font-size:10px;padding-left: 10px;"></i>'; 
    var firstIcon;
    var secondIcon;
    var thirdIcon;
    var fourthIcon;
    var fifthIcon;
    var sixthIcon;
    var firstRowColor;
    var secondRowColor;
    var thirdRowColor; 
    var fourthRowColor; 
    var fifthRowColor; 
    var sixthRowColor; 
    
    for(var i = 0; i < predictionScrollData.length; i++) {
    	if(predictionScrollData[i][3]=="Red"){
        	firstIcon = arrowupRedIcon;
        	firstRowColor = "red";
        }
        else if(predictionScrollData[i][3]=="Green"){
        	firstIcon = arrowdownGreenIcon;
        	firstRowColor = "green";
        }
        else if(predictionScrollData[i][3]=="Yellow"){
        	firstIcon = arrowupAmberIcon;
        	firstRowColor = "yellow";
        }
        else if(predictionScrollData[i][3]=="Blue"){
            firstIcon = noDataIcon;
            firstRowColor = "blue";
        }
    	if(predictionScrollData[i+1][3]=="Red"){
    		secondIcon = arrowupRedIcon;
    		secondRowColor = "red";
        }
        else if(predictionScrollData[i+1][3]=="Green"){
        	secondIcon = arrowdownGreenIcon;
        	secondRowColor = "green";
        }
        else if(predictionScrollData[i+1][3]=="Yellow"){
        	secondIcon = arrowupAmberIcon;
        	secondRowColor = "yellow";
        }
        else if(predictionScrollData[i+1][3]=="Blue"){
        	secondIcon = noDataIcon;
        	secondRowColor = "blue";
        }
    	if(predictionScrollData[i+2][3]=="Red"){
    		thirdIcon = arrowupRedIcon;
    		thirdRowColor = "red";    		
        }
        else if(predictionScrollData[i+2][3]=="Green"){
        	thirdIcon = arrowdownGreenIcon;
        	thirdRowColor = "green";
        }
        else if(predictionScrollData[i+2][3]=="Yellow"){
        	thirdIcon = arrowupAmberIcon;
        	thirdRowColor = "yellow";
        }
        else if(predictionScrollData[i+2][3]=="Blue"){
            thirdIcon = noDataIcon;
            thirdRowColor = "blue";
        }
    	if(predictionScrollData[i+3][3]=="Red"){
    		fourthIcon = arrowupRedIcon;
    		fourthRowColor = "red";    		
        }
        else if(predictionScrollData[i+3][3]=="Green"){
        	fourthIcon = arrowdownGreenIcon;
        	fourthRowColor = "green";
        }
        else if(predictionScrollData[i+3][3]=="Yellow"){
        	fourthIcon = arrowupAmberIcon;
        	fourthRowColor = "yellow";
        }
        else if(predictionScrollData[i+3][3]=="Blue"){
        	fourthIcon = noDataIcon;
        	fourthRowColor = "blue";
        }
    	if(predictionScrollData[i+4][3]=="Red"){
    		fifthIcon = arrowupRedIcon;
    		fifthRowColor = "red";    		
        }
        else if(predictionScrollData[i+4][3]=="Green"){
        	fifthIcon = arrowdownGreenIcon;
        	fifthRowColor = "green";
        }
        else if(predictionScrollData[i+4][3]=="Yellow"){
        	fifthIcon = arrowupAmberIcon;
        	fifthRowColor = "yellow";
        }
        else if(predictionScrollData[i+4][3]=="Blue"){
        	fifthIcon = noDataIcon;
        	fifthRowColor = "blue";
        }
    	if(predictionScrollData[i+5][3]=="Red"){
    		sixthIcon = arrowupRedIcon;
    		sixthRowColor = "red";    		
        }
        else if(predictionScrollData[i+5][3]=="Green"){
        	sixthIcon = arrowdownGreenIcon;
        	sixthRowColor = "green";
        }
        else if(predictionScrollData[i+5][3]=="Yellow"){
        	sixthIcon = arrowupAmberIcon;
        	sixthRowColor = "yellow";
        }
        else if(predictionScrollData[i+5][3]=="Blue"){
        	sixthIcon = noDataIcon;
        	sixthRowColor = "blue";
        }
    	if(predictionScrollData[i][2]==-1){
    		predictionScrollData[i][2] = "No Data";
        }
    	if(predictionScrollData[i+1][2]==-1){
    		predictionScrollData[i+1][2] = "No Data";
        }
    	if(predictionScrollData[i+2][2]==-1){
    		predictionScrollData[i+2][2] = "No Data";
        }
    	if(predictionScrollData[i+3][2]==-1){
    		predictionScrollData[i+3][2] = "No Data";
        }
    	if(predictionScrollData[i+4][2]==-1){
    		predictionScrollData[i+4][2] = "No Data";
        }
    	if(predictionScrollData[i+5][2]==-1){
    		predictionScrollData[i+5][2] = "No Data";
        }
        
    	 pausecontent.push('<span style="color:'+firstRowColor+'">'+predictionScrollData[i][0]+'-'+predictionScrollData[i][1]+':00'+'-  '+predictionScrollData[i][2]+firstIcon+'</br>'+'</span>'+'<span style="color:'+secondRowColor+'">'+predictionScrollData[i+1][0]+'-'+predictionScrollData[i+1][1]+':00'+'-  '+predictionScrollData[i+1][2]+secondIcon+'</br>'+'</span>'+'<span style="color:'+thirdRowColor+'">'+predictionScrollData[i+2][0]+'-'+predictionScrollData[i+2][1]+':00'+'-  '+predictionScrollData[i+2][2]+thirdIcon+'</span>'+'</br>'+'</br>'+'<span style="color:'+fourthRowColor+'">'+predictionScrollData[i+3][0]+'-'+predictionScrollData[i+3][1]+':00'+'-  '+predictionScrollData[i+3][2]+fourthIcon+'</br>'+'</span>'+'<span style="color:'+fifthRowColor+'">'+predictionScrollData[i+4][0]+'-'+predictionScrollData[i+4][1]+':00'+'-  '+predictionScrollData[i+4][2]+fifthIcon+'</br>'+'</span>'+'<span style="color:'+sixthRowColor+'">'+predictionScrollData[i+5][0]+'-'+predictionScrollData[i+5][1]+':00'+'-  '+predictionScrollData[i+5][2]+sixthIcon+'</span>');
         i=i+5;
    }
    scroller1.populate(pausecontent);
    
    $(".loader").fadeOut();
}
 
 
 function displayTickerTable(ambBaseLocTickerData){
		var $select=$('#tickerTable tbody');
		$select.find('tr').remove();
		  for(i=0;i<ambBaseLocTickerData.length;i++){
		  	  	$("#tickerTable tbody").append('<tr onclick="districtOnClick(this);" style="color:white;font: normal 10px thahoma;"><td style=" border: 1px solid black;cursor: pointer;"> '+ambBaseLocTickerData[i].district+' </td><td style="text-align: center; border: 1px solid black;"> '+ambBaseLocTickerData[i].totAmb+'</td><td style="text-align:center; border: 1px solid black;background:'+ambBaseLocTickerData[i].baseLocFlag+'">'+ambBaseLocTickerData[i].ambBaseLoc+'</td><td style="text-align:center; border: 1px solid black;background:'+ambBaseLocTickerData[i].ambCaseFlag+'">'+ambBaseLocTickerData[i].ambCase+'</td><td style="text-align:center; border: 1px solid black;">'+ambBaseLocTickerData[i].vehDown+'</td></tr>');
		  }
	}
 function myFunction() {
	    /* alert("Hello World"); */
	   /*  var url = "http://tngis.tn.gov.in/thematic_atlas/thememap1.php?uploaded_file_name=http://tngis.tn.gov.in/thematic_atlas/xml/servicejson1.php?filetype=json"; */
	   var tnegaurl = "http://tngis.tn.gov.in/thematic_atlas/thememap1.php?uploaded_file_name=" ;
	   /*  var url = tnegaurl + webUrl +"ambulanceTnega.do?filetype=json"; */
	   var url = tnegaurl + hostName+contextPath+"/ambulanceTnega.do?filetype=json"; 
	   window.open(url, null,
		"height=900,width=1400,status=yes,toolbar=no,menubar=no,location=no");
	    $.ajax({type:"GET",
        	url:'ambulanceTnega.do',
       		contentType: "application/json",
        	dataType: "json", 
         'data':  { 
                      
         },
         success: function (result) {
/* alert("success"); */
         },
error: function (xhr, status, error) {
alert("Internal Error Occured-Please Contact System Administrator");
}
}
	  ); 
	    
	    
	}

	
	<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath+"/";
	%>
	var webUrl='<%=webUrl%>';
	var contextPath='<%=contextPath%>';
	var hostName='<%=hostName%>';
 function districtOnClick(val){
	    var district = $(val).find('td:first').text();
	    var all_tr = $('#tickerTable tbody tr');
	    all_tr.removeClass('highlightSelected');
	    $(val).addClass('highlightSelected');
	    district=district.trim();
	    $(".loader").fadeIn();
	    
	    $.ajax({type:"POST",
	                    url:'getScrollByDistrict.do',
	                    'data':  { 
	                                    districtName:district
	                    },
	                    success: function (result) {
	                                    var jsonData = JSON.parse(result);           
	                                    var talukScrollData=jsonData.talukScrollData;
	                                    var villageScrollData=jsonData.villageScrollData;
	                                    
	                                    document.getElementById("talukMarqueHeader").innerText = "Taluk-wise case count in "+district+" for last 2 hours";
	                                    document.getElementById("villageMarqueHeader").innerText = "Village-wise case count in "+district+" for last 2 hours";
	                                    
	                                    if(talukScrollData == "null"){
	                                                    talukScrollData = "No case is recorded in "+district+" for last 2 hours";
	                                    }
	                                    if(villageScrollData == "null"){
	                                                    villageScrollData = "No case is recorded in "+district+" for last 2 hours";
	                                    }
	                                    
	                                    document.getElementById("marqueeTaluk").innerText = talukScrollData;
	                                    document.getElementById("marqueeVillage").innerText = villageScrollData;
	                                    $(".loader").fadeOut();
	                    },
	   error: function (xhr, status, error) {
	alert("Internal Error Occured-Please Contact System Administrator");
	        }
	    }); 
	    
	}
 
 createNewTableMap.style.display = "none";
 $('.createNewTable-reportClose').click(function() {
	 createNewTableMap.style.display = "none";
		$("#mapPop").empty();
	});
 
 $('.createNewTable-reportCloseMap').click(function() {
		
		createNewTableMap.style.display = "none";	
		$("#mapPop").empty();
	});
	$('#mapPop').prop('contenteditable', false); 
 
 function displayTopMiddleTableData(ambIncByEmerTypeData){
		var $select=$('#ambLocTable tbody');
		$select.find('tr').remove(); 
		$('#ambLocTable  div.pager').remove(); 

		if(ambIncByEmerTypeData!=null){
		  for(i=0;i<ambIncByEmerTypeData.length;i++){
			  var ambBaseLocTablerow;
			  if(ambIncByEmerTypeData[i][4]==='Y'){ 
				 var x = "y";
				  ambBaseLocTablerow = '<tr><td  onclick="getGeoMapData(this);" style=" border: 1px solid black;cursor:pointer;"> <u>'+ambIncByEmerTypeData[i][0]+'</u></td></tr>';  
			   }else{
				   ambBaseLocTablerow = '<tr><td style=" border: 1px solid black;cursor:pointer;"> '+ambIncByEmerTypeData[i][0]+'</td></tr>';
			   }
		  	  	$("#ambLocTable tbody").append(ambBaseLocTablerow);
		  }
		}
		else{
			$("#ambLocTable tbody").append("No Data");
		}
		  
		  $('#ambLocTable tbody.paginated').each(function() {
			   var currentPage = 0;
			   var numPerPage = 12;
			   var $table = $(this);
			   $table.bind('repaginate', function() {
			       $table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
			   });
			   $table.trigger('repaginate');
			   var numRows = $table.find('tr').length;
			   var numPages = Math.ceil(numRows / numPerPage);
			   var $pager = $('<div class="pager"></div>');
			   for (var page = 0; page < numPages; page++) {
			       $('<span class="page-number"></span>').text(page + 1).bind('click', {
			           newPage: page
			       }, function(event) {
			           currentPage = event.data['newPage'];
			           $table.trigger('repaginate');
			           $(this).addClass('active').siblings().removeClass('active');
			       }).appendTo($pager).addClass('clickable');
			   }
			   $pager.insertAfter($table).find('span.page-number:first').addClass('active');
			}); 
	}
 
 function getGeoMapData(val,clickMode){
	 var vehicleNo = null;
	 if(clickMode=='mapClick')
	{	var str= val.split(":");
	var vehicleNo_temp = str[1];

	}
	 else{
	 var vehicleNo_temp =  $(val).text();
	
	 }
	 var vehicleNo = vehicleNo_temp.trim();
/* 	 alert("calling path map"+vehicleNo); */
	 //var vehicleNo = $(val).text();
	 var districtName = document.getElementById("distName").value;
	 $(".loader").fadeIn();
	 $.ajax({type:"POST",
			url:'getLiveGPSStatusStreamingData.do',
			'data':  { 
				districtName:districtName,vehicleNo:vehicleNo
			},
			success: function (result) {
				var jsonData = JSON.parse(result);
				InstitutionMap(jsonData.gisBaseList,jsonData.parentJSON,jsonData.vehicleNo,10,'map');
				getAmbulancePath(jsonData.gisPathStatusList);	
				document.getElementById('vehicleNoVal').innerHTML = vehicleNo;
				$(".loader").fadeOut();
			 },
	      	error: function (xhr, status, error) {
	            alert("Internal Error Occured-Please Contact System Administrator");
		    }
		});
 } 
  
  function showMapPopupDetails(){
		var createNewTable = document.getElementById('createNewTableMap');
		createNewTable.style.display = "block";
		
		$("#mapPop").empty();
		var districtName = document.getElementById("distName").value; 
		$(".loader").fadeIn();
		 $.ajax({type:"POST",
				url:'getLiveBaseLocAmbByDistrict.do',
				'data':  { 
					district:districtName
				},
				success: function (result) {
					var jsonData = JSON.parse(result);	
					 displayTopMiddleTableData(jsonData.parentJSON); 
					InstitutionMap(jsonData.gisBaseList,jsonData.parentJSON,jsonData.vehicleNo,12,'mapPop');
					getAmbulancePath(jsonData.gisPathStatusList);	
					document.getElementById('districtNameVal').innerHTML = districtName;
					document.getElementById('vehicleNoVal').innerHTML = jsonData.vehicleNo;
					document.getElementById('districtName').innerHTML = districtName;		
					$(".loader").fadeOut(); 
				 },
		      	error: function (xhr, status, error) {
		            alert("Internal Error Occured-Please Contact System Administrator");
			    }
			});
		 
	
	}


 
 function startRefreshAmbLoc(){	
	 var distNew = document.getElementById("selectedDistVal").value;
	 showBaseLocation(distNew,1);
 }
 function showBaseLocation(key,index){
	 clearInterval(myVar);
	 var district;
	 if(index===0){
		 district=key.innerText;
		 document.getElementById("selectedDistVal").value=district;
	 }else{
		 district=document.getElementById("selectedDistVal").value;
	 }
	 document.getElementById("distName").value = district;	
	 $(".loader").fadeIn(); 
	 $.ajax({type:"POST",
		url:'getLiveBaseLocAmbByDistrict.do',
		'data':  { 
			district:district
		},
		success: function (result) {
			var jsonData = JSON.parse(result);	
			 displayTopMiddleTableData(jsonData.parentJSON); 
			InstitutionMap(jsonData.gisBaseList,jsonData.parentJSON,jsonData.vehicleNo,10,'map');
			getAmbulancePath(jsonData.gisPathStatusList);	
			document.getElementById('districtNameVal').innerHTML = district;
			document.getElementById('vehicleNoVal').innerHTML = jsonData.vehicleNo;
			document.getElementById('districtName').innerHTML = district;			
			$(".loader").fadeOut(); 
		 },
      	error: function (xhr, status, error) {
            alert("Internal Error Occured-Please Contact System Administrator");
	    }
	});
	 var myVar = setInterval(startRefreshAmbLoc, 30000000);
 }
 
 function InstitutionMap(gisBaseList,gisAmbCurrentLoc,vehicleNo,zoomSize,divId){	
	  var locations = gisBaseList; 
	  var locations2 =gisAmbCurrentLoc;
				   		      
	    var map = new google.maps.Map(document.getElementById(divId), {
	        zoom: zoomSize ,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,	
	    });
	    
	    
	    var trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);

	     
	    navigator.geolocation && navigator.geolocation.getCurrentPosition(showPosition, showError) == undefined && showError();	
	    var infowindow = new google.maps.InfoWindow();	
	    var marker, i;	
	   
	      for (i = 0; i < locations.length; i++) {

	
	        marker = new google.maps.Marker({
	          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	          /* icon: new google.maps.MarkerImage('images/Ambulance-Transparent.png',null, null, null, new google.maps.Size(25, 25)), */
	          label: "DistName",
	          color:"green",
	          map: map,	
	          optimized: false,
	          /* animation: google.maps.Animation.DROP */
	        });	
	      
	      
	      
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	          return function() {
	            infowindow.setContent(locations[i][0]);
	            infowindow.open(map, marker);
	          }
	        })(marker, i));
	      }
	
	      function showPosition(position) {

	        lat = locations2[3][1];
	        lon = locations2[3][2]; 
	        latlon = new google.maps.LatLng(lat, lon);
	        map.setCenter(latlon);
	        enableHighAccuracy: true;
	        for (i = 0; i < locations2.length; i++) {
	        marker = new google.maps.Marker({
		          position: new google.maps.LatLng(locations2[i][1], locations2[i][2]),
		          icon: new google.maps.MarkerImage('images/siren.gif',null, null, null, new google.maps.Size(25, 25)),
		          map: map,	
		          optimized: false,
		          animation: google.maps.Animation.DROP
		        });
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
		          return function() {
		            infowindow.setContent(locations[i][0]);
		            infowindow.open(map, marker);
		            getGeoMapData(locations[i][0],"mapClick");
		          }
		          
		         
		        })(marker, i));
	        
	        }
	      	     
	        circle = new google.maps.Circle({
	          map: map,
	          clickable: false,
	          // metres
	          radius: 2500,
	          //fillColor: '#fff',
	          fillOpacity: .1,
	          strokeColor: '#e24545',
	          strokeOpacity: .4,
	          strokeWeight: .9
	        });
	        // attach circle to marker
	        circle.bindTo('center', marker, 'position');
	

	      }
	
	      function showError(error) {
	        map.setCenter(new google.maps.LatLng(10.964289, 78.056801)); // default 1st from array
	      }
		}
 function getAmbulancePath(gisPathStatusList){ 
	 var map, heatmap;
	 var realData=[];
	 
      for(var i in gisPathStatusList){
   	   realData.push(new google.maps.LatLng(gisPathStatusList[i][1],gisPathStatusList[i][2]));
      }
	
	   map = new google.maps.Map(document.getElementById('pathMap'), {
	     zoom: 10,
	     center: {lat: parseFloat(gisPathStatusList[0][1]), lng:parseFloat(gisPathStatusList[0][2])},
	     
	     mapTypeId: google.maps.MapTypeId.ROADMAP,	
	   }); 
	   
	    
	    var trafficLayer = new google.maps.TrafficLayer();
       trafficLayer.setMap(map);
       
	   heatmap = new google.maps.visualization.HeatmapLayer({
	     data: realData,
	     map: map
	   });
	 }

		 function toggleHeatmap() {
		   heatmap.setMap(heatmap.getMap() ? null : map);
		 }

		 function changeGradient() {
		   var gradient = [
		     'rgba(0, 255, 255, 0)',
		     'rgba(0, 255, 255, 1)',
		     'rgba(0, 191, 255, 1)',
		     'rgba(0, 127, 255, 1)',
		     'rgba(0, 63, 255, 1)',
		     'rgba(0, 0, 255, 1)',
		     'rgba(0, 0, 223, 1)',
		     'rgba(0, 0, 191, 1)',
		     'rgba(0, 0, 159, 1)',
		     'rgba(0, 0, 127, 1)',
		     'rgba(63, 0, 91, 1)',
		     'rgba(127, 0, 63, 1)',
		     'rgba(191, 0, 31, 1)',
		     'rgba(255, 0, 0, 1)'
		   ]
		   heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
		 }

		 function changeRadius() {
		   heatmap.set('radius', heatmap.get('radius') ? null : 20);
		 }

		 function changeOpacity() {
		   heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
		 }

		 // Heatmap data: 500 Points
		 function getPoints(gisPathStatusList) {	
			 var realData=[];
			 <%-- var testArray = <%= request.getAttribute("gisPathStatusList") %>; --%>
		           for(var i in gisPathStatusList){
		        	   realData.push(new google.maps.LatLng(gisPathStatusList[i][0],gisPathStatusList[i][1]));
		           }
				return realData;

		 }
	/*  } */
 </script> 
 </html>
 
	


