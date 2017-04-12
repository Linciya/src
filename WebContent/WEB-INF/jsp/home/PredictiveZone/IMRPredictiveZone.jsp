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
/* .btn {
    display: block;
    width:120px;
    padding: 1px 1px;
    margin-bottom: 0;
    font-size: 14px;
    text-align: center;
    cursor: pointer;
    user-select: none;
    background :none;
    background-image: none;
    border: 1px solid #ccc;
    border-top-left-radius: 0px 0px;
	border-top-right-radius: 0px 0px;
	border-bottom-left-radius: 0px 0px;
	border-bottom-right-radius: 0px 0px;
} */
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
				<select id="district" name="district" class="reportDropDown" multiple="multiple">
					<c:forEach var="districts" items="${districtList}">
                   		<option value='<c:out value="${districts}"/>'>${districts} </option> 
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
					<input id="topLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_district_wise"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapTopLeft"></div>
				<div id="msgTopLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_institution_wise"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapTopRight"></div>
				<div id="msgTopRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_child_indicators"/>" readonly="readonly" title="">
				</div>
				<div id="doughnut2dChart"></div>
				<div id="msgBottomLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_IMR_forecast"/>" readonly="readonly" title="">
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

heatMapTopLeftProperties={"renderAt":'#heatMapTopLeft',"top":100,"right":0,"bottom":100,"left":0,"width":600,"height":330,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"showLables":20,"showlabelPos":2.2,"gapx":1,"gapy":1};
heatMapTopRightProperties={"renderAt":'#heatMapTopRight',"top":70,"right":0,"bottom":100,"left":0,"width":550,"height":330,"buckets":9,"rx":10,"ry":10,"rectWidth":1,"rectHeight":1,"showLables":120,"showlabelPos":3,"gapx":1.010,"gapy":1.010};
var doughnut2dChartProperties={"type": 'pie2d',"renderAt": 'doughnut2dChart', "width": '600',"height": '320',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000","bgColor": "#ffffff","showBorder": "0","use3DLighting": "0","showShadow": "0","enableSmartLabels": "0","startingAngle": "310","showLabels": "0","showPercentValues": "0","showLegend": "1",
		"legendShadow": "0","legendBorderAlpha": "0","centerLabelBold": "1","showTooltip": "0","decimals": "0","captionFontSize": "14","subcaptionFontSize": "14","subcaptionFontBold": "0","seriesname": "Food Products",
        "showValues":"0"};
heatMapBottomRightProperties={"renderAt":'#heatMapBottomRight',"top":80,"right":0,"bottom":100,"left":0,"width":600,"height":350,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"showLables":40,"showlabelPos":2.2,"gapx":1,"gapy":2};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];
function onLoad(){
   	var heatMapTopLeftData = <%= request.getAttribute("topLeftData") %>;
   	var heatMapTopRightData = <%= request.getAttribute("topRightData") %>;
   	var pieBottomLeftData = <%= request.getAttribute("bottomLeftData") %>;
   	var heatMapBottomRightData = <%= request.getAttribute("bottomRightData") %>;
   	if(heatMapTopLeftData === '' || heatMapTopLeftData === null){
		 $('#heatMapTopLeft').empty();
		 $('#msgTopLeft').show();			 
   	}else{
   		$('#msgTopLeft').hide();
   		heatMapPredictive(heatMapTopLeftProperties,colours,heatMapTopLeftData);
   	}
   	if(heatMapTopRightData === '' || heatMapTopRightData === null){
		 $('#heatMapTopRight').empty();
		 $('#msgTopRight').show();			 
	}else{
		$('#msgTopRight').hide();
		heatMapPredictive(heatMapTopRightProperties,colours,heatMapTopRightData);
	}
   	if(pieBottomLeftData === '' || pieBottomLeftData === null){
		 $('#doughnut2dChart').empty();
		 $('#msgBottomLeft').show();			 
		}
   	else{
   		$('#msgBottomLeft').hide();
   		var doughnut2dChartHeader="";
   		var doughnut2dChartSubCaption="";
   		doughnut2dChart(doughnut2dChartProperties,doughnut2dChartSubCaption,pieBottomLeftData,doughnut2dChartHeader);
   	}
   	if(heatMapBottomRightData === '' || heatMapBottomRightData === null){
		 $('#heatMapBottomRight').empty();
		 $('msgBottomRight').show();			 
	}else{
		$('#msgBottomRight').hide();
		heatMapPredictive(heatMapBottomRightProperties,colours,heatMapBottomRightData);
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
	var yearMonth=month.substring(0,3)+' '+year;
	$("#indicator").val(name);
	$("#txtFrom").val(yearMonth);
	$("#txtTo").val(yearMonth);
	
	$('#topLeftLabel').val($('#topLeftLabel').val()+' - All Districts & '+yearMonth);
   	$('#topRightLabel').val($('#topRightLabel').val()+' - '+yearMonth+' & '+district);
   	$('#bottomLeftLabel').val($('#bottomLeftLabel').val()+' - '+yearMonth+' & '+district);
   	$('#bottomRightLabel').val($('#bottomRightLabel').val()+' - All Districts');
   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
	$('#district option[value='+district+']').prop("selected", true);
	$('#district').multipleSelect({
    	//filter: true
    });
});
function onSearch()
{
	var selectedDistrict=$('#district').val();
	var district=selectedDistrict.toString();
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
	$.ajax({
		type: "POST",
		url: "imrPredictiveOnSearch.do",
		'data':{
			fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,district:district
		},
		success: function(result){
			if(result === '' || result === null){
				$('#heatMapTopLeft').empty();
				$('#heatMapTopRight').empty();
				$('#doughnut2dChart').empty();
				$('#heatMapBottomRight').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
				$('#msgBottomRight').show();
			}
			$('#heatMapTopLeft').empty();
			$('#heatMapTopRight').empty();
			$('#doughnut2dChart').empty();
			$('#heatMapBottomRight').empty();
			var data = JSON.parse(result);
			var heatMapTopLeftData=data.topLeftData;
			var heatMapTopRightData=data.topRightData;
			var heatMapBottomRightData=data.bottomRightData;
			var pieBottomLeftData=data.bottomLeftData;
			var district = data.district;
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
			$('#topLeftLabel').val(topLeftLabel+'- All Districts & '+yearMonth);
		   	$('#topRightLabel').val(topRightLabel+'- '+yearMonth+' & '+district);
		   	$('#bottomLeftLabel').val(bottomLeftLabel+'- '+yearMonth+' & '+district);
			$('#bottomRightLabel').val(bottomRightLabel+'- All Districts');
		   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
		   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
		   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
		   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
			if(typeof heatMapTopLeftData == 'undefined' || heatMapTopLeftData.length === 0 || heatMapTopLeftData === ''){
				$('#heatMapTopLeft').empty();
				$('#msgTopLeft').show();
			}else{
				$('#msgTopLeft').hide();
				heatMapPredictive(heatMapTopLeftProperties,colours,heatMapTopLeftData);
			}
			if(typeof heatMapTopRightData == 'undefined' || heatMapTopRightData.length === 0 || heatMapTopRightData === ''){
				$('#heatMapTopRight').empty();
				$('#msgTopRight').show();
			}else{
				$('#msgTopRight').hide();
				heatMapPredictive(heatMapTopRightProperties,colours,heatMapTopRightData);
			}
			if(typeof pieBottomLeftData == 'undefined' || pieBottomLeftData.length === 0 || pieBottomLeftData === ''){
				$('#heatMapBottomLeft').empty();
				$('#msgBottomLeft').show();
			}else{
				$('#msgBottomLeft').hide();
				var doughnut2dChartHeader="";
				var doughnut2dChartSubCaption="";
				doughnut2dChart(doughnut2dChartProperties,doughnut2dChartSubCaption,pieBottomLeftData,doughnut2dChartHeader);
			}
			if(typeof heatMapBottomRightData == 'undefined' || heatMapBottomRightData.length === 0 || heatMapBottomRightData === ''){
				$('#heatMapBottomRight').empty();
				$('#msgBottomRight').show();
			}else{
				$('#msgBottomRight').hide();
				heatMapPredictive(heatMapBottomRightProperties,colours,heatMapBottomRightData);
			}			
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
}
function onIndicatorChange(){
	var indicator=document.getElementById("indicator").value;
	var contextpath='<%=request.getContextPath()%>';
	if(indicator === "IMR DashboardI"){
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