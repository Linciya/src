<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>DFW Analysis Zone</title>
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
		
		#middleLeft select{
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
		
		#middleright select{
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
					<option value="mscolumn2d">Multi-series Column Chart</option>
					<option value="msline">Multi-series Line Chart</option>
					<option value="msbar2d">Multi-series Bar Chart</option>
					<option value="msarea">Multi-series Area Chart</option>
					<option value="marimekko">Marimekko Chart</option>
					<option value="zoomline">Zoom Line Chart</option>
				</select>
				<div id="normalChartsTopLeft"></div>
				<div id="msgTopLeft" style="padding-top:50px;">
					<p><b><spring:message code="shdrc_analysis_zone10_1"/></b><br><br><br><br><br>
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
					<p><b><spring:message code="shdrc_analysis_zone10_2"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
			</div>
			
			<div style="width:99.3%;">
				<div id="middleLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<select id="middleLeftchartsType" name="middleLeftchartsType" onchange="changeChartMiddleLeft();">
					<option value="">Select Chart Type &#9660;</option>
					<option value="mscolumn2d">Multi-series Column Chart</option>
					<option value="msline">Multi-series Line Chart</option>
					<option value="msbar2d">Multi-series Bar Chart</option>
					<option value="msarea">Multi-series Area Chart</option>
					<option value="marimekko">Marimekko Chart</option>
					<option value="zoomline">Zoom Line Chart</option>
				</select>
				<div id="normalChartsMiddleLeft"></div>
				<div id="msgMiddleLeft" style="padding-top:50px;">
					<p><b><spring:message code="shdrc_analysis_zone10_3"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
				
				<div id="middleright" align="center" style="width:48.9%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<select id="middlerightChartsType" name="middlerightChartsType" onchange="changeChartMiddleRight();" style="float:right;">
					<option value="">Select Chart Type &#9660;</option>
					<option value="mscolumn2d">Multi-series Column Chart</option>
					<option value="msline">Multi-series Line Chart</option>
					<option value="msbar2d">Multi-series Bar Chart</option>
					<option value="msarea">Multi-series Area Chart</option>
					<option value="marimekko">Marimekko Chart</option>
					<option value="zoomline">Zoom Line Chart</option>
				</select>
				<div id="normalChartsMiddleRight"></div>
				<div id="msgMiddleRight" style="padding-top:50px;">
					<p><b><spring:message code="shdrc_analysis_zone10_4"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
			</div>
			
			<div style="width:99.3%;">
				<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<select id="bottomLeftchartsType" name="bottomLeftchartsType" onchange="changeChartBottomLeft();">
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
					<p><b><spring:message code="shdrc_analysis_zone10_5"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
				
				<div id="bottomright" align="center" style="width:48.9%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<select id="bottomrightChartsType" name="bottomrightChartsType" onchange="changeChartBottomRight();" style="float:right;">
					<option value="">Select Chart Type &#9660;</option>
					<option value="mscolumn2d">Multi-series Column Chart</option>
					<option value="msline">Multi-series Line Chart</option>
					<option value="msbar2d">Multi-series Bar Chart</option>
					<option value="msarea">Multi-series Area Chart</option>
					<option value="marimekko">Marimekko Chart</option>
					<option value="zoomline">Zoom Line Chart</option>
				</select>
				<div id="normalChartsBottomRight"></div>
				<div id="msgBottomRight" style="padding-top:50px;">
					<p><b><spring:message code="shdrc_analysis_zone10_6"/></b><br><br><br><br><br>
					This Report has no data for the selected Month and Year </p>
				</div>
				</div>
			</div>

		</div>
	</body>
	
	<script type="text/javascript">
	var msChartTopLeftProperties={"renderAt": 'normalChartsTopLeft', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	var msChartTopRightProperties={"renderAt": 'normalChartsTopRight', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	var msChartMiddleLeftProperties={"renderAt": 'normalChartsMiddleLeft', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	var msChartMiddleRightProperties={"renderAt": 'normalChartsMiddleRight', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	var msChartBottomLeftProperties={"renderAt": 'normalChartsBottomLeft', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
	var msChartBottomRightProperties={"renderAt": 'normalChartsBottomRight', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "1","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};
		
	var analysisReportName1 = "Sterilisation_Comparison_yearwise";
	var analysisReportName2 = "Sterilisation_Comparison_deptwise";
	var analysisReportName3 = "IUCD_Comparison_yearwise";
	var analysisReportName4 = "Coverage_of_Deliveries";
	var analysisReportName5 = "IUD_Prime_Child_Comparison";
	var analysisReportName6 = "DFW_PHC_Performance_Comparison";
	
	var analysisZoneReport1Data1 = <%= request.getAttribute("analysisZoneReport1Data1") %>;
	var analysisZoneReport1Data2 = <%= request.getAttribute("analysisZoneReport1Data2") %>;
	var analysisZoneReport2Data1 = <%= request.getAttribute("analysisZoneReport2Data1") %>;
	var analysisZoneReport2Data2 = <%= request.getAttribute("analysisZoneReport2Data2") %>;
	var analysisZoneReport3Data1 = <%= request.getAttribute("analysisZoneReport3Data1") %>;
	var analysisZoneReport3Data2 = <%= request.getAttribute("analysisZoneReport3Data2") %>;
	var analysisZoneReport4Data1 = <%= request.getAttribute("analysisZoneReport4Data1") %>;
	var analysisZoneReport4Data2 = <%= request.getAttribute("analysisZoneReport4Data2") %>;
	var analysisZoneReport5Data1 = <%= request.getAttribute("analysisZoneReport5Data1") %>;
	var analysisZoneReport5Data2 = <%= request.getAttribute("analysisZoneReport5Data2") %>;
	var analysisZoneReport6Data1 = <%= request.getAttribute("analysisZoneReport6Data1") %>;
	var analysisZoneReport6Data2 = <%= request.getAttribute("analysisZoneReport6Data2") %>;
	
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
		var firstChart="mscolumn2d";
		var secondChart="msline";
		var thirdChart="msbar2d";
		var fourthChart="mscolumn2d";
		var fifthChart="msline";
		var sixthChart="msbar2d";
		
		if((analysisZoneReport1Data1!=null && analysisZoneReport1Data1.length>0) || (analysisZoneReport1Data2!=null && analysisZoneReport1Data2.length>0)){
			document.getElementById("normalChartsTopLeft").style.display="inline";
			document.getElementById("msgTopLeft").style.display="none";	
			StaticMSChart(firstChart,msChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data1,analysisZoneReport1Data2,"District");
		}
		else{
			document.getElementById("normalChartsTopLeft").style.display="none";
			document.getElementById("msgTopLeft").style.display="block";
		}
		if((analysisZoneReport2Data1!=null && analysisZoneReport2Data1.length>0) || (analysisZoneReport2Data2!=null && analysisZoneReport2Data2.length>0)){
			document.getElementById("msgTopRight").style.display="none";
			document.getElementById("normalChartsTopRight").style.display="inline";
			StaticMSChart(secondChart,msChartTopRightProperties,analysisReportName2,analysisZoneReport2Data1,analysisZoneReport2Data2,"Department");
		}
		else{
			document.getElementById("normalChartsTopRight").style.display="none";
			document.getElementById("msgTopRight").style.display="block";
		}
		if((analysisZoneReport3Data1!=null && analysisZoneReport3Data1.length>0) || (analysisZoneReport3Data2!=null && analysisZoneReport3Data2.length>0)){
			document.getElementById("normalChartsMiddleLeft").style.display="inline";
			document.getElementById("msgMiddleLeft").style.display="none";	
			StaticMSChart(thirdChart,msChartMiddleLeftProperties,analysisReportName3,analysisZoneReport3Data1,analysisZoneReport3Data2,"District");
		}
		else{
			document.getElementById("normalChartsMiddleLeft").style.display="none";
			document.getElementById("msgMiddleLeft").style.display="block";
		}
		if((analysisZoneReport4Data1!=null && analysisZoneReport4Data1.length>0) || (analysisZoneReport4Data2!=null && analysisZoneReport4Data2.length>0)){
			document.getElementById("msgMiddleRight").style.display="none";
			document.getElementById("normalChartsMiddleRight").style.display="inline";
			StaticMSChart(fourthChart,msChartMiddleRightProperties,analysisReportName4,analysisZoneReport4Data1,analysisZoneReport4Data2,"Indicator");
		}
		else{
			document.getElementById("normalChartsMiddleRight").style.display="none";
			document.getElementById("msgMiddleRight").style.display="block";
		}
		if((analysisZoneReport5Data1!=null && analysisZoneReport5Data1.length>0) || (analysisZoneReport5Data2!=null && analysisZoneReport5Data2.length>0)){
			document.getElementById("normalChartsBottomLeft").style.display="inline";
			document.getElementById("msgBottomLeft").style.display="none";	
			StaticMSChart(fifthChart,msChartBottomLeftProperties,analysisReportName5,analysisZoneReport5Data1,analysisZoneReport5Data2,"Indicator");
		}
		else{
			document.getElementById("normalChartsBottomLeft").style.display="none";
			document.getElementById("msgBottomLeft").style.display="block";
		}
		if((analysisZoneReport6Data1!=null && analysisZoneReport6Data1.length>0) || (analysisZoneReport6Data2!=null && analysisZoneReport6Data2.length>0)){
			document.getElementById("msgBottomRight").style.display="none";
			document.getElementById("normalChartsBottomRight").style.display="inline";
			StaticMSChart(sixthChart,msChartBottomRightProperties,analysisReportName6,analysisZoneReport6Data1,analysisZoneReport6Data2,"District");
		}
		else{
			document.getElementById("normalChartsBottomRight").style.display="none";
			document.getElementById("msgBottomRight").style.display="block";
		}
		document.getElementById("Loading").style.display="none";
		document.getElementById("LoadingImage").style.display="none";
	}
	
	function changeChartTopLeft(){
		var selectedChart=document.getElementById("topLeftchartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport1Data1!=null && analysisZoneReport1Data1.length>0) || (analysisZoneReport1Data2!=null && analysisZoneReport1Data2.length>0)){
			document.getElementById("normalChartsTopLeft").style.display="inline";
			document.getElementById("msgTopLeft").style.display="none";	
			StaticMSChart(chartType,msChartTopLeftProperties,analysisReportName1,analysisZoneReport1Data1,analysisZoneReport1Data2,"District");
		}
		else{
			document.getElementById("normalChartsTopLeft").style.display="none";
			document.getElementById("msgTopLeft").style.display="block";
		}
	}
	
	function changeChartTopRight(){			
		var selectedChart=document.getElementById("toprightChartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport2Data1!=null && analysisZoneReport2Data1.length>0) || (analysisZoneReport2Data2!=null && analysisZoneReport2Data2.length>0)){
			document.getElementById("msgTopRight").style.display="none";
			document.getElementById("normalChartsTopRight").style.display="inline";
			StaticMSChart(chartType,msChartTopRightProperties,analysisReportName2,analysisZoneReport2Data1,analysisZoneReport2Data2,"Department");
		}
		else{
			document.getElementById("normalChartsTopRight").style.display="none";
			document.getElementById("msgTopRight").style.display="block";
		}
	}
	
	function changeChartMiddleLeft(){
		var selectedChart=document.getElementById("middleLeftchartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport3Data1!=null && analysisZoneReport3Data1.length>0) || (analysisZoneReport3Data2!=null && analysisZoneReport3Data2.length>0)){
			document.getElementById("normalChartsMiddleLeft").style.display="inline";
			document.getElementById("msgMiddleLeft").style.display="none";	
			StaticMSChart(chartType,msChartMiddleLeftProperties,analysisReportName3,analysisZoneReport3Data1,analysisZoneReport3Data2,"District");
		}
		else{
			document.getElementById("normalChartsMiddleLeft").style.display="none";
			document.getElementById("msgMiddleLeft").style.display="block";
		}
	}
	
	function changeChartMiddleRight(){			
		var selectedChart=document.getElementById("middlerightChartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport4Data1!=null && analysisZoneReport4Data1.length>0) || (analysisZoneReport4Data2!=null && analysisZoneReport4Data2.length>0)){
			document.getElementById("msgMiddleRight").style.display="none";
			document.getElementById("normalChartsMiddleRight").style.display="inline";
			StaticMSChart(chartType,msChartMiddleRightProperties,analysisReportName4,analysisZoneReport4Data1,analysisZoneReport4Data2,"Indicator");
		}
		else{
			document.getElementById("normalChartsMiddleRight").style.display="none";
			document.getElementById("msgMiddleRight").style.display="block";
		}	
	}
	
	function changeChartBottomLeft(){
		var selectedChart=document.getElementById("bottomLeftchartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport5Data1!=null && analysisZoneReport5Data1.length>0) || (analysisZoneReport5Data2!=null && analysisZoneReport5Data2.length>0)){
			document.getElementById("normalChartsBottomLeft").style.display="inline";
			document.getElementById("msgBottomLeft").style.display="none";	
			StaticMSChart(chartType,msChartBottomLeftProperties,analysisReportName5,analysisZoneReport5Data1,analysisZoneReport5Data2,"Indicator");
		}
		else{
			document.getElementById("normalChartsBottomLeft").style.display="none";
			document.getElementById("msgBottomLeft").style.display="block";
		}
	}
	
	function changeChartBottomRight(){			
		var selectedChart=document.getElementById("bottomrightChartsType");
		var chartType=selectedChart.options[selectedChart.selectedIndex].value;
		if((analysisZoneReport6Data1!=null && analysisZoneReport6Data1.length>0) || (analysisZoneReport6Data2!=null && analysisZoneReport6Data2.length>0)){
			document.getElementById("msgBottomRight").style.display="none";
			document.getElementById("normalChartsBottomRight").style.display="inline";
			StaticMSChart(chartType,msChartBottomRightProperties,analysisReportName6,analysisZoneReport6Data1,analysisZoneReport6Data2,"District");
		}
		else{
			document.getElementById("normalChartsBottomRight").style.display="none";
			document.getElementById("msgBottomRight").style.display="block";
		}	
	}	
	
	function changeYearMonth(){
		document.getElementById("Loading").style.display="inline";
		document.getElementById("LoadingImage").style.display="inline";
		document.getElementById("topLeftchartsType").value="";
		document.getElementById("toprightChartsType").value="";
		document.getElementById("middleLeftchartsType").value="";
		document.getElementById("middlerightChartsType").value="";
		document.getElementById("bottomLeftchartsType").value="";
		document.getElementById("bottomrightChartsType").value="";
		
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
			url:'dfwAnalysisZoneSearchChange.do',
			'data':{
				selectedYear:selectedYear,monthName:monthName,directorateId:directorateId
			},
			 success: function(result){
				 	var data = JSON.parse(result);
				 	analysisZoneReport1Data1=data.analysisZoneReport1Data1;
				 	analysisZoneReport1Data2=data.analysisZoneReport1Data2;
				 	analysisZoneReport2Data1=data.analysisZoneReport2Data1;
				 	analysisZoneReport2Data2=data.analysisZoneReport2Data2;
				 	analysisZoneReport3Data1=data.analysisZoneReport3Data1;
				 	analysisZoneReport3Data2=data.analysisZoneReport3Data2;
				 	analysisZoneReport4Data1=data.analysisZoneReport4Data1;
				 	analysisZoneReport4Data2=data.analysisZoneReport4Data2;
				 	analysisZoneReport5Data1=data.analysisZoneReport5Data1;
				 	analysisZoneReport5Data2=data.analysisZoneReport5Data2;
				 	analysisZoneReport6Data1=data.analysisZoneReport6Data1;
				 	analysisZoneReport6Data2=data.analysisZoneReport6Data2;
				 	chartsRenderOnLoad();
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			    }});
		}
	</script>
</html>