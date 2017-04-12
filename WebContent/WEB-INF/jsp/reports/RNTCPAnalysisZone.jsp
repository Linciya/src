<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>RNTCP Analysis Zone</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="js/fusioncharts.js"></script>
		<script src="js/Fusion.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
		<script src="gis/jsondata.js"></script>
		<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_UN3281vLu65MNaK-y6w2XFxN_Wvo97M&callback=initMap" type="text/javascript"></script>
		<script src="jquery/jquery_2.0.3_jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>	
		<script src="js/script.js"></script>
		<style>
			#topLeft select{
				float:right;
			    width:auto;
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			    padding: 2px 2px 2px 30px;
			    border: 1;
			    background: transparent url("images/images.png") no-repeat 5px center;
			    text-align: center;
			    margin-right:10px;
			    margin-top:10px;
			}
			
			#topright select{
				float:right;
			    width:auto;
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			    padding: 2px 2px 2px 30px;
			    border: 1;
			    background: transparent url("images/images.png") no-repeat 5px center;
			    text-align: center;
			    margin-right:10px;
			    margin-top:10px;
			}
			
			#bottomLeft select{
				float:right;
			    width:auto;
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			    padding: 2px 2px 2px 30px;
			    border: 1;
			    background: transparent url("images/images.png") no-repeat 5px center;
			    text-align: center;
			    margin-right:10px;
			    margin-top:10px;
			}
			
			#bottomRight select{
				float:right;
			    width:auto;
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			    padding: 2px 2px 2px 30px;
			    border: 1;
			    background: transparent url("images/images.png") no-repeat 5px center;
			    text-align: center;
			    margin-right:10px;
			    margin-top:10px;
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
		</style>
	</head>
	
	<body onload="onLoad();">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
		<div class="zonesMainDiv" id="zonesMainDiv">
			<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_analysis_zone"/></div>	
				<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
			<table>
				<tr>
					<td class="searchCriteria"><spring:message code="label_searchcriteria_year"/></td>	
					<td class="searchCriteria" style="padding-left:5px;">
						<select id="year" name="year" class="reportDropDown" onchange="changeYear();">
							<c:forEach var="year" items="${yearList}">
				     			<option value='<c:out value="${year}"/>'>${year} </option>
				 			</c:forEach>
						</select> 
					</td>	
					<td class="searchCriteria" style="padding-left:20px;">
						<label id="lblmonth"><spring:message code="label_searchcriteria_month"/></label>
						<label id="lblquarter"><spring:message code="label_searchcriteria_quarter"/></label>
					</td>
					<td class="searchCriteria" style="padding-left:5px;">
						<select id="month" name="month" class="reportDropDown">
							<c:forEach var="months" items="${monthsList}">
		                   		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
		               		</c:forEach> 
						</select> 
						<select name="quarter" id="quarter" size="1" class="reportDropDown" >
						     <c:forEach var="quarter" items="${quarterList}">
							     <option value='<c:out value="${quarter.id}"/>'>${quarter.name} </option>
							 </c:forEach>
						</select>
					</td>	
					<td class="searchCriteria">
						<button onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button>
					</td>	
					<td class="searchCriteria"><input type="button" onclick="printDiv('zonesMainDiv')" value="Save as Pdf" /></td>	
					 <td class="searchCriteria" style="padding-left:30px;"><label id="Loading"><spring:message code="label_Loading"/></label></td>
		    <td class="searchCriteria" style="padding-left:2px;"><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:30px;"></td>		
				</tr>			
			</table>
			</div>
			<div style="width:99.3%;">
				<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<select id="topLeftchartsType" name="topLeftchartsType" onchange="changeChartTopLeft();">
						<option value="">Select Chart Type &#9660;</option>
						<option value="column2d">Bar Chart</option>
						<option value="bar2d">Horizontal Bar Chart</option>
						<option value="doughnut3d">Doughnut Chart</option>
						<option value="line">Line Chart</option>
						<option value="doughnut2d">Pie Chart</option>
						<option value="area2d">Area Chart</option>
						<option value="pareto2d">Pareto Chart</option>
					</select>
					<div id="normalChartsTopLeft"></div>
					<div id="msgTopLeft" style="padding-top:50px;">
						<p><b><spring:message code="shdrc_analysis_zone6_1"/></b><br><br><br><br><br>
						This Report has no data for the selected Month and Year </p>
					</div>
				</div>
				
				<div id="topright" align="center" style="width:48.9%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<select id="toprightChartsType" name="toprightChartsType" onchange="changeChartTopRight();" style="float:right;">
						<option value="">Select Chart Type &#9660;</option>
						<option value="column2d">Bar Chart</option>
						<option value="bar2d">Horizontal Bar Chart</option>
						<option value="doughnut3d">Doughnut Chart</option>
						<option value="line">Line Chart</option>
						<option value="doughnut2d">Pie Chart</option>
						<option value="area2d">Area Chart</option>
						<option value="pareto2d">Pareto Chart</option>
					</select>
					<div id="normalChartsTopRight"></div>
					<div id="msgTopRight" style="padding-top:50px;">
						<p><b><spring:message code="shdrc_analysis_zone6_2"/></b><br><br><br><br><br>
						This Report has no data for the selected Month and Year </p>
					</div>
				</div>
			</div>
			
			<div style="width:99.3%;">
				<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<select id="bottomLeftchartsType" name="bottomLeftchartsType" onchange="changeChartBottomLeft();" style="float:right;">
						<option value="">Select Chart Type &#9660;</option>
						<option value="column2d">Bar Chart</option>
						<option value="bar2d">Horizontal Bar Chart</option>
						<option value="doughnut3d">Doughnut Chart</option>
						<option value="line">Line Chart</option>
						<option value="doughnut2d">Pie Chart</option>
						<option value="area2d">Area Chart</option>
						<option value="pareto2d">Pareto Chart</option>
					</select>
					<div id="normalChartsBottomLeft"></div>
					<div id="msgBottomLeft" style="padding-top:50px;">
						<p><b><spring:message code="shdrc_analysis_zone6_3"/></b><br><br><br><br><br>
						This Report has no data for the selected Month and Year </p>
					</div>
				</div>
				
				<div id="bottomRight" align="center" style="width:48.9%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
					<!-- <div style="margin-top:3px;width:48%;height:20px;background:#ffffff;font-size:12px;font-weight: bold;">TB Success Rate</div> -->
					<div id="map" class="col-md-6"></div>
		 	 		<div id="legend"></div> 
					<div id="msgBottomRight" style="padding-top:50px;">
						<p><b><spring:message code="shdrc_analysis_zone6_6"/></b><br><br><br><br><br>
						This Report has no data for the selected Month and Year </p>
					</div>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
	
	var normalChartTopLeftProperties={"renderAt": 'normalChartsTopLeft', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
	var normalChartTopRightProperties={"renderAt": 'normalChartsTopRight', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
	var normalChartBottomLeftProperties={"renderAt": 'normalChartsBottomLeft', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
	
	var analysisReportName1 = "TB Detection Rate";
	var analysisReportName2 = "TB Incidence Rate";
	var analysisReportName3 = "TB Prevalence Rate";
	
	var analysisZoneReport1Data = <%= request.getAttribute("analysisZoneReport1Data") %>;
	var analysisZoneReport2Data = <%= request.getAttribute("analysisZoneReport2Data") %>;
	var analysisZoneReport3Data = <%= request.getAttribute("analysisZoneReport3Data") %>;
	<%-- var analysisZoneReport4Data = <%= request.getAttribute("analysisZoneReport4Data") %>; --%>
	
	function onLoad(){
		document.getElementById("Loading").style.display="none";
		document.getElementById("LoadingImage").style.display="none";
		var month = "<%= request.getAttribute("month") %>";
		var year = <%= request.getAttribute("year") %>;
		document.getElementById('year').value=year;
		document.getElementById('month').value=month;
		document.getElementById('lblquarter').style.display="none";
		document.getElementById('quarter').style.display="none";
		document.getElementById("msgBottomRight").style.display="none";
		chartsRenderOnLoad(); 
		InstitutionMap();
	}
	
	function chartsRenderOnLoad(){
		var firstChart="column2d";
		var secondChart="column2d";
		var thirdChart="bar2d";
					
		if(analysisZoneReport1Data!=null && analysisZoneReport1Data.length>0){
			document.getElementById("normalChartsTopLeft").style.display="inline";
			document.getElementById("msgTopLeft").style.display="none";
			StaticChart(firstChart,normalChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data,"Indicator Value","District");
		}
		else{
			document.getElementById("normalChartsTopLeft").style.display="none";
			document.getElementById("msgTopLeft").style.display="block";
		} 
		
		if(analysisZoneReport2Data!=null && analysisZoneReport2Data.length>0){
			document.getElementById("msgTopRight").style.display="none";
			document.getElementById("normalChartsTopRight").style.display="inline";
			StaticChart(secondChart,normalChartTopRightProperties,analysisReportName2,analysisZoneReport2Data,"Indicator Value","District");
		}
		else{
			document.getElementById("normalChartsTopRight").style.display="none";
			document.getElementById("msgTopRight").style.display="block";
		}
		
		if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){
			document.getElementById("msgBottomLeft").style.display="none";
			document.getElementById("normalChartsBottomLeft").style.display="inline";
			StaticChart(thirdChart,normalChartBottomLeftProperties,analysisReportName3,analysisZoneReport3Data,"Indicator Value","District");
		}
		else{
			document.getElementById("normalChartsBottomLeft").style.display="none";
			document.getElementById("msgBottomLeft").style.display="block";
		}
		
		/* if(analysisZoneReport4Data!=null && analysisZoneReport4Data.length>0){ 
			document.getElementById("msgBottomRight").style.display="none";
			document.getElementById("map").style.display="inline";
			document.getElementById("legend").style.display="inline";
		 }
		else{
			document.getElementById("map").style.display="none";
			document.getElementById("legend").style.display="none";
			document.getElementById("msgBottomRight").style.display="block";
		} */
	}
	
	function changeChartTopLeft(){
		var selectedChart=document.getElementById("topLeftchartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if(analysisZoneReport1Data!=null && analysisZoneReport1Data.length>0){
			document.getElementById("normalChartsTopLeft").style.display="inline";
			document.getElementById("msgTopLeft").style.display="none";
			StaticChart(chartType,normalChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data,"Indicator Value","District");
		}
		else{
			document.getElementById("normalChartsTopLeft").style.display="none";
			document.getElementById("msgTopLeft").style.display="block";
		} 
	}
	
	function changeChartTopRight(){	
		var selectedChart=document.getElementById("toprightChartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if(analysisZoneReport2Data!=null && analysisZoneReport2Data.length>0){
			document.getElementById("msgTopRight").style.display="none";
			document.getElementById("normalChartsTopRight").style.display="inline";
			StaticChart(chartType,normalChartTopRightProperties,analysisReportName2,analysisZoneReport2Data,"Indicator Value","District");
		}
		else{
			document.getElementById("normalChartsTopRight").style.display="none";
			document.getElementById("msgTopRight").style.display="block";
		}
	}
	
	function changeChartBottomLeft(){
		var selectedChart=document.getElementById("bottomLeftchartsType");
		var ChartType=selectedChart.options[selectedChart.selectedIndex].value;
		if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){
			document.getElementById("msgBottomLeft").style.display="none";
			document.getElementById("normalChartsBottomLeft").style.display="inline";
			StaticChart(ChartType,normalChartBottomLeftProperties,analysisReportName3,analysisZoneReport3Data,"Indicator Value","District");
		}
		else{
			document.getElementById("normalChartsBottomLeft").style.display="none";
			document.getElementById("msgBottomLeft").style.display="block";
		}
	}
	
	function changeYearMonth(){
		document.getElementById("Loading").style.display="inline";
		document.getElementById("LoadingImage").style.display="inline";
		document.getElementById("topLeftchartsType").value="";
		document.getElementById("toprightChartsType").value="";
		document.getElementById("bottomLeftchartsType").value="";
		var selectedMonth=document.getElementById("month");
		 if (selectedMonth != 'undefined') {
			var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
		}
		var year=document.getElementById("year");
		if(year!='undefined'){
			var selectedYear=year.options[year.selectedIndex].value;
		}
		var quarter=document.getElementById("quarter");
		if(quarter!='undefined'){
			var selectedQuarter=quarter.options[quarter.selectedIndex].value;
		}
		var directorateId = document.getElementById("directorateId").value;
		$.ajax({
			type:"POST",
			url:'rntcpAnalysisZoneSearchChange.do',
			'data':{
				selectedYear:selectedYear,monthName:monthName,directorateId:directorateId,selectedQuarter:selectedQuarter
			},
			 success: function(result){
				 	var data = JSON.parse(result);
				 	analysisZoneReport1Data=data.analysisZoneReport1Data;
				 	analysisZoneReport2Data=data.analysisZoneReport2Data;
				 	analysisZoneReport3Data=data.analysisZoneReport3Data;
				 	/* analysisZoneReport4Data=data.analysisZoneReport4Data; */
				 	chartsRenderOnLoad();
				 	InstitutionMap();
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			    }});
		}
		
		function changeYear(){
			var year=document.getElementById("year");
			var selectedYear;
			if(year!='undefined'){
				selectedYear=year.options[year.selectedIndex].value;
			}
			if(selectedYear<=2015){
				document.getElementById('lblmonth').style.display="none";
				document.getElementById('month').style.display="none";
				document.getElementById('lblquarter').style.display="inline";
				document.getElementById('quarter').style.display="inline";
			}
			else{
				document.getElementById('lblquarter').style.display="none";
				document.getElementById('quarter').style.display="none";
				document.getElementById('lblmonth').style.display="inline";
				document.getElementById('month').style.display="inline";
			}
		}
		
		
	function InstitutionMap(){	
		/* var locations = analysisZoneReport4Data; */
		/* var locations =[['RNTCP - TB Success Rate - Madurai : 39.085',09.58, 78.10,'B'],
                        ['RNTCP - TB Success Rate - Namakkal : 42.500',11.13, 78.13,'A'],
                        ['RNTCP - TB Success Rate - Pudukottai : 45.187',10.23, 78.52,'A'],
                        ['RNTCP - TB Success Rate - Erode : 47.727',11.20 ,77.46, ''],
		                ['RNTCP - TB Success Rate - Kancheepuram : 48.529',12.50,79.45, ''],
		                ['RNTCP - TB Success Rate - Ramanathapuram : 44.800',09.22,78.52,'A'],
                        ['RNTCP - TB Success Rate - Sivaganga : 56.321',09.52,78.28,''],
                        ['RNTCP - TB Success Rate - Thanjavur : 35.156',10.47,79.10,'B'],
                        ['RNTCP - TB Success Rate - Thoothukudi : 47.639',08.48, 78.11 , ''],
		                ['RNTCP - TB Success Rate - Tiruchirapalli : 48.133',10.50, 78.46 , ''],
		                ['RNTCP - TB Success Rate - Tiruvallur : 46.411',13.09,79.57 , 'B'],
		                ['RNTCP - TB Success Rate - Tiruvannamalai : 45.655',12.15, 79.07 , 'A'],
		                ['RNTCP - TB Success Rate - Tiruvarur : 43.137',10.46, 79.39 , 'A']
		   		           ]; */
		   		           
        var locations =[['RNTCP - TB Success Rate - Virudhunagar -  Aruppukottai: 0.0548',9.502400, 78.096600,'B'],
                        ['RNTCP - TB Success Rate - Virudhunagar - Virudhunagar : 0.1768',9.588900,77.962200 ,'A'],
                        ['RNTCP - TB Success Rate - Pudukottai - Watrap: 0.0716',9.639800,77.635400 ,'A'],
                        ['RNTCP - TB Success Rate - Erode - Jambai (Bhavani): 0.0891',11.450614 ,77.681761, 'B'],
		                ['RNTCP - TB Success Rate - Kancheepuram - KANCHEEPURAM: 0.1647',12.832921,79.710590, ''],
		                ['RNTCP - TB Success Rate - Ramanathapuram - Ramanathapuram: 0.2103',9.364300,78.832200,'A'],
                        ['RNTCP - TB Success Rate - Virudhunagar - Sattur: 0.0956',9.353200,77.920300,''],
                        ['RNTCP - TB Success Rate - Thanjavur - Papanasam: 0.1789',10.926382,79.263024,'B'],                       
		                ['RNTCP - TB Success Rate - Tiruvannamalai - Tiruvannamalai: 0.2028',12.304100,78.796000,'A'],
		                ['RNTCP - TB Success Rate - Tiruvarur - Valangaiman: 0.0531',10.8877984,79.394110, 'A'],
		                ['RNTCP - TB Success Rate - Tirunelveli - Tirunelveli: 0.1401',8.702700 , 77.457500 , ''],
		                ['RNTCP - TB Success Rate - Coimbatore - Annur: 0.0201', 11.232300,77.101800 , ''],
		                ['RNTCP - TB Success Rate - Coimbatore - Madukkarai: 0.0300',10.957200,76.924700  , 'A'],
		                ['RNTCP - TB Success Rate - Coimbatore - Kolarpatty: 0.0516',10.629200, 77.111600 , ''],
		                ['RNTCP - TB Success Rate - Tiruvannamalai - POLUR: 0.1631',12.508700,79.123600 , 'B'],
		                ['RNTCP - TB Success Rate - Tiruvannamalai - KALASAPAKKAM: 0.1640',12.434509 ,79.1042138  , 'B'],
		                ['RNTCP - TB Success Rate - Tiruvannamalai - CHEYYAR: 0.1618', 12.664000, 79.540500 , ''],
		                ['RNTCP - TB Success Rate - Vellore - WALAJAH: 0.1807', 12.925200,  79.358000, ''],
		                ['RNTCP - TB Success Rate - Vellore - SHOLINGAR : 0.1941',13.112200 , 79.420500 , ''],
		                ['RNTCP - TB Success Rate - Vellore - ARCOT: 0.1734 ',12.902300 ,79.338200  , 'B'],
		                ['RNTCP - TB Success Rate - Vellore - ALANGAYAM: 0.1653', 13.085300,79.664900  , ''],
		                ['RNTCP - TB Success Rate - Krishnagiri - HOSUR: 0.1308 ',12.771400 ,77.846200  , 'A'],
		                ['RNTCP - TB Success Rate - Krishnagiri - KRISHNAGIRI: 0.1154 ',12.525000 ,78.215000  , ''],
		                ['RNTCP - TB Success Rate - Krishnagiri - MATHUR: 0.1052', 12.382992,78.413230  , ''],
		                ['RNTCP - TB Success Rate - Krishnagiri - UTHANGARAI: 0.1046',12.266359 , 78.535451 , 'B'],
		                ['RNTCP - TB Success Rate - Karur - ARAVAKURICHI: 0.1354',10.771923 , 77.909410 , 'B'],
		                ['RNTCP - TB Success Rate - Karur - KARUR: 0.1636', 10.962276,78.080800  , ''],
		                ['RNTCP - TB Success Rate - Karur - KRISHNARAYAPURAM: 0.1890',10.931922 ,78.273897  , ''],
		                ['RNTCP - TB Success Rate - Karur - KULITHALAI: 0.1587', 10.867130, 78.454300 , ''],
		                ['RNTCP - TB Success Rate - Nagapattinam - SIRKALI: 0.017', 11.235717,79.735036  , 'A'],
		                ['RNTCP - TB Success Rate - Nagapattinam - KILVELUR: 0.0314',10.765150 , 79.742565 , 'B'],
		                ['RNTCP - TB Success Rate - Nagapattinam - KUTHALAM: 0.2880', 11.072200,  79.559200, ''],
		                ['RNTCP - TB Success Rate - Nagapattinam - Mailaduthurai: 0.0437',11.101979 , 79.647620 , ''],
		                ['RNTCP - TB Success Rate - Nagapattinam - Nagapattinam: 0.1520',10.772844 ,79.839911  , ''],
		                ['RNTCP - TB Success Rate - Nagapattinam - Vedaranyam: 0.0493',10.378047 , 79.852059 , 'A'],
		                ['RNTCP - TB Success Rate - Ramanathapuram - Ramanathapuram: 0.1744',9.3643 , 78.8322 , ''],
		                ['RNTCP - TB Success Rate - Ramanathapuram - KADALADI: 0.07872',9.217400 , 78.495100 , 'B'],
		                ['RNTCP - TB Success Rate - Nilgiris - Nilgiris: 0.0539', 11.353034, 76.793301 , ''],
		                ['RNTCP - TB Success Rate -  - MELUR: ', 10.033673,  78.335944, ''],
		                ['RNTCP - TB Success Rate -  - THIRUMANGALAM: ',9.824828 ,  77.986623, ''],
		                ['RNTCP - TB Success Rate -  - USILAMPATTI : ', 9.962389,77.788460  , 'A'],
		                ['RNTCP - TB Success Rate -  - T.VADIPATTI: ', 10.081733, 77.965772 , 'B']
		   		           ];

	    var map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 6,
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
	        mc = locations[i][3];	
	        switch (mc) {
	          case 'B':
	        	  image_src = 'images/map-marker-icon.png';
                  break;

                case 'A':
                  image_src = 'images/mapicon_amber.png';
                  break;

                default:
                  image_src = 'images/Location-Symbol.png';
	        }
	
	        marker = new google.maps.Marker({
	          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	          icon: new google.maps.MarkerImage(image_src,null, null, null, new google.maps.Size(25, 25)),
	          map: map,	
	          animation: google.maps.Animation.DROP
	        });	
	
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	          return function() {
	            infowindow.setContent(locations[i][0]);
	            infowindow.open(map, marker);
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
	  	document.getElementById("Loading").style.display="none";
		document.getElementById("LoadingImage").style.display="none";  
		}
	</script>
</html>