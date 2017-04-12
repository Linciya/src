<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		<script src="gis/jsondata.js"></script>
		<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_UN3281vLu65MNaK-y6w2XFxN_Wvo97M&libraries=visualization" type="text/javascript"> -->
		<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeZt8_jdE79lYb_YNd1UiUvEf8UcGLsf4&libraries=visualization" type="text/javascript"></script>
       	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
		<%
		String userTier=UserInfo.getUserTier();
		List<String> userRoleList=UserInfo.getUserRoleList();
		JSONArray jsonUserRole=new JSONArray(userRoleList);
		%>
		<style>
			.subMenu{
				/* color:#A52A2A; */
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
			var userRoleArr = <%= jsonUserRole %>;
			function doDataEntry(){
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
       				case "<%= ShdrcConstants.Role.DMS %>"	:	directorateServlet= "/dmsDataEntry.do";
           														break;
			       	case "<%= ShdrcConstants.Role.DPH %>"	:	directorateServlet= "/dphDataEntry.do";
			        											break;
			       	case "<%= ShdrcConstants.Role.TNMSC %>"	:	directorateServlet= "/tnmscDataEntry.do";
			        										 	break;
			       	case "<%= ShdrcConstants.Role.TANSACS %>"	:	directorateServlet="/tansacsDataEntry.do";
			        										   		break;
			       	case "<%= ShdrcConstants.Role. NRHM %>"	:	directorateServlet= "/nrhmDataEntry.do";
			        											break;
			       	case "<%= ShdrcConstants.Role.RNTCP %>"	:	directorateServlet= "/rntcpDataEntry.do";
			        											break;
			        case "<%= ShdrcConstants.Role.MA %>"	:	directorateServlet= "/maDataEntry.do";
			        											break;
					case "<%= ShdrcConstants.Role.DME %>"	:	directorateServlet= "/dmeDataEntry.do";
			        											break;
					case "<%= ShdrcConstants.Role.DRMGR %>"	:	directorateServlet= "/drmgrDataEntry.do";
			        											break;
					case "<%= ShdrcConstants.Role.DFW %>"	:	directorateServlet= "/dfwDataEntry.do";
			        											break;
					case "<%= ShdrcConstants.Role.SHTO %>"	:	directorateServlet= "/shtdDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.COC %>"	:	directorateServlet= "/cocDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.SBCS %>"	:	directorateServlet= "/sbcsDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.DCA %>"	:	directorateServlet= "/dcaDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.MRB %>"	:	directorateServlet= "/mrbDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.DFS %>"	:	directorateServlet= "/dfsDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.CMCHIS %>"	:	directorateServlet= "/cmchisDataEntry.do";
                    												break;
					case "<%= ShdrcConstants.Role.DIM %>"	:	directorateServlet= "/dimDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.NLEP %>"	:	directorateServlet= "/nlepDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.SBHI %>"	:	directorateServlet= "/sbhiDataEntry.do";
                    											break;
					case "<%= ShdrcConstants.Role.ESI %>"	:	directorateServlet= "/esiDataEntry.do";
                    											break;			
					case "<%= ShdrcConstants.Role.ALLDIRECTORATE %>"	:	directorateServlet= "/dmsDataEntry.do";
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
			    -webkit-animation-duration: 0.4s;
			    animation-duration: 0.4s;
			}
			.createNewTable-contentMap{
				position: absolute;
			    background-color: #fefefe;
			    margin: auto;
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
			.createNewTable-reportCloseMap{
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
			    height:22px;   
			    line-height: 12px;
			    margin-top:-20px; 
			    width:110%;    
			}
			.createNewTable-bodyMap {
				 height: 600px;
				width:110%;
			}
			.createNewTable-footerMap {			
		    	padding: 2px 16px;
   				background-color: #3fadb5;
   			    height:22px;
		        width:110%; 
			}
			#map {
				height: 350px;			
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
				width:10px;
				height:10px;
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
				height: 350px;
				width: 100%;
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
			.row a:hover .arrow{
				color:#999;
			} 
			/* Toggle Menu End*/
			.createNewTable{
                 display: none; /* Hidden by default */
                 position: fixed; /* Stay in place */
                 z-index: 2; /* Sit on top */
                 padding-top: 10px; /* Location of the box */
                 left: 0;
                 top: 190px;             
                 margin-left:200px;
                 width: 70%; /* Full width */
                 height: 600px; /* Full height */
                 overflow: auto; /* Enable scroll if needed */               
                  }

                  
			/* Modal Content */
			.createNewTable-content{
			   padding-top: -25px;
			   position: relative;
			   background-color: #fefefe;
			   /* margin: auto; */
			   padding: 0;
			   border: 1px solid #888;
			   width: 100%;
			   box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
			   -webkit-animation-name: animatetop;
			   -webkit-animation-duration: 0.4s;
			   animation-name: animatetop;
			   animation-duration: 0.4s;			   
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
			            
			.createNewTable-reportClose:hover,
			.createNewTable-reportClose:focus {
			    color: white;
			    text-decoration: none;
			    cursor: pointer;
			}
			      
			.createNewTable-header {
			    padding: 2px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;   
			    line-height: 12px;     
			}
		            
			.createNewTable-body {
			      padding: 2px 16px;
			      overflow: auto;
			}
			
			.createNewTable-footer {
			    padding: 2px 16px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;
			}
		</Style>
		<link rel="stylesheet" type="text/css" href="css/dropdown.css">
	</head>
	
	<body onload="onLoad();">
		<input id="distName"  type="hidden" name="distName"/>
		<div id="mainDIV">
			<img alt="" src="images/shdrc top2.png" style="margin-top:-12px; width:100%; height:60%;" width="100%" height="45%">
			<div id="subMenu" class="subMenu">
				<ul class="dropDownMenu">
					<li class="parent"><a id="refClass" href="" style="margin-left:-40px;width:150px;text-align:center;color:black">User Menu</a>
		  				<ul class="children">
						  	<%	if(ShdrcConstants.UserTier.TIER3.equalsIgnoreCase(userTier) 
										|| ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)
										||(userRoleList.contains("AllDirectorate") )){	%>
						    	<li><a href="#" onclick="doDataEntry();" >Data Entry Forms</a></li>
						      	<li><a href="#" onclick="location.href='uploadExcel.do';">Upload Data Files</a></li>
						   	<%} %>   
							<li><a href="#" onclick="location.href='changePassword.do';" >Change Password</a></li>
						    <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  
						    	<li><a href="#" onclick="location.href='messageAlert.do';">Notification/News</a></li>
						    <%} %>
						    <%	if((userRoleList.contains("AllDirectorate") )){%>
						     	<li><a href="userManagement.do" >Add User</a></li>
						   	<%} %>      
					      	<li><a href="#" onclick="location.href='modifyUser.do';">Modify User</a></li>
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
  				<div id="userInfo" class="userInfo"><% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  
  					<label style="font-weight:none;font: normal 18px thahoma;font-size:15px;margin-left:200px;margin-top:7px;" onclick="location.href='shdrcHome.do';" >Home Page</label><%} %>  <label style="font-weight:none;font: normal 18px thahoma;font-size:15px;margin-left:800px;margin-top:7px;">Logged User: <%=UserInfo.getLoggedInUserName() %></label>
 					<label id="logoutButton" class="logoutButton" onclick="location.href='userSessionInvalidate.do';" class="btn btn-default btn-sm" style="font: normal 18px thahoma;height:100px;margin-left:50px;">
            			Logout
            		</label>
            	</div>
			</div>
		</div>

		<div style="width:100%;background:white; height:450px; margin-left: 10px;">	
		
		<div><P style="font-size:13px;font-weight:bold;background-color: #b3e6cc; height: 30px; margin-top: 5px;" >GPS Status <label id="Loading"><spring:message code="label_Loading"/></label>
	    	<img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:20px;"></P></div> 
		
<!-- 	    	<div><P style="font-size:13px;font-weight:bold;background-color: #b3e6cc;" >GPS Status</P></div>
 -->	    	<div class="nav navbar-nav navbar-right" id="drop">	    
    			<div class="dropdown">
		 			<a id="click" href="#" data-toggle="dropdown" style="font-size: 13px;margin-left: -50px;font-weight: bold;color:blue;"><u>BROWSE ALL DASHBOARD  &#9776;</u></a>
		   			<div class="dropdown-menu" id="dm">
		         		<div class="row"> 
		             		<a class="ex-link" href="<%=request.getContextPath()%>/108GPSStatus.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">GPS Status</div></a>
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
		
			<div style="margin-top: 8px;float: left"><label>Tamil Nadu- Active Case Count : <span id="stateActiveCount" style="font-size: 11px;color: blue;" ></span></label>   <button style="font-size: 11px;  width: 50px;height: 14px;margin-left: 232px;" onclick="myFunction()">TNega</button></div>   
            <div style="width:40%;height:570px; margin-left:570px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
                 <div id="topmiddle"  style="width:100%;height:280px;float:left;/* margin-left:-80px; */margin-top:5px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
                     <label>Amb Base Location-  <span style="font-size: 11px;color: blue;" id='districtNameVal'></span></label>
                         <i id="zoomIcon" class="glyphicon glyphicon-zoom-in" onclick="showMapPopupDetails();" style="font-size:12px;cursor: pointer; color:black; padding-left: 10px;"></i>     
                         <!-- <button onclick="myEMRIFunction()">TNega</button> -->
                         <input style="width:90px;" type="text" id="ambNoSearch"/>
                         <input type="submit" id="byBtn" value="Search" onclick="getAmbCurrentLoc()"/>
                         <div id="map" class="col-md-6" style="width:99%;height:240px"></div>                           
                  </div>      
                   <div id="topLeft"  style="width:100%;height:300px;/*  float:left; */ /* margin-left:-80px; */margin-top:290px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
                   <label>GPS Tracking-<span style="font-size: 11px;color: blue;" id='vehicleNoVal'></span></label>                          
                   <div id="pathMap" class="col-md-6" style="width:93%;height:265px"></div>
                   </div>                              
                  </div>             
            <div id="bottomRight"  style="margin-top:-570px;width:35%;height:590px;border:0.1px solid black;box-shadow: 0 0 1em olive ">
                        <div id="mapnew" class="col-md-6" style="width:93%;height:545px;margin-top:-535px"></div>
                       <div id="legend"></div> 
                  </div>
            </div>      
		
		
		<!-- Map POP-UP   --> 
	    <div id="createNewTableMap" class="createNewTableMap" align="center">
	    	<div class="createNewTable-contentMap" align="center" >
	        	<div class="createNewTable-headerMap">
	            	<span class="createNewTable-reportCloseMap">×</span>
	                <label id="createNewMapPopUpHeadingMap">Ambulance Base Location Plot</label>
	            </div>
	           	<div class="createNewTable-bodyMap">	           	
	            	<div id="mapPop" class="col-md-6" align="center" style="height:600px;width:110%;"></div>
	            </div>
	            <div class="createNewTable-footerMap"></div>
	        </div>                             
	   	</div> 
	   	
	   	<!-- <div class="loader"></div>  -->
   		<div style="float:left;width:45%;">
   		
			<div id="tickerData" style="width:50%;height:427px;border:1px solid black; margin-left: 672px;margin-top: -580px;margin-bottom: 10px;overflow: auto;">
				<p style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color: #D3D3D3; color: black; ">District Wise Count Details</p>
				<table id="tickerTable" align="center" style="width:99%;font-size:small;height:auto;background-color:black ;margin-top: -5px;">
					<thead>
						<tr style="font-size:small">
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color: black; color: #CCFFFF; "> District Name</td>
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Total Ambulance </td>
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Active Cases </td>
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Closed Cases</td>
						</tr>
					</thead>
					<tbody></tbody>		
				</table>		
			</div>
		</div>
	
		<div style="float:left;width:45%;">
			<div id="tickerData"  style="width:50%;height:150px;border:1px solid black; margin-left: 672px;margin-top: -143px;margin-bottom: 10px;overflow: auto;">
			<p style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color: #D3D3D3; color: black; ">Taluk Wise Count Details- <span style="font-size: 11px;color: #696969;" id='districtNameVals'></span></p>
				
				<table id="tickerSecondTable"  align="center" style="width:99%;font-size:small;height:auto;background-color:black ;margin-top: -5px;">
					<thead>
						<tr>
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color: black; color: #CCFFFF; "> District Name</td>
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Taluk Name </td>
							<td  style="font-size:small; border: 1px solid black;box-shadow: 0 0 1em olive; background-color:black ; color: #CCFFFF; "> Count </td>
						</tr>
					</thead>
					<tbody></tbody>		
				</table>		
			</div>
		</div>
 
		<div id="createNewTable" class="createNewTable">
			<div class="createNewTable-content">
				<div class="createNewTable-header">
					<span class="createNewTable-reportClose">×</span>
					<label id="talukCaseDetailsHeaderPopUp"></label>
				</div>
				<div class="createNewTable-body">
        			<div id="firstSec" style="width:84%;float:left;">
       					<table id="tickerPopUpTable"  align="center" style="width:119%;font-size:10px;height:auto;background-color:white ;margin-top: 10px;">
							<thead>
								<tr>
									<td style="font-size:10px;border: 1px solid black;background-color:black;color:white;"> Taluk Name </td>
									<td style="font-size:10px;border: 1px solid black;background-color:black;color:white;"> Case Id </td>
									<td style="font-size:10px;border: 1px solid black;background-color:black;color:white;"> Ambulance No</td>
									<td style="font-size:10px;border: 1px solid black;background-color:black;color:white;"> Incident City </td>
									<td style="font-size:10px;border: 1px solid black;background-color:black;color:white;"> Incident Location</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>		
					</div>
    			</div>                             
			</div>
		</div>

		<script>
			var emriActiveDet; 

 			function onLoad(){
 				
 				
 			
 	                document.getElementById("Loading").style.display="none";
 					document.getElementById("LoadingImage").style.display="none";
 				
 				
 				
				var districtName = "<%= request.getAttribute("districtName") %>";
				var gisBaseList = <%= request.getAttribute("gisBaseList") %>;
				var gisPathStatusList = <%= request.getAttribute("gisPathStatusList") %>;
				var parentJSON = <%= request.getAttribute("parentJSON") %>;
				var vehicleNo = "<%= request.getAttribute("vehicleNo") %>"; 
				var emriCaseCntDet = <%= request.getAttribute("emriCaseCntDet") %>; 
				 emriActiveDet = <%= request.getAttribute("emriActiveDet") %>; 
								
				document.getElementById("distName").value = districtName;
				document.getElementById('districtNameVal').innerHTML = districtName;
				document.getElementById('vehicleNoVal').innerHTML = vehicleNo;
				document.getElementById('districtNameVals').innerHTML = districtName; 
				
				InstitutionMap_new(emriCaseCntDet);				
			 	displayTickerTable(emriCaseCntDet);
			 	displaySecTickerTable(emriActiveDet);
				InstitutionMap(gisBaseList,parentJSON,vehicleNo,10,'map');
				getAmbulancePath(gisPathStatusList);			
 			}
 
 		 	function displayTickerTable(emriCaseCntDet){
 		 		 clearInterval(myVar);	   
 				var $select=$('#tickerTable tbody');
 				$select.find('tr').remove();
 				
 				/* emriCaseCntDet = emriCaseCntDet.sort(sortByProperty('ActiveCasesCount')); */
 				var totalCount;
 				
 			  	for(i=0;i<emriCaseCntDet.length;i++){
 			  		if(emriCaseCntDet[i].districtName != "ALL"){
 			  			$("#tickerTable tbody").append('<tr onclick="showDetailsByDistrict(this);" style="color:white;font: normal 10px tahoma;"><td style=" border: 1px solid black;cursor: pointer;"> '+emriCaseCntDet[i].districtName+' </td><td style="text-align:center;border:1px solid black;cursor: pointer;">'+emriCaseCntDet[i].Tot_Amb+'</td><td style="text-align:center; border: 1px solid black;">'+emriCaseCntDet[i].ActiveCasesCount+'</td><td style="text-align:center; border: 1px solid black;background:#6F6969;">'+emriCaseCntDet[i].ClosedCasesCount+'</td></tr>');
 			  		} 
 			  		else{
 			  			totalCount = '<tr style="background:white;color:black;font: normal 10px tahoma;"><td style=" border: 1px solid black;"> Total </td><td style="text-align:center; border: 1px solid black;">'+emriCaseCntDet[i].Tot_Amb+'</td><td style="text-align:center; border: 1px solid black;">'+emriCaseCntDet[i].ActiveCasesCount+'</td><td style="text-align:center; border: 1px solid black;">'+emriCaseCntDet[i].ClosedCasesCount+'</td></tr>';
 			  		}
 			  	}
 			  	$("#tickerTable tbody").append(totalCount); 			  
	 			 	$("#tickerTable tr").each(function(){	
	 			 		var firstRowText = $(this).find('td:nth-child(1)').text();
	 			 		if(firstRowText.trim() != 'Total'){
		 					if($(this).find('td:nth-child(3)').text()<=15){
		 			    		$(this).find('td:nth-child(3)').css('background-color','green');
			 			    }else{
			 			    	if($(this).find('td:nth-child(3)').text()>15){
			 			   		$(this).find('td:nth-child(3)').css('background-color','red');
			 			    	}
			 			    }
	 			 		}
	 				});
 			  	
 			 	 var myVar = setInterval(startRefreshAmbLoc, 60000);   
 			}
 		 	
 		 	function displaySecTickerTable(emriActiveDet){
 				var $select=$('#tickerSecondTable tbody');
 				$select.find('tr').remove();
 			  	for(i=0;i<emriActiveDet.length;i++){
 			  		$("#tickerSecondTable tbody").append('<tr onclick="popupforTalukDetails(this);" style="color:white;font: normal 10px thahoma;"><td style=" border: 1px solid black;cursor: pointer;"> '+emriActiveDet[i].districtName+' </td><td style="text-align:center; border: 1px solid black;background:green">'+emriActiveDet[i].talName+'</td><td style="text-align:center; border: 1px solid black;background:red">'+emriActiveDet[i].count+'</td></tr>');
 			  	}
 			   	var seen = {};
 			   	$('#tickerSecondTable tr').each(function() {
 					var txt = $(this).text();
 				    if (seen[txt])
 				    	$(this).remove();
 				    else
 				    	seen[txt] = true;
 				}); 
 			}
		
 			function myFunction() {
	    		var tnegaurl = "http://tngis.tn.gov.in/thematic_atlas/thememap1.php?uploaded_file_name=" ;
	   			var url = tnegaurl + hostName+contextPath+"/ambulanceTnega.do?filetype=json"; 
	   			window.open(url, null,
					"height=900,width=1400,status=yes,toolbar=no,menubar=no,location=no");
	    		$.ajax({type:"GET",
	         		url:'ambulanceTnega.do',
	         		'data':  { 
	                      
	         		},
	         		success: function (result) {
	         		},
					error: function (xhr, status, error) {
						alert("Internal Error Occured-Please Contact System Administrator");
					}
				}); 
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
 
			createNewTableMap.style.display = "none";
			$('.createNewTable-reportCloseMap').click(function() {		
				createNewTableMap.style.display = "none";	
				$("#mapPop").empty();
			});
			$('#mapPop').prop('contenteditable', false); 
 
			function getGeoMapData(val,clickMode){
	 			var vehicleNo = null;
	 			if(clickMode=='mapClick'){
	 				var str= val.split(":");
					var vehicleNo_temp = str[1];
				}
	 			else{
	 				var vehicleNo_temp =  $(val).text();
	 			}
	 			var vehicleNo = vehicleNo_temp.trim();
	 			var districtName = document.getElementById("distName").value;
	 			/* $(".loader").fadeIn(); */
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
						/* $(".loader").fadeOut(); */
			 		},
	      			error: function (xhr, status, error) {
	            		alert("Internal Error Occured-Please Contact System Administrator");
		    		}
				});
 			} 
  
  			function showMapPopupDetails(){
				var createNewTableMap = document.getElementById('createNewTableMap');
				createNewTableMap.style.display = "block";		
				$("#mapPop").empty();
				var districtName = document.getElementById("distName").value; 
				/* $(".loader").fadeIn(); */
				
		 		$.ajax({type:"POST",
					url:'getLiveBaseLocAmbByDistrict.do',
					'data':  { 
						district:districtName
					},
					success: function (result) {
						var jsonData = JSON.parse(result);	
						document.getElementById('districtNameVal').innerHTML = districtName;
						document.getElementById('vehicleNoVal').innerHTML = jsonData.vehicleNo;
						InstitutionMap(jsonData.gisBaseList,jsonData.parentJSON,jsonData.vehicleNo,12,'mapPop');
						/* $(".loader").fadeOut(); */ 
					 },
			      	error: function (xhr, status, error) {
			            alert("Internal Error Occured-Please Contact System Administrator");
				    }
				});	
			}
	  		
			function startRefreshAmbLoc(){
				/* alert("refreshing emri data..."); */
				getCaseCount();
			}
		
			function getCaseCount(){
				/*  $(".loader").fadeIn();  */
	 			$.ajax({type:"POST",
					url:'getCaseCountOnRefresh.do',
					'data':  { 
					},
					success: function (result) {
						var jsonData = JSON.parse(result);	
						displayTickerTable(jsonData);
						InstitutionMap_new(jsonData);						 		
						/* $(".loader").fadeOut();  */
			 		},
	      			error: function (xhr, status, error) {
	            		alert("Internal Error Occured-Please Contact System Administrator");
		    		}
				});
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
	     
	    		/* navigator.geolocation && navigator.geolocation.getCurrentPosition(showPosition, showError) == undefined && showError();	 */
	    		var infowindow = new google.maps.InfoWindow();	
	    		var marker, i;	
	   
	      		for (i = 0; i < locations.length; i++) {	
	        		marker = new google.maps.Marker({
	          			position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	          			icon: new google.maps.MarkerImage('images/Ambulance-Transparent.png',null, null, null, new google.maps.Size(25, 25)),
	          			map: map,	
	          			optimized: false,
	          			animation: google.maps.Animation.DROP
	        		});		      
	      
	        		google.maps.event.addListener(marker, 'click', (function(marker, i) {
	          			return function() {
	            			infowindow.setContent(locations[i][0]);
	            			infowindow.open(map, marker);
	          			}
	        		})(marker, i));
	      		}
	
	      		/* function showPosition(position) { */
	        		lat = locations2[2][1];
	        		lon = locations2[2][2]; 
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
		    	/* } */
	
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
				var testArray = <%= request.getAttribute("gisPathStatusList") %>;
			    for(var i in gisPathStatusList){
			    	realData.push(new google.maps.LatLng(gisPathStatusList[i][0],gisPathStatusList[i][1]));
			    }
				return realData;
			} 
	
			function InstitutionMap_new(emriCaseCntDet){
				var locations2=emriCaseCntDet;
	    		var map = new google.maps.Map(document.getElementById('mapnew'), {
		        	zoom: 7,
		        	mapTypeId: google.maps.MapTypeId.ROADMAP,	
	    		});
	    
	   			//Add Layer
	     		map.data.addGeoJson(data);
	     		map.data.setStyle(function (feature) {
	        		var color = feature.getProperty('fillColor');
		       		return {
		            	fillColor: color,
		            	strokeWeight: 1
		        	};
		    	});
	     
	    		/* navigator.geolocation && navigator.geolocation.getCurrentPosition(showPosition, showError) == undefined && showError();	 */
	    		var infowindow = new google.maps.InfoWindow();	
	    		var marker, i;	
	       		for (i = 0; i < locations2.length; i++) {
		        	if((locations2[i].districtName)=="ALL"){
		        		document.getElementById("stateActiveCount").innerText = locations2[i].ActiveCasesCount;
		        	}
		        
		        	var countIcon;
		        	if(locations2[i].ActiveCasesCount>15){
		        		countIcon = 'images/redIcon.png';
		        	}
		        	else{
		        		countIcon = 'images/greenIcon.png';
		        	}
		        
					if((locations2[i].districtName)!="ALL"){
			        	marker = new google.maps.Marker({
			        		position: new google.maps.LatLng(locations2[i].lat, locations2[i].lon),
				           	icon: {
						        url: countIcon,
						        size: new google.maps.Size(55, 55),
						        origin: new google.maps.Point(0, 0),
						        anchor: new google.maps.Point(0, 20),
						        scaledSize: new google.maps.Size(20, 20),
						        labelOrigin: new google.maps.Point(10, 12)
						    }, 
						    label: {
								text: locations2[i].ActiveCasesCount,
							    fontWeight: 'bold',
							    fontSize: '12px',
							    fontFamily: '"Courier New", Courier,Monospace',
							    color: 'black'
							},					      
				          	map: map,	
				          	animation: google.maps.Animation.DROP
				        });	
			
			        	google.maps.event.addListener(marker, 'click', (function(marker, i) {
			        		return function() {
			            		infowindow.setContent(locations2[i].districtName);
			            		infowindow.open(map, marker);
				          	}
				        })(marker, i));
					}
	      		}      

	      		/* function showPosition(position) { */
					lat=11.122223;
	    			lon=78.447718;
		        	latlon = new google.maps.LatLng(lat, lon);
		        	map.setCenter(latlon);
		        	enableHighAccuracy: true;
		        	var marker = new google.maps.Marker({
		          		position: latlon,
		          		map: map,
		          		icon: new google.maps.MarkerImage('images/CurrentLocation.png',null, null, null, new google.maps.Size(15, 15)),
		          		title: "Current Location",
		          		optimized: false	
		        	});
	     
	        		circle = new google.maps.Circle({
			        	map: map,
			          	clickable: false,
			          	// metres
			          	radius: 2500,
			          	//fillColor: '#fff',
			          	fillOpacity: .1,
			          	strokeColor: '#313131',
			          	strokeOpacity: .4,
			          	strokeWeight: .9
			        });
		        	// attach circle to marker
		        	circle.bindTo('center', marker, 'position');    
		        	
		        	var legend = document.getElementById('legend');
	        		var div = document.createElement('div');
	            	div.innerHTML = '<img src="images/redIcon.png"> ' + "Active case > 15";
	            	legend.appendChild(div);
	            	var div1 = document.createElement('div');
	            	div1.innerHTML = '<img src="images/greenIcon.png"> ' + "Active case <= 15";
	            	legend.appendChild(div1);
	            	map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
	      		/* }  */
	
	      		function showError(error) {
	        		map.setCenter(new google.maps.LatLng(10.964289, 78.056801)); // default 1st from array
	      		} 
			}
	
			function getAmbCurrentLoc(){            
                var vehicleNo = document.getElementById('ambNoSearch').value;
                var districtName = document.getElementById("distName").value; 
                $.ajax({type:"POST",
                      url:'getLiveGPSStatusStreamingDataVehicleNo.do',
                'data':  { 
                      vehicleNo:vehicleNo,districtName:districtName
                },
                      success: function (result) {
                      var jsonData = JSON.parse(result); 
                      var vehicleBaseLoc = jsonData.vehicleBaseLoc;
                      var vehicleCurrentLoc = jsonData.vehicleCurrentLoc;
                      InstitutionMapVehicleNo(vehicleBaseLoc,vehicleCurrentLoc,9,'map')
                },
                error: function (xhr, status, error) {
                      alert("Internal Error Occured-Please Contact System Administrator");
                  }
              });             
          }
		
			function InstitutionMapVehicleNo(vehicleBaseLoc,gisAmbCurrentLoc,zoomSize,divId){  
                var locations2 =gisAmbCurrentLoc;                                                        
                var map = new google.maps.Map(document.getElementById(divId), {
                      zoom: zoomSize ,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,      
                });                    
                  
                var trafficLayer = new google.maps.TrafficLayer();
                trafficLayer.setMap(map);
                   
                /* navigator.geolocation && navigator.geolocation.getCurrentPosition(showPosition, showError) == undefined && showError();   */
                var infowindow = new google.maps.InfoWindow();     
                var marker, i;                     
                for (i = 0; i < vehicleBaseLoc.length; i++) {
                      marker = new google.maps.Marker({
                          position: new google.maps.LatLng(vehicleBaseLoc[i][1], vehicleBaseLoc[i][2]),
                          icon: new google.maps.MarkerImage('images/Ambulance-Transparent.png',null, null, null, new google.maps.Size(25, 25)),
                          map: map,  
                          optimized: false,
                          animation: google.maps.Animation.DROP
                      }); 
                      
                      google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                            infowindow.setContent(vehicleBaseLoc[i][0]);
                            infowindow.open(map, marker);
                            }
                     })(marker, i));
                }
              
                /* function showPosition(position) { */
                      lat = locations2[0][0];
                      lon = locations2[0][1]; 
                      latlon = new google.maps.LatLng(lat, lon);
                      map.setCenter(latlon);
                      enableHighAccuracy: true;
                      for (i = 0; i < locations2.length; i++) {
                      marker = new google.maps.Marker({
                              position: new google.maps.LatLng(locations2[i][0], locations2[i][1]),
                              icon: new google.maps.MarkerImage('images/siren.gif',null, null, null, new google.maps.Size(25, 25)),
                              map: map,  
                              optimized: false,
                              animation: google.maps.Animation.DROP
                      });
                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                  infowindow.setContent("Current Location");
                                infowindow.open(map, marker);
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
                      /* }  */
              
                function showError(error) {
                  map.setCenter(new google.maps.LatLng(10.964289, 78.056801)); // default 1st from array
                }
                }

	         function popupforTalukDetails(val){
	        	document.getElementById("talukCaseDetailsHeaderPopUp").innerText = "Taluk-wise Case details for "+emriActiveDet[0].districtName+"";
	         	var talukName = $(val).find('td:nth-child(2)').text();           
	         	var $selects=$('#tickerPopUpTable tbody');
	            $selects.find('tr').remove();
	            for(i=0;i<emriActiveDet.length;i++){
	            	if(emriActiveDet[i].talName == talukName){
	                	$("#tickerPopUpTable tbody").append('<tr><td style="border: 1px solid black;font-size:10px;background-color:#DAD4D4;">'+emriActiveDet[i].talName+'</td><td style="border: 1px solid black;font-size:10px;background-color:#DAD4D4;">'+emriActiveDet[i].CaseId+'</td><td style="border: 1px solid black;font-size:10px;background-color:#DAD4D4;">'+emriActiveDet[i].AmbulanceNumber+'</td><td style="border: 1px solid black;font-size:10px;background-color:#DAD4D4;">'+emriActiveDet[i].IncidentCity+'</td><td style="border: 1px solid black;font-size:10px;background-color:#DAD4D4;">'+emriActiveDet[i].IncidentLocation+'</td></tr>');
	                }
	            }
	            var createNewTable = document.getElementById('createNewTable');                     
	            createNewTable.style.display = "block";         
			}
	         
	         $('.createNewTable-reportClose').click(function() {
	        	 createNewTable.style.display = "none";
	 		});
	         
	         
	        var sortByProperty = function (property) {
        	    return function (x, y) {
        	        return ((parseInt(x[property]) === parseInt(y[property])) ? 0 : ((parseInt(x[property]) > parseInt(y[property])) ? -1 : 1));
        	    };
        	};
        	
        	function showDetailsByDistrict(val){        		
        		var	districtName = $(val).find('td:first').text(); 
				    document.getElementById("Loading").style.display="inline";
    				document.getElementById("LoadingImage").style.display="inline";
	    		$.ajax({
	    			type:"POST",
	    			url:'getDetailsByDistrict.do',
	    			'data':{
	    				districtName:districtName
	    			},
	    			success: function(result){
	    				  document.getElementById("Loading").style.display="none";
	      				document.getElementById("LoadingImage").style.display="none";
	    				var jsonData = JSON.parse(result);	 
	    				var districtName = jsonData.districtName;
	    				emriActiveDet = jsonData.emriActiveDet;
	    				var gisBaseList = jsonData.gisBaseList;
	    				var parentJSON = jsonData.parentJSON;
	    				var gisPathStatusList = jsonData.gisPathStatusList;
	    				var vehicleNo = jsonData.vehicleNo;
	    												
	    				document.getElementById("distName").value = districtName;
	    				document.getElementById('districtNameVal').innerHTML = districtName;
	    				document.getElementById('districtNameVals').innerHTML = districtName;
	    				document.getElementById('vehicleNoVal').innerHTML = vehicleNo;
	    				
	    				displaySecTickerTable(emriActiveDet);
	    				InstitutionMap(gisBaseList,parentJSON,vehicleNo,10,'map');
	    				getAmbulancePath(gisPathStatusList);
	    			},
	    			error: function (xhr, status, error) {
	    	        	alert("Internal Error Occured-Please Contact System Administrator");
	    			}}); 
	    		}
 		</script> 
 	</body>
</html>