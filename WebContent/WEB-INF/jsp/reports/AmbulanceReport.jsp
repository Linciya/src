<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>108 Ambulance Report</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="js/Fusion.js"></script>
		<script src="js/fusioncharts.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
		<script src="js/d3.v3.min.js"></script>
		<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_UN3281vLu65MNaK-y6w2XFxN_Wvo97M&callback=initMap" type="text/javascript"></script> 
		<script src="gis/jsondata.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>	
		<script src="js/script.js"></script>
		
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<style>
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
			
			#loading {width: 100%;height: 100%;top: 0px;left: 0px;position: fixed;display: block; z-index: 99}

		#loading-image {position: absolute;top: 40%;left: 45%;z-index: 100} 
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
			<div id="directorateNameHeader"><b>Incidents Reported for the Day</b></div>	
			<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
				<table>
					<tr>
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_frequency"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<select id="frequency" name="frequency" class="reportDropDown" style="width:150px;" onchange="frequencyChange();">
								<option value="Daily"><spring:message code="option_frequency_Daily"/></option> 
								<option value="Monthly"><spring:message code="option_frequency_monthly"/></option> 
								<option value="Yearly"><spring:message code="option_frequency_yearly"/></option> 
							</select>
						</td>	
						
						<%-- <td class="searchCriteria" style="padding-left:5px;"><spring:message code="label_searchcriteria_from"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<input type="text" class="inputText" id="txtFrom" name="txtFrom">
						</td>
						<td class="searchCriteria" style="padding-left:5px;"><spring:message code="label_searchcriteria_to"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<input type="text" class="inputText" id="txtTo" name="txtToDate"/>
						</td> --%>
						
						<td class="searchCriteria" style="padding-left:5px;">
							<label id="lblDate"><spring:message code="label_searchcriteria_date"/></label>
							<label id="lblYear"><spring:message code="label_searchcriteria_year"/></label>
						</td>						
						<td class="searchCriteria" style="padding-left:3px;">	
							<input type="text" class="inputText" id="searchDate" name="searchDate" />
							<select name="year" id="year"  class="dropDown" size="1" style="width:65px;">
								<option value="">--Select--</option>
							     <c:forEach var="year" items="${yearList}">
								     <option value='<c:out value="${year}"/>'>${year} </option>
								 </c:forEach>
							</select>
						</td>
						
						<td class="searchCriteria" style="padding-left:5px;">
							<label id="lblMonth"><spring:message code="label_searchcriteria_month"/></label>
						</td>						
						<td class="searchCriteria" style="padding-left:3px;">	
							<select name="month" id="month" class="dropDown" size="1" style="width:85px;">
								<option value="">--Select--</option>
							    <c:forEach var="month" items="${monthsList}">
							     	<option value='<c:out value="${month.name}"/>'>${month.name} </option>
							 	</c:forEach>
							</select>
						</td>		
						
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_emergencyType"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<select id="emergencyType" name="emergencyType" class="reportDropDown" style="width:150px;" onchange="emergencyTypeChange();">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="emerType" items="${emergencyTypeList}">
									<option value='<c:out value="${emerType.name}"/>'>${emerType.name} </option>
								</c:forEach>
							</select>
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
							<button onclick="onSearch('searchBtnClick',null,null,null);"><spring:message code="label_searchcriteria_search"/></button>
						</td>	
						<td class="searchCriteria"><label id="Loading" style=""><spring:message code="label_Loading"/></label><img id="LoadingImage" src="images/siren.gif" alt="Progressing" style="width:30px;height:30px;"></td>
						<td class="searchCriteria" style="float:right;margin-bottom:5px;margin-top:5px;"">
							<button style="background-color:#FFF8C6;color:black;" onclick="showPrediction();">Prediction</button>
						</td>	
						<td class="searchCriteria" style="float:right;margin-bottom:5px;margin-top:5px;"">
							<button style="background-color:#FFF8C6;color:black;" onclick="getCaseReport();">Case Report</button>
						</td>
					</tr>
				</table>
				<div class="nav navbar-nav navbar-right" id="drop">
         			<div class="dropdown">
              		<a id="click" href="#" data-toggle="dropdown" style="font-size: 13px;margin-left: -55px;font-weight: bold;color:blue;"><u>BROWSE ALL DASHBOARD  &#9776;</u></a>
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
			<div style="width:99.3%;">		
				<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<label>Incidents reported by District</label>
					<div id="map" class="col-md-6" style="width:99%;height:320px;"></div>
					
					<div id="legend"></div>   
				</div>
				<div id="topRight" align="center" style="width:48.9%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;overflow: auto;">
				</div>
			</div>
			<div style="width:99.3%;">		
				<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;overflow: auto;">
				<p style="margin-top:15px;"><b>Day-wise Incidents reported</b></p>
				</div>
				<div id="bottomRight" align="center" style="width:48.9%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				</div>
			</div>
		</div>
		
	<script>	
	//ChartProperties
	var heatMapHeader="108 Emergency Incident";
	var heatMapSubCaption="Hour-wise";
	var heatMapXAxisName="Hour";
	var captionAlignment="left";		
	heatMapBottomProperties={"renderAt":'#bottomLeft',"top":50,"right":0,"bottom":0,"left":160,"width":1400,"height":450,"buckets":9,"rx":40,"ry":40,"rectWidth":1,"rectHeight":1,"showLables":70,"showlabelPos":2,"gapx":1,"gapy":1};

	colours = ["#259012","#dec60d","#de0d0d"];
	/* "#96de0d","#de650d", */
	var comparisonChartProperties={"renderAt": 'bottomRight', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	
	function onLoad(){
		document.getElementById("Loading").style.display="none";
		document.getElementById("LoadingImage").style.display="none";
		var maxDate = "<%= request.getAttribute("maxDate") %>";
		var ambulanceGISReportData = <%= request.getAttribute("ambulanceGISReportData") %>;
		var ambulanceHourwiseHeatGridData = <%= request.getAttribute("ambulanceHourwiseHeatGridData") %>;
		var ambulanceDaywiseHeatGridData = <%= request.getAttribute("ambulanceDaywiseHeatGridData") %>;
		var ambulanceComparisonFirstSeriesData = <%= request.getAttribute("ambulanceComparisonFirstSeriesData") %>;
		var ambulanceComparisonSecondSeriesData = <%= request.getAttribute("ambulanceComparisonSecondSeriesData") %>;		
		var geoMapDistColor = <%= request.getAttribute("geoMapDistColor") %>;
		var heatMapDataRange = <%= request.getAttribute("heatMapDataRange") %>;
		
		document.getElementById('lblYear').style.display="none";
		document.getElementById('year').style.display="none";
		document.getElementById('lblMonth').style.display="none";
		document.getElementById('month').style.display="none";
		
		getCalender();
		document.getElementById('searchDate').value = maxDate;
		
		var dates = $( "#searchDate" ).datepicker({
	        changeMonth: true,
	        changeYear: true,
	        maxDate: new Date(),
	        dateFormat: "dd-mm-yy",
	      onSelect: function( selectedDate ) {
	                var option = this.id == "txtFrom" ? "minDate" : "maxDate",
	                        instance = $( this ).data( "datepicker" ),
	                        date =$.datepicker.parseDate(
	                                instance.settings.dateFormat ||
	                                $.datepicker._defaults.dateFormat,
	                                selectedDate, instance.settings );
	                dates.not( this ).datepicker( "option", option, date );
	                dateChange();
	        }
		});
		
		//GIS Map
		getGeoMap(ambulanceGISReportData,geoMapDistColor);
		
		//heatMap
		var heatMapWidth = (ambulanceHourwiseHeatGridData.length)*6;
		var heatMapHeight = (ambulanceHourwiseHeatGridData.length)*3;
		var heatMapProperties={"type": 'heatmap',"renderAt": 'topRight',"width":heatMapWidth,"height":heatMapHeight,"dataFormat": 'json',"theme": "fint",
			"showPlotBorder": "0","gradient": "1","colorRangeCode": "#6da81e","startLabel": "Good","endLabel": "Poor", "colorRangeColorCode1": "#6da81e",
			"colorLabel1": "Good","colorRangeColorCode2": "#f6bc33","colorLabel2": "Average","colorRangeColorCode3": "#e24b1a","colorLabel3": "Bad"};
		var mngood=heatMapDataRange.minValue;
		var mxgood=Math.round(((heatMapDataRange.minValue)+(heatMapDataRange.avgValue))/2);
		var mnavg=Math.round(((heatMapDataRange.minValue)+(heatMapDataRange.avgValue))/2);
		var mxavg=Math.round(((heatMapDataRange.avgValue)+(heatMapDataRange.maxValue))/2);
		var mnpoor=Math.round(((heatMapDataRange.avgValue)+(heatMapDataRange.maxValue))/2);
		var mxpoor=heatMapDataRange.maxValue;
		var heatMapYAxisName="District";
		heatMap(heatMapProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,ambulanceHourwiseHeatGridData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
	
		//Vertical HeatMap
		verticalHeatMap(heatMapBottomProperties,colours,ambulanceDaywiseHeatGridData);
		
		//Comparison Chart
		StaticMSChart("msline",comparisonChartProperties,"Incidents trend comparison by month",ambulanceComparisonFirstSeriesData,ambulanceComparisonSecondSeriesData,"Month");
	
	}	
	
	function frequencyChange(){
		var frequency;
		var selectedFreq=document.getElementById("frequency");
		if (selectedFreq != 'undefined') {
			frequency=selectedFreq.options[selectedFreq.selectedIndex].value; 
		 }
		if(frequency=="Daily"){
			document.getElementById('lblDate').style.display="inline";
			document.getElementById('searchDate').style.display="inline";
			document.getElementById('lblYear').style.display="none";
			document.getElementById('year').style.display="none";
			document.getElementById('lblMonth').style.display="none";
			document.getElementById('month').style.display="none";
		}
		else if(frequency=="Monthly"){
			document.getElementById('lblDate').style.display="none";
			document.getElementById('searchDate').style.display="none";
			document.getElementById('lblYear').style.display="inline";
			document.getElementById('year').style.display="inline";
			document.getElementById('lblMonth').style.display="inline";
			document.getElementById('month').style.display="inline";
		}
		else if(frequency=="Yearly"){
			document.getElementById('lblDate').style.display="none";
			document.getElementById('searchDate').style.display="none";
			document.getElementById('lblYear').style.display="inline";
			document.getElementById('year').style.display="inline";
			document.getElementById('lblMonth').style.display="none";
			document.getElementById('month').style.display="none";
		}
	}
	
	function dateChange(){
		var frequency;
		var selectedFreq=document.getElementById("frequency");
		if (selectedFreq != 'undefined') {
			frequency=selectedFreq.options[selectedFreq.selectedIndex].value; 
		 }
		
		var date = document.getElementById('searchDate').value;
		var month = document.getElementById('month').value;
		var year = document.getElementById('year').value;
		
		$.ajax({
			type:"POST",
			url:'ambulanceReportSearchDateChange.do',
			'data':{
				frequency:frequency,date:date,month:month,year:year
			},
			 success: function(result){
				 var jsonData = JSON.parse(result);
			    	var $select = $('#emergencyType');                           
		               $select.find('option').remove();   
		               $('<option>').val("").text("--Select--").appendTo($select);      
		               $.each(jsonData, function(idx, obj) { 
		                   $('<option>').val(obj.name).text(obj.name).appendTo($select);      
		               });					 	
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			    }});
	}
	
	function emergencyTypeChange(){
		var frequency;
		var selectedFreq=document.getElementById("frequency");
		if (selectedFreq != 'undefined') {
			frequency=selectedFreq.options[selectedFreq.selectedIndex].value; 
		 }
		
		if(frequency=="Daily"){
			var date = document.getElementById('searchDate').value;
			if(date==""){
				alert("Select Date");
				return false;
			}
		}
		if(frequency=="Monthly"){
			var month = document.getElementById('month').value;
			var year = document.getElementById('year').value;
			if(month==""){
				alert("Select Month");
				return false;
			}
			if(year==""){
				alert("Select Year");
				return false;
			}
		}
		if(frequency=="Yearly"){
			var year = document.getElementById('year').value;
			if(year==""){
				alert("Select Year");
				return false;
			}
		}
		
		var selectedEmergencyType=document.getElementById("emergencyType");
		if (selectedEmergencyType != 'undefined') {
			var emergencyType=selectedEmergencyType.options[selectedEmergencyType.selectedIndex].value; 
		 }		
		
		$.ajax({
			type:"POST",
			url:'ambulanceReportSearchEmergencyTypeChange.do',
			'data':{
				frequency:frequency,date:date,month:month,year:year,emergencyType:emergencyType
			},
			 success: function(result){
				 var jsonData = JSON.parse(result);
			    	var $select = $('#districtName');                           
		               $select.find('option').remove();   
		               $('<option>').val("").text("--Select--").appendTo($select);      
		               $.each(jsonData, function(idx, obj) { 
		                   $('<option>').val(obj.name).text(obj.name).appendTo($select);      
		               });					 	
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			    }});
	}
	
	function onSearch(methodName,geoMapData,geoMapcolor,distName){
		document.getElementById("Loading").style.display="inline";
		document.getElementById("LoadingImage").style.display="inline";
		var frequency;
		var selectedFreq=document.getElementById("frequency");
		if (selectedFreq != 'undefined') {
			frequency=selectedFreq.options[selectedFreq.selectedIndex].value; 
		 }
		
		if(frequency=="Daily"){
			var date = document.getElementById('searchDate').value;
			if(date==""){
				alert("Select Date");
				return false;
			}
		}
		else if(frequency=="Monthly"){
			var month = document.getElementById('month').value;
			var year = document.getElementById('year').value;
			if(month==""){
				alert("Select Month");
				return false;
			}
			if(year==""){
				alert("Select Year");
				return false;
			}
		}
		else if(frequency=="Yearly"){
			var year = document.getElementById('year').value;
			if(year==""){
				alert("Select Year");
				return false;
			}
		}
		
		var selectedEmergencyType=document.getElementById("emergencyType");
		if (selectedEmergencyType != 'undefined') {
			var emergencyType=selectedEmergencyType.options[selectedEmergencyType.selectedIndex].value; 
		 }		
		var districtName;
		if(methodName=="searchBtnClick"){
			var selectedDistrict=document.getElementById("districtName");
			if (selectedDistrict != 'undefined') {
				districtName=selectedDistrict.options[selectedDistrict.selectedIndex].value; 
			 }		
			
			if(districtName==""){
				alert("Select District Name");
				return false;
			}
		}
		else if(methodName=="geoMapClick"){
			districtName=distName;
			document.getElementById('districtName').value=districtName;
		}
		$.ajax({
			type:"POST",
			url:'ambulanceReportOnSearch.do',
			'data':{
				frequency:frequency,date:date,month:month,year:year,emergencyType:emergencyType,districtName:districtName,methodName:methodName
			},
			 success: function(result){
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
			 	var data = JSON.parse(result);
			 	if(methodName=="searchBtnClick"){
				 	var ambulanceGISReportData = data.ambulanceGISReportData;
				 	var geoMapDistColor = data.geoMapDistColor;
					getGeoMap(ambulanceGISReportData,geoMapDistColor);
			 	}
			 	else if(methodName=="geoMapClick"){
			 		changeGeoPlotOnClick(geoMapData,geoMapcolor)
			 	}
				
				var ambulanceHourwiseHeatGridData = data.ambulanceHourwiseHeatGridData;
				var heatMapDataRange = data.heatMapDataRange;
				var ambulanceDaywiseHeatGridData = data.ambulanceDaywiseHeatGridData;
				var ambulanceComparisonFirstSeriesData = data.ambulanceComparisonFirstSeriesData;
				var ambulanceComparisonSecondSeriesData = data.ambulanceComparisonSecondSeriesData;
			
				var heatMapWidth = (ambulanceHourwiseHeatGridData.length)*6;
				var heatMapHeight = (ambulanceHourwiseHeatGridData.length)*3;
				var heatMapProperties={"type": 'heatmap',"renderAt": 'topRight',"width":heatMapWidth,"height":heatMapHeight,"dataFormat": 'json',"theme": "fint",
						"showPlotBorder": "0","gradient": "1","colorRangeCode": "#6da81e","startLabel": "Good","endLabel": "Poor", "colorRangeColorCode1": "#6da81e",
						"colorLabel1": "Good","colorRangeColorCode2": "#f6bc33","colorLabel2": "Average","colorRangeColorCode3": "#e24b1a","colorLabel3": "Bad"};
				var mngood=heatMapDataRange.minValue;
				var mxgood=Math.round(((heatMapDataRange.minValue)+(heatMapDataRange.avgValue))/2);
				var mnavg=Math.round(((heatMapDataRange.minValue)+(heatMapDataRange.avgValue))/2);
				var mxavg=Math.round(((heatMapDataRange.avgValue)+(heatMapDataRange.maxValue))/2);
				var mnpoor=Math.round(((heatMapDataRange.avgValue)+(heatMapDataRange.maxValue))/2);
				var mxpoor=heatMapDataRange.maxValue;
				var heatMapYAxisName="Taluk";
				$('#bottomLeft').empty();
				heatMap(heatMapProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,ambulanceHourwiseHeatGridData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
				verticalHeatMap(heatMapBottomProperties,colours,ambulanceDaywiseHeatGridData);
				StaticMSChart("msline",comparisonChartProperties,"Incidents trend comparison by month",ambulanceComparisonFirstSeriesData,ambulanceComparisonSecondSeriesData,"Month");
			 },
			 error: function (xhr, status, error) {
	            alert("Internal Error Occured-Please Contact System Administrator");
			 }});
		return false;
	}
	
	function getGeoMap(ambulanceGISReportData,geoMapDistColor){	
		var locations = ambulanceGISReportData; 
	    var map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 7,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,	
	    });
	    
	    
        var icons = {
          green: {
            name: 'Green - Low Incidence Count'/* ,
            icon: 'images/location_map_pin_dark_green6.png' */
         
          },
          amber: {
            name: 'Amber - Average Incidence count'/* ,
            icon: 'images/map-marker-icon.png' */
          },
          red: {
            name: 'Red - High Incidence count'/* ,
            icon: 'images/location-icon-02.png' */
          }
        };
	    
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
	        mc = locations[i][3];	
	        switch (mc) {
	          case 'green':
	        	  image_src = 'images/location_map_pin_dark_green6.png';
                  break;

               case 'red':
                  image_src = 'images/map-marker-icon.png';
                  break; 
                  
               case 'yellow':
            	   image_src = 'images/location-icon-02.png';
            	   break; 
            	   
                default:
                  image_src = 'images/Location-Symbol.png';
	        }
	
	        marker = new google.maps.Marker({
	          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	          icon: new google.maps.MarkerImage(image_src,null, null, null, new google.maps.Size(15, 15)),
	          map: map,	
	          animation: google.maps.Animation.DROP
	        });	
	
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	          return function() {
	            infowindow.setContent(locations[i][0]);
	            infowindow.open(map, marker);
	            /* alert(locations[i][0]);
	            changeGeoPlotOnClick(ambulanceGISReportData,geoMapDistColor); */	            
	            onSearch("geoMapClick",ambulanceGISReportData,geoMapDistColor,locations[i][4]);
	          }
	        })(marker, i));
	      }
	
	      function showPosition(position) {
	        lat = position.coords.latitude;
	        lon = position.coords.longitude;
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
	        for (var key in icons) {
	          var type = icons[key];
	          var name = type.name;
	          /* var icon = type.icon; */
	          var div = document.createElement('div');
	          div.innerHTML =  /* '<img src="' + icon + '"> ' + */ name;
	          legend.appendChild(div);
	        }
	        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
	
	       /*  map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(
	          document.getElementById('legend'));*/
	      } 
	
	      function showError(error) {
	        map.setCenter(new google.maps.LatLng(10.964289, 78.056801)); // default 1st from array
	      }
	      
	     /*  layer = new google.maps.FusionTablesLayer(132848,
	    		    {
	    		        heatmap: true
	    		    });
	    		    layer.setMap(map); */
		}
	
	function verticalHeatMap(heatMapProperties,colours,heatMapData){
		var dataArray = heatMapData;
		var yAxisValues=[];
		for (var i=0;i<heatMapData.length;i++){
			yAxisValues.push(heatMapData[i].district);
		}
		var duplicatesArray=[];
		for (var i=0;i<heatMapData.length;i++){
			duplicatesArray.push(heatMapData[i].indicator);
		}
		var uniqueArray = duplicatesArray.filter(function(elem, pos) {
			  return duplicatesArray.indexOf(elem) == pos;
			});
		var xAxisValues=uniqueArray;
		
		if(heatMapData.length < 40){
			heatMapProperties.top=40;
			heatMapProperties.width=600;
			heatMapProperties.height=300;
			heatMapProperties.rectWidth = 1;
			heatMapProperties.rectHeight = 1;
			heatMapProperties.gapy = 1.5;
			heatMapProperties.showLables = 80; 
		}
		if(heatMapData.length > 40 && heatMapData.length < 65){
			heatMapProperties.top=50;
			heatMapProperties.width=900;
			heatMapProperties.height=400;
			heatMapProperties.rectWidth = 1;
			heatMapProperties.rectHeight = 1;
			heatMapProperties.gapy = 1.5;
			heatMapProperties.showLables = 180;
		}
		if(heatMapData.length > 65){
			heatMapProperties.top=50;
			heatMapProperties.width=900;
			heatMapProperties.height=400;
			heatMapProperties.rectWidth = 1;
			heatMapProperties.rectHeight = 1;
			heatMapProperties.gapy = 2;
			heatMapProperties.showLables = 180;
		}
		var renderAt=heatMapProperties.renderAt;
		var margin = {top:heatMapProperties.top,bottom:heatMapProperties.bottom,left:heatMapProperties.left,right:heatMapProperties.right},
		           width = heatMapProperties.width - margin.left - margin.right,
		           height = heatMapProperties.height - margin.top - margin.bottom,
		           gridSize = Math.floor(width / heatMapData.length),
		           legendElementWidth = gridSize*2,
		           buckets = heatMapProperties.buckets,
		           colors =colours;

		 var dataHandler = function(error, data) {
			 console.log("data=", data);
		 /* var colorScale = d3.scale.quantile()
		       .domain([0, buckets - 1, d3.max(data, function (d) { return d.value; })])
		       .range(colors); */
		 
		 var minDataPoint = d3.min(data, function (d) { return d.value; });
		 var maxDataPoint = d3.max(data, function (d) { return d.value; });
		 var midDatapoint = (minDataPoint+maxDataPoint)/2;
		 var colorScale = d3.scale.linear()
		                       .domain([minDataPoint,midDatapoint,maxDataPoint])
		                       .range(colors);

		 var svg = d3.select(renderAt).append("svg")
		   .attr("width", width + margin.left + margin.right)
		   .attr("height", height + margin.top + margin.bottom)
		   .append("g")
		   .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		
		 var xAxisLabels = svg.selectAll(".xAxisLabel")
		     .data(xAxisValues)
		     .enter().append("text")
			 .text(function (d) { return d; })
			 .attr("x", 0)
			 .attr("y", function (d, i) { return i * gridSize * heatMapProperties.gapy; })
			 .style("text-anchor", "end")
			 .style("font-size","12")
			 .attr("class", "x axis")
			 .attr("transform", "translate(-6," + gridSize / 1.5 + ")");

		 var yAxisLabels = svg.selectAll(".yAxisLabel")
		   .data(yAxisValues)
		   .enter().append("text")
		   .text(function(d) { return d; })
		   .attr("transform", function(d, i) { 
			   		return "translate(" + ( i * gridSize) + ","+heatMapProperties.showLables+")"
			   		+ "translate(" + gridSize *2 /heatMapProperties.showlabelPos + ", 60)rotate(-50)";
		   			})
		   /*.attr("transform", "translate(" + gridSize / 2 + ", -6)")*/
		   .style("text-anchor", "end")
		   .style("font-size","12")
		   .attr("class", function(d, i) { return ((i >= 8 && i <= 16) ? 
		   "timeLabel mono axis axis-worktime" : 
		   "timeLabel mono axis"); 
					});
		  var heatMap = svg.selectAll(".yAxis")
		   .data(data)
		   .enter().append("rect")
		   .attr("x", function(d) { return (d.yAxis - 1) * gridSize * heatMapProperties.gapx; })
		   .attr("y", function(d) { return (d.xAxis - 1) * gridSize * heatMapProperties.gapy; })
		   .attr("rx", heatMapProperties.rx)
		   .attr("ry", heatMapProperties.ry)
		   .attr("class", "yAxis bordered")
		   .attr("width", gridSize * heatMapProperties.rectWidth)
		   .attr("height", gridSize * heatMapProperties.rectHeight)
		   .style("fill", colors[0]);		
		   
		   heatMap.transition().duration(3000)
		       .style("fill", function(d) { return colorScale(d.value); });
		   heatMap.append("title").text(function(d) { return d.value; });
		   }
		   dataHandler(null, dataArray);
		}
	
	
	function changeGeoPlotOnClick(ambulanceGISReportData,geoMapDistColor){	
		var locations = ambulanceGISReportData; 
	    var map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 6,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,	
	    });
	    
	    //Add Layer
	     map.data.addGeoJson(data);
	     var dist=geoMapDistColor;
	     map.data.setStyle(function (feature) {
	       /*  var color;
	        var j;
	       for (j = 0; j < locations.length; j++){
	    	   var description = feature.getProperty('description');
	    	   if((locations[j][4]) == description){
	    		   color = locations[j][3];
	    	   }
	    	   else {
	    		   color = "#ffffff";
	    	   }
	    	   } */
	       
	    	   
			var description = feature.getProperty('description');
			var range=dist[description];
			var color=range;
			/* alert("range"+range); */
			
	        return {
	            fillColor: color,
	            strokeWeight: 1
	        };
	    });
	     
	    navigator.geolocation && navigator.geolocation.getCurrentPosition(showPosition, showError) == undefined && showError();	
	    var infowindow = new google.maps.InfoWindow();	
	    var marker, i;	
	      for (i = 0; i < locations.length; i++) {
	        mc = locations[i][3];	
	        switch (mc) {
	          case 'green':
	        	  image_src = 'images/Location-Symbol.png';
                  break;

               case 'red':
                  image_src = 'images/Location-Symbol.png';
                  break; 
                  
               case 'amber':
            	   image_src = 'images/Location-Symbol.png';
            	   break; 
            	   
                default:
                  image_src = 'images/Location-Symbol.png';
	        }
	
	        marker = new google.maps.Marker({
	          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	          icon: new google.maps.MarkerImage(image_src,null, null, null, new google.maps.Size(15, 15)),
	          map: map,	
	          animation: google.maps.Animation.DROP
	        });	
	
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	          return function() {
	            infowindow.setContent(locations[i][0]);
	            infowindow.open(map, marker);
	            /* alert(locations[i][0]);
	            changeGeoPlotOnClick(ambulanceGISReportData,geoMapDistColor) */
	            onSearch("geoMapClick",ambulanceGISReportData,geoMapDistColor,locations[i][4]);
	          }
	        })(marker, i));
	      }
	
	      function showPosition(position) {
	        lat = position.coords.latitude;
	        lon = position.coords.longitude;
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
	
	        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(
	          document.getElementById('legend'));
	      }
	
	      function showError(error) {
	        map.setCenter(new google.maps.LatLng(10.964289, 78.056801)); // default 1st from array
	      }
		}
	
		function showPrediction(){
			var contextpath='<%=request.getContextPath()%>'; 		
			document.location.href=contextpath+"/"+'ambulancePredictionReport.do'; 
		}	
		
		function getCaseReport(){
			var contextpath='<%=request.getContextPath()%>'; 				
			document.location.href=contextpath+"/"+'ambulanceCaseReport.do'; 
		}	
	
	</script>
	</body>
	<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
	<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
</html>