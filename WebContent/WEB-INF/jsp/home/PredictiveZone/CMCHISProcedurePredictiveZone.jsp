<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMCHIS Procedure Predictive Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
<link rel="stylesheet" href="css/HSAutocomplete.css">
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
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_institution_type"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="institution_type" name="institution_type" class="reportDropDown" multiple="multiple" style="width: 100px;">
					<option value="Govt">Govt</option>
					<option value="Pvt">Pvt</option>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="reportDropDown" multiple="multiple" >
					<c:forEach var="districts" items="${districtList}">
                   		<option value='<c:out value="${districts}"/>'>${districts} </option> 
               		</c:forEach> 
				</select> 
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_speciality"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="speciality" name="speciality" class="reportDropDown">
					<c:forEach var="speciality" items="${specialityList}">
                   		<option value='<c:out value="${speciality}"/>'>${speciality} </option> 
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
				<div  class="predictiveHeader" align="left">
					<input id="topLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_claims_raised_speciality_wise"/>" readonly="readonly" title="">
				</div>
				<div id="heatMapTopLeft"></div>
				<div id="msgTopLeft" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div  class="predictiveHeader" align="left">
					<input id="topRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_claims_raised_precedure_wise"/>" readonly="readonly" title="">
				</div>
				<div id="horizontalBarChart" style="padding-top:20px;"></div>
				<div id="msgTopRight" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div  class="predictiveHeader" align="left">
					<input id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_claims_raised_district_wise"/>" readonly="readonly" title="">
				</div>
				<div id="barBottomLeft" style="padding-top:20px;"></div>
				<div id="msgBottomLeft" style="padding-top:120px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div  class="predictiveHeader" align="left">
					<input id="bottomRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_claims_raised_institution_wise"/>" readonly="readonly" title="">
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
heatMapTopLeftProperties={"renderAt":'#heatMapTopLeft',"top":20,"right":0,"bottom":100,"left":0,"width":600,"height":300,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"showLables":-120,"showlabelPos":3,"gapx":1,"gapy":1};
heatMapBottomRightProperties={"renderAt":'#heatMapBottomRight',"top":10,"right":0,"bottom":100,"left":0,"width":600,"height":300,"buckets":9,"rx":4,"ry":4,"rectWidth":1,"rectHeight":1,"showLables":70,"showlabelPos":3,"gapx":1,"gapy":1};
var horizontalBarChartProperties={"renderAt": 'horizontalBarChart', "width": '600',"height": '300',"dataFormat": 'json',"startingAngle": "20","showPercentValues": "0","showPercentInTooltip": "0","enableSmartLabels": "0","enableMultiSlicing": "0","decimals": "1","showLegend": "1","theme": "fint"};
var barBottomLeftChartProperties={"type": 'stackedcolumn2dline',"renderAt": 'barBottomLeft', "width": '600',"height": '300',"dataFormat": 'json',"showPercentValues": "1","showPercentInTooltip": "0","enableSmartLabels": "1","decimals": "1","skipOverlapLabels": "1","theme": "fint","showValues":"0"};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];
function onLoad(){
	var CPPTopLeftData=<%= request.getAttribute("CPPTopLeftData") %>;
	var CPPTopRightData=<%= request.getAttribute("CPPTopRightData") %>;
	var CPPBottomLeftData=<%= request.getAttribute("CPPBottomLeftData") %>;
	var CPPBottomRightData=<%= request.getAttribute("CPPBottomRightData") %>;
	
	if(CPPTopLeftData === '' || CPPTopLeftData === null){
		 $('#heatMapTopLeft').empty();
		 $('#msgTopLeft').show();			 
  	}else{
  		$('#msgTopLeft').hide();
  		heatMapPredictive(heatMapTopLeftProperties,colours,CPPTopLeftData);
  	}
    if(CPPTopRightData === '' || CPPTopRightData === null){
		 $('#horizontalBarChart').empty();
		 $('#msgTopRight').show();			 
	}else{
		$('#msgTopRight').hide();
		var firstChart="bar2d";
  		StaticChart(firstChart,horizontalBarChartProperties,"",CPPTopRightData,"","General_Name");
	}
  	if(CPPBottomLeftData === '' || CPPBottomLeftData === null){
		 $('#barBottomLeft').empty();
		 $('#msgBottomLeft').show();			 
		}
  	else{
  		$('#msgBottomLeft').hide();
  		var barChartHeader="";
		var barChartSubCaption="";
		barBottomLeftChartProperties.seriesname="District_Name";
		barChart(barBottomLeftChartProperties,barChartSubCaption,CPPBottomLeftData,barChartHeader);
  	}
  	if(CPPBottomRightData === '' || CPPBottomRightData === null){
		 $('#heatMapBottomRight').empty();
		 $('#msgBottomRight').show();			 
		}
 	else{
 		$('#msgBottomRight').hide();
 		heatMapPredictive(heatMapBottomRightProperties,colours,CPPBottomRightData);
 	}
}
$(document).ready(function() {
	$('#msgTopLeft').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();	
	var name='${indicatorName}';
	var district='${district}';
	var speciality='${speciality}';
	var instType='${instType}';
	$("#indicator").val(name);
	$("#speciality").val(speciality);
	$('#topLeftLabel').val($('#topLeftLabel').val()+' - '+instType);
   	$('#topRightLabel').val($('#topRightLabel').val()+' - '+speciality+' & '+instType);
   	$('#bottomLeftLabel').val($('#bottomLeftLabel').val()+' - '+speciality+' & '+instType+' & All Districts');
   	$('#bottomRightLabel').val($('#bottomRightLabel').val()+' - '+speciality+' & '+instType+' & '+district);
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
	var selectedDistrict=$('#district').val();
	var district=selectedDistrict.toString();
	var selectedInstType=$('#institution_type').val();
	var instType=selectedInstType.toString();
	var speciality=document.getElementById("speciality").value;
	$.ajax({
		type: "POST",
		url: "CPPPredictiveOnSearch.do",
		'data':{
			instType:instType,district:district,speciality:speciality
		},
		success: function(result){
			if(result === '' || result === null){
				$('#heatMapTopLeft').empty();
				$('#horizontalBarChart').empty();
				$('#barBottomLeft').empty();
				$('#heatMapBottomRight').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
				$('#msgBottomRight').show();
			}
			$('#heatMapTopLeft').empty();
			$('#horizontalBarChart').empty();
			$('#barBottomLeft').empty();
			$('#heatMapBottomRight').empty();
			var data = JSON.parse(result);
			var CPPTopLeftData=data.CPPTopLeftData;
			var CPPTopRightData=data.CPPTopRightData;
			var CPPBottomLeftData=data.CPPBottomLeftData;
			var CPPBottomRightData=data.CPPBottomRightData;
			var district = data.district;
		   	var instType= data.instType;
		   	var speciality= data.speciality;
		   	var n1=$('#topLeftLabel').val().indexOf('-');
		   	var n2=$('#topRightLabel').val().indexOf('-');
		   	var n3=$('#bottomLeftLabel').val().indexOf('-');
		   	var n4=$('#bottomRightLabel').val().indexOf('-');
		   	var topLeftLabel=$('#topLeftLabel').val().substring(0,n1);
		   	var topRightLabel=$('#topRightLabel').val().substring(0,n2);
		   	var bottomLeftLabel=$('#bottomLeftLabel').val().substring(0,n3);
		   	var bottomRightLabel=$('#bottomRightLabel').val().substring(0,n4);
			$('#topLeftLabel').val(topLeftLabel+' - '+instType);
		   	$('#topRightLabel').val(topRightLabel+' - '+speciality+' & '+instType);
		   	$('#bottomLeftLabel').val(bottomLeftLabel+' - '+speciality+' & '+instType+' & All Districts');
			$('#bottomRightLabel').val(bottomRightLabel+' - '+speciality+' & '+instType+' & '+district);
		   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
		   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
		   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
		   	$('#bottomRightLabel').prop('title',$('#bottomRightLabel').val());
			if(typeof CPPTopLeftData == 'undefined' || CPPTopLeftData.length === 0 || CPPTopLeftData === ''){
				 $('#horizontalBarChart').empty();
				 $('#msgTopLeft').show();	
			}else{
				$('#msgTopLeft').hide();
				heatMapPredictive(heatMapTopLeftProperties,colours,CPPTopLeftData);	
			}
			if(typeof CPPTopRightData == 'undefined' || CPPTopRightData.length === 0 || CPPTopRightData === ''){
				 $('#horizontalBarChart').empty();
				 $('#msgTopRight').show();
			}else{
				$('#msgTopRight').hide();
				var firstChart="bar2d";
		  		StaticChart(firstChart,horizontalBarChartProperties,"",CPPTopRightData,"","General_Name");
				}
			if(typeof CPPBottomLeftData == 'undefined' || CPPBottomLeftData.length === 0 || CPPBottomLeftData === ''){
				$('#barBottomLeft').empty();
				$('#msgBottomLeft').show();
			}else{
				$('#msgBottomLeft').hide();
				var barChartHeader="";
				var barChartSubCaption="";
				barBottomLeftChartProperties.seriesname="District_Name";
				barChart(barBottomLeftChartProperties,barChartSubCaption,CPPBottomLeftData,barChartHeader);
			}
			if(typeof CPPBottomRightData == 'undefined' || CPPBottomRightData.length === 0 || CPPBottomRightData === ''){
				$('#heatMapBottomRight').empty();
				$('#msgBottomRight').show();
			}else{
				$('#msgBottomRight').hide();
				heatMapPredictive(heatMapBottomRightProperties,colours,CPPBottomRightData);
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