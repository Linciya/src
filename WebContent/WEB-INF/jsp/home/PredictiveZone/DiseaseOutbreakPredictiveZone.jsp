<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Disease Outbreak Predictive Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/HSAutocomplete.css">
<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
<script src="js/d3.v3.min.js"></script>
<script src="js/PredictiveZone.js"></script>
<script src="js/zingchart.min.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/Fusion.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.widgets.js"></script>
<script src="js/Fusion.js"></script>
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
				<select id="indicator" name="indicator" class="reportDropDown" onchange="onIndicatorChange();">
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
			<td class="searchCriteria"><spring:message code="label_searchcriteria_from"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<input type="text" id="txtFrom" style="width:100px;background-color: #DDFF99;"/>
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_to"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<input type="text" id="txtTo" style="width:100px;background-color: #DDFF99;"/>
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="reportDropDown"  multiple="multiple">
					<c:forEach var="districts" items="${districtList}">
                   		<option value='<c:out value="${districts}"/>'>${districts} </option> 
               		</c:forEach> 
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_disease"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="disease" name="disease" class="reportDropDown" style="width: 100px;" multiple="multiple">
					<c:forEach var="diseases" items="${diseaseList}">
                   		<option value='<c:out value="${diseases}"/>'>${diseases} </option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria"><button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
			<td class="searchCriteria"><input type="button" onclick="predictivePrint('<%=request.getContextPath()%>','divMain')" value="Save as Pdf" /></td>
		</tr>			
	</table>
	</div>
		<div style="width:99.4%;">
			<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_disease_outbreak_by_district"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapTopLeft"></div>
				<div id="msgTopLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_disease_outbreak_by_institution"/>" readonly="readonly" title="">
				</div>
				<div id="zingTopRight" style="width:100%;margin-top: 50px;"></div>
				<div id="msgTopRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_disease_outbreak_trend_analysis"/>" readonly="readonly" title="">
				</div>
				<div id="multiAxisLineChart" style="padding-top:20px;"></div>
				<div id="msgBottomLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_yearly_forecast"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapBottomRight"></div>
				<div id="msgBottomRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
//heatMapTopLeftProperties={"renderAt":'#cluster',"top":0,"right":0,"bottom":0,"left":20,"width":600,"height":530,"buckets":9,"rx":0,"ry":0,"rectWidth":1.1,"rectHeight":1.1,"showLables":170,"showlabelPos":2,"gapx":2,"gapy":2};
heatMapBottomRightProperties={"renderAt":'#heatMapBottomRight',"top":100,"right":0,"bottom":100,"left":0,"width":600,"height":350,"buckets":9,"rx":40,"ry":40,"rectWidth":1,"rectHeight":1,"divWidth":30,"showLables":50,"showlabelPos":2,"gapx":1,"gapy":1};
var multiAxisLineChartProperties={"type": 'multiaxisline',"renderAt": 'multiAxisLineChart', "width": '600',"height": '300',"dataFormat": 'json',"id": 'revenue-chart',"theme": "fint","titlepos": "left","tickwidth": "10","divlineisdashed": "1","numdivlines": "14","seriesnameGT": "","seriesnameLT": ""};
var heatMapTopLeftProperties={"type": 'heatmap',"renderAt": 'heatMapTopLeft',"width": '600',"height": '300',"dataFormat": 'json',"theme": "fint","showPlotBorder": "0","gradient": "1","colorRangeCode": "#e24b1a","startLabel": "Good","endLabel": "Poor", "colorRangeColorCode1": "#6da81e","colorLabel1": "Good","colorRangeColorCode2": "#f6bc33","colorLabel2": "Average","colorRangeColorCode3": "#e24b1a","colorLabel3": "Bad"};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];
var mngood=1;
var mxgood=100;
var mnavg=101;
var mxavg=200;
var mnpoor=201;
var mxpoor=300;
var captionAlignment="centre";
function onLoad(){
	var DOBHeatMapTopLeftData=<%= request.getAttribute("topLeftData") %>;
	var DOBHeatMapTopRightData=<%= request.getAttribute("topRightData") %>;
	var DOBLineBottomLeftData=<%= request.getAttribute("bottomLeftData") %>;
	var DOBHeatMapBottomRightData=<%= request.getAttribute("bottomRightData") %>;
	
	if(DOBHeatMapTopLeftData === '' || DOBHeatMapTopLeftData === null){
		 $('#heatMapTopLeft').empty();
		 $('#msgTopLeft').show();			 
  	}else{
  		$('#msgTopLeft').hide();
  		var heatMapHeader="";
		var heatMapSubCaption="";
		var heatMapYAxisName="Diseases";
		var heatMapXAxisName="Districts";		
		heatMap(heatMapTopLeftProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,DOBHeatMapTopLeftData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
  	}
	if(DOBHeatMapTopRightData === '' || DOBHeatMapTopRightData === null || DOBHeatMapTopRightData === 'undefined'){
		 $('#heatMapTopRight').empty();
		 $('#msgTopRight').show();			 
		}
 	else{
 		$('#msgTopRight').hide();
 		var DOBDistrictData=[];
		var DOBDiseaseData=[];
		var DOBValueData=[];
		var DOBDiseaseData= $.unique(DOBHeatMapTopRightData.map(function (d) {
		    return d.disease.toString()})).sort();
 		for(i=0;i<DOBHeatMapTopRightData.length;i++){
 			DOBDistrictData.push(DOBHeatMapTopRightData[i].district);
 			DOBValueData.push(DOBHeatMapTopRightData[i].value);
 		}
 		zingChart(DOBDistrictData,DOBDiseaseData,DOBValueData);
 	}
  	if(DOBLineBottomLeftData === '' || DOBLineBottomLeftData === null){
		 $('#multiAxisLineChart').empty();
		 $('#msgBottomLeft').show();			 
	}else{
		$('#msgBottomLeft').hide();
		var multiAxisLineChartHeader="";
		var multiAxisLineChartXAxisname="Time_Month_Name";
		var DOBLineFirstSeriesData=[];
		var DOBLineSecondSeriesData=[];
		if(DOBLineBottomLeftData!=null && DOBLineBottomLeftData.length>0){
			var year=DOBLineBottomLeftData[0].year;
			for(i=0;i<DOBLineBottomLeftData.length;i++){
				if(DOBLineBottomLeftData[i].year != year){
					multiAxisLineChartProperties.seriesnameGT=DOBLineBottomLeftData[i].year;
					DOBLineFirstSeriesData.push(DOBLineBottomLeftData[i]);
				}
				else{
					multiAxisLineChartProperties.seriesnameLT=DOBLineBottomLeftData[i].year;
					DOBLineSecondSeriesData.push(DOBLineBottomLeftData[i]);
				}
			}
		}
		multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,DOBLineFirstSeriesData,DOBLineSecondSeriesData,multiAxisLineChartHeader);
	}
  	if(DOBHeatMapBottomRightData === '' || DOBHeatMapBottomRightData === null){
		 $('#heatMapBottomRight').empty();
		 $('#msgBottomRight').show();			 
		}
  	else{
  		$('#msgBottomRight').hide();
  		heatMapPredictive(heatMapBottomRightProperties,colours,DOBHeatMapBottomRightData);
  	}
}
$(document).ready(function() {
	$('#msgTopLeft').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();	
	
	var name='${indicatorName}';		
	var district='${district}';
	var year='${year}';
	var month='${month}';
	var disease='${disease}';
	var yearMonth=month+' '+year;
	$("#indicator").val(name);
	$("#txtFrom").val(yearMonth);
	$("#txtTo").val(yearMonth);
	$("#disease").val(disease);
	$('#topLeftLabel').val($('#topLeftLabel').val()+' - All Districts & '+yearMonth+' & '+disease);
   	$('#topRightLabel').val($('#topRightLabel').val()+' - '+yearMonth+' & '+district);
   	$('#bottomLeftLabel').val($('#bottomLeftLabel').val()+' - '+district);
   	$('#bottomRightLabel').val($('#bottomRightLabel').val()+' - All Districts');
   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
	$('#district option[value='+district+']').prop("selected", true);
	$('#district').multipleSelect({
    	filter: true
    });
	$('#disease').multipleSelect({
    	filter: true
    });
});
function onSearch()
{
	var fromDate = document.getElementById('txtFrom').value;
    var toDate = document.getElementById('txtTo').value;
    if(fromDate!=""){
        var selectedFromDate = fromDate.split(" ");
        fromMonth = selectedFromDate[0];
		fromYear = parseInt(selectedFromDate[1]);
	}
	if(toDate!=""){
        var selectedToDate =toDate.split(" ");    
		toMonth = selectedToDate[0];
		toYear = parseInt(selectedToDate[1]);
	}
	var selectedDistrict=$('#district').val();
	var district=selectedDistrict.toString();
	var selectedDisease=$("#disease").val();
	var disease = selectedDisease.toString();
	$.ajax({
		type: "POST",
		url: "DOBPredictiveOnSearch.do",
		'data':{
			fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,district:district,disease:disease
		},
		success: function(result){
			if(result === '' || result === null){
				$('#heatMapTopLeft').empty();
				$('#zingTopRight').empty();
				$('#multiAxisLineChart').empty();
				$('#heatMapBottomRight').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
				$('#msgBottomRight').show();
			}
			$('#heatMapTopLeft').empty();
			$('#zingTopRight').empty();
			$('#multiAxisLineChart').empty();
			$('#heatMapBottomRight').empty();
			var data = JSON.parse(result);
			var DOBHeatMapTopLeftData=data.topLeftData;
			var DOBHeatMapTopRightData=data.topRightData;
			var DOBLineBottomLeftData=data.bottomLeftData;
			var DOBHeatMapBottomRightData=data.bottomRightData;
			var district = data.district;
			var disease = data.disease;
		   	var fromMonth= data.fromMonth;
		   	var fromYear= data.fromYear;
		   	var toMonth= data.toMonth;
		   	var toYear= data.toYear;
		   	var yearMonth='from '+fromMonth+' '+fromYear+' to '+toMonth+' '+toYear;
			var n1=$('#topLeftLabel').val().indexOf('-');
		   	var n2=$('#topRightLabel').val().indexOf('-');
		   	var n3=$('#bottomLeftLabel').val().indexOf('-');
		   	var n4=$('#bottomRightLabel').val().indexOf('-');
		   	var topLeftLabel=$('#topLeftLabel').val().substring(0,n1);
		   	var topRightLabel=$('#topRightLabel').val().substring(0,n2);
		   	var bottomLeftLabel=$('#bottomLeftLabel').val().substring(0,n3);
		   	var bottomRightLabel=$('#bottomRightLabel').val().substring(0,n4);
			$('#topLeftLabel').val(topLeftLabel+'- All Districts & '+yearMonth+' & '+disease);
		   	$('#topRightLabel').val(topRightLabel+'- '+yearMonth+' & '+district);
		   	$('#bottomLeftLabel').val(bottomLeftLabel+'- '+district);
			$('#bottomRightLabel').val(bottomRightLabel+'- All Districts');
		   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
		   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
		   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
		   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
			if(typeof DOBHeatMapTopLeftData == 'undefined' || DOBHeatMapTopLeftData === ""){
				$('#heatMapTopLeft').empty();
				$('#msgTopLeft').show();
			}else{
				$('msgTopLeft').hide();
				var heatMapHeader="";
				var heatMapSubCaption="";
				var heatMapYAxisName="Diseases";
				var heatMapXAxisName="Districts";		
				heatMap(heatMapTopLeftProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,DOBHeatMapTopLeftData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
			}
			if(typeof DOBHeatMapTopRightData == 'undefined' || DOBHeatMapTopRightData.length === 0 || DOBHeatMapTopRightData === ''){
				$('#zingTopRight').empty();
				$('#msgTopRight').show();
			}else{
				$('#msgTopRight').hide();
				var DOBDistrictData=[];
				var DOBDiseaseData=[];
				var DOBValueData=[];
				var DOBDiseaseData= $.unique(DOBHeatMapTopRightData.map(function (d) {
				    return d.disease.toString()})).sort();
		 		for(i=0;i<DOBHeatMapTopRightData.length;i++){
		 			DOBDistrictData.push(DOBHeatMapTopRightData[i].district);
		 			DOBValueData.push(DOBHeatMapTopRightData[i].value);
		 		}
		 		zingChart(DOBDistrictData,DOBDiseaseData,DOBValueData);
			}
			if(typeof DOBLineBottomLeftData == 'undefined' || DOBLineBottomLeftData.length === 0 || DOBLineBottomLeftData === ''){
				$('#multiAxisLineChart').empty();
				$('#msgBottomLeft').show();
			}else{
				$('#msgBottomLeft').hide();
				var multiAxisLineChartHeader="";
				var multiAxisLineChartXAxisname="Time_Month_Name";
				var DOBLineFirstSeriesData=[];
				var DOBLineSecondSeriesData=[];
				if(DOBLineBottomLeftData!=null && DOBLineBottomLeftData.length>0){
					var year=DOBLineBottomLeftData[0].year;
					for(i=0;i<DOBLineBottomLeftData.length;i++){
						if(DOBLineBottomLeftData[i].year != year){
							multiAxisLineChartProperties.seriesnameGT=DOBLineBottomLeftData[i].year;
							DOBLineFirstSeriesData.push(DOBLineBottomLeftData[i]);
						}
						else{
							multiAxisLineChartProperties.seriesnameLT=DOBLineBottomLeftData[i].year;
							DOBLineSecondSeriesData.push(DOBLineBottomLeftData[i]);
						}
					}
				}
				multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,DOBLineFirstSeriesData,DOBLineSecondSeriesData,multiAxisLineChartHeader);
			
			}
			if(typeof DOBHeatMapBottomRightData == 'undefined' || DOBHeatMapBottomRightData.length === 0 || DOBHeatMapBottomRightData === ''){
				$('#heatMapBottomRight').empty();
				$('#msgBottomRight').show();
			}else{
				$('#msgBottomRight').hide();
				heatMapPredictive(heatMapBottomRightProperties,colours,DOBHeatMapBottomRightData);
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
var searchMinDate = "-2y";
var searchMaxDate = "-1m";
if ((new Date()).getDate() <= 5) {
searchMaxDate = "-2m";
}
$("#txtFrom").datepicker({
dateFormat: "M yy",
changeMonth: true,
changeYear: true,
showButtonPanel: true,
showAnim: "",
minDate: searchMinDate,
maxDate: searchMaxDate,
showButtonPanel: true,
beforeShow: function (input, inst) {
    if ((datestr = $("#txtFrom").val()).length > 0) {
        var year = datestr.substring(datestr.length - 4, datestr.length);
        var month = jQuery.inArray(datestr.substring(0, datestr.length - 5), $("#txtFrom").datepicker('option', 'monthNamesShort'));
        $("#txtFrom").datepicker('option', 'defaultDate', new Date(year, month, 1));
        $("#txtFrom").datepicker('setDate', new Date(year, month, 1));
    }
},
onClose: function (input, inst) {
    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
    $("#txtFrom").datepicker('option', 'defaultDate', new Date(year, month, 1));
    $("#txtFrom").datepicker('setDate', new Date(year, month, 1));
    var to = $("#txtTo").val();
    $("#txtTo").datepicker('option', 'minDate', new Date(year, month, 1));
    if (to.length > 0) {
        var toyear = to.substring(to.length - 4, to.length);
        var tomonth = jQuery.inArray(to.substring(0, to.length - 5), $("#txtTo").datepicker('option', 'monthNamesShort'));
        $("#txtTo").datepicker('option', 'defaultDate', new Date(toyear, tomonth, 1));
        $("#txtTo").datepicker('setDate', new Date(toyear, tomonth, 1));
    }
}
});
$("#txtTo").datepicker({
dateFormat: "M yy",
changeMonth: true,
changeYear: true,
showButtonPanel: true,
showAnim: "",
minDate: searchMinDate,
maxDate: searchMaxDate,
showButtonPanel: true,
beforeShow: function (input, inst) {
    if ((datestr = $("#txtTo").val()).length > 0) {
        var year = datestr.substring(datestr.length - 4, datestr.length);
        var month = jQuery.inArray(datestr.substring(0, datestr.length - 5), $("#txtTo").datepicker('option', 'monthNamesShort'));
        $("#txtTo").datepicker('option', 'defaultDate', new Date(year, month, 1));
        $("#txtTo").datepicker('setDate', new Date(year, month, 1));
    }
},
onClose: function (input, inst) {
    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
    $("#txtTo").datepicker('option', 'defaultDate', new Date(year, month, 1));
    $("#txtTo").datepicker('setDate', new Date(year, month, 1));
    var from = $("#txtFrom").val();
    $("#txtFrom").datepicker('option', 'maxDate', new Date(year, month, 1));
    if (from.length > 0) {
        var fryear = from.substring(from.length - 4, from.length);
        var frmonth = jQuery.inArray(from.substring(0, from.length - 5), $("#txtFrom").datepicker('option', 'monthNamesShort'));
        $("#txtFrom").datepicker('option', 'defaultDate', new Date(fryear, frmonth, 1));
        $("#txtFrom").datepicker('setDate', new Date(fryear, frmonth, 1));
    }
    
}
});
</script>
</html>