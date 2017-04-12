<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<title>108 Ambulance Case Report</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="jquery/ui/1.11.4/jquery-ui.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/Fusion.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.widgets.js"></script>
<script src="js/ambHighcharts.js"></script> 
<script src="js/drilldown.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="js/script.js"></script>	
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/bootstrap.min.js"></script>	
<style>
.createNewTable{
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 150px; /* Location of the box */
    left: 0;
    top: 90px;
    width: 100%; /* Full width */
    height: 300px; /* Full height */
    overflow: auto; /* Enable scroll if needed */
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
.highlightSelected{
	/* background: red; */
	font-weight:bold;
	color: blue;
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
</style>
</head>	
<body onload="onLoad();">
		<div style="width:100%">
			<!-- <div id="directorateNameHeader"><b>108 Ambulance Report</b></div> -->
			<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
				<table>
					<tr>
						<td class="searchCriteria" style="padding-left:5px;"><b>Ambulance Service Distribution by Emergency Type</b></td>
						<td class="searchCriteria" style="padding-left:15px;"><spring:message code="label_searchcriteria_date"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<input type="text" class="inputText" id="date" name="searchDate">
						</td>						
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_district"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<select id="districtName" name="districtName" class="reportDropDown" style="width:150px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="district" items="${districts}">
									<option value='<c:out value="${district.name}"/>'>${district.name} </option>
								</c:forEach>
							</select>
						</td>	
						<td class="searchCriteria">
							<button onclick="districtOnSearch();"><spring:message code="label_searchcriteria_search"/></button>
						</td>	
						<td class="searchCriteria">
							<button onclick="showCaseDetails();"><spring:message code="button_view_case_details"/></button>
						</td>	
						<td class="searchCriteria"><label id="Loading" style=""><spring:message code="label_Loading"/></label><img id="LoadingImage" src="images/siren.gif" alt="Progressing" style="width:30px;height:30px;"></td>
						<td class="searchCriteria" style="float:right;margin-right:20px;margin-bottom:5px;margin-top:5px;">
							<button style="background-color:#FFF8C6;color:black;" onclick="showPrediction();">Prediction</button>
						</td>	
						<td class="searchCriteria" style="float:right;margin-right:10px;margin-bottom:5px;margin-top:5px;">
							<button style="background-color:#FFF8C6;color:black;" onclick="getIncidentReport();">Incident Report</button>
						</td>
					</tr>
				</table>
								<div class="nav navbar-nav navbar-right" id="drop">
         			<div class="dropdown">
              		<a id="click" href="#" data-toggle="dropdown" style="font-size: 13px;margin-left: -45px;font-weight: bold;color:blue;"><u>BROWSE ALL DASHBOARD  &#9776;</u></a>
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
			<%-- <div style="width:99.3%;">		
				<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;">  
					<div id="topLeftTable1Div" style="float:left;margin:right;border-right: 1px black;">					
							<P style="font-size:small;font-weight:bold" >Vehicle availability vs serviced location</P>
							<table id="topLeftTable1" style="font-size:small;border-collapse:collapse;border: 1px solid black;margin-left:10px;">
							<thead>
								<tr>
							 		<th  style="width:128px;font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> District </th>
							 		<th  style="width:36px;font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Total Ambulance</th>
							 		<th  style="width:37px;font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Total Incidents </th>
							 	</tr>
							</thead>
							<tbody>
							</tbody>						
						</table>
					</div>
					<div id="topLeftTable2Div" style="width:45%;overflow:auto;margin-top: -5px;">
							<P> <input type="text" id="districtName" value="Incidents by Emergency Type in <%= request.getAttribute("districtName")%>" style="border:none;font-size:small;font-weight:bold;width: 275px;" readonly="readonly" >
							</P>
							<P style="font-size:small;font-weight:bold" >Incidents by Emergency Type in "<%= request.getAttribute("districtName")%>"</P>
							<table id="topLeftTable2" style="font-size:small;border-collapse:collapse;border: 1px solid black;margin-left:10px;">
								<thead>
								<tr style="font-size:small">
									<th  style="width:100px;font-size:small; text-align: center;border: 1px solid black; background-color: #FFA500; color: white "> Emergency Type </th>
									<th  style="width:70px;font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> Emergency SubType </th>
									<th  style="width:40px;font-size:small; text-align: center;border: 1px solid black; background-color:#FFA500 ; color: white "> Incidence Count</th>
								</tr>
								</thead>
								<tbody>
								 </tbody>		
						</table>
					</div>
				</div>
				<div id="topRight" align="center" style="width:48.9%;height:350px;float:right;margin-top:4px;margin-bottom:4px;">
				</div>
			</div> --%>
			
			
			
			<div style="width: 100%;">
				<div id="vehicleAvailability"  align="center" style="width:28.3%;height:350px;float:left;border:1px solid black;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;border-bottom-left-radius: 10px 10px;">
					<div style="width:100%;height:20px;font-size:small;">
						 <input type="text" id="VehicleAvailabilityVsSerLoc" value="Vehicle availability vs serviced location" style="border:none;font-size:small;font-weight:bold;width: 275px;" readonly="readonly" >
					</div>
					<div style="width:100%;height:330px;font-size:12px;overflow: auto;">
						<table id="topLeftTable1" style="font-size:small;border-collapse:collapse;border: 1px solid black;margin-left: 5px;">
							<thead>
								<tr>
							 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> District</th>
							 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Total Ambulance</th>
							 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Total Incidents Reported</th>
							 	</tr>
							</thead>
							<tbody>
							</tbody>						
						</table>
					</div>
				</div>
				<div id="incidentsByEmergency"  align="center" style="width:28%;height:350px;float:left;border:1px solid black;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;border-bottom-left-radius: 10px 10px;">
					<div style="width:100%;height:20px;font-size:small;">
						 <input type="text" id="emerTypeInc" value="Incidents by Emergency Type in <%= request.getAttribute("districtName")%>" style="border:none;font-size:small;font-weight:bold;width: 275px;" readonly="readonly" >
					</div>
					<div style="width:100%;height:330px;font-size:small;overflow: auto;">
						<table id="topLeftTable2" style="font-size:small;border-collapse:collapse;border: 1px solid black;margin-left:5px;">
							<thead>
								<tr>
									<th  style="font-size:small; text-align: center;border: 1px solid black; background-color: #FFA500; color: white "> Emergency Type </th>
									<th  style="font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> Emergency SubType </th>
									<th  style="font-size:small; text-align: center;border: 1px solid black; background-color:#FFA500 ; color: white "> Incidence Count</th>
								</tr>
							</thead>
							<tbody>
							</tbody>		
						</table>
					</div>
				</div>
				<div id="topRight"  align="center" style="width:43%;height:350px;float:right;border:1px solid black;">
				</div>
			</div>
			 <div style="width:100%;">		
				<div id="bottomLeft" align="center" style="width:49.5%;height:350px;float:left;margin-top:4px;border:1px solid black;">
				</div>
				<div id="bottomRight" align="center" style="width:49.4%;height:350px;float:right;margin-top:4px;border:1px solid black;">
				</div>
			</div> 
		</div>

	<!-- POP-UP -->	
		<div id="createNewTable" class="createNewTable">
			<div class="createNewTable-content">
			<div class="createNewTable-header">
			<span class="createNewTable-reportClose">×</span>
			<label  id="createNewTablePopUpHeading" style="margin-top: 4px;">Case Details in <%= request.getAttribute("hospitalName")%></label>
			</div>
			<div class="createNewTable-body">
			 <table id="createNewTablePopTable" class="createNewTablePopTable" align="center" border=1 style="font-size:12px;">
			 <tr>
				 <th class="incidentLocation">Incident Location</th>
				 <th class="emergencyType">Emergency Type</th>
				 <th class="emergencySubType">Emergency SubType</th>
				 <th class="callTime">Call Time</th>
				 <th class="assignedTime">Assigned Time</th>
				 <th class="departureTime">Departure Time</th>
				 <th class="sceneArrivalTime">Scene Arrival Time</th>
				 <th class="sceneDepartureTime">Scene Departure Time</th>
				 <th class="hospitalReachTime">Hospital Reach Time</th>
			 </tr>
			 <tbody id="createNewTablePopTbody" class="createNewTablePopTbody">
			</tbody>
			</table>
			</div>
			<div class="createNewTable-footer">
			</div>
			</div>
		</div>
<script>  

function onLoad(){
	document.getElementById("Loading").style.display="none";
	document.getElementById("LoadingImage").style.display="none"; 
	var maxDate = "<%= request.getAttribute("maxDate") %>";
var districtName = "<%= request.getAttribute("districtName") %>";
var hospitalName = "<%= request.getAttribute("hospitalName") %>";
var ambIncTableData = <%= request.getAttribute("ambIncTableData")%>;
var ambIncByEmerTypeData = <%= request.getAttribute("ambIncByEmerTypeData")%>;
var hospitalIncData = <%= request.getAttribute("hospitalIncData")%>;
var hospitalIncByEmerTypeData = <%= request.getAttribute("hospitalIncByEmerTypeData")%>;
var hospitalCaseData = <%= request.getAttribute("hospitalCaseData")%>;
var hospitalCaseTimingData = <%= request.getAttribute("hospitalCaseTimingData")%>;
var hospitalCaseComparisonData = <%= request.getAttribute("hospitalCaseComparisonData")%>;
	$('#districtName').val(districtName);
	 $( "#date" ).datepicker({
			dateFormat: 'yy-mm-dd',	
		/* 	showOn: "both", */
			/* buttonImageOnly: true, 
			buttonImage: "images/cal_icon.gif",*/
		});
	document.getElementById('date').value = maxDate;  
	displayTopLeftTableData(ambIncTableData);
	displayTopMiddleTableData(ambIncByEmerTypeData);
	getDrillDownChart(hospitalIncData,hospitalIncByEmerTypeData,districtName);
	displayMiddleTableData(hospitalCaseData);
	getStackedBarChart(hospitalCaseTimingData,hospitalName);
	getComparisonChart(hospitalCaseComparisonData,hospitalName);
}	
createNewTable.style.display = "none";
$('.createNewTable-reportClose').click(function() {
	createNewTable.style.display = "none";
	$("#createNewTablePopTbody").empty();
});
$('#createNewTablePopTbody').prop('contenteditable', false);

function displayTopLeftTableData(ambIncTableData){
	var $select=$('#topLeftTable1 tbody');
	$select.find('tr').remove();
	  for(i=0;i<ambIncTableData.length;i++){
	  	  	$("#topLeftTable1 tbody").append('<tr onclick="districtOnClick(this);"><td style=" border: 1px solid black;"> '+ambIncTableData[i].label+' </td><td style="text-align: center; border: 1px solid black;"> '+ambIncTableData[i].ambValue+'</td><td style="text-align:center; border: 1px solid black;">'+ambIncTableData[i].incValue+'</td></tr>');
	  }
}

function displayTopMiddleTableData(ambIncByEmerTypeData){
	var $select=$('#topLeftTable2 tbody');
	$select.find('tr').remove();
	  for(i=0;i<ambIncByEmerTypeData.length;i++){
	  	  	$("#topLeftTable2 tbody").append('<tr><td style=" border: 1px solid black;"> '+ambIncByEmerTypeData[i].emergencyType+' </td><td style=" border: 1px solid black;"> '+ambIncByEmerTypeData[i].emergencySubType+'</td><td style="text-align:center; border: 1px solid black;">'+ambIncByEmerTypeData[i].count+'</td></tr>');
	  }
}
function displayMiddleTableData(hospitalCaseData){
	 for(var i in hospitalCaseData){
		$("#createNewTablePopTbody").append('<tr align="top"><td>'+hospitalCaseData[i].incidentLocation+'</td><td>'+hospitalCaseData[i].emergencyType+'</td><td>'+hospitalCaseData[i].emergencySubType+'</td><td>'+hospitalCaseData[i].callTime+'</td><td>'+hospitalCaseData[i].assignedTime+'</td><td>'+hospitalCaseData[i].departureTime+'</td><td>'+hospitalCaseData[i].sceneArrivalTime+'</td><td>'+hospitalCaseData[i].sceneDepartureTime+'</td><td>'+hospitalCaseData[i].hospReachTime+'</td></tr>');
	 }
}
function districtOnClick(val){
	var district = $(val).find('td:first').text();
	var mode="onClick";
	/* alert(district); */	
	var all_tr = $('#topLeftTable1 tr');
	all_tr.removeClass('highlightSelected');
	$(val).addClass('highlightSelected');
	district=district.trim();
	document.getElementById('districtName').value = district;  
	getDistrictwiseAggData(district,mode);
}

function districtOnSearch(){
	var district = $('#districtName').val();
	var mode="onSearch";
	/* alert(district); */
	getDistrictwiseAggData(district,mode);
}
function getDistrictwiseAggData(district,mode){
	/* alert(district); */
	/* alert("hsdsi"); */
	document.getElementById("Loading").style.display="inline";
	document.getElementById("LoadingImage").style.display="inline";
	var districtName = district;
	var date=$("#date").val();
	var searchMode=mode;
	$.ajax({
		type:"POST",
		url:'ambulanceCaseReportOnSearch.do',
		'data':{
			districtName:districtName,date:date,searchMode:searchMode
		},
		 success: function(result){
			 document.getElementById("Loading").style.display="none";
			 document.getElementById("LoadingImage").style.display="none"; 
			 var jsonData = JSON.parse(result);
			 var hospitalName = jsonData.hospitalName;			     
			 var ambIncByEmerTypeData = jsonData.ambIncByEmerTypeData;
			 var hospitalIncData =jsonData.hospitalIncData;
			 var hospitalIncByEmerTypeData = jsonData.hospitalIncByEmerTypeData;
			 var hospitalCaseData = jsonData.hospitalCaseData;
			 var hospitalCaseTimingData = jsonData.hospitalCaseTimingData;
			 var hospitalCaseComparisonData = jsonData.hospitalCaseComparisonData;
			 $('#createNewTablePopUpHeading').val('Case Details in '+hospitalName);
			 $('#emerTypeInc').val('Incidents by Emergency Type in '+districtName);	 		 
			 if(searchMode == "onSearch"){	
				var ambIncTableData = jsonData.ambIncTableData;
			 	displayTopLeftTableData(ambIncTableData);
			 }
			displayTopMiddleTableData(ambIncByEmerTypeData);
			getDrillDownChart(hospitalIncData,hospitalIncByEmerTypeData,districtName);
			displayMiddleTableData(hospitalCaseData);
			getStackedBarChart(hospitalCaseTimingData,hospitalName);
			getComparisonChart(hospitalCaseComparisonData,hospitalName);
		 },
		 error: function (xhr, status, error) {
                alert("Internal Error Occured-Please Contact System Administrator");
		 }});
}	
function getDrillDownChart(hospitalIncData,hospitalIncByEmerTypeData,districtName) {

    // Create the chart
    $('#topRight').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Incidents by Hospital in '+districtName
        },
        xAxis: {
            type: 'category'
        },
        yAxis : {
                title: {
                  text: 'Incidence Count'
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
            name: 'Hospital',
            colorByPoint: true,
            data:  hospitalIncData
        }],
        drilldown: {
            series: hospitalIncByEmerTypeData	            	 
        }
    });
}
function getComparisonChart(hospitalCaseComparisonData,hospitalName){
	var normalChartProperties={"renderAt": 'bottomRight', "width": '625',"height": '350',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
	StaticChart("doughnut2d",normalChartProperties,"IFT Vs Non-IFT Comparison in " +hospitalName,hospitalCaseComparisonData,"Incidence Count","Hospital Name");	
}

function getStackedBarChart(hospitalCaseTimingData,hospitalName){
	 FusionCharts.ready(function(){
		    var fusioncharts = new FusionCharts({
		    type: 'stackedcolumn2d',
		    renderAt: 'bottomLeft',
		    width: '625',
		    height: '350',
		    dataFormat: 'json',
		    dataSource: {
		        "chart": {
		            "caption": "Incident wise Time Analysis in "+hospitalName,
		            "xAxisname": "Emergency Type",
		            "yAxisName": "Time Taken",
		            //To show value as datavalue and percent value in tooltip
		            "showValues": "0",
		            "showSum": "1",
		            //Value font color
		            "valueFontColor": "#ffffff",
		            "theme": "fint"
		        },

		        "categories": [{
		            "category": hospitalCaseTimingData
		        }],

		        "dataset": hospitalCaseTimingData
		    }
		}
		);
		    fusioncharts.render();
		});
}
function showCaseDetails(){
	var createNewTable = document.getElementById('createNewTable');
	createNewTable.style.display = "block";
}
$('.caseDetails-reportClose').click(function() {
	caseDetails.style.display = "none";
});
$('#caseDetailPopTbody').prop('contenteditable', false);

	function showPrediction(){
		var contextpath='<%=request.getContextPath()%>'; 		
		document.location.href=contextpath+"/"+'ambulancePredictionReport.do'; 
	}
	
	function getIncidentReport(){
		var contextpath='<%=request.getContextPath()%>'; 				
		document.location.href=contextpath+"/"+'ambulanceReport.do'; 
	}
</script>
</body>
<!--  <script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>  -->
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
</html>