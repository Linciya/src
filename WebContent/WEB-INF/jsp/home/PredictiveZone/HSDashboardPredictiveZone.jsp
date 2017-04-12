<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HS Predictive Zone</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="js/projectedBar.js"></script>
<script src="js/script.js"></script>
<script src="js/printThis.js"></script>
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
</head>
<body onload="onLoad();">
<input type="hidden" id="indlength" value=""/>
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
			<td class="searchCriteria"><spring:message code="label_searchcriteria_year"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<input type="text" id="year" readonly="readonly" style="border:none;width:100px;background-color: #DDFF99;"/>
			</td>	
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_month"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<input type="text" id="month" readonly="readonly" style="border:none;width:100px;background-color: #DDFF99;"/>
			</td>
			<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_district"/></td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="district" name="district" class="reportDropDown">
					<option value="All Districts">All Districts</option>
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
		<div id="top" style="width:99.4%;">
			<div id="topLeft" align="center" style="width:50.5%;height:350px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<%-- <label style="margin-left: 10px;margin-top: 2px;"><spring:message code="label_district_wise"/></label> --%>
					<input type="text" id="topLeftIndName" value="" style="border:none;background: none;width:400px;" readonly="readonly"/>
				</div>
				<div id="hsTopLeft"></div>
				<div id="msgTopLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="topright" align="center" style="width:48.8%;height:350px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<%-- <label style="margin-left: 10px;margin-top: 2px;"><spring:message code="label_institution_wise"/></label> --%>
					<input type="text" id="topRightIndName" value="" style="border:none;background: none;width:400px;" readonly="readonly"/>
				</div>
				<div id="hsTopRight"></div>
				<div id="msgTopRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>		
		<div id="bottom" style="width:99.4%;">
			<div id="bottomLeft" align="center" style="width:50.5%;height:350px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<%-- <label style="margin-left: 10px;margin-top: 2px;"><spring:message code="label_child_indicators"/></label> --%>
					<input type="text" id="bottomLeftIndName" value="" style="border:none;background: none;width:400px;" readonly="readonly"/>
				</div>
				<div id="hsBottomLeft"></div>
				<div id="msgBottomLeft" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
			
			<div id="bottomRight" align="center" style="width:48.8%;height:350px;float:right;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-radius:10px;">
				<div class="predictiveHeader" align="left">
					<%-- <label style="margin-left: 10px;margin-top: 2px;"><spring:message code="label_IMR_forecast"/></label> --%>
					<input type="text" id="bottomRightIndName" value="" style="border:none;background: none;width:400px;" readonly="readonly"/>
				</div>
				<div id="hsBottomRight"></div>
				<div id="msgBottomRight" style="padding-top:50px;">
					<p>This Report has no data for the selected Month and Year </p>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
topLeftProp={"renderAt":'hsTopLeft',"width":'625',"height":'315',"xaxis":"district"};
topRightProp={"renderAt":'hsTopRight',"width":'600',"height":'315',"xaxis":"district"};
bottomLeftProp={"renderAt":'hsBottomLeft',"width":'625',"height":'315',"xaxis":"district"};
bottomRightProp={"renderAt":'hsBottomRight',"width":'600',"height":'315',"xaxis":"district"};
$(document).ready(function() {
	$('#msgTopLeft').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();
	$('#msgTopRight').hide();
});

function onLoad(){
   	var topLeftData = <%= request.getAttribute("TopLeftData") %>;
   	var topRightData = <%= request.getAttribute("TopRightData") %>;
   	var bottomLeftData = <%= request.getAttribute("BottomLeftData") %>;
   	var bottomRightData = <%= request.getAttribute("BottomRightData") %>;
   	var year = <%= request.getAttribute("year") %>;
   	var month = "<%= request.getAttribute("month") %>";
   	var district = "<%= request.getAttribute("district") %>";
   	var indNames = <%= request.getAttribute("indNames") %>;
   	var indicatorName = "<%= request.getAttribute("indicatorName") %>";
   	$('#year').val(year);
   	$('#month').val(month);
   	$('#district').val(district);
   	$('#indicator').val(indicatorName);
   	$('#indlength').val(indNames);
   	//if(indNames == 4){
   		document.getElementById('topLeftIndName').value="<%= request.getAttribute("topLeftIndName") %>";
   		document.getElementById('topRightIndName').value="<%= request.getAttribute("topRightIndName") %>";
   		document.getElementById('bottomLeftIndName').value="<%= request.getAttribute("bottomLeftIndName") %>";
   		document.getElementById('bottomRightIndName').value="<%= request.getAttribute("bottomRightIndName") %>";
   		
   		$('#topLeftIndName').val($('#topLeftIndName').val()+' - '+year+' & '+month+' & '+district);
   	   	$('#topRightIndName').val($('#topRightIndName').val()+' - '+year+' & '+month+' & '+district);
   	   	$('#bottomLeftIndName').val($('#bottomLeftIndName').val()+' - '+year+' & '+month+' & '+district);
   	   	$('#bottomRightIndName').val($('#bottomRightIndName').val()+' - '+year+' & '+month+' & '+district);
   	   	$('#topLeftIndName').prop('title',$('#topLeftIndName').val());
   	   	$('#topRightIndName').prop('title',$('#topRightIndName').val());
   	   	$('#bottomLeftIndName').prop('title',$('#bottomLeftIndName').val());
   	   	$('#bottomRightIndName').prop('title',$('#bottomRightIndName').val());
	   	if(typeof topLeftData == 'undefined' || topLeftData === '' || topLeftData === null || topLeftData.length == 0){
			 $('#hsTopLeft').empty();
			 $('#msgTopLeft').show();			 
	   	}else{
	   		$('#msgTopLeft').hide();
	   		predictiveProjectedBar(topLeftData,topLeftData[0].projectedIndName,'<%= request.getAttribute("TopLeftDataSubCaption") %>',topLeftProp);
	   	}
	   	if(typeof topRightData == 'undefined' || topRightData === '' || topRightData === null || topRightData.length == 0){
			 $('#hsTopRight').empty();
			 $('#msgTopRight').show();			 
		}else{
			$('#msgTopRight').hide();
			predictiveProjectedBar(topRightData,topRightData[0].projectedIndName,'<%= request.getAttribute("TopRightDataSubCaption") %>',topRightProp);
		}
	   	if(typeof bottomLeftData == 'undefined' || bottomLeftData === '' || bottomLeftData === null || bottomLeftData.length == 0){
			 $('#hsBottomLeft').empty();
			 $('#msgBottomLeft').show();			 
			}
	   	else{
	   		$('#msgBottomLeft').hide();
	   		predictiveProjectedBar(bottomLeftData,bottomLeftData[0].projectedIndName,'<%= request.getAttribute("BottomLeftDataSubCaption") %>',bottomLeftProp);
	   	}
	   	if(typeof bottomRightData == 'undefined' || bottomRightData === '' || bottomRightData === null || bottomRightData.length == 0){
			 $('#hsBottomRight').empty();
			 $('msgBottomRight').show();			 
		}else{
			$('#msgBottomRight').hide();
			predictiveProjectedBar(bottomRightData,bottomRightData[0].projectedIndName,'<%= request.getAttribute("BottomRightDataSubCaption") %>',bottomRightProp);
		}
   //	}
   <%-- 	if(indNames == 3){
   		document.getElementById('topLeftIndName').value="<%= request.getAttribute("topLeftIndName") %>";
   		document.getElementById('topRightIndName').value="<%= request.getAttribute("topRightIndName") %>";
   		document.getElementById('bottomLeftIndName').value="<%= request.getAttribute("bottomLeftIndName") %>";
   		$('#bottomRight').empty();
   		$('#bottomRight').hide();
   		$('#msgBottomRight').hide();
	   	if(topLeftData === '' || topLeftData === null || topLeftData.length == 0){
			 $('#hsTopLeft').empty();
			 $('#msgTopLeft').show();			 
	   	}else{
	   		$('msgTopLeft').hide();
	   		predictiveProjectedBar(topLeftData,topLeftData[0].projectedIndName,'<%= request.getAttribute("TopLeftDataSubCaption") %>',topLeftProp);
	   	}
	   	if(topRightData === '' || topRightData === null || topRightData.length == 0){
			 $('#hsTopRight').empty();
			 $('#msgTopRight').show();			 
		}else{
			$('msgTopRight').hide();
			predictiveProjectedBar(topRightData,topRightData[0].projectedIndName,'<%= request.getAttribute("TopRightDataSubCaption") %>',topRightProp);
		}
	   	if(bottomLeftData === '' || bottomLeftData === null || bottomLeftData.length == 0){
			 $('#hsBottomLeft').empty();
			 $('#msgBottomLeft').show();			 
			}
	   	else{
	   		$('#msgBottomLeft').hide();
	   		predictiveProjectedBar(bottomLeftData,bottomLeftData[0].projectedIndName,'<%= request.getAttribute("BottomLeftDataSubCaption") %>',bottomLeftProp);
	   	}
   	}
	if(indNames == 2){
		document.getElementById('topLeftIndName').value="<%= request.getAttribute("topLeftIndName") %>";
   		document.getElementById('topRightIndName').value="<%= request.getAttribute("topRightIndName") %>";
   		$('#bottomLeft').empty();
   		$('#bottomLeft').hide();
   		$('#bottomRight').empty();
   		$('#bottomRight').hide();
   		$('#msgBottomRight').hide();
   		$('#msgBottomLeft').hide();
	   	if(topLeftData === '' || topLeftData === null || topLeftData.length == 0){
			 $('#hsTopLeft').empty();
			 $('#msgTopLeft').show();			 
	   	}else{
	   		$('msgTopLeft').hide();
	   		predictiveProjectedBar(topLeftData,topLeftData[0].projectedIndName,'<%= request.getAttribute("TopLeftDataSubCaption") %>',topLeftProp);
	   	}
	   	if(topRightData === '' || topRightData === null || topRightData.length == 0){
			 $('#hsTopRight').empty();
			 $('#msgTopRight').show();			 
		}else{
			$('msgTopRight').hide();
			predictiveProjectedBar(topRightData,topRightData[0].projectedIndName,'<%= request.getAttribute("TopRightDataSubCaption") %>',topRightProp);
		}
   	} --%>
}
var sendData;
function onSearch()
{
	var topLeftIndName;
	var topRightIndName;
	var bottomLeftIndName;
	var bottomRightIndName;
	var selectedDistrict=$('#district').val();
	//var district=selectedDistrict.toString();
	var year = document.getElementById('year').value;
    var month = document.getElementById('month').value;
    var indlength=$('#indlength').val();
   // if(indlength == 4){
	    topLeftIndName=document.getElementById('topLeftIndName').value;
	    topRightIndName=document.getElementById('topRightIndName').value;
	    bottomLeftIndName=document.getElementById('bottomLeftIndName').value;
	    bottomRightIndName=document.getElementById('bottomRightIndName').value;
    //}
   /*  if(indlength == 3){
	    topLeftIndName=document.getElementById('topLeftIndName').value;
	    topRightIndName=document.getElementById('topRightIndName').value;
	    bottomLeftIndName=document.getElementById('bottomLeftIndName').value;
	    bottomRightIndName=null;
	}
    if(indlength == 2){
	    topLeftIndName=document.getElementById('topLeftIndName').value;
	    topRightIndName=document.getElementById('topRightIndName').value; 
	    bottomLeftIndName=null;
	    bottomRightIndName=null;
    } */
	$.ajax({
		type: "POST",
		url: "hsDashboardPredictiveOnSearch.do",
		'data':{indlength:indlength,year:year,month:month,district:selectedDistrict,topLeftIndName:topLeftIndName,topRightIndName:topRightIndName,bottomLeftIndName:bottomLeftIndName,bottomRightIndName:bottomRightIndName},
		success: function(result){
			if(result === '' || result === null){
				$('#hsTopLeft').empty();
				$('#hsTopRight').empty();
				$('#hsBottomLeft').empty();
				$('#hsBottomRight').empty();
				$('#msgTopLeft').show();
				$('#msgTopRight').show();
				$('#msgBottomLeft').show();
				$('#msgBottomRight').show();
			}
			/* $('#hsTopLeft').empty();
			$('#hsTopRight').empty();
			$('#hsBottomLeft').empty();
			$('#hsBottomRight').empty(); */
			/* $('#msgTopLeft').hide();
			$('#msgTopRight').hide();
			$('#msgBottomLeft').hide();
			$('#msgBottomRight').hide(); */
			var data = JSON.parse(result);
			var topLeftData=data.TopLeftData;
			var topRightData=data.TopRightData;
			var bottomRightData=data.BottomRightData;
			var bottomLeftData=data.BottomLeftData;
			var indNames=data.indNames;
			var district = data.district;
		   	var year= data.year;
		   	var month= data.month;
		   	var n1=$('#topLeftIndName').val().indexOf('-');
		   	var n2=$('#topRightIndName').val().indexOf('-');
		   	var n3=$('#bottomLeftIndName').val().indexOf('-');
		   	var n4=$('#bottomRightIndName').val().indexOf('-');
		   	var topLeftIndName=$('#topLeftIndName').val().substring(0,n1);
		   	var topRightIndName=$('#topRightIndName').val().substring(0,n2);
		   	var bottomLeftIndName=$('#bottomLeftIndName').val().substring(0,n3);
		   	var bottomRightIndName=$('#bottomRightIndName').val().substring(0,n4);
		   	$('#topLeftIndName').val(topLeftIndName+' - '+year+' & '+month+' & '+district);
	   	   	$('#topRightIndName').val(topRightIndName+' - '+year+' & '+month+' & '+district);
	   	   	$('#bottomLeftIndName').val(bottomLeftIndName+' - '+year+' & '+month+' & '+district);
	   	   	$('#bottomRightIndName').val(bottomRightIndName+' - '+year+' & '+month+' & '+district);
	   	 	$('#topLeftIndName').prop('title',$('#topLeftIndName').val());
	   	   	$('#topRightIndName').prop('title',$('#topRightIndName').val());
	   	   	$('#bottomLeftIndName').prop('title',$('#bottomLeftIndName').val());
	   	   	$('#bottomRightIndName').prop('title',$('#bottomRightIndName').val());
			//if(indNames == 4){
			   	if(topLeftData.length == 0 || typeof topLeftData === 'undefined'){
					 $('#hsTopLeft').empty();
					 $('#msgTopLeft').show();			 
			   	}else{
			   		$('#msgTopLeft').hide();
			   		document.getElementById('topLeftIndName').value=topLeftData[0].projectedIndName;
			   		topLeftProp.xaxis="month";
			   		predictiveProjectedBar(topLeftData,topLeftData[0].projectedIndName,'<%= request.getAttribute("TopLeftDataSubCaption") %>',topLeftProp);
			   	}
			   	if(topRightData.length == 0 || typeof topRightData === 'undefined'){
					 $('#hsTopRight').empty();
					 $('#msgTopRight').show();			 
				}else{
					$('#msgTopRight').hide();
					document.getElementById('topRightIndName').value=topRightData[0].projectedIndName;
					topRightProp.xaxis="month";
					predictiveProjectedBar(topRightData,topRightData[0].projectedIndName,'<%= request.getAttribute("TopRightDataSubCaption") %>',topRightProp);
				}
			   	if(bottomLeftData.length == 0 || typeof bottomLeftData === 'undefined'){
					 $('#hsBottomLeft').empty();
					 $('#msgBottomLeft').show();			 
					}
			   	else{
			   		$('#msgBottomLeft').hide();
			   		document.getElementById('bottomLeftIndName').value=bottomLeftData[0].projectedIndName;
			   		bottomLeftProp.xaxis="month";
			   		predictiveProjectedBar(bottomLeftData,bottomLeftData[0].projectedIndName,'<%= request.getAttribute("BottomLeftDataSubCaption") %>',bottomLeftProp);
			   	}
			   	if(bottomRightData.length == 0|| typeof bottomRightData === 'undefined'){
			   	 	 $('#msgBottomRight').show();
					 $('#hsBottomRight').empty();
				}else{
					$('#msgBottomRight').hide();
					document.getElementById('bottomRightIndName').value=bottomRightData[0].projectedIndName;
					bottomRightProp.xaxis="month";
					predictiveProjectedBar(bottomRightData,bottomRightData[0].projectedIndName,'<%= request.getAttribute("BottomRightDataSubCaption") %>',bottomRightProp);
				}
		   //	}
		   	<%-- if(indNames == 3){
		   		$('#bottomRight').empty();
		   		$('#bottomRight').hide();
		   		$('#msgBottomRight').empty();
		   		$('#msgBottomRight').hide();
			   	if(topLeftData.length == 0 || typeof topLeftData === 'undefined'){
					 $('#hsTopLeft').empty();
					 $('#msgTopLeft').show();			 
			   	}else{
			   		$('msgTopLeft').hide();
			   		//$('topLeftIndName').val(topLeftData[0].projectedIndName);
			   		document.getElementById('topLeftIndName').value=topLeftData[0].projectedIndName;
			   		topLeftProp.xaxis="month";
			   		predictiveProjectedBar(topLeftData,topLeftData[0].projectedIndName,'<%= request.getAttribute("TopLeftDataSubCaption") %>',topLeftProp);
			   	}
			   	if(topRightData.length == 0 || typeof topRightData === 'undefined'){
					 $('#hsTopRight').empty();
					 $('#msgTopRight').show();			 
				}else{
					$('msgTopRight').hide();
					document.getElementById('topRightIndName').value=topRightData[0].projectedIndName;
					topRightProp.xaxis="month";
					predictiveProjectedBar(topRightData,topRightData[0].projectedIndName,'<%= request.getAttribute("TopRightDataSubCaption") %>',topRightProp);
				}
			   	if(bottomLeftData.length == 0 || typeof bottomLeftData === 'undefined'){
					 $('#hsBottomLeft').empty();
					 $('#msgBottomLeft').show();			 
					}
			   	else{
			   		$('#msgBottomLeft').hide();
			   		document.getElementById('bottomLeftIndName').value=bottomLeftData[0].projectedIndName;
			   		bottomLeftProp.xaxis="month";
			   		predictiveProjectedBar(bottomLeftData,bottomLeftData[0].projectedIndName,'<%= request.getAttribute("BottomLeftDataSubCaption") %>',bottomLeftProp);
			   	}
		   	}
			if(indNames == 2){
		   		$('#bottomLeft').empty();
		   		$('#bottomLeft').hide();
		   		$('#bottomRight').empty();
		   		$('#bottomRight').hide();
		   		$('#msgBottomRight').hide();
		   		$('#msgBottomLeft').hide();
			   	if(topLeftData.length == 0 || typeof topLeftData === 'undefined'){
					 $('#hsTopLeft').empty();
					 $('#msgTopLeft').show();			 
			   	}else{
			   		$('msgTopLeft').hide();
			   		document.getElementById('topLeftIndName').value=topLeftData[0].projectedIndName;
			   		topLeftProp.xaxis="month";
			   		predictiveProjectedBar(topLeftData,topLeftData[0].projectedIndName,'<%= request.getAttribute("TopLeftDataSubCaption") %>',topLeftProp);
			   	}
			   	if(topRightData.length == 0 || typeof topRightData === 'undefined'){
					 $('#hsTopRight').empty();
					 $('#msgTopRight').show();			 
				}else{
					$('msgTopRight').hide();
					document.getElementById('topRightIndName').value=topRightData[0].projectedIndName;
					topRightProp.xaxis="month";
					predictiveProjectedBar(topRightData,topRightData[0].projectedIndName,'<%= request.getAttribute("TopRightDataSubCaption") %>',topRightProp);
				}
		   	} --%>			
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
</script>
</html>