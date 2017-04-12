<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<title>DMS Analysis Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/Fusion.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.widgets.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>	
<script src="js/script.js"></script>
</head>
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
</style>

<body onload="onLoad();">
	<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
	<div class="zonesMainDiv" id="zonesMainDiv">
	<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_analysis_zone"/></div>	
	<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
	<table>
		<tr>
			<td class="searchCriteria"><spring:message code="label_searchcriteria_year"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="year" name="year" class="reportDropDown">
					<c:forEach var="year" items="${yearList}">
		     			<option value='<c:out value="${year}"/>'>${year} </option>
		 			</c:forEach>
				</select> 
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_month"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="month" name="month" class="reportDropDown">
					<c:forEach var="months" items="${monthsList}">
                   		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
               		</c:forEach> 
				</select> 
			</td>	
			<td class="searchCriteria"><button onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button></td>	
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
				<p><b><spring:message code="shdrc_analysis_zone1_1"/></b><br><br><br><br><br>
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
				<p><b><spring:message code="shdrc_analysis_zone1_2"/></b><br><br><br><br><br>
				This Report has no data for the selected Month and Year </p>
			</div>
			</div>
		</div>
		
		<div style="width:99.3%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
			<select id="bottomLeftchartsType" name="bottomLeftchartsType" onchange="changeChartBottomLeft();" style="float:right;">
				<option value="">Select Chart Type &#9660;</option>
				<option value="mscolumn2d">Multi-series Column Chart</option>
				<option value="msline">Multi-series Line Chart</option>
				<option value="msbar2d">Multi-series Bar Chart</option>
				<option value="msarea">Multi-series Area Chart</option>
				<option value="marimekko">Marimekko Chart</option>
				<option value="zoomline">Zoom Line Chart</option>
			</select>
			<div id="normalChartsBottomLeft"></div>
			<div id="msgBottomLeft" style="padding-top:50px;">
				<p><b><spring:message code="shdrc_analysis_zone1_3"/></b><br><br><br><br><br>
				This Report has no data for the selected Month and Year </p>
			</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.9%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
			<select id="bottomRightChartsType" name="bottomRightChartsType" onchange="changeChartBottomRight();" style="float:right;">
				<option value="">Select Chart Type &#9660;</option>
				<option value="mscolumn2d">Multi-series Column Chart</option>
				<option value="msline">Multi-series Line Chart</option>
				<option value="msbar2d">Multi-series Bar Chart</option>
				<option value="msarea">Multi-series Area Chart</option>
				<option value="marimekko">Marimekko Chart</option>
				<option value="zoomline">Zoom Line Chart</option>
			</select>
			<div id="multiSeriesChartsBottomRight"></div>
			<div id="msgBottomRight" style="padding-top:50px;">
				<p><b><spring:message code="shdrc_analysis_zone1_6"/></b><br><br><br><br><br>
				This Report has no data for the selected Month and Year </p>
			</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

var normalChartTopLeftProperties={"renderAt": 'normalChartsTopLeft', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
var normalChartTopRightProperties={"renderAt": 'normalChartsTopRight', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
var normalChartBottomLeftProperties={"renderAt": 'normalChartsBottomLeft', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
		"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
		"subcaptionFontSize": "14"};
var multiSeriesChartProperties={"renderAt": 'multiSeriesChartsBottomRight', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
		"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
		"subcaptionFontSize": "14"};

var analysisReportName1 = "Top 10 Institutions - Caesarean Deliveries";
var analysisReportName2 = "Top 10 Institutions - Normal Deliveries";
var analysisReportName3 = "District Wise Inpatients vs Outpatients";
var analysisReportName4 = "Night Caesarean Trend";

var analysisZoneReport1Data = <%= request.getAttribute("analysisZoneReport1Data") %>;
var analysisZoneReport2Data = <%= request.getAttribute("analysisZoneReport2Data") %>;
var analysisZoneReport3Data = <%= request.getAttribute("analysisZoneReport3Data") %>;
var analysisZoneReport4Data = <%= request.getAttribute("analysisZoneReport4Data") %>;

function onLoad(){
	document.getElementById("Loading").style.display="none";
	document.getElementById("LoadingImage").style.display="none";
	var month = "<%= request.getAttribute("month") %>";
	var year = <%= request.getAttribute("year") %>;
	document.getElementById('year').value=year;
	document.getElementById('month').value=month;
	chartsRenderOnLoad();
}

function chartsRenderOnLoad(){
	var firstChart="column2d";
	var secondChart="column2d";
	var thirdChart="mscolumn2d";
	var fourthChart="msline";
	
	var nightCaesareanFirstSeriesData=[];
	var nightCaesareanSecondSeriesData=[];
	if(analysisZoneReport4Data!=null && analysisZoneReport4Data.length>0){
		var month=analysisZoneReport4Data[0].seriesName;
		var xaxisName=analysisZoneReport4Data[0].xaxisName;
		for(i=0;i<analysisZoneReport4Data.length;i++){
			if(analysisZoneReport4Data[i].seriesName!=month){
				nightCaesareanFirstSeriesData.push(analysisZoneReport4Data[i]);
			}
			else{
				nightCaesareanSecondSeriesData.push(analysisZoneReport4Data[i]);
			}
		}
	}	
	
	var distOpIpFirstSeriesData=[];
	var distOpIpSecondSeriesData=[];
	if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){
		var indicator=analysisZoneReport3Data[0].seriesName;
		var xaxisName=analysisZoneReport3Data[0].xaxisName;
		for(i=0;i<analysisZoneReport3Data.length;i++){
			if(analysisZoneReport3Data[i].seriesName!=indicator){
				distOpIpFirstSeriesData.push(analysisZoneReport3Data[i]);
			}
			else{
				distOpIpSecondSeriesData.push(analysisZoneReport3Data[i]);
			}
		}
	}	
		
	if(analysisZoneReport1Data!=null && analysisZoneReport1Data.length>0){
		document.getElementById("normalChartsTopLeft").style.display="inline";
		document.getElementById("msgTopLeft").style.display="none";
		
		StaticChart(firstChart,normalChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data,"Indicator Value","Institution");
	}
	else{
		document.getElementById("normalChartsTopLeft").style.display="none";
		document.getElementById("msgTopLeft").style.display="block";
	}
	if(analysisZoneReport2Data!=null && analysisZoneReport2Data.length>0){
		document.getElementById("msgTopRight").style.display="none";
		document.getElementById("normalChartsTopRight").style.display="inline";
		StaticChart(secondChart,normalChartTopRightProperties,analysisReportName2,analysisZoneReport2Data,"Indicator Value","Institution");
	}
	else{
		document.getElementById("normalChartsTopRight").style.display="none";
		document.getElementById("msgTopRight").style.display="block";
	}
	
	if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){
		document.getElementById("msgBottomLeft").style.display="none";
		document.getElementById("normalChartsBottomLeft").style.display="inline";
		StaticMSChart(thirdChart,normalChartBottomLeftProperties,analysisReportName3,distOpIpFirstSeriesData,distOpIpSecondSeriesData,xaxisName);
	}
	else{
		document.getElementById("normalChartsBottomLeft").style.display="none";
		document.getElementById("msgBottomLeft").style.display="block";
	}
	
	if(analysisZoneReport4Data!=null && analysisZoneReport4Data.length>0){
		document.getElementById("msgBottomRight").style.display="none";
		document.getElementById("multiSeriesChartsBottomRight").style.display="inline";
		StaticMSChart(fourthChart,multiSeriesChartProperties,analysisReportName4,nightCaesareanFirstSeriesData,nightCaesareanSecondSeriesData,xaxisName); 
	}
	else{
		document.getElementById("multiSeriesChartsBottomRight").style.display="none";
		document.getElementById("msgBottomRight").style.display="block";
	}
	document.getElementById("Loading").style.display="none";
	document.getElementById("LoadingImage").style.display="none";
}

function changeChartTopLeft(){
	var selectedChart=document.getElementById("topLeftchartsType");
	var chartType=selectedChart.options[selectedChart.selectedIndex].value;
	if(analysisZoneReport1Data!=null && analysisZoneReport1Data.length>0){
		document.getElementById("msgTopLeft").style.display="none";
		StaticChart(chartType,normalChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data,"Indicator Value","Institution");
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
		StaticChart(chartType,normalChartTopRightProperties,analysisReportName2,analysisZoneReport2Data,"Indicator Value","Institution");
	}
	else{
		document.getElementById("normalChartsTopRight").style.display="none";
		document.getElementById("msgTopRight").style.display="block";
	}
}

function changeChartBottomLeft(){
	var distOpIpFirstSeriesData=[];
	var distOpIpSecondSeriesData=[];
	if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){
		var indicator=analysisZoneReport3Data[0].seriesName;
		var xaxisName=analysisZoneReport3Data[0].xaxisName;
		for(i=0;i<analysisZoneReport3Data.length;i++){
			if(analysisZoneReport3Data[i].seriesName!=indicator){
				distOpIpFirstSeriesData.push(analysisZoneReport3Data[i]);
			}
			else{
				distOpIpSecondSeriesData.push(analysisZoneReport3Data[i]);
			}
		}
	}	
	var selectedChart=document.getElementById("bottomLeftchartsType");
	var ChartType=selectedChart.options[selectedChart.selectedIndex].value;
	if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){
		document.getElementById("msgBottomLeft").style.display="none";
		StaticMSChart(ChartType,normalChartBottomLeftProperties,analysisReportName3,distOpIpFirstSeriesData,distOpIpSecondSeriesData,xaxisName);
	}
	else{
		document.getElementById("normalChartsBottomLeft").style.display="none";
		document.getElementById("msgBottomLeft").style.display="block";
	}
}

function changeChartBottomRight(){
	var nightCaesareanFirstSeriesData=[];
	var nightCaesareanSecondSeriesData=[];
	if(analysisZoneReport4Data!=null && analysisZoneReport4Data.length>0){
		var month=analysisZoneReport4Data[0].seriesName;
		var xaxisName=analysisZoneReport4Data[0].xaxisName;
		for(i=0;i<analysisZoneReport4Data.length;i++){
			if(analysisZoneReport4Data[i].seriesName!=month){
				nightCaesareanFirstSeriesData.push(analysisZoneReport4Data[i]);
			}
			else{
				nightCaesareanSecondSeriesData.push(analysisZoneReport4Data[i]);
			}
		}
	}	
	var selectedChart=document.getElementById("bottomRightChartsType");
	var chartType=selectedChart.options[selectedChart.selectedIndex].value;
	if(analysisZoneReport4Data!=null && analysisZoneReport4Data.length>0){
		document.getElementById("msgBottomRight").style.display="none";
		StaticMSChart(chartType,multiSeriesChartProperties,analysisReportName4,nightCaesareanFirstSeriesData,nightCaesareanSecondSeriesData,xaxisName); 
	}
	else{
		document.getElementById("multiSeriesChartsBottomRight").style.display="none";
		document.getElementById("msgBottomRight").style.display="block";
	}
}

function changeYearMonth(){
	document.getElementById("Loading").style.display="inline";
	document.getElementById("LoadingImage").style.display="inline";
	document.getElementById("topLeftchartsType").value="";
	document.getElementById("toprightChartsType").value="";
	document.getElementById("bottomLeftchartsType").value="";
	document.getElementById("bottomRightChartsType").value="";
	var selectedMonth=document.getElementById("month");
	 if (selectedMonth != 'undefined') {
		var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
	}
	var year=document.getElementById("year");
	if(year!='undefined'){
		var selectedYear=year.options[year.selectedIndex].value;
	}
	var directorateId = document.getElementById("directorateId").value;
	$.ajax({
		type:"POST",
		url:'dmsAnalysisZoneSearchChange.do',
		'data':{
			selectedYear:selectedYear,monthName:monthName,directorateId:directorateId
		},
		 success: function(result){
			 	var data = JSON.parse(result);
			 	analysisZoneReport1Data=data.analysisZoneReport1Data;
			 	analysisZoneReport2Data=data.analysisZoneReport2Data;
			 	analysisZoneReport3Data=data.analysisZoneReport3Data;
			 	analysisZoneReport4Data=data.analysisZoneReport4Data;
			 	chartsRenderOnLoad();
		 },
			error: function (xhr, status, error) {
                alert("Internal Error Occured-Please Contact System Administrator");
		    }});
	}
</script>
</html>