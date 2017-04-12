<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Predictive Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
<script src="js/d3.v3.min.js"></script>
<script src="js/PredictiveZone.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/Fusion.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.widgets.js"></script>
<link rel="stylesheet" href="css/HSAutocomplete.css">
<link rel="stylesheet" href="css/multiple-select.css">
<script src="js/multiple-select.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="js/script.js"></script>
<script src="js/printThis.js"></script>
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
<div id="divMain" style="width:100%;background:#ffffff;box-shadow: 0 0 1em olive;border-radius:10px;">
	<div id="directorateNameHeader"><b>Predictive Zone</b></div>	
	<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
	<table>
		<tr>
			<td class="searchCriteria"><spring:message code="label_searchcriteria_indicator"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="indicator" name="indicator" class="reportDropDown" onchange="onIndicatorChange();" style="width:150px;">
					<option value="IMR Dashboard I">IMR Dashboard I</option>
					<option value="IMR Clustering Dashboard">IMR Clustering Dashboard</option>
					<option value="MMR Operational Analytics">MMR Operational Analytics</option>
					<option value="MMR Insides">MMR Insides</option>
					<option value="Disease Outbreak Analytics">Disease Outbreak Analytics</option>
					<option value="CMCHIS Service Dashboard">CMCHIS Service Dashboard</option>
					<option value="CMCHIS Procedure Dashboard">CMCHIS Procedure Dashboard</option>
					<option value="CMCHIS Denied Dashboard">CMCHIS Denied Dashboard</option>
					<option value="Fully Immunized Dashboard">Fully Immunized Dashboard</option>
					<option value="Measles Dashboard">Measles Dashboard</option>
					<option value="Blood Bank Stock Dashboard">Blood Bank Stock Dashboard</option>
					<option value="Blood Bank Stock Institution Wise">Blood Bank Stock Institution Wise</option>
					<option value="HOB Para III">HOB Para III</option>
					<option value="CMCHIS Need More Info Dashboard">CMCHIS Need More Info Dashboard</option>
					<option value="HS Deliveries">HS Deliveries</option>
					<option value="HS Disease">HS Disease</option>
					<option value="HS Hospital Deaths">HS Hospital Deaths</option>
					<option value="HS Beds and Equipment Related">HS Beds and Equipment Related</option>
					<option value="HS Drug and Lab Test">HS Drug and Lab Test</option>
					<option value="HS Deaths">HS Deaths</option>
					<option value="HS Referral and MMR">HS Referral and MMR</option>
					<option value="HS Others">HS Others</option>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="reportDropDown" multiple="multiple">
					<c:forEach var="districts" items="${districtList}">
                   		<option value='<c:out value="${districts}"/>'>${districts} </option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_year"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="year" name="year" class="reportDropDown">
					<c:forEach var="years" items="${yearList}">
                   		<option value='<c:out value="${years}"/>'>${years} </option> 
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
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_reasonableInd"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="reasonableIndicator" name="reasonableIndicator" class="reportDropDown" multiple="multiple">
					<c:forEach var="reasonableIndicators" items="${reasonableIndicatorList}">
                   		<option value='<c:out value="${reasonableIndicators}"/>'>${reasonableIndicators} </option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria">&nbsp;&nbsp;<button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
			<td class="searchCriteria"><input type="button" onclick="predictivePrint('<%=request.getContextPath()%>','divMain')" value="Save as Pdf" /></td>
		</tr>			
	</table>
	</div>
		<div style="width:99.4%;">
			<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_mmr_alert_district"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapTopLeft"></div>
				<div id="msgTopLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_mmr_alert_institution"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapTopRight" class="heatMapTopRight"></div>
				<div id="msgTopRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<%-- <label id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;"><spring:message code="label_mmr_reasonable_indicators"/></label> --%>
					<input id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_mmr_reasonable_indicators"/>" readonly="readonly" title="">
				</div>
				<div id="BottomLeft"></div>
				<div id="msgBottomLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_mmr_forecast_district"/>" readonly="readonly" title="">
				</div>
				<div id="BottomRight"></div>
				<div id="msgBottomRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
var TopLeftChartProperties={"renderAt":'#heatMapTopLeft',"top":100,"right":0,"bottom":100,"left":0,"width":600,"height":330,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"showLables":20,"showlabelPos":2.2,"gapx":1,"gapy":1};
var TopRightChartProperties={"renderAt":'#heatMapTopRight',"top":50,"right":0,"bottom":100,"left":0,"width":600,"height":330,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"showLables":120,"showlabelPos":2.3,"gapx":1,"gapy":1};
var BottomRightChartProperties={"type": 'stackedcolumn2dline',"renderAt": 'BottomRight', "width": '600',"height": '300',"dataFormat": 'json',"showPercentValues": "1","showPercentInTooltip": "0","enableSmartLabels": "1","decimals": "1","skipOverlapLabels": "1","theme": "fint","showLegend": "1","showValues":"0"};
var BottomLeftChartProperties={"type": 'heatmap',"renderAt": 'BottomLeft',"width": '600',"height": '300',"dataFormat": 'json',"theme": "fint","showPlotBorder": "0","gradient": "1","colorRangeCode": "#e24b1a","startLabel": "Good","endLabel": "Poor", "colorRangeColorCode1": "#6da81e","colorLabel1": "Good","colorRangeColorCode2": "#f6bc33","colorLabel2": "Average","colorRangeColorCode3": "#e24b1a","colorLabel3": "Bad"};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];		
var mngood=1;
var mxgood=100;
var mnavg=101;
var mxavg=200;
var mnpoor=201;
var mxpoor=300;
var captionAlignment="centre";
function onLoad(){
   	var TopLeftData = <%= request.getAttribute("MMROTopLeftData") %>;
   	var TopRightData = <%= request.getAttribute("MMROTopRightData") %>;
   	var BottomLeftData = <%= request.getAttribute("MMROBottomLeftData") %>;
   	var BottomRightData = <%= request.getAttribute("MMROBottomRightData") %>;
   	var district = "<%= request.getAttribute("district") %>";
   	var month= "<%= request.getAttribute("month") %>";
   	var year= <%= request.getAttribute("year") %>;
   	var reasonableInd= "<%= request.getAttribute("reasonableIndicator") %>";
   	$('#topLeftLabel').val($('#topLeftLabel').val()+' - '+month);
   	$('#topRightLabel').val($('#topRightLabel').val()+' - '+month+' and '+district);
   	$('#bottomLeftLabel').val($('#bottomLeftLabel').val()+' - '+month+' & '+reasonableInd);
   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
   	if(TopLeftData === '' || TopLeftData === null){
		 $('#heatMapTopLeft').empty();
		 $('#msgTopLeft').show();			 
   	}else{   
   		$('#msgTopLeft').hide();
   		heatMapPredictive(TopLeftChartProperties,colours,TopLeftData);
   	}
   	if(TopRightData === '' || TopRightData === null){
		 $('#heatMapTopRight').empty();
		 $('#msgTopRight').show();			 
	}else{
		$('#msgTopRight').hide();
		heatMapPredictive(TopRightChartProperties,colours,TopRightData);
	}
   	if(BottomLeftData === '' || BottomLeftData === null){
		 $('#BottomLeft').empty();
		 $('#msgBottomLeft').show();			 
		}
   	else{
   		$('#msgBottomLeft').hide();
   		var heatMapHeader="";
		var heatMapSubCaption="";
		var heatMapYAxisName="Reasonable Indicators";
		var heatMapXAxisName="Districts";		
		heatMap(BottomLeftChartProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,BottomLeftData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
   	}
   	if(BottomRightData === '' || BottomRightData === null){
		 $('#BottomRight').empty();
		 $('#msgBottomRight').show();			 
	}else{
		$('#msgBottomRight').hide();
		var barChartHeader="";
		var barChartSubCaption="";
		TopLeftChartProperties.seriesname="District_Name";
		barChart(BottomRightChartProperties,barChartSubCaption,BottomRightData,barChartHeader);
	}
}
$(document).ready(function() {
	$('#msgTopLeft').hide();
	$('#msgTopRight').hide();
	$('#msgBottomLeft').hide();
	
	var name='${indicatorName}';	
	var district='${district}';
	var year='${year}';
	var month='${month}';
	var reasonableInd="${reasonableIndicator}";
	$("#month").val(month);
	$("#year").val(year);
	$("#indicator").val(name);
	$('#district option[value='+district+']').prop("selected", true);
	$('#district').multipleSelect({
    });
	$('#reasonableIndicator option[value="'+reasonableInd+'"]').prop("selected", true);
	$('#reasonableIndicator').multipleSelect({
    });
});
function onSearch()
{
	var selectedDistrict=$('#district').val();
	var district=selectedDistrict.toString();
	var year = $('#year').val();
	var month = $('#month').val();
	var selectedReasonableInd=$('#reasonableIndicator').val();
	var reasonableInd=selectedReasonableInd.toString();
	$.ajax({
		type: "POST",
		url: "MMROperationalAnalyticsOnSearch.do",
		'data':{
			district:district,year:year,month:month,reasonableInd:reasonableInd
		},
		success: function(result){
			if(result === '' || result === null){
				$('#heatMapTopLeft').empty();
				$('#heatMapTopRight').empty();
				$('#BottomLeft').empty();
				$('#BottomRight').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
				$('#msgBottomRight').show();
			}
			$('#heatMapTopLeft').empty();
			$('#heatMapTopRight').empty();
			$('#BottomLeft').empty();
			$('#BottomRight').empty();
			var data = JSON.parse(result);
			var TopLeftData=data.MMROTopLeftData;
			var TopRightData=data.MMROTopRightData;
			var BottomRightData=data.MMROBottomRightData;
			var BottomLeftData=data.MMROBottomLeftData;
			var district = data.district;
		   	var month= data.month;
		   	var year= data.year;
		   	var reasonableInd= data.reasonableIndicator;
		   	var n1=$('#topLeftLabel').val().indexOf('-');
		   	var n2=$('#topRightLabel').val().indexOf('-');
		   	var n3=$('#bottomLeftLabel').val().indexOf('-');
		   	var topLeftLabel=$('#topLeftLabel').val().substring(0,n1);
		   	var topRightLabel=$('#topRightLabel').val().substring(0,n2);
		   	var bottomLeftLabel=$('#bottomLeftLabel').val().substring(0,n3);
			$('#topLeftLabel').val(topLeftLabel+'- '+month);
		   	$('#topRightLabel').val(topRightLabel+'- '+month+' and '+district);
		   	$('#bottomLeftLabel').val(bottomLeftLabel+'- '+month+' & '+reasonableInd);
		   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
		   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
		   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
		   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
			if(typeof TopLeftData == 'undefined' || TopLeftData.length == 0 || TopLeftData === ''){
				$('#heatMapTopLeft').empty();
				$('#msgTopLeft').show();
			}else{
				$('#msgTopLeft').hide();
				heatMapPredictive(TopLeftChartProperties,colours,TopLeftData);
			}
			if(typeof TopRightData == 'undefined' || TopRightData.length == 0 || TopRightData === ''){
				$('#heatMapTopRight').empty();
				$('#msgTopRight').show();
			}else{
				$('#msgTopRight').hide();
				heatMapPredictive(TopRightChartProperties,colours,TopRightData);
			}
			if(typeof BottomLeftData == 'undefined' || BottomLeftData.length == 0 || BottomLeftData === ''){
				$('#BottomLeft').empty();
				$('#msgBottomLeft').show();
			}else{
				$('#msgBottomLeft').hide();
				var heatMapHeader="";
				var heatMapSubCaption="";
				var heatMapYAxisName="Reasonable Indicators";
				var heatMapXAxisName="Districts";		
				heatMap(BottomLeftChartProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,BottomLeftData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
			}
			if(typeof BottomRightData == 'undefined' || BottomRightData.length == 0 || BottomRightData === ''){
				$('#BottomRight').empty();
				$('#msgBottomRight').show();
			}else{
				$('#msgBottomRight').hide();
				var barChartHeader="";
				var barChartSubCaption="";
				TopLeftChartProperties.seriesname="District_Name";
				barChart(BottomRightChartProperties,barChartSubCaption,BottomRightData,barChartHeader);
			}
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
}
function onIndicatorChange(){
	var indicator=document.getElementById("indicator").value;
	var contextpath='<%=request.getContextPath()%>';
	if(indicator === "IMR Dashboard I"){
		urlInd="/IMRPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "IMR Clustering Dashboard"){
		urlInd="/IMRClusteringPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "Disease Outbreak Analytics"){
		urlInd="/DiseaseOutbreakPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "CMCHIS Service Dashboard"){
		urlInd="/CMCHISServicePredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "CMCHIS Procedure Dashboard"){
		urlInd="/CMCHISProcedurePredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "CMCHIS Denied Dashboard"){
		urlInd="/CMCHISDeniedPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "Fully Immunized Dashboard"){
		urlInd="/FullyImmunizedPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "Measles Dashboard"){
		urlInd="/MeaslesPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "Blood Bank Stock Dashboard"){
		urlInd="/BloodBankStockPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "Blood Bank Stock Institution Wise"){
		urlInd="/BloodBankStockInstitutionWisePredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HOB Para III"){
		urlInd="/HOBParaPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "CMCHIS Need More Info Dashboard"){
		urlInd="/CNPParaPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Deliveries"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Disease"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Hospital Deaths"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Beds and Equipment Related"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Drug and Lab Test"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Deaths"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Referral and MMR"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "HS Others"){
		urlInd="/hsDashboardPredictiveZone.do?indicator="+indicator;
	}
	if(indicator === "MMR Operational Analytics"){
		urlInd="/MMROperationalAnalytics.do?indicator="+indicator;
	}
	if(indicator === "MMR Insides"){
		urlInd="/MMRInsides.do?indicator="+indicator;
	}
	document.location.href=contextpath+urlInd;
}
</script>
</html>