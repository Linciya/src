<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMCHIS NMI Predictive Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
<link rel="stylesheet" href="css/HSAutocomplete.css">
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
<script src="js/d3.v3.min.js"></script>
<script src="js/PredictiveZone.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/Fusion.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.widgets.js"></script>
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
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="reportDropDown" multiple="multiple">
					<c:forEach var="districts" items="${districtList}">
                   		<option value='<c:out value="${districts}"/>'>${districts} </option> 
               		</c:forEach> 
				</select> 
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_institution_type"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="institution_type" name="institution_type" class="dropDown" multiple="multiple" style="width: 100px;">
					<option value="Govt">Govt</option>
					<option value="Pvt">Pvt</option>
				</select> 
			</td>
			<td class="searchCriteria"><button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
			<td class="searchCriteria"><input type="button" onclick="predictivePrint('<%=request.getContextPath()%>','divMain')" value="Save as Pdf" /></td>
		</tr>			
	</table>
	</div>
		<div style="width:99.3%;">
			<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_preauth"/>" readonly="readonly" title="">
				</div>
				<div id="horizontalBarTopLeft"  style="padding-top:20px;"></div>
				<div id="msgTopLeft" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_claims"/>" readonly="readonly" title="">
				</div>
				<div id="horizontalBarTopRight" style="padding-top:20px;"></div>
				<div id="msgTopRight" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div style="width:99.3%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:400px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_preauth"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapBottomLeft"></div>
				<div id="msgBottomLeft" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:400px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_preauth"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapBottomRight"></div>
				<div id="msgBottomRight" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
var horizontalBarTopLeftChartProperties={"renderAt": 'horizontalBarTopLeft', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
heatMapBottomLeftProperties={"renderAt":'#heatMapBottomLeft',"top":20,"right":0,"bottom":100,"left":0,"width":600,"height":350,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"divWidth":10,"showLables":90,"showlabelPos":3,"gapx":1.01,"gapy":1};
heatMapBottomRightProperties={"renderAt":'#heatMapBottomRight',"top":20,"right":0,"bottom":100,"left":0,"width":600,"height":350,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"divWidth":10,"showLables":90,"showlabelPos":3,"gapx":1.01,"gapy":1};
var horizontalBarTopRightChartProperties={"renderAt": 'horizontalBarTopRight', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];
var multiSeriesChartProperties={"renderAt": 'horizontalBarChart', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
function onLoad(){
	var CNPTopLeftData=<%= request.getAttribute("CNPTopLeftData") %>;
	var CNPTopRightData=<%= request.getAttribute("CNPTopRightData") %>;
	var CNPBottomLeftData=<%= request.getAttribute("CNPBottomLeftData") %>;
	var CNPBottomRightData=<%= request.getAttribute("CNPBottomRightData") %>;
	
	if(CNPTopLeftData === '' || CNPTopLeftData === null){
		 $('#horizontalBarTopLeft').empty();
		 $('#msgTopLeft').show();			 
  	}else{
  		$('#msgTopLeft').hide();
  		var firstChart="bar2d";
  		StaticChart(firstChart,horizontalBarTopLeftChartProperties,"",CNPTopLeftData,"","District_Name");
  	}
    if(CNPTopRightData === '' || CNPTopRightData === null){
		 $('#horizontalBarTopRight').empty();
		 $('#msgTopRight').show();			 
	}else{
		$('#msgTopRight').hide();
		var firstChart="bar2d";
  		StaticChart(firstChart,horizontalBarTopRightChartProperties,"",CNPTopRightData,"","District_Name");
	}
  	if(CNPBottomLeftData === '' || CNPBottomLeftData === null){
		 $('#heatMapBottomLeft').empty();
		 $('#msgBottomLeft').show();			 
		}
  	else{
  		$('#msgBottomLeft').hide();
  		if(CNPBottomLeftData.length <6){
  			heatMapBottomLeftProperties.showLables=250;
  		}
  		heatMapPredictive(heatMapBottomLeftProperties,colours,CNPBottomLeftData);
  	}
  	if(CNPBottomRightData === '' || CNPBottomRightData === null){
		 $('#heatMapBottomRight').empty();
		 $('#msgBottomRight').show();			 
		}
 	else{
 		$('#msgBottomRight').hide();
 		heatMapPredictive(heatMapBottomRightProperties,colours,CNPBottomRightData);
 	}
}
$(document).ready(function() {
	$('#msgTopLeft').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();	
	
	var name='${indicatorName}';
	var district='${district}';
	var instType='${instType}';
	var year='${year}';
	var month='${month}';
	
	$("#indicator").val(name);
	$("#year").val(year);
	$("#month").val(month);
	$('#topLeftLabel').val($('#topLeftLabel').val()+' - '+year+' & '+month+' & '+instType);
   	$('#topRightLabel').val($('#topRightLabel').val()+' - '+year+' & '+month+' & '+district+' & '+instType);
   	$('#bottomLeftLabel').val($('#bottomLeftLabel').val()+' - '+year+' & '+month+' & '+instType);
   	$('#bottomRightLabel').val($('#bottomRightLabel').val()+' - '+year+' & '+month+' & '+district+' & '+instType);
   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
	$('#district option[value='+district+']').prop("selected", true);
	$('#district').multipleSelect({
    	filter: true
    });
	$('#institution_type option[value='+instType+']').prop("selected", true);
	$('#institution_type').multipleSelect({
    	filter: true
    });		
});
function onSearch()
{
	var year=document.getElementById("year").value;
	var month=document.getElementById("month").value;
	var selectedDistrict=$('#district').val();
	var district=selectedDistrict.toString();
	var selectedInstType=$('#institution_type').val();
	var institutionType=selectedInstType.toString();
	$.ajax({
		type: "POST",
		url: "CNPPredictiveOnSearch.do",
		'data':{
			year:year,district:district,institutionType:institutionType,month:month
		},
		success: function(result){
			if(result === '' || result === null){
				$('#horizontalBarTopLeft').empty();
				$('#horizontalBarTopRight').empty();
				$('#heatMapBottomLeft').empty();
				$('#heatMapBottomRight').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
				$('#msgBottomRight').show();
			}
			$('#horizontalBarTopLeft').empty();
			$('#horizontalBarTopRight').empty();
			$('#heatMapBottomLeft').empty();
			$('#heatMapBottomRight').empty();
			var data = JSON.parse(result);
			var CNPTopLeftData=data.CNPTopLeftData;
			var CNPTopRightData=data.CNPTopRightData;
			var CNPBottomLeftData=data.CNPBottomLeftData;
			var CNPBottomRightData=data.CNPBottomRightData;
			var district = data.district;
		   	var year= data.year;
		   	var month= data.month;
		   	var instType= data.instType;
		   	var n1=$('#topLeftLabel').val().indexOf('-');
		   	var n2=$('#topRightLabel').val().indexOf('-');
		   	var n3=$('#bottomLeftLabel').val().indexOf('-');
		   	var n4=$('#bottomRightLabel').val().indexOf('-');
		   	var topLeftLabel=$('#topLeftLabel').val().substring(0,n1);
		   	var topRightLabel=$('#topRightLabel').val().substring(0,n2);
		   	var bottomLeftLabel=$('#bottomLeftLabel').val().substring(0,n3);
		   	var bottomRightLabel=$('#bottomRightLabel').val().substring(0,n4);
			$('#topLeftLabel').val(topLeftLabel+' - '+year+' & '+month+' & '+instType);
		   	$('#topRightLabel').val(topRightLabel+' - '+year+' & '+month+' & '+district+' & '+instType);
		   	$('#bottomLeftLabel').val(bottomLeftLabel+' - '+year+' & '+month+' & '+instType);
			$('#bottomRightLabel').val(bottomRightLabel+' - '+year+' & '+month+' & '+district+' & '+instType);
		   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
		   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
		   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
		   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
			if(typeof CNPTopLeftData == 'undefined' || CNPTopLeftData.length === 0 || CNPTopLeftData === ''){
				 $('#horizontalBarChart').empty();
				 $('#msgTopLeft').show();	
			}else{
				$('#msgTopLeft').hide();
		  		var firstChart="bar2d";
		  		StaticChart(firstChart,horizontalBarTopLeftChartProperties,"",CNPTopLeftData,"","District_Name");	
			}
			if(typeof CNPTopRightData == 'undefined' || CNPTopRightData.length === 0 || CNPTopRightData === ''){
				 $('#LineChartsTopRight').empty();
				 $('#msgTopRight').show();
			}else{
				$('#msgTopRight').hide();
				var firstChart="line";
		  		StaticChart(firstChart,horizontalBarTopRightChartProperties,"",CNPTopRightData,"","District_Name");
				}
			if(typeof CNPBottomLeftData == 'undefined' || CNPBottomLeftData.length === 0 || CNPBottomLeftData === ''){
				$('#heatMapBottomLeft').empty();
				$('#msgBottomLeft').show();
			}else{
				$('#msgBottomLeft').hide();
				heatMapPredictive(heatMapBottomLeftProperties,colours,CNPBottomLeftData);
			}
			if(typeof CNPBottomRightData == 'undefined' || CNPBottomRightData.length === 0 || CNPBottomRightData === ''){
				$('#heatMapBottomRight').empty();
				$('#msgBottomRight').show();
			}else{
				$('#msgBottomRight').hide();
				heatMapPredictive(heatMapBottomRightProperties,colours,CNPBottomRightData);
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

$( "#date" ).datepicker({
	dateFormat: 'dd-mm-yy',	
});
</script>
</html>