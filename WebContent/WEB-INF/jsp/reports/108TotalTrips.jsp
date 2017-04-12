<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.json.JSONArray"%>
    <%@page import="org.json.JSONObject"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
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
/* #mainDiv{
	margin-top:-10px;
} */

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

div.col-xs-4 {
    width: 14.333333%;
}

/* Demo CSS for Pausing Scrollers */

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

	#dashboardHeader{
				width:100%;
/* 				background-image: linear-gradient(bottom, #A0E8FF 10%,  #FFC696 90%);
				background-image: -o-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				background-image: -moz-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				background-image: -webkit-linear-gradient(bottom,  #A0E8FF 10%, #FFC696 90%);
				background-image: -ms-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%); 
				padding-left:20px;
				background:-webkit-linear-gradient(#c2d6d6,#a3c2c2); */
				background-color: #b3e6cc;
				font-weight:bold;
				font-size:12px;
				padding-top:5px;
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
			
	.highlightSelected{
            font-weight:bold;
            color: blue;
}
</Style>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SDGS Indicators</title>
		<script src="js/Fusion.js"></script>
		<script src="js/fusioncharts.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
		<script src="js/fusioncolumn3d.js"></script>
		<script src="js/fusionpie.js"></script>
		<script src="js/sdgs.js"></script>
		<script src="js/script.js"></script>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="js/ambHighcharts.js"></script> 
        <script src="js/drilldown.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
       <link rel="stylesheet" href="css/pausingscroller.css" />
       <script type="text/javascript" src="js/pausingscroller.js"></script>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">        
       
       <script>
       var pausecontent1 = new Array();
       	pausecontent1[0]='Prediction data for next 2 hours'
       	pausecontent1[1]='Prediction data for next 2 hours'
	   var scroller1 = new pausescroller(pausecontent1, "pscroller1", 4000, 1500)
       </script>
     
        
</head>
<body onload="onLoad();" style="height:500px">
<input id="predScrollData"  type="hidden" name="predScrollData"/>
	<div style="width:100%;background:white; height:40%;margin-left: 10px; ">	
	<!-- 	<div style="width:100%;"> -->
	<div>
	<div id="dashboardHeader" >Total Trips Of Ambulance </div>
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

		<div id="chart-container0" style="float:left;width:30%;">
		<div id="districtdata"  style="width:100%;height:314px;border:1px solid black; margin-left: 0px;margin-top: 0px;margin-bottom: 0px;overflow: auto;font-size:12px;">
		<table id="indTable1" style="width:100%;font-size:small;height:10%; border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
		<thead>
		<tr style="font: normal 10px thahoma;">Amb Trips Count By District</tr>
		<tr style="font-size:small">
		<td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white "> District Name</td>
		<td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Available </td>
		<td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Used </td>
		<td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Case Count </td>
		</tr>
		
		</thead>
		<tbody id="indTable" class="paginated" name="jsonData">
		<%
		JSONArray data=(JSONArray)request.getAttribute("jsonData");
		 for(int i=0;i<data.length();i++){
		 JSONObject row=data.getJSONObject(i);%>
		 <tr id=<%=row.get("districtName")%> style="font-size:small;">
		 <td onclick="showName(this);" style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:10px;"><%=row.get("districtName")%></td>
		 <td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:10px;"><%=row.get("ambCount")%></td>
		 <td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:10px;"><%=row.get("noOfAmbUsed")%></td>
		 <td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:10px;"><%=row.get("caseCount")%></td>
		 </tr>
		 <%}%>
		 </tbody>
		</table>
		</div>
		</div>
		<div id="topRight"  align="center" style="width:33%;height:315px;float:left;border:1px solid black; margin-left: 10px;">
		</div>
		<div id="topSecondRight"  align="center" style="width:33%;height:315px;float:left;border:1px solid black; margin-left: 10px;">
		</div>
     <div class="loader"></div>    
		
	</div>
	
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
	<div style="background:#e0ebeb;height:280px;margin-top:328px;margin-left:815px;width:47%;border:0.1px solid black;">
	<div>
	<label id="talukMarqueHeader" style="margin-top:10px;font-size:12px;color:black;margin-left:8px;"></label>
	<marquee id="marqueeTaluk"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="float:right;margin-top:4px;height:15px;width:99%;position:relative;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
	</div>
	<div>
	<label id="villageMarqueHeader" style="margin-top:10px;font-size:12px;color:black;margin-left:8px;"></label>
	<marquee id="marqueeVillage"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="float:right;margin-top:4px;height:15px;width:99%;position:relative;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
	</div>
	<div style="margin-top:30px;">
		<label id="predictionScrollHeader" style="margin-top:10px;font-size:12px;color:black;margin-left:8px;">Prediction data for next 2 hours</label>
		<div id="pscroller1" class="pausescroller" style="margin-top:0px;font-size:10px;color:black;margin-left:8px;">
		</div>
	</div> 
	</div>
		
</body>

<script>

function onLoad(){
	$(".loader").fadeIn();
	var districtName = "<%= request.getAttribute("districtName") %>";
 	var ambTotalTripsData = <%= request.getAttribute("ambTotalTripsData")%>;
	var ambTotalTripsByTypeData = <%= request.getAttribute("ambTotalTripsByTypeData")%>;
	getDrillDownChart(ambTotalTripsData,ambTotalTripsByTypeData,districtName);
	
	var ambulanceCaseTypeData = <%= request.getAttribute("ambulanceCaseTypeData")%>;
	var ambulanceCaseByTypeData = <%= request.getAttribute("ambulanceCaseByTypeData")%>;
	getPieDrillDownChart(ambulanceCaseTypeData,ambulanceCaseByTypeData,districtName);
	
	var ambBaseLocTickerData = <%= request.getAttribute("ambBaseLocTickerData")%>;
	displayTickerTable(ambBaseLocTickerData);
	
	var talukScrollData = "<%= request.getAttribute("talukScrollData") %>";
	var villageScrollData = "<%= request.getAttribute("villageScrollData") %>";
	var predictionScrollData = <%= request.getAttribute("predictionScrollData")%>;
	
	document.getElementById("talukMarqueHeader").innerText = "Taluk-wise case count in "+districtName+" for last 2 Hours";
	document.getElementById("villageMarqueHeader").innerText = "Village-wise case count in "+districtName+" for last 2 Hours";
	
	if(talukScrollData == "null"){
		talukScrollData = "No case is recorded in "+districtName+" for last 2 Hours";
	}
	if(villageScrollData == "null"){
		villageScrollData = "No case is recorded in "+districtName+" for last 2 Hours";
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

function getDrillDownChart(ambTotalTripsData,ambTotalTripsByTypeData,districtName) {
	// Create the chart
    $('#topRight').highcharts({
        chart: {
            type: 'column'
        },
        title: {
        	  text: 'Total Trips Of Ambulance '+districtName,
              style:{
                      color: 'black',
                      fontSize: '12px'
                  }       
          },
        xAxis: {
            type: 'category'
        },
        yAxis : {
                title: {
                  text: 'Ambulances Count'
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
            name: 'Ambulance',
            colorByPoint: true,
            data:  ambTotalTripsData
        }],
        drilldown: {
            series: ambTotalTripsByTypeData	            	 
        }
    });
}
function getPieDrillDownChart(ambulanceCaseTypeData,ambulanceCaseByTypeData,districtName) {
	// Create the chart
    $('#topSecondRight').highcharts({
        chart: {
            type: 'pie'
        },
        
        title: {
      	  text: 'Case Type Of Ambulance '+districtName,
            style:{
                    color: 'black',
                    fontSize: '12px'
                }       
        },
        xAxis: {
            type: 'category'
        },
        yAxis : {
                title: {
                  text: 'Case Type Count'
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
            name: 'Ambulance',
            colorByPoint: true,
            data:  ambulanceCaseTypeData
        }],
        drilldown: {
            series: ambulanceCaseByTypeData	  
           
        }
    });
}
function showName(key){
	var district=key.innerText;
	$(".loader").fadeIn();
	$.ajax({type:"POST",
		url:'getTotalTripsValuesByDistrict.do',
		'data':  { 
			district:district
		},
		success: function (result) {
			 var jsonData = JSON.parse(result);	
			 var ambTotalTripsData=jsonData.ambTotalTripsData;
			 var ambTotalTripsByTypeData=jsonData.ambTotalTripsByTypeData;
			 
			 var ambulanceCaseTypeData=jsonData.ambulanceCaseTypeData;
			 var ambulanceCaseByTypeData=jsonData.ambulanceCaseByTypeData; 
			 
			 getDrillDownChart(ambTotalTripsData,ambTotalTripsByTypeData,district);
			 getPieDrillDownChart(ambulanceCaseTypeData,ambulanceCaseByTypeData,district);
			 $(".loader").fadeOut();
		 },
      	error: function (xhr, status, error) {
            alert("Internal Error Occured-Please Contact System Administrator");
	    }
	});	
	
}

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
                                    
                                    document.getElementById("talukMarqueHeader").innerText = "Taluk-wise case count in "+district+" for last 2 Hours";
                                    document.getElementById("villageMarqueHeader").innerText = "Village-wise case count in "+district+" for last 2 Hours";
                                    
                                    if(talukScrollData == "null"){
                                                    talukScrollData = "No case is recorded in "+district+" for last 2 Hours";
                                    }
                                    if(villageScrollData == "null"){
                                                    villageScrollData = "No case is recorded in "+district+" for last 2 Hours";
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
</script> 
</html>