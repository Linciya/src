<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HS Dashboard</title>
<link rel="stylesheet" href="css/HSAutocomplete.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jquery/ui/1.11.4/jquery-ui.js"></script> 
<script src="js/fusioncharts.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncolumn3d.js"></script>
<script src="js/fusionpie.js"></script>
<script src="js/projectedBar.js"></script>
<style>		
.d3-tip {
	line-height: 1;
	font-weight: bold;
	padding: 12px;
	background: rgba(0, 0, 0, 0.8);
	color: #fff;
	border-radius: 2px;
}		
/* Creates a small triangle extender for the tooltip */
.d3-tip:after {
	box-sizing: border-box;
	display: inline;
	font-size: 10px;
	width: 100%;
	line-height: 1;
	color: rgba(0, 0, 0, 0.8);
	content: "\25BC";
	position: absolute;
	text-align: center;
}		
/* Style northward tooltips differently */
.d3-tip.n:after {
	margin: -1px 0 0 0;
	top: 100%;
	left: 0;
}
#container {
    height: 400px; 
    min-width: 310px; 
    max-width: 800px;
    margin: 0 auto;
}		
#tfnewsearch{
	float:right;
	padding:20px;
}		
.tftextinput{
	margin: 0;
	padding: 5px 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-size:14px;
	border:1px solid #0076a3; border-right:0px;
	border-top-left-radius: 5px 5px;
	border-bottom-left-radius: 5px 5px;
}			
.textinput{
	margin: 0;
	padding: 5px 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-size:14px;
	border:1px solid #0076a3; /* border-right:0px; */
	border-top-left-radius: 5px 5px;
	border-top-right-radius: 5px 5px;
	border-bottom-left-radius: 5px 5px;
	border-bottom-right-radius: 5px 5px;
}		
.tfbutton {
	margin: 0;
	padding: 5px 10px;
	font-family: Arial, Helvetica, sans-serif;
	font-size:14px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
	border: solid 1px #0076a3; border-right:0px;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
	background: -moz-linear-gradient(top,  #00adee,  #0078a5);
	border-top-right-radius: 5px 5px;
	border-bottom-right-radius: 5px 5px;
}		
.tfbutton:hover {
	text-decoration: none;
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);
}		
	/* Fixes submit button height problem in Firefox */
.tfbutton::-moz-focus-inner {
	border: 0;
}
div#fixedheader {
	position:fixed;
	top:0px;
	left:0px;
	width:100%;
	color:white;
	background:#007297;
	font-size:20px;
	padding:20px;
}	
.axis path,
.axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}		
.bar {
	fill: steelblue;
}
/* Toggle Menu CSS Start */
div#dm{
	width:1000px;
}
.dropdown{
	margin-left: 100px;
}
div#drop{
	margin-right:30px;
	margin-top:10px;
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
#directorateNameHeader{
	padding-left:10px;
	font-family: Verdana;
	font-size: 12px;
	font-size:14px;
	width:99.3%;
	color:black;
	height:30px;
	padding-top:6px;
	background-image: linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -o-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -moz-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -webkit-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -ms-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
}
table#projectTable tr{
	border: 1px solid steelblue;
}
table#projectTable tr:nth-child(odd) {
    background-color: #dddddd;
}
/* Toggle Menu End*/
</style>
</head>
<body onload="OnLoad();">
<form name="hsDashboard" method="POST" action="hsDashboard" id="hsDashboard">
<div class="mainDiv">
<div id="directorateNameHeader"><spring:message code="shdrc_hsdashboard_header_name"/></div>
	<div>
		<div style="float: left; width:100%;padding-bottom: 10px;padding-top: 10px;" >
			<label id="dashboardIndName" style="font-size: 11px"><%= request.getAttribute("dashIndName") %></label>
			<input id ="searchOptions" type="text" class="textinput" size="40" value="<%= request.getAttribute("searchOption") %>" style="width:200px;">
			<input id ="searchParam" type="text" class="textinput" name="searchParam" size="30" value="<%= request.getAttribute("searchParameter") %>" maxlength="30">
			<input id ="searchInstParamList" type="text" class="tftextinput" size="50"/><input id="searchButton" name="searchButton" type="button" value="search" class="tfbutton" onclick="doSearch();" />
			<input id="viewButton" name="viewButton" type="button" value="View All Data" class="tfbutton" onclick="viewData();" />	
		</div>			
	</div>
<div style="position:absolute;right:10px;top:84px;">
<div class="nav navbar-nav navbar-right" id="drop">
    <div class="dropdown">
    	<%--  <a id="click" href="<%=request.getContextPath()%>/shdrcHome.do" style="padding-right: 10px;">Main Home</a> --%>
 		 <a id="click" href="#" data-toggle="dropdown">BROWSE ALL INDICATORS  &#9776;</a>
   	<div class="dropdown-menu" id="dm">
         <div class="row"> 
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Chickunguniya Cases"><div class="arrow">&#10146;</div><div class="col-xs-4">Chickunguniya Cases</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Deliveries Conducted"><div class="arrow">&#10146;</div><div class="col-xs-4">Deliveries Conducted</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Dengue Cases"><div class="arrow">&#10146;</div><div class="col-xs-4">Dengue Cases</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Disease Outbreak Alert"><div class="arrow">&#10146;</div><div class="col-xs-4">Disease Outbreak Alert</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Dysfunctional Equipment Indicator"><div class="arrow">&#10146;</div><div class="col-xs-4">Dysfunctional Equipment</div></a>
         </div>
         <div class="row">
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Dysfunctional Operation Theatre Indicator"><div class="arrow">&#10146;</div><div class="col-xs-4">Dysfunctional Operation Theatre</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Excess of Average Length of Stay"><div class="arrow">&#10146;</div><div class="col-xs-4">Average Length of Stay</div></a> 
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Fever Cases"><div class="arrow">&#10146;</div><div class="col-xs-4">Fever Cases</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Hospital Death Rate"><div class="arrow">&#10146;</div><div class="col-xs-4">Hospital Death Rate</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Infant Mortality Rate"><div class="arrow">&#10146;</div><div class="col-xs-4">Infant Mortality Rate</div></a>
         </div>
         <div class="row"> 
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Inpatients Treated"><div class="arrow">&#10146;</div><div class="col-xs-4">Inpatients Treated</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Maternal Mortality Rate"><div class="arrow">&#10146;</div><div class="col-xs-4">Maternal Mortality Rate</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Non Availability of Drugs"><div class="arrow">&#10146;</div><div class="col-xs-4">Non Availability of Drugs</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Number of Lab Tests done per 1000 patients"><div class="arrow">&#10146;</div><div class="col-xs-4">Lab Tests done per 1000 patients</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Operation Theatre Utilization / Underutilized Operation Theatres"><div class="arrow">&#10146;</div><div class="col-xs-4">Operation Theatre Utilization</div></a>
         </div>
         <div class="row"> 
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Outpatients Treated"><div class="arrow">&#10146;</div><div class="col-xs-4">Outpatients Treated</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Assisted Deliveries"><div class="arrow">&#10146;</div><div class="col-xs-4">Assisted Deliveries %</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Beds Vacant / Underutilized Bed Occupancy"><div class="arrow">&#10146;</div><div class="col-xs-4">Bed Occupancy %</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Cesarian Deliveries"><div class="arrow">&#10146;</div><div class="col-xs-4">Cesarian Deliveries %</div></a>  
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Deaths among Accident and Emergency Cases"><div class="arrow">&#10146;</div><div class="col-xs-4">Accident and Emergency Case %</div></a>
         </div>
         <div class="row"> 
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of High Risk Pregnancies among ANCs registered"><div class="arrow">&#10146;</div><div class="col-xs-4">High Risk Pregnancies %</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Neonatal Deaths among Live Births"><div class="arrow">&#10146;</div><div class="col-xs-4">Neonatal Deaths among Live Births</div></a> 
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Referral among inpatients treated"><div class="arrow">&#10146;</div><div class="col-xs-4">Referral among inpatients treated</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Short Supply of Drugs"><div class="arrow">&#10146;</div><div class="col-xs-4">Short Supply of Drugs</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Staff Deficiency"><div class="arrow">&#10146;</div><div class="col-xs-4">Staff Deficiency</div></a>
         </div>
         <div class="row"> 
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Surgical Load of Surgeons"><div class="arrow">&#10146;</div><div class="col-xs-4">Surgical Load of Surgeons</div></a>
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Swine Flu Cases"><div class="arrow">&#10146;</div><div class="col-xs-4">Swine Flu Cases</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Deaths reported due to TB"><div class="arrow">&#10146;</div><div class="col-xs-4">Deaths reported due to TB</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Infant Deaths"><div class="arrow">&#10146;</div><div class="col-xs-4">Infant Deaths</div></a>  
             <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Maternal Deaths"><div class="arrow">&#10146;</div><div class="col-xs-4">Maternal Deaths</div></a>
         </div>
         <div class="row"> 
         	 <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Mothers referred out"><div class="arrow">&#10146;</div><div class="col-xs-4">Mothers referred out</div></a>
           <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Neonatal Cases Referred out"><div class="arrow">&#10146;</div><div class="col-xs-4">Neonatal Cases Referred out</div></a>
           <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Organ Transplants done"><div class="arrow">&#10146;</div><div class="col-xs-4">Organ Transplants</div></a>
           <a class="ex-link" href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Vehicles Off-road"><div class="arrow">&#10146;</div><div class="col-xs-4">Vehicles Off-road</div></a>           
          </div>
          </div>
        </div>
    </div>
</div>
<div style="width:100%;">
<input id="indValue"  type="hidden" name="indValue" /> 
<input id="indName"  type="hidden" name="indName" value="<%= request.getAttribute("dashIndName") %>">
<div id="errorMsg" style="background:#E9FFDB;">
	<p align="center" style="padding-top:220px;font-size: 16px;color:#E9FFDB;font-weight: bold;"> Your search did not match any documents.
			Make sure that your criteria is spelled correct.</p>		
</div>
<div id="streamingdist" style="width:100% ;height:20px;">
	<label id="dashboardIndStateValue" style="height:20px;float:left; width:20%;background:#007297;font-family:sans-serif;font-size:12px;color:white;padding-top: 3px;">Streaming Data : <%= request.getAttribute("stateValue") %> <label style="float:right;font-family:sans-serif;font-size:12px;color:white;">District  :  </label></label>
	<label style="float: Right;width:80%;height:20px;"> <marquee scrollAmount="6" onmouseover="stop();"  onmouseout="start();" style="float:right;background:#3B9C9C;font-family:sans-serif;font-size:12px;color:white;height:20px;padding-top: 3px;">	<%= request.getAttribute("districtDataList") %></marquee></label>
</div>
<div style="width:79.4%;">
	<div id="topLeft" align="center" style="background:#E9FFDB;width:50%;height:350px;margin-top:53px; margin-left:1px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
		<div id="barChart" style="padding-top:0px;"></div>
		<div id="msgTopLeft" style="padding-top:120px;">
			<p>This Report has no data for the selected Month and Year </p>
		</div>
	</div>
	
	<div id="topright" align="center" style="background:#E9FFDB;width:48.8%;height:350px;margin-top:-352px;float:right; border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
		<div id="pieChart" style="padding-top:0px;"></div>
		<div id="msgTopRight" style="padding-top:100px;">
			<p>This Report has no data for the selected Month and Year </p>
		</div>
	</div>
</div>		
<div id="streamingInst" style="width:89%;height:20px;padding-top:3px;">
		<label style="height:20px;float:left; width:20%;background:#007297;font-family:sans-serif;font-size:12px;color:white;padding-top: 3px;">Streaming Data : <label style="float:right;font-family:sans-serif;font-size:12px;color:white;">Institutions  :   </label></label>
		<label id="dashboardIndInstValue" style="height:20px; width:69%"><marquee scrollAmount="6" onmouseover="stop();" onmouseout="start();" style="float:right;background:#3B9C9C;font-family:sans-serif;font-size:12px;color:white;height:20px;padding-top: 3px;">	<%= request.getAttribute("institutionDataList") %></marquee></label>
</div>
<div style="width:89%;padding-bottom:3px;">
	<div id="bottomLeft" align="center" style="background:#E9FFDB;width:89%;height:300px;float:left;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
		<div id="multiseriesChart" style="padding-top:0px;"></div>
		<div id="msgBottom" style="padding-top:100px;">
			<p>This Report has no data for the selected Month and Year </p>
		</div>
	</div>
</div>
<div id="rightSideTable" align="center" style="width:20%;height:680px;margin-top:-383px;float:right; border:0.1px solid black;box-shadow: 0 0 1em olive;overflow: scroll;">
		<div style="width:100%;float:right;" id="dashboardIndInst"><label id="dashboardIndInstValue" style="float:left;"><marquee scrollAmount="3" onmouseover="stop();" onmouseout="start();" style="float:right;background:#999999;font-family:sans-serif;font-size:11px;color:#ffff33;">Cumulative Indicator Projections For The Current Year</marquee></label></div>
		<div id="cumulativeTable" style="background:#E9FFDB;width:100%;float:right;margin-top:-5px;font-family:sans-serif;font-size:11px;color:white;padding-left:28px;">
			<table id ="projectTable" cellpadding="1" style="width:100%;" >
					<tr><th colspan="3" align="center" style="font-family:sans-serif;font-size:16px;color:white;padding-left:10px;padding-top:15px;padding-bottom:5px;background:steelblue;">Cumulative Projected Value</th></tr>
					<tr><th colspan="3" align="center" style="font-family:sans-serif;font-size:13px;color:white;padding-left:50px;padding-top:3px;padding-bottom:15px;padding-left:20px;background:steelblue;"><%= request.getAttribute("cumulativeProjectedSubCaption") %> </th></tr>
			</table>
		</div>
</div>
</div>
</div>
<script>
var form = $('#hsDashboard');
searchList = ${searchOptionsList} ;
paramList = ${searchParamList};
InstParamList= ${searchInstParamList};

function doSearch() {
	var searchParam=document.getElementById("searchParam").value;
	var searchInstParam=document.getElementById("searchInstParamList").value;
	searchParam = searchParam.replace(/[^a-zA-Z0-9]/g, ' ');
	searchParam=searchParam.replace(/  +/g, ' ');
	if(searchParam.lastIndexOf(",")!=-1){
		searchParam=searchParam.substring(0,searchParam.length-1);
	 }
	getGridData(searchParam,searchInstParam); 
}
function split( val ) {
      return val.split( /,\s*/ );
   }
function extractLast( term ) {
      return split( term ).pop();
}
$("#searchOptions").autocomplete({  
       source: function(request, response) {
           var results = $.ui.autocomplete.filter(searchList, request.term);
		response(results.slice(0, 10));
       } ,
       select: function(event, ui) {  
                $("#searchOptions").val(ui.item.label);                  
                $("#searchParam").val(ui.item.value); 
               document.getElementById(indName).value=(ui.item.indName);
              $('#indName').val(ui.item.indName);
               var searchParam=document.getElementById("searchParam").value;
               return false;  
           } 
   });
$("#searchParam").autocomplete({        
	minLength: 0,
       source: function( request, response ) {
         var results= $.ui.autocomplete.filter(
           paramList, extractLast( request.term ) ) ;
         response(results.slice(0, 10));
       },
       focus: function() {
         return false;
       },
       select: function( event, ui ) {
         var terms = split( this.value );
         // remove the current input
         terms.pop();
         // add the selected item
         terms.push( ui.item.value );
         // add placeholder to get the comma-and-space at the end
         terms.push( "" );
         this.value = terms.join( "," );
         return false;
       }
     });    
$("#searchInstParamList").autocomplete({
	source: function(request, response) {
           var results = $.ui.autocomplete.filter(InstParamList, request.term);
		response(results.slice(0, 10));
       }
});
function getGridData(searchParam,searchInstParam){
	var indName = $('#indName').val();
	$.ajax({
		type: "POST",		
                 contentType: "application/json; charset=utf-8", 
		url: "doSearch.do?searchParam="+searchParam+"&indName="+indName+"&searchInstParam="+searchInstParam,
		success: function (output) {
			var result=output.trim();
			if(result == 'InvalidInput'){
				disableAllDivContainer();
				document.getElementById("errorMsg").style.display="inline";
			}
			else if(result == 'NoData'){
				disableAllDivContainer();
				document.getElementById("msgTopLeft").style.display="inline";
				document.getElementById("msgTopRight").style.display="inline";
				document.getElementById("msgBottom").style.display="inline";
			}
			else{
				disableErrorMsgContainer();
				enableAllDivContainer();
				var gridData = JSON.parse(result);						    	
		    	var indData = gridData.indicatorDetailsList;
		    	var projectedData=gridData.projectedValue;  
		    	var topDistrictsData=gridData.topDistrictList;  
		    	var bottomDistrictsData=gridData.bottomDistrictList;  
		    	var projectedValueSubCaption= gridData.projectedValueSubCaption;
		    	var barChartSubCaption="Indicator Value for "+gridData.barChartSubCaption;
		    	
		        if(topDistrictsData==null){
					bar(indData,indName,barChartSubCaption);
				}else{
					bar(topDistrictsData,indName,"Top 10 Indicator Value");
				}
				if(projectedData!=null && projectedData.length>0){
					projectedBar(projectedData,indName,projectedValueSubCaption);
				}
				else{
					 document.getElementById("msgBottom").style.display="inline"; 
				}
				if(bottomDistrictsData!=null && bottomDistrictsData.length>0){
					pie(bottomDistrictsData,indName);
				}else{
					$('#pieChart').hide();
				}
			}
	   	    },
	    error: function () {
	    $("#errorMessage").text("Save Error");				    
    }});				
}

function OnLoad(){
document.getElementById("errorMsg").style.display="none";
document.getElementById("msgTopRight").style.display="none";
document.getElementById("msgTopLeft").style.display="none";
document.getElementById("msgBottom").style.display="none";
var indicatorDetailsList = <%= request.getAttribute("indicatorDetailsList") %>;
var topDistrictList = <%= request.getAttribute("topDistrictList") %>;
var bottomDistrictList = <%= request.getAttribute("bottomDistrictList") %>;
var projectedValue = <%= request.getAttribute("projectedValue") %>;
var cumulativeProjectedValue = <%= request.getAttribute("cumulativeProjectedValue") %>;
var projectedValueSubCaption = '<%= request.getAttribute("projectedValueSubCaption") %>';
		var indName=document.getElementById('indName').value;				
		if(topDistrictList!=null && topDistrictList.length>0){
			bar(topDistrictList,indName,"Top 10 Indicator Value");
			document.getElementById("msgTopLeft").style.display="none";
		}else{
			document.getElementById("msgTopLeft").style.display="inline";
			disableAllDivContainer();
		}
		if(projectedValue!=null && projectedValue.length>0){
			projectedBar(projectedValue,indName,projectedValueSubCaption);
			document.getElementById("msgBottom").style.display="none";
		}else{
			 document.getElementById("msgBottom").style.display="inline"; 
		}
		if(bottomDistrictList!=null && bottomDistrictList.length>0){
			pie(bottomDistrictList,indName);
		}else{
			document.getElementById("msgTopRight").style.display="inline";
		}
	    for(var i=0;i<cumulativeProjectedValue.length;i++){
		   var inserRow='<tr><td> '+cumulativeProjectedValue[i].district+' </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td> '+cumulativeProjectedValue[i].projectedValue+'</td></tr><br>'
		   $("#projectTable").append(inserRow);			  
	     //  $("#projectTable").append('<tr style="height:10%;"><td>&nbsp;</td></tr>');
	      } 
	}
	
	function disableAllDivContainer(){
		$('#barChart').hide();
		 $('#pieChart').hide();
		 $('#multiseriesChart').hide();
		// $('#rightSideTable').hide();
		 $('#dashboardIndInst').hide();
		 $('#streamingInst').hide();
		 $('#streamingdist').hide();
	}
	
	function enableAllDivContainer(){
		$('#barChart').show();
		 $('#pieChart').show();
		 $('#multiseriesChart').show();
		// $('#rightSideTable').show();
		 $('#dashboardIndInst').show();
		 $('#streamingInst').show();
		 $('#streamingdist').show();
	}
	
function disableErrorMsgContainer(){
		$('#msgTopLeft').hide();
		$('#msgTopRight').hide();
		$('#msgBottom').hide();
		 $('#errorMsg').hide();
	}
	
	function viewData(){
		var searchParam=document.getElementById("searchParam").value;
		var indName = $('#indName').val();
		var submitType="ViewAllData";
		var url = webUrl+
		'?searchParam='+searchParam+
		'&indicatorName='+indName+
		'&submitType='+submitType;
		window.open(url, null,
		"height=480,width=500,status=no,toolbar=no,menubar=no,location=no,left=350px,scrollbars=no,resizable=no,fullscreen=no,top=200px");
	}
	
	<% String requestURL=request.getRequestURL().toString();
String contextPath=request.getContextPath();
int urlIndex = requestURL.lastIndexOf(contextPath);
String hostName=requestURL.substring(0,urlIndex);
String webUrl =hostName+contextPath+"/"+"hsDashboardAllDirstictData.do";
%>
var webUrl='<%=webUrl%>';
var contextPath='<%=contextPath%>';
var hostName='<%=hostName%>';
</script>
</form>
		</body>
</html>
