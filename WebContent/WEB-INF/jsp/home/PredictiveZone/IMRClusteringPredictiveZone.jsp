<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IMR Clustering Predictive Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
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
<div id="divMain" style="width:100%;background:#ffffff;">
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
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="reportDropDown" multiple="multiple">
					<c:forEach var="districts" items="${districtList}">
                   		<option value='<c:out value="${districts}"/>'>${districts} </option> 
               		</c:forEach>
				</select> 
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_cluster"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="clusters" name="cluster" class="reportDropDown">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
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
					<input id="topLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_IMR_cluster"/>" readonly="readonly" title="">
				</div>
				<div id="cluster" style="width:100%;margin-top: 50px;"></div>
				<div id="msgTopLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="topRightLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_IMR_trend"/>" readonly="readonly" title="">
				</div>
				<div id="multiAxisLineChart"></div>
				<div id="msgTopRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:99.4%;height:380px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<input id="bottomLeftLabel" style="width:600px;margin-left: 10px;margin-top: 2px;border: none;background: none;" value="<spring:message code="label_IMR_related_indicators"/>" readonly="readonly" title="">
				</div>
				<div id="verticalHeatMapBottom" style="margin-left: 10px;"></div>
				<div id="msgBottom" style="padding-top:100px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
heatMapTopLeftProperties={"renderAt":"#cluster","top":0,"right":0,"bottom":0,"left":20,"width":600,"height":530,"buckets":9,"rx":40,"ry":40,"rectWidth":1.1,"rectHeight":1.1,"showLables":170,"showlabelPos":2,"gapx":2,"gapy":2};
heatMapBottomProperties={"renderAt":'#verticalHeatMapBottom',"top":50,"right":0,"bottom":0,"left":360,"width":1400,"height":450,"buckets":9,"rx":2,"ry":2,"rectWidth":1,"rectHeight":1,"showLables":150,"showlabelPos":2,"gapx":1,"gapy":1};
var multiAxisLineChartProperties={"type": 'multiaxisline',"renderAt": 'multiAxisLineChart', "width": '600',"height": '320',"dataFormat": 'json',"id": 'revenue-chart',"theme": "fint","titlepos": "left","tickwidth": "10","divlineisdashed": "1","numdivlines": "14"};
colours = ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"];
function onLoad(){
	var IMR2HeatMapTopLeftData=<%= request.getAttribute("IMR2TopLeftData") %>;
	var IMR2LineTopRightData=<%= request.getAttribute("IMR2TopRightData") %>;
	var IMR2HeatMapBottomData=<%= request.getAttribute("IMR2BottomData") %>;
	
	if(IMR2HeatMapTopLeftData === '' || IMR2HeatMapTopLeftData === null){
		 $('#cluster').empty();
		 $('#msgTopLeft').show();			 
  	}else{
  		$('#msgTopLeft').hide();
  		heatMapPredictive(heatMapTopLeftProperties,colours,IMR2HeatMapTopLeftData);
  	}
    if(IMR2LineTopRightData === '' || IMR2LineTopRightData === null){
		 $('#multiAxisLineChart').empty();
		 $('#msgTopRight').show();			 
	}else{
		$('#msgTopRight').hide();
		var multiAxisLineChartHeader="";
		var multiAxisLineChartXAxisname="Time_Month_Name";
		var IMR2LineFirstSeriesData=[];
		var IMR2LineSecondSeriesData=[];
		if(IMR2LineTopRightData!=null && IMR2LineTopRightData.length>0){
			var year=IMR2LineTopRightData[0].year;
			for(i=0;i<IMR2LineTopRightData.length;i++){
				if(IMR2LineTopRightData[i].year != year){
					multiAxisLineChartProperties.seriesnameGT=IMR2LineTopRightData[i].year;
					IMR2LineFirstSeriesData.push(IMR2LineTopRightData[i]);
				}
				else{
					multiAxisLineChartProperties.seriesnameLT=IMR2LineTopRightData[i].year;
					IMR2LineSecondSeriesData.push(IMR2LineTopRightData[i]);
				}
			}
		}
		multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,IMR2LineFirstSeriesData,IMR2LineSecondSeriesData,multiAxisLineChartHeader);
	}
  	if(IMR2HeatMapBottomData === '' || IMR2HeatMapBottomData === null){
		 $('#verticalHeatMapBottom').empty();
		 $('#msgBottomLeft').show();			 
		}
  	else{
  		$('#msgBottomLeft').hide();
  		verticalHeatMap(heatMapBottomProperties,colours,IMR2HeatMapBottomData);
  	} 
}

$(document).ready(function() {
	$('#msgTopLeft').hide();
	$('#msgTopRight').hide();
	$('#msgBottom').hide();
	
	var name='${indicatorName}';	
	var district='${district}';
	var cluster='${cluster}';
	$("#indicator").val(name);
	$("#clusters").val(cluster);
	
	$('#topLeftLabel').val($('#topLeftLabel').val()+' - All Districts');
   	$('#topRightLabel').val($('#topRightLabel').val()+' - '+district+' & Cluster '+cluster);
   	$('#bottomLeftLabel').val($('#bottomLeftLabel').val()+' - Cluster '+cluster);
   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
	$('#district option[value='+district+']').prop("selected", true);
	$('#district').multipleSelect({
    	filter: true
    });
});
function onSearch()
{
	var selectedDistrict=$('#district').val();
	var district=selectedDistrict.toString();
	var cluster=document.getElementById("clusters").value;
	$.ajax({
		type: "POST",
		url: "IMRClusterPredictiveOnSearch.do",
		'data':{
			district:district,cluster:cluster
		},
		success: function(result){
			if(result === '' || result === null){
				$('#cluster').empty();
				$('#multiAxisLineChart').empty();
				$('#verticalHeatMapBottom').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
			}
			$('#cluster').empty();
			$('#multiAxisLineChart').empty();
			$('#verticalHeatMapBottom').empty();
			var data = JSON.parse(result);
			var IMR2HeatMapTopLeftData=data.IMR2TopLeftData;
			var IMR2LineTopRightData=data.IMR2TopRightData;
			var IMR2HeatMapBottomData=data.IMR2BottomData;
			var district=data.district;
			var cluster=data.cluster;
			var n1=$('#topLeftLabel').val().indexOf('-');
		   	var n2=$('#topRightLabel').val().indexOf('-');
		   	var n3=$('#bottomLeftLabel').val().indexOf('-');
		   	var topLeftLabel=$('#topLeftLabel').val().substring(0,n1);
		   	var topRightLabel=$('#topRightLabel').val().substring(0,n2);
		   	var bottomLeftLabel=$('#bottomLeftLabel').val().substring(0,n3);
			$('#topLeftLabel').val(topLeftLabel+' - All Districts');
		   	$('#topRightLabel').val(topRightLabel+' - '+district+' & Cluster '+cluster);
		   	$('#bottomLeftLabel').val(bottomLeftLabel+' - Cluster '+cluster);
		   	$('#topLeftLabel').prop('title',$('#topLeftLabel').val());
		   	$('#topRightLabel').prop('title',$('#topRightLabel').val());
		   	$('#bottomLeftLabel').prop('title',$('#bottomLeftLabel').val());
			if(typeof IMR2HeatMapTopLeftData == 'undefined' || IMR2HeatMapTopLeftData.length === 0 || IMR2HeatMapTopLeftData === ''){
				 $('#cluster').empty();
				 $('#msgTopLeft').show();	
			}else{
				$('#msgTopLeft').hide();
		  		heatMapPredictive(heatMapTopLeftProperties,colours,IMR2HeatMapTopLeftData);
			}
			if(typeof IMR2LineTopRightData == 'undefined' || IMR2LineTopRightData.length === 0 || IMR2LineTopRightData === ''){
				 $('#multiAxisLineChart').empty();
				 $('#msgTopRight').show();
			}else{
				$('#msgTopRight').hide();
				var multiAxisLineChartHeader="";
				var multiAxisLineChartXAxisname="Time_Month_Name";
				var IMR2LineFirstSeriesData=[];
				var IMR2LineSecondSeriesData=[];
				if(IMR2LineTopRightData!=null && IMR2LineTopRightData.length>0){
					var year=IMR2LineTopRightData[0].year;
					for(i=0;i<IMR2LineTopRightData.length;i++){
						if(IMR2LineTopRightData[i].year != year){
							IMR2LineFirstSeriesData.push(IMR2LineTopRightData[i]);
						}
						else{
							IMR2LineSecondSeriesData.push(IMR2LineTopRightData[i]);
						}
					}
				}
				multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,IMR2LineFirstSeriesData,IMR2LineSecondSeriesData,multiAxisLineChartHeader);
			}
			if(typeof IMR2HeatMapBottomData == 'undefined' || IMR2HeatMapBottomData.length === 0 || IMR2HeatMapBottomData === ''){
				$('#verticalHeatMapBottom').empty();
				$('#msgBottomLeft').show();
			}else{
				$('#msgBottomLeft').hide();
				verticalHeatMap(heatMapBottomProperties,colours,IMR2HeatMapBottomData);
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