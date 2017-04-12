<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>MRB Analysis Zone</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="js/fusioncharts.js"></script>
		<script src="js/Fusion.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
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
					<p><b><spring:message code="shdrc_analysis_zone15_1"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
				
				<div id="topright" align="center" style="width:48.9%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<select id="toprightChartsType" name="toprightChartsType" onchange="changeChartTopRight();" style="float:right;">
					<option value="">Select Chart Type &#9660;</option>
					<option value="mscolumn2d">Multi-series Column Chart</option>
					<option value="msline">Multi-series Line Chart</option>
					<option value="msbar2d">Multi-series Bar Chart</option>
					<option value="msarea">Multi-series Area Chart</option>
					<option value="marimekko">Marimekko Chart</option>
					<option value="zoomline">Zoom Line Chart</option>
				</select>
				<div id="normalChartsTopRight"></div>
				<div id="msgTopRight" style="padding-top:50px;">
					<p><b><spring:message code="shdrc_analysis_zone15_2"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
			</div>
			
			<div style="width:99.3%;">
				<div id="bottomLeft" align="center" style="width:100%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
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
					<p><b><spring:message code="shdrc_analysis_zone15_3"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
	
	var normalChartTopLeftProperties={"renderAt": 'normalChartsTopLeft', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
	var normalChartTopRightProperties={"renderAt": 'normalChartsTopRight', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	var normalChartBottomLeftProperties={"renderAt": 'normalChartsBottomLeft', "width": '1000',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
	
	var analysisReportName1 = "HR Details";
	var analysisReportName2 = "No of Posts Remaining";
	var analysisReportName3 = "Expenditure and Balance";
	
	var analysisZoneReport1Data = <%= request.getAttribute("analysisZoneReport1Data") %>;
	var analysisZoneReport2Data1 = <%= request.getAttribute("analysisZoneReport2Data1") %>; 
	var analysisZoneReport2Data2 = <%= request.getAttribute("analysisZoneReport2Data2") %>;
	var analysisZoneReport2Data3 = <%= request.getAttribute("analysisZoneReport2Data3") %>;
	var analysisZoneReport3Data = <%= request.getAttribute("analysisZoneReport3Data") %>;	
	
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
		var firstChart="area2d";
		var secondChart="msline";
		var thirdChart="bar2d";
		
		if(analysisZoneReport1Data!=null && analysisZoneReport1Data.length>0){
			document.getElementById("normalChartsTopLeft").style.display="inline";
			document.getElementById("msgTopLeft").style.display="none";			
			StaticChart(firstChart,normalChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data,"Indicator Value","Indicator");
		}
		else{
			document.getElementById("normalChartsTopLeft").style.display="none";
			document.getElementById("msgTopLeft").style.display="block";
		}
		if((analysisZoneReport2Data1!=null && analysisZoneReport2Data1.length>0) || (analysisZoneReport2Data2!=null && analysisZoneReport2Data2.length>0) || (analysisZoneReport2Data3!=null && analysisZoneReport2Data3.length>0)){
			document.getElementById("msgTopRight").style.display="none";
			document.getElementById("normalChartsTopRight").style.display="inline";
			StaticMS3DataChart(secondChart,normalChartTopRightProperties,analysisReportName2,analysisZoneReport2Data1,analysisZoneReport2Data2,analysisZoneReport2Data3,"General Name"); 
		}
		else{
			document.getElementById("normalChartsTopRight").style.display="none";
			document.getElementById("msgTopRight").style.display="block";
		}
		
		if(analysisZoneReport3Data!=null && analysisZoneReport3Data.length>0){		
			document.getElementById("msgBottomLeft").style.display="none";
			document.getElementById("normalChartsBottomLeft").style.display="inline";
			StaticChart(thirdChart,normalChartBottomLeftProperties,analysisReportName3,analysisZoneReport3Data,"Indicator Value","Indicator");
		}
		else{
			document.getElementById("normalChartsBottomLeft").style.display="none";
			document.getElementById("msgBottomLeft").style.display="block";
		}
		document.getElementById("Loading").style.display="none";
		document.getElementById("LoadingImage").style.display="none";
	}
	
	function changeChartTopLeft(){
		var selectedChart=document.getElementById("topLeftchartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if(analysisZoneReport1Data!=null && analysisZoneReport1Data.length>0){
			document.getElementById("msgTopLeft").style.display="none";
			StaticChart(chartType,normalChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data,"Indicator Value","Indicator");
		}
		else{
			document.getElementById("normalChartsTopLeft").style.display="none";
			document.getElementById("msgTopLeft").style.display="block";
		}
	}
	
	function changeChartTopRight(){	
		var selectedChart=document.getElementById("toprightChartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport2Data1!=null && analysisZoneReport2Data1.length>0) || (analysisZoneReport2Data2!=null && analysisZoneReport2Data2.length>0) || (analysisZoneReport2Data3!=null && analysisZoneReport2Data3.length>0)){
			document.getElementById("msgTopRight").style.display="none";
			StaticMS3DataChart(chartType,normalChartTopRightProperties,analysisReportName2,analysisZoneReport2Data1,analysisZoneReport2Data2,analysisZoneReport2Data3,"General Name"); 
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
			StaticChart(ChartType,normalChartBottomLeftProperties,analysisReportName3,analysisZoneReport3Data,"Indicator Value","Indicator");
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
		var directorateId = document.getElementById("directorateId").value;
		$.ajax({
			type:"POST",
			url:'mrbAnalysisZoneSearchChange.do',
			'data':{
				selectedYear:selectedYear,monthName:monthName,directorateId:directorateId
			},
			 success: function(result){
				 	var data = JSON.parse(result);
				 	analysisZoneReport1Data=data.analysisZoneReport1Data;
				 	analysisZoneReport2Data1=data.analysisZoneReport2Data1;
				 	analysisZoneReport2Data2=data.analysisZoneReport2Data2;
				 	analysisZoneReport2Data3=data.analysisZoneReport2Data3;
				 	analysisZoneReport3Data=data.analysisZoneReport3Data;
				 	chartsRenderOnLoad();
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			    }});
		}
	</script>
</html>