<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Predictive Zone</title>
<script src="js/d3.v3.min.js"></script>
<script src="js/PredictiveZone.js"></script>
</head>
<style>
#searchButton{
	widht:30px;
	height:20px;
	background: #0076a3;
	color:white;
	border: none;
	border-top-left-radius: 5px 5px;
	border-top-right-radius: 5px 5px;
	border-bottom-left-radius: 5px 5px;
	border-bottom-right-radius: 5px 5px;
}
</style>
<body onload="onLoad();">
<div id="divMain" style="width:100%;background:#ffffff;">
	<div id="directorateNameHeader"><b>Predictive Zone</b></div>	
	<table>
		<tr>
			<td class="searchCriteria"><spring:message code="label_searchcriteria_year"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="year" name="year" class="dropDown">
					<c:forEach var="year" items="${yearList}">
		     			<option value='<c:out value="${year}"/>'>${year} </option>
		 			</c:forEach>
				</select> 
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_month"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="month" name="month" class="dropDown">
					<c:forEach var="months" items="${monthsList}">
                   		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
               		</c:forEach> 
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="dropDown">
					<c:forEach var="districts" items="${districtsList}">
                   		<option value='<c:out value="${districts.name}"/>'>${districts.name} </option> 
               		</c:forEach> 
				</select> 
			</td>	
			<td><button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
		</tr>			
	</table>
		<div style="width:99.4%;">
			<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;">
				<div id="heatMapTopLeft"></div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;">
				<div id="heatMapTopRight"></div>
			</div>
		</div>		
		<div style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;">
				<div id="doughnut2dChart"></div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;">
				<div id="heatMapBottomRight"></div>
			</div>
		</div>
	</div>
</body>

<script>
heatMapTopLeftProperties={"renderAt":'#heatMapTopLeft',"top":100,"right":0,"bottom":100,"left":0,"width":460,"height":230,"buckets":9,"rx":0,"ry":0,"rectWidth":1,"rectHeight":1};
heatMapTopRightProperties={"renderAt":'#heatMapTopRight',"top":100,"right":0,"bottom":100,"left":0,"width":460,"height":230,"buckets":9,"rx":0,"ry":0,"rectWidth":1,"rectHeight":1};
var doughnut2dChartProperties={"type": 'doughnut2d',"renderAt": 'doughnut2dChart', "width": '500',"height": '350',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000","bgColor": "#ffffff","showBorder": "0","use3DLighting": "0","showShadow": "0","enableSmartLabels": "0","startingAngle": "310","showLabels": "0","showPercentValues": "1","showLegend": "1",
		"legendShadow": "0","legendBorderAlpha": "0","centerLabelBold": "1","showTooltip": "0","decimals": "0","captionFontSize": "14","subcaptionFontSize": "14","subcaptionFontBold": "0","seriesname": "Food Products",
        "showValues":"0"};
heatMapBottomRightProperties={"renderAt":'#heatMapBottomRight',"top":100,"right":0,"bottom":100,"left":0,"width":460,"height":230,"buckets":9,"rx":0,"ry":0,"rectWidth":1,"rectHeight":1};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];
function onLoad(){
	var doughnut2dChartHeader="";
	var doughnut2dChartSubCaption="";
	heatMapPredictive(heatMapTopLeftProperties,colours);
	heatMapPredictive(heatMapTopRightProperties,colours);
	heatMapPredictive(heatMapBottomRightProperties,colours);
	doughnut2dChart(doughnut2dChartProperties,subCaption,data,caption);
	
}
</script>
<script>
function onSearch()
{
	var year=document.getElementById("year").value;
	var month=document.getElementById("month").value;
	var district=document.getElementById("district").value;
	var disease=document.getElementById("disease").value;
	$.ajax({
		type: "POST",
		url: "predictiveOnSearch.do",
		'data':{
			year:year,month:month,district:district,disease:disease
		},
		success: function(result){
			
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
}
</script>
</html>