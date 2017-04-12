<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>108 Ambulance Total Cases Availed</title>		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
		<!-- <link rel="stylesheet" href="css/icons.css"> --> 
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
		
		<script src="js/d3.v3.min.js"></script>
		<script type='text/javascript' src="js/overAllView.js"></script> 
		<script type='text/javascript' src='jquery/jquery-1.11.1.min.js'></script> 
		<script src="js/ambHighcharts.js"></script> 
		<script src="js/drilldown.js"></script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_UN3281vLu65MNaK-y6w2XFxN_Wvo97M&callback=initMap" type="text/javascript"></script>
		<!-- <script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerwithlabel/src/markerwithlabel.js"></script>
		<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn-history/r150/trunk/markerwithlabel/src/markerwithlabel.js"></script> -->
		<!-- <script src="js/googleMap_MarkerwithLabels.js"></script> -->
		<script src="gis/jsondata.js"></script> 
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!--   <script src="jquery/jquery-1.11.1.min.js"></script> -->
  <script src="bootstrap/js/bootstrap.min.js"></script>
	  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 10%;
      height:2%;
      margin-left: 150px;
  }
.carousel-indicators {
    bottom: -5px;
    
}
  </style>
					
		<style>	
			path {
				stroke: #fff;
				fill-rule: evenodd;
			}
			
			text {
				font-family: Arial, sans-serif;
				font-size: 11px;
			}
			
			.dropDown{
				width: 150px;
			}
			
			.node {
				cursor: pointer;
			}
			
			.node circle {
		  		fill: #fff;
		  		stroke: steelblue;
		  		stroke-width: 1.5px;
			}
			
			.node text {
		  		font: 10px sans-serif;
			}
			.link {
				fill: none;
				stroke: #ccc;
				stroke-width: 1.5px;
			}
			
			#overAllFlow svg{
				height:570px;
				width:500px;
			}
			
			
			.createNewTable{
				display: none; /* Hidden by default */
			    position: fixed; /* Stay in place */
			    z-index: 2; /* Sit on top */
			    /* padding-top: 30px; */ /* Location of the box */
			    left: 0;
			    /* top: 90px; */
			   	margin-left:150px;
			    width: 65%; /* Full width */
			    height: 450px; /* Full height */
			    /* overflow: auto; */ /* Enable scroll if needed */
			}
			
			.createNewTableMap{
				display: none; /* Hidden by default */
			    position: relative; /* Stay in place */
			    z-index: 2; /* Sit on top */
			    /* padding-top: 30px; */ /* Location of the box */
			    left: 0;
			    /* top: 90px; */
			    width: 100%; /* Full width */
			    height: 450px; /* Full height */
			    margin-left:200px;
			    /* overflow: auto; */ /* Enable scroll if needed */
			}
			
			/* Modal Content */
			.createNewTable-content{
				position: relative;
			    background-color: #fefefe;
			    margin: auto;
			    padding: 0;
			    border: 1px solid #888;
			    width: 95%;
			    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
			    -webkit-animation-name: animatetop;
			    -webkit-animation-duration: 0.4s;
			    animation-name: animatetop;
			    animation-duration: 0.4s
			}
			.createNewTable-contentMap{
				position: absolute;
			    background-color: #fefefe;
			    margin: auto;
			    padding: 0;
			    border: 1px solid #888;
			    width: 60%;
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
			
			.createNewTable-reportClose:hover,
			.createNewTable-reportClose:focus {
			    color: white;
			    text-decoration: none;
			    cursor: pointer;
			}
			.createNewTable-reportCloseMap:hover,
			.createNewTable-reportCloseMap:focus {
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
			.createNewTable-headerMap {
			    padding: 2px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;   
			    line-height: 12px;
			    margin-top:-20px; 
			    /* margin-left:200px; */
			    width:110%;    
			}
			
			.createNewTable-body {
				padding: 2px 16px;
				 height: 500px;
				overflow: auto;
				
			}
			.createNewTable-bodyMap {
				padding: 2px 16px;
				 height: 500px;
				width:105%;
				/* margin-left:200px; */
			}
			
			.createNewTable-footer {
			    padding: 2px 16px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;
			    
			}
			
			.createNewTable-footerMap {
			    padding: 2px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;
			    width:110%;   
			    line-height: 12px;
			    margin-top:1px;
			    /* margin-left:200px; */
			}
			
			#dashboardHeader{
				width:100%;
				/* 
				background-image: linear-gradient(bottom, #A0E8FF 10%,  #FFC696 90%);
				background-image: -o-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				background-image: -moz-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				background-image: -webkit-linear-gradient(bottom,  #A0E8FF 10%, #FFC696 90%);
				background-image: -ms-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%); */
				padding-left:20px;
				background-color: #b3e6cc;
				/* background:-webkit-linear-gradient(#c2d6d6,#a3c2c2); */
				font-weight:bold;
			}
			
			.highlightSelected{
				font-weight:bold;
				color: blue;
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
			#createNewTablePopTbody svg{
			margin-top: -70px;
			}
			
			div.tooltip {
			  position: absolute;
			  text-align: left;
			  width: auto;
			  height: auto;
			  padding: 8px;
			  font: 12px sans-serif;
			  background: #0a2538;
			  border: #0a2538 1px solid;
			  border-radius: 0px;
			  pointer-events: none;
			  color: white;
			} 
			
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
			
			/* Toggle Menu CSS Start */
div#dm{
	width:1000px;
}
.dropdown{
	margin-left: 100px;
}
div#drop{
	margin-top:-19px;
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
			
			.labels {
     color: red;
     background-color: white;
     font-family: "Lucida Grande", "Arial", sans-serif;
     font-size: 10px;
     font-weight: bold;
     text-align: center;
     width: 40px;     
     border: 2px solid black;
     white-space: nowrap;
   }
		</style>
	</head>

	<body onload="bodyOnLoad();">		
		<input id="distName"  type="hidden" name="distName"/>
		<input id="sunburstChartData"  type="hidden" name="sunburstChartData"/>
		<div>
		<div id="dashboardHeader" >Total Cases Availed</div>
	<div class="nav navbar-nav navbar-right" id="drop">
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
		</div>	
		<div style="width:100%;margin-top: 10px;">
			<div id="firstDiv" style="float:left;">
				<label style=" font-size:12px;font-weight: bold;color:black;">District View</label>
				<div id="overAllFlow"  style="float:left;width:20%;overflow-x:none;"></div>
				<div id="midSec" style="float:right;height: 400px;width: 60%;margin-left:-200px;">
					<div id="scrollDiv" style="height: 400px;">
						 <label style="margin-left:180px;font-size:12px;font-weight: bold;color:black;">Case count at Taluk & Village level</label>	 
							<i id="tableIcon" class="fa fa-table" onclick="getCaseCountTable('table')" style="font-size:20px;padding-left: 10px;"></i>	
							<i id="barChartIcon" class="fa fa-bar-chart" onclick="getCaseCountTable('chart');" style="font-size:20px;padding-left: 10px;"></i>				
						</div>
						<div id="caseCountDrilldownBar"  style="float:right;margin-top:-360px;height:450px;width:100%;border: 1px solid black;box-shadow: 0 0 1em olive;"></div>
						<div id="caseCountTableDiv" style="float:right;width:100%">
							<div style="margin-left:45px;margin-top:-360px;height:150px;width:100%;overflow:auto;border: 1px solid black;">
							<table id="talukCaseCountTable" style="font-size:small;border-collapse:collapse;">
								<thead>
									<tr>
								 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> Taluk Name</th>
								 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Range</th>
								 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Case Count</th>
								 	</tr>
								</thead>
								<tbody>
								</tbody>						
							</table>
							</div>
							<div style="margin-left:45px;margin-top:-1px;height:300px;width:100%;overflow:auto;;border: 1px solid black;">
							<table id="villageCaseCountTable" style="font-size:small;border-collapse:collapse;">
								<thead>
									<tr>
								 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> Village Name</th>
								 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Range</th>
								 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Case Count</th>
								 	</tr>
								</thead>
								<tbody>
								</tbody>						
							</table>
							</div>
						</div>						
						</div>						
						<marquee id="marquee"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="height:25px;width:32%;position:absolute;margin-top:510px;margin-left:96px;padding-top:5px;border: 1px solid black;font-size:12px;font-weight: bold;color:black;background:#ffcccc;"></marquee>
						<marquee id="marquee2"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="height:25px;width:32%;position:absolute;margin-top:545px;margin-left:96px;padding-top:5px;border: 1px solid black;font-size:12px;font-weight: bold;color:black;background:-webkit-linear-gradient(#d6f5d6,#84e184);"></marquee>
				</div>
			<div id="secDiv">
				<label style="margin-left:300px;font-size:12px;font-weight: bold;color:black;">Incidents reported by District/Taluk/Village (Sunburst View)</label>
				<!-- <button  onclick="showSunBurstPopupDetails();" style="background:-webkit-linear-gradient(#eaf0fa ,#6d97df);">View Sunburst</button> --> 
				<i id="zoomIcon" class="glyphicon glyphicon-zoom-in" onclick="showSunBurstPopupDetails();" style="font-size:20px;cursor: pointer;padding-left: 10px;"></i>
				<div id="createNewTablePopTbody" style="margin-left:-120px;float:right;border: 1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;height:280px;overflow:auto;"></div>	
				<div style="width:44.5%;height:275px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;overflow:auto;">
					<label style="margin-left:300px;font-size:12px;font-weight: bold;color:black;">Incidents reported by District</label>
					<!-- <button  onclick="showMapPopupDetails();" style="background:-webkit-linear-gradient(#eaf0fa ,#6d97df);">View Map</button> -->
					<i id="zoomIcon" class="glyphicon glyphicon-zoom-in" onclick="showMapPopupDetails();" style="font-size:20px;cursor: pointer;padding-left: 10px;"></i>	
					<div id="map" class="col-md-6" style="width:99%;height:350px;"></div>
				</div>
				
			</div>
		</div>   
		
		<!-- Sunburst POP-UP -->   
	    <div id="createNewTable" class="createNewTable">
	    	<div class="createNewTable-content">
	        	<div class="createNewTable-header">
	            	<span class="createNewTable-reportClose">×</span>
	                <label  id="createNewTablePopUpHeading" style="margin-top: 4px;">Incidents reported by District/Taluk/Village (Sunburst View)</label>
	            </div>
	           	<div class="createNewTable-body">
	            	<div id="createNewTablePopTbodyPop" style="margin-top:20px;">	            	           	
	            	</div>
	            </div>
	            <div class="createNewTable-footer"></div>
	        </div>                             
	   	</div>      
	   	 
	   	<!-- Map POP-UP -->   
	   <div id="createNewTableMap" class="createNewTableMap" >
	    	<div class="createNewTable-contentMap">
	        	<div class="createNewTable-headerMap">
	            	<span class="createNewTable-reportCloseMap">×</span>
	                <label  id="createNewMapPopUpHeadingMap">Incidents reported by District</label>
	            </div>
	           	<div class="createNewTable-bodyMap">	           	
	            	<div id="mapPop" class="col-md-6" align="centre" style="height:500px;width:100%">
	            	</div>
	            </div>
	            <div class="createNewTable-footerMap"></div>
	        </div>                             
	   	</div> 
	   	
	   	<div class="loader"></div> 

                  
	<script>
		function bodyOnLoad(){
			
			 $(".loader").fadeIn();
			var treeChartArray = <%=request.getAttribute("treeChartArray") %>;
			var sunburstArray = <%=request.getAttribute("sunburstArray") %>;
			var talukCaseCount = <%=request.getAttribute("talukCaseCount") %>;
			var villageCaseCount = <%=request.getAttribute("villageCaseCount") %>;
			var districtName = "<%=request.getAttribute("districtName") %>";
			var talukCaseCountTableData = <%=request.getAttribute("talukCaseCountTableData") %>;
			var villageCaseCountTableData = <%=request.getAttribute("villageCaseCountTableData") %>;
			var gisTotalCasesAvailedList = <%= request.getAttribute("gisTotalCasesAvailedList") %>;
			var emgData = "<%= request.getAttribute("emgData") %>";
			var distData = "<%= request.getAttribute("distData") %>";
			
			document.getElementById("sunburstChartData").value = sunburstArray;
			document.getElementById("distName").value = districtName;
			document.getElementById("caseCountTableDiv").style.display = "none";
			document.getElementById("barChartIcon").style.display = "none";
			
			document.getElementById("marquee").innerText = emgData;
			document.getElementById("marquee2").innerText = distData;
			
			overAllView(treeChartArray);
			getDrillDownChart(talukCaseCount,villageCaseCount,districtName);
			getTalukCaseCountTable(talukCaseCountTableData);
			getVillageCaseCountTable(villageCaseCountTableData);
			getSunburstChart(districtName,sunburstArray,'690','500',"#createNewTablePopTbody",'3');
			InstitutionMap(gisTotalCasesAvailedList,7,'map');
			
			$(".loader").fadeOut();  
			
		}
		
		 createNewTable.style.display = "none";
		 createNewTableMap.style.display = "none";
		$('.createNewTable-reportClose').click(function() {
			createNewTable.style.display = "none";
			createNewTableMap.style.display = "none";
			$("#createNewTablePopTbodyPop").empty();
			$("#mapPop").empty();
		});
		$('.createNewTable-reportCloseMap').click(function() {
			createNewTable.style.display = "none";
			createNewTableMap.style.display = "none";	
			$("#mapPop").empty();
		});
		$('#createNewTablePopTbody').prop('contenteditable', false); 
		$('#mapPop').prop('contenteditable', false); 
		
		function showSunBurstPopupDetails(){
			var createNewTable = document.getElementById('createNewTable');
			createNewTable.style.display = "block";
			$("#createNewTablePopTbodyPop").empty();
			var districtName = document.getElementById("distName").value; 
			$(".loader").fadeIn();
			$.ajax({
				type:"POST",
				url:'totalCaseAvailedSunburst.do',
				'data':{
					districtName:districtName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 getSunburstChart(districtName,jsonData,'690','500',"#createNewTablePopTbodyPop",'2');
					 $(".loader").fadeOut(); 
					 
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
			
			
		}
		
	 function showMapPopupDetails(){
			var createNewTable = document.getElementById('createNewTableMap');
			createNewTable.style.display = "block";
			$("#mapPop").empty();
			var districtName = document.getElementById("distName").value; 
			$(".loader").fadeIn();
			$.ajax({
				type:"POST",
				url:'totalCaseAvailedMap.do',
				'data':{
					districtName:districtName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 InstitutionMap(jsonData,10,'mapPop');
					 $(".loader").fadeOut();
					 
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
			
		}
		
		function getCaseCountTable(method){
			if(method=='table'){
				document.getElementById("caseCountTableDiv").style.display = "inline";
				document.getElementById("caseCountDrilldownBar").style.display = "none";
				document.getElementById("barChartIcon").style.display = "inline";
				document.getElementById("tableIcon").style.display = "none";
			}
			else if(method=='chart'){
				document.getElementById("caseCountTableDiv").style.display = "none";
				document.getElementById("caseCountDrilldownBar").style.display = "inline";
				document.getElementById("barChartIcon").style.display = "none";
				document.getElementById("tableIcon").style.display = "inline";
			}
		}
		
		function showCaseDetails(){
			var createNewTable = document.getElementById('createNewTable');
			createNewTable.style.display = "block";	
			
			$("#createNewTablePopTbody").empty();
			var districtName = document.getElementById("distName").value; 
			$(".loader").fadeIn();
			$.ajax({
				type:"POST",
				url:'totalCaseAvailedSunburst.do',
				'data':{
					districtName:districtName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 getSunburstChart(districtName,jsonData,'690','500',"#createNewTablePopTbody",'3');
					 $(".loader").fadeOut();
					 
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
			
		}
		
		function getTalukCaseCountTable(talukCaseCountTableData){
			var $select=$('#talukCaseCountTable tbody');
			$select.find('tr').remove();
			  for(i=0;i<talukCaseCountTableData.length;i++){
			  	  	$("#talukCaseCountTable tbody").append('<tr onclick="getOnChangeVillageCaseCountTable(this);"><td style=" border: 1px solid black;"> '+talukCaseCountTableData[i].talukName+' </td><td style="text-align: center; border: 1px solid black;"> '+talukCaseCountTableData[i].range+'</td><td style="text-align:center; border: 1px solid black;">'+talukCaseCountTableData[i].caseCount+'</td></tr>');
			  }
		}
		
		function getVillageCaseCountTable(villageCaseCountTableData){
			var $select=$('#villageCaseCountTable tbody');
			$select.find('tr').remove();
			  for(i=0;i<villageCaseCountTableData.length;i++){
			  	  	$("#villageCaseCountTable tbody").append('<tr><td style=" border: 1px solid black;"> '+villageCaseCountTableData[i].villageName+' </td><td style="text-align: center; border: 1px solid black;"> '+villageCaseCountTableData[i].range+'</td><td style="text-align:center; border: 1px solid black;">'+villageCaseCountTableData[i].caseCount+'</td></tr>');
			  }
		}
		
		function districtChange(districtName){
			$(".loader").fadeIn();
			$.ajax({
				type:"POST",
				url:'totalCaseAvailedOnChange.do',
				'data':{
					districtName:districtName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 
					 talukCaseCount = jsonData.talukCaseCount;
					 villageCaseCount = jsonData.villageCaseCount;
					 talukCaseCountTableData = jsonData.talukCaseCountTableData;
					 villageCaseCountTableData = jsonData.villageCaseCountTableData;
					 sunburstArray = jsonData.sunburstArray;
					 gisTotalCasesAvailedList = jsonData.gisTotalCasesAvailedList;
					 emgData = jsonData.emgData;
					 
					 document.getElementById("sunburstChartData").value = sunburstArray;
					 document.getElementById("distName").value = districtName;
					 $("#createNewTablePopTbody").empty();
					 $("#createNewTablePopTbodyPop").empty();
					 $("#mapPop").empty();

						document.getElementById("caseCountTableDiv").style.display = "none";
						document.getElementById("caseCountDrilldownBar").style.display = "inline";
						document.getElementById("barChartIcon").style.display = "none";
						document.getElementById("tableIcon").style.display = "inline";
						document.getElementById("marquee").innerText = "";
						document.getElementById("marquee").innerText = emgData;
					 
					 getDrillDownChart(talukCaseCount,villageCaseCount,districtName);
					 getTalukCaseCountTable(talukCaseCountTableData);
					 getVillageCaseCountTable(villageCaseCountTableData);
					 getSunburstChart(districtName,sunburstArray,'690','500',"#createNewTablePopTbody",'3');
					 InstitutionMap(gisTotalCasesAvailedList,7,'map');
					 
					 $(".loader").fadeOut();
					 
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
			
		}
		
		function getOnChangeVillageCaseCountTable(talukName){
			/* var all_tr = $('#talukCaseCountTable tbody tr');
			$(all_tr).removeClass('.highlightSelected');
			$(talukName).removeClass('.highlightSelected');
			$(talukName).addClass('highlightSelected'); */
			
			var all_tr = $('#talukCaseCountTable tbody tr');
			all_tr.removeClass('highlightSelected');
			$(talukName).addClass('highlightSelected');
			
			
			var districtName = document.getElementById("distName").value;
			var talukName = $(talukName).find('td:first').text(); 
			var talukName = talukName.trim()
			$(".loader").fadeIn();
			$.ajax({
				type:"POST",
				url:'villageCaseCountTableData.do',
				'data':{
					districtName:districtName,talukName:talukName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 getVillageCaseCountTable(jsonData);
					 
					 $(".loader").fadeOut();
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
			
		}

		
		function getDrillDownChart(talukCaseCount,villageCaseCount,districtName) {
			
		    // Create the chart
		    $('#caseCountDrilldownBar').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'For '+districtName ,
		            style: { "color": "#333333", "fontSize": "11px" }
		        },
		        xAxis: {
		            type: 'category'
		        },
		        yAxis : {
		                title: {
		                  text: 'Case Count'
		                }
		             },

		        legend: {
		            enabled: false
		        },

		        plotOptions: {
		            series: {
		                borderWidth: 0,
		                dataLabels: {
		                    enabled: true
		                }
		            }
		        },

		        series: [{
		            name: 'Taluk',
		            colorByPoint: true,
		            data:  talukCaseCount
		        }],
		        drilldown: {
		            series: villageCaseCount            	 
		        }
		    });
		    
		}
		
		function getSunburstChart(districtName,sunburstArray,width,height,divId,radious){
			var width1 = width,
		    height1 = height,
		    radius = Math.min(width1, height1) / radious;
		
		var x = d3.scale.linear()
		    .range([0, 2 * Math.PI]);
		
		var y = d3.scale.linear()
		    .range([0, radius]);
		
		var color = d3.scale.category20c();
		
		var svg1 = d3.select(divId).append("svg")
		    .attr("width", width1)
		    .attr("height", height1)
		  .append("g")
		    .attr("transform", "translate(" + width1 / 2 + "," + (height1 / 2 + 10) + ")");
		
		var partition = d3.layout.partition()
		    .value(function(d) { return d.size; });
		
		var arc = d3.svg.arc()
		    .startAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))); })
		    .endAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))); })
		    .innerRadius(function(d) { return Math.max(0, y(d.y)); })
		    .outerRadius(function(d) { return Math.max(0, y(d.y + d.dy)); });
		
		/*d3.json(jsonData, function(error, root) {*/
		
		var root =  constructData(sunburstArray);
		
		  var g = svg1.selectAll("g")
		     .data(partition.nodes(root))
		    .enter().append("g");
		  
		// tooltip
		  var tooltip = d3.select("body").append("div")
		    .attr("class", "tooltip")
		    .style("opacity", 0);
		
		  var path = g.append("path")
		    .attr("d", arc)
		    .style("fill", function(d) { return color((d.children ? d : d.parent).name); })
		    .on("click", click)
		    .on("mouseover", function(d, i) { 
tooltip.text(d.name)
        .style("opacity", 0.8)
        .style("left", (d3.event.pageX) + 0 + "px")
        .style("top", (d3.event.pageY) - 0 + "px");
    })
    .on("mouseout", function(d) {
      tooltip.style("opacity", 0);
    }); 
/* 		    .on("mouseover", mouseover)
        	.on("mouseout", mouseout); */
		    
		
 		  var text = g.append("text")   
		      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + computeTextRotation(d) + ")"; })
		        .attr('text-anchor', function (d) { return computeTextRotation(d) >90 ? "end" : "start"; })
		        .attr('text-anchor', "middle")
		        .attr('marign-left', "auto")
		        .attr("dx", "7") // margin
		        .attr("dy", ".50em") // vertical-align        
		        .text(function(d) { return d.name; }); 
		      

		  function click(d) {
		    // fade out all text elements
		    text.transition().attr("opacity", 0);
		
		    path.transition()
		      .duration(750)
		      .attrTween("d", arcTween(d))
		      .each("end", function(e, i) {
		          // check if the animated element's data e lies within the visible angle span given in d
		          if (e.x >= d.x && e.x < (d.x + d.dx)) {
		            // get a selection of the associated text element
		            var arcText = d3.select(this.parentNode).select("text");
		            // fade in the text element and recalculate positions
		            arcText.transition().duration(750)
		              .attr("opacity", 1)
		             /* .attr("transform", function() { return "rotate(" + computeTextRotation(e) + ")" })*/
		              /*.attr("x", function(d) { return y(d.y); });*/
		               .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + computeTextRotation(d) + ")"; })
		               .attr('text-anchor', function (d) { return computeTextRotation(d) > 180 ? "end" : "start"; })
		          }
		      });
		  };
		  
		 d3.select(self.frameElement).style("height", height1 + "px"); 
		
		// Interpolate the scales!
		function arcTween(d) {
		  var xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx]),
		      yd = d3.interpolate(y.domain(), [d.y, 1]),
		      yr = d3.interpolate(y.range(), [d.y ? 20 : 0, radius]);
		  return function(d, i) {
		    return i
		        ? function(t) { return arc(d); }
		        : function(t) { x.domain(xd(t)); y.domain(yd(t)).range(yr(t)); return arc(d); };
		  };
		}
		
		function computeTextRotation(d) {
		/*  return (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;*/
			 var ang = (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;
		     return (ang > 90) ? 180 + ang : ang;
		}
		
		function constructData(sunburstArray){		
			var data = sunburstArray;
			var dataMap = data.reduce(function(map, node) {
			    map[node.name] = node;
			    return map;
			}, {});
		
			// create the tree array
			var treearray = [];
			data.forEach(function(node) {
			    // add to parent
			    var parent = dataMap[node.parent];
			    delete node.parent;
			    if (parent) {
			        // create child array if it doesn't exist
			        (parent.children || (parent.children = []))
			            // add node to child array
			            .push(node);
			    } else {
			        // parent is null or missing
			        treearray.push(node);
			    }
			});
			var finaltreemap = {"name":districtName,"children":treearray}
			/*  d3.json("json/flare.json", function(error, flare) {   */
				var flare = finaltreemap;
			
			
			return flare	
		};
	

		
		}
		
		function InstitutionMap(gisTotalCasesAvailedList,zoomSize,divId){	
			  var locations = gisTotalCasesAvailedList; 
						   		      
			    var map = new google.maps.Map(document.getElementById(divId), {
			        zoom: zoomSize,
			        mapTypeId: google.maps.MapTypeId.ROADMAP,	
			    });
			    
			    //Add Layer
			      map.data.addGeoJson(data);
			     map.data.setStyle(function (feature) {
			        var color = feature.getProperty('fillColor');
					//var description = feature.getProperty('description');
					//var range=dist[description];
					//alert("range"+range);
					
			        return {
			            fillColor: color,
			            strokeWeight: 1
			        };
			    }); 
			     
			    navigator.geolocation && navigator.geolocation.getCurrentPosition(showPosition, showError) == undefined && showError();	
			    var infowindow = new google.maps.InfoWindow();	
			    var marker, i;	
			   
			      for (i = 0; i < locations.length; i++) {
			    	   /* image_src = 'images/greenPin.png';  */
			        /* mc = locations[i][3];	
			        switch (mc) {
			          case 'B':
			        	  image_src = 'images/map-marker-icon.png';
		               break;

		             case 'A':
		               image_src = 'images/mapicon_amber.png';
		               break;

		             default:
		               image_src = 'images/Location-Symbol.png';
			        } */
			
			         marker = new google.maps.Marker({
			          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			          map: map ,	
			         /* icon: new google.maps.MarkerImage(image_src,null, null, null, new google.maps.Size(55, 55)),  */
			         /*  label: "12", */
			         icon: {
				        url: 'images/redIcon.png',
				        size: new google.maps.Size(55, 55),
				        origin: new google.maps.Point(0, 0),
				        anchor: new google.maps.Point(0, 20),
				        scaledSize: new google.maps.Size(20, 20),
				        labelOrigin: new google.maps.Point(10, 12)
				      },
			         label: {
				        text: '15',
				        fontWeight: 'bold',
				        fontSize: '12px',
				        fontFamily: '"Courier New", Courier,Monospace',
				        color: 'black'
				      }
			           
			         
			         /*  animation: google.maps.Animation.DROP  */
			        });  
			        
			        /*  marker = new MarkerWithLabel({
			            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			            map: map,
			            draggable: true,
			            raiseOnDrag: true,
			            labelContent: "A",
			            labelAnchor: new google.maps.Point(3, 30),
			            labelClass: "labels", // the CSS class for the label
			            labelInBackground: false
			          }); */ 
			
			        google.maps.event.addListener(marker, 'click', (function(marker, i) {
			          return function() {
			            infowindow.setContent(locations[i][0]);
			            infowindow.open(map, marker);
			          }
			        })(marker, i));
			      }
			
			      function showPosition(position) {
			        lat = locations[0][1];
			        lon = locations[0][2]; 
			      
/* 			        lat = gisAmbCurrentLoc[0].latitude;
			        lon = gisAmbCurrentLoc[0].longitude; */ 
			        latlon = new google.maps.LatLng(lat, lon);
			        map.setCenter(latlon);
			        enableHighAccuracy: true;
			         var marker = new google.maps.Marker({
			          position: latlon,
			          map: map,
			          icon: new google.maps.MarkerImage('images/CurrentLocation.png',null, null, null, new google.maps.Size(15, 15)),
			          title: "CurrentLocation",
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
			
			        /* map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(
			          document.getElementById('legend')); */
			      }
			
			      function showError(error) {
			        map.setCenter(new google.maps.LatLng(10.964289, 78.056801)); // default 1st from array
			      }
				}

		
	</script>
	</body>	
</html>