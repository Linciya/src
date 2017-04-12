<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMCHIS Indicator Zone</title>
	<link rel="stylesheet" href="css/HSAutocomplete.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="pivot/js/jquery-ui.min.js"></script>
	<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
	<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"/>
	<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"/>
	<script src="pivot/js/pivot.min.js"></script>
	<script src="pivot/js/c3.min.js"></script>
	<script src="pivot/js/c3_renderers.min.js"></script>
	<script src="pivot/js/d3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<style>
.nav-tabs{
	height:40px;
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: none;
}
ul.nav-tabs li {
	height:40px;
	text-align:left;
	width:100px;
	background: #ffffcc;
	border:1px solid #0076a3;
	border-top-left-radius: 5px 5px;
	border-top-right-radius: 5px 5px;
	float: left;
	
}
ul.nav-tabs li a {
	margin-left:-1px;
	margin-top:-1px;
	word-wrap: break-word;
	width:100px;
	height:40px;
    display: block;
    color: black;
    text-align: center;
    text-decoration: none;
    transition: 0.5s;
    font-size: 10px;
    text-align: center;
    float:left;
}
ul.nav-tabs li a:hover {
	border:#0076a3;
	 border-top-left-radius: 5px 5px;
	border-top-right-radius: 5px 5px;
	background-color: #0076a3;
	color:#ffffcc;
}
ul.nav-tabs li a:focus, .active {
	border:#0076a3;
	border-top-left-radius: 5px 5px;
	border-top-right-radius: 5px 5px;
	background-color: #0076a3;
	color:#ffffcc;
}
#category{
	width:150px;
}
img{
	margin-left:1px;
}
#SelectedIndicatorName{
	width:75%;
	height:25px;
}

ul.nav.nav-tabs{
	height: 40px;
}
</style>
<Style>
.c3-line, .c3-focused {stroke-width: 3px !important;}
.c3-bar {stroke: white !important; stroke-width: 1;}
.c3 text { font-size: 12px; color: grey;}
.tick line {stroke: white;}
.c3-axis path {stroke: grey;}
.c3-circle { opacity: 1 !important; }
.indzone{
width: 60.6%;
overflow: acroll;
}
#tableToExcel{
	float:right;
}
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
#StateButton{
	/* margin-top:2px;
	float:right;
	width:85px;
	height:16px; */
	background: #0076a3;
	color:white;
	border: none;
	font-size: 13px;
}
#DistButton{
	margin-top:1px;
	float:right;
	width:85px;
	height:15px;
	background: #0076a3;
	color:white;
	border: none;
	font-size: 13px;
}
#govtHospitalButton{
	margin-top:3px;
	float:right;
	width:85px;
	height:15px;
	background: #0076a3;
	color:white;
	border: none;
	font-size: 13px;
}
#exportButton{
	width:85px;
	height:15px;
	background: #0076a3;
	color:white;
	border: none;
	font-size: 12px;
}
.selected {
    background:#0076a3;
    color:#ffffcc;
}
#SelectedDist{
	width:75%;
	height:25px;
	border: none;
}
div#pvtState > #pvtTable{
	min-height: 208px;
	min-width:100%;
}
div#pvtDist > #pvtTable{
	min-height: 180px;
	min-width:100%;
} 
div#pvtInst > #pvtTable{
	min-height: 220px;
	min-width:100%;
}
div#pvtGovtHospital > #pvtTable{
	min-height: 445px;
	min-width:98.8%;
}
</style>
<body onload="onLoad();">
<form id="CMCHISReportFrom" name="CMCHISReportFrom">
<input type="hidden" id="indicatorNameSelected" name="indicatorNameSelected"/>
<div class="zonesMainDiv">
<div id="directorateNameHeader"><spring:message code="shdrc_directorate_short_name${directorateId}"/><spring:message code="shdrc_indicator_zone"/></div>
	<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
	<table>
		<tr id="filters">
			<td class="searchCriteria"><spring:message code="label_indicator_category"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="category" name="category" class="reportDropDown" style="width:250px;">
				<option value="<spring:message code="shdrc_indicator_zone17_1"/>"><spring:message code="shdrc_indicator_zone17_1"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_2"/>"><spring:message code="shdrc_indicator_zone17_2"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_3"/>"><spring:message code="shdrc_indicator_zone17_3"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_4"/>"><spring:message code="shdrc_indicator_zone17_4"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_5"/>"><spring:message code="shdrc_indicator_zone17_5"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_6"/>"><spring:message code="shdrc_indicator_zone17_6"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_7"/>"><spring:message code="shdrc_indicator_zone17_7"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_8"/>"><spring:message code="shdrc_indicator_zone17_8"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_9"/>"><spring:message code="shdrc_indicator_zone17_9"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_10"/>"><spring:message code="shdrc_indicator_zone17_10"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_11"/>"><spring:message code="shdrc_indicator_zone17_11"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_12"/>"><spring:message code="shdrc_indicator_zone17_12"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_13"/>"><spring:message code="shdrc_indicator_zone17_13"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_14"/>"><spring:message code="shdrc_indicator_zone17_14"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_15"/>"><spring:message code="shdrc_indicator_zone17_15"/></option>
				<option value="<spring:message code="shdrc_indicator_zone17_16"/>"><spring:message code="shdrc_indicator_zone17_16"/></option>
			</select>
			</td>
			<td class="searchCriteria"><spring:message code="label_searchcriteria_year"/></td>	
			<td class="searchCriteria" style="padding-left:3px;">
				<select id="year" name="year" class="reportDropDown">
					<c:forEach var="years" items="${yearList}">
						<option value='<c:out value="${years}"/>'>${years} </option> 
					</c:forEach>
			</select>
			</td>	
			<td class="searchCriteria" ><spring:message code="label_searchcriteria_month"/></td>
			<td class="searchCriteria" style="padding-left:3px;">
				<select id="month" name="month" class="reportDropDown">
					<c:forEach var="months" items="${monthsList}">
						<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
					</c:forEach>
			</select>
			</td>
			<td class="searchCriteria">&nbsp;&nbsp;<button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
			
			<td class="searchCriteria"><label id="exportLabel" ><spring:message code="label_searchcriteria_export"/></label></td>	
			<td class="searchCriteria" style="padding-left:3px;">
				<select id="exportTable" name="exportTable" class="reportDropDown" style="width: 100px;">
					<option value="">-- Select Level --</option>
					<option value="pvtState">State Level</option>
					<option value="pvtDist">District Level</option>
					<option value="pvtInst">Institution Level</option>
				</select>
			</td>
			<td class="searchCriteria"><input type="button" id="exportButton" name="exportButton" onclick="exportToExcel();" value="<spring:message code="label_exporttoexcel"/>"></td>
			<td class="searchCriteria"><label id="Loading" style=""><spring:message code="label_Loading"/></label><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:20px;height:20px;"></td>
		</tr>
	</table>
	</div>
	<div style="width:99.3%;">
			<div id="StateDiv" align="center" style="width:39%;height:250px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
				<div style="background:#e1eaea; width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
					<label id="Statewise" style="float: left;margin-top: 3px;"><spring:message code="label_state_level"/></label>
					
				</div>
				<label id="noStateData" style="margin-left:-150px;margin-top: 80px;position: absolute;"><spring:message code="label_shownodata"/></label>
				<div id="pvtState" class="pvtState" style="width:38.5%;height:225px; overflow:scroll;position: absolute;"></div>
			</div>
			
			<div id="DistDiv" align="center" style="width:60%;height:250px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
				<div style="background:#e1eaea;width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
					<label id="Districtwise" style="float:left;margin-top: -6px;"><spring:message code="label_district_level"/></label>
					<input type="text" id="SelectedIndicatorName" style="background: none;border: none;margin-top: -11px;text-align: center;" value="" readonly="readonly"/>
				</div>
				<label id="noDistrictData" style="margin-left:-150px;margin-top:70px;position: absolute;"><spring:message code="label_shownodata"/></label>
				<div id="pvtDist" class="pvtDist" style="width:59%;height:225px; overflow:scroll;position: absolute;"></div>
			</div>
		</div>
		
		<div style="width:99.5%;">
			<div id="InstDiv" align="center" style="width:99.5%;height:225px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">		
				<div style="background:#e1eaea;width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
					<label id="Institutionwise" style="float:left; margin-top: 3px;"><spring:message code="label_institution_level"/></label>
					<label id="DistSelected" style=""><spring:message code="label_districtname"/></label>
					<input type="text" id="SelectedDist" style="background: none;border:none;text-align:left;margin-top: -1px;" value="" readonly="readonly"/>
				</div>
				<label id="noInstData" style="margin-top: 80px;margin-left:-150px;position: absolute;"><spring:message code="label_shownodata"/></label>
				<div id="pvtInst" style="width:98.3%;height:200px;overflow: scroll;position: absolute;"></div>
			</div>
		</div>
		
		<div id="govtHospitalDiv" style="width:99.5%;">
			<div id="govtHospitalHeader" style="width:99.5%;height:475px;float:left;margin-top:4px;margin-bottom:4px;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">		
				<div style="background:#e1eaea;width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
					<label id="GovtHospitalNormalIndicator" style="float:left; margin-top: 3px;"><spring:message code="label_govt_hospital_normal_indicator"/></label>
					<input type="button" id="govtHospitalButton" name="govtHospitalButton" onclick="tableToExcel('govtHospital', 'sheet1')" value="<spring:message code="label_exporttoexcel"/>">
				</div>				
				<div id="pvtGovtHospital" style="width:98.8%;height:450px;overflow: scroll;position: absolute;"></div>
				<label id="noGovtHospitalData" style="margin-top: 200px;position: absolute;margin-left: 200px;"><spring:message code="label_shownodata"/></label>
			</div>
		</div>
</div>
</form>
</body>
<script type="text/javascript">
		  var tableToExcel = (function() {            
          var uri = 'data:application/vnd.ms-excel;base64,'
            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
          return function(elementId, name) {
           /* if (!table.nodeType) table = document.getElementById(table) */
           table=document.getElementById(elementId).getElementsByTagName('table')[0];
           //alert("table content"+table.innerHTML);
            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
            window.location.href = uri + base64(format(template, ctx))
          }
        })()
</script>
<script>
function onLoad(){
	var reportName = '<%= request.getAttribute("indicatorCategory") %>';
	var year = '<%= request.getAttribute("year") %>';
	var month = '<%= request.getAttribute("month") %>';
	$('#year').val(year);
	$('#month').val(month);
	if(reportName === 'Govt Hospital - Normal Indicator'){
		document.getElementById("Loading").style.display="none";
		document.getElementById("LoadingImage").style.display="none";
		document.getElementById("govtHospitalDiv").style.display="inline";
		document.getElementById("StateDiv").style.display="none";
		document.getElementById("DistDiv").style.display="none";
		document.getElementById("InstDiv").style.display="none";
		document.getElementById("noGovtHospitalData").style.display="none";
		document.getElementById("exportLabel").style.display="none";
		document.getElementById("exportTable").style.display="none";
		document.getElementById("exportButton").style.display="none";
		var govtHospitalData = <%= request.getAttribute("govtHospitalData") %>;
		$('#category').val(reportName);
		if(govtHospitalData === null){
			document.getElementById("noGovtHospitalData").style.display="inline";
			document.getElementById("pvtGovtHospital").style.display="none";
		}else{
			var utils = $.pivotUtilities;
			var heatmap =  utils.renderers["Table"];
			var sumOverSum =  utils.aggregators["Sum over Sum"];
			var derivers = $.pivotUtilities.derivers;
			if(govtHospitalData.length === 0){
				$('#pvtGovtHospital').empty();
				document.getElementById("noGovtHospitalData").style.display="inline";
			}
			else{
				$("#pvtGovtHospital").pivot(
						govtHospitalData, {
						    rows: ["IndicatorName","Social","AgeGroup","Gender"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["IndValue"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });  
			}
		}
	}else{
	document.getElementById("StateDiv").style.display="inline";
	document.getElementById("DistDiv").style.display="inline";
	document.getElementById("InstDiv").style.display="inline";
	document.getElementById("govtHospitalDiv").style.display="none";
	document.getElementById("Loading").style.display="none";
	document.getElementById("LoadingImage").style.display="none";
    document.getElementById("noStateData").style.display="none";
    document.getElementById("noDistrictData").style.display="none";
    document.getElementById("noInstData").style.display="none";
    document.getElementById("exportLabel").style.display="inline";
	document.getElementById("exportTable").style.display="inline";
	document.getElementById("exportButton").style.display="inline";
	var indPvtStateData = <%= request.getAttribute("indPvtStateData") %>;
	var indPvtDistData = <%= request.getAttribute("indPvtDistData") %>;
	var indPvtInstData = <%= request.getAttribute("indPvtInstData") %>;
	var selectedIndicator = '<%= request.getAttribute("selectedIndicator") %>';
	var selectedDistrict = '<%= request.getAttribute("selectedDistrict") %>';
	$('#category').val(reportName);
	document.getElementById("SelectedIndicatorName").value=selectedIndicator;
	document.getElementById('indicatorNameSelected').value=selectedIndicator;
	var utils = $.pivotUtilities;
	var heatmap =  utils.renderers["Table"];
	var sumOverSum =  utils.aggregators["Sum over Sum"];
	var derivers = $.pivotUtilities.derivers;
	if(indPvtStateData === null){
		document.getElementById("noStateData").style.display="inline";
	}else{
		if(indPvtStateData.length === 0){
			$('#pvtState').empty();
			document.getElementById("noStateData").style.display="inline";
		}
		else{
			$("#pvtState").pivot(
					indPvtStateData, {
					    rows: ["Indicator","State"],
					    cols: [],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
		$("#pvtState table.pvtTable").find("tr").find('th.pvtTotalLabel').html("Value");

		}
	}
	if(indPvtDistData === null){
		$('#pvtDist').empty();		
		$('#tabs').empty();
		document.getElementById("noDistrictData").style.display="inline";
		document.getElementById("SelectedIndicatorName").value="";
	}else{
		document.getElementById("SelectedIndicatorName").value=selectedIndicator;
		if(indPvtDistData.length === 0){
			$('#pvtDist').empty();		
			$('#tabs').empty();
			document.getElementById("noDistrictData").style.display="inline";
			document.getElementById("SelectedIndicatorName").value="";
			$('#pvtInst').empty();
			document.getElementById("noInstData").style.display="inline";
		 	document.getElementById("SelectedDist").value="";
			document.getElementById("DistSelected").style.display="none";
		}else{
			document.getElementById("noDistrictData").style.display="none";
			document.getElementById('SelectedIndicatorName').value=selectedIndicator;
			$("#pvtDist").pivot(
					indPvtDistData, {
						rows: ["District"],
					    cols: [],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
		}
	}
	if(indPvtInstData === null){
		$('#pvtInst').empty();
		document.getElementById("noInstData").style.display="inline";
		document.getElementById("SelectedDist").value="";
		document.getElementById("DistSelected").style.display="none";
	}else{
		if(indPvtInstData.length === 0){
			$('#pvtInst').empty();
			document.getElementById("noInstData").style.display="inline";
			document.getElementById("SelectedDist").value="";
			document.getElementById("DistSelected").style.display="none";
		}else{
			document.getElementById('SelectedDist').value=selectedDistrict;
			$("#pvtInst").pivot(
					indPvtInstData, {
						rows: ["Institution","Institution_Type"],
					    cols: [],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
		}
	}	
	}
}
function exportToExcel(){
	var selectedLevel=$("#exportTable").val();
	if(selectedLevel===""){
		alert('Please select at least one level to export');
	}else{
		tableToExcel(selectedLevel,'sheet1')
	}
}
function onSearch(){
	document.getElementById("Loading").style.display="inline";
	document.getElementById("LoadingImage").style.display="inline";
	var category=document.getElementById("category").value;
	var directorateId = 17;
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;	
	var contextPath='<%= request.getContextPath()%>';
	var district=document.getElementById('SelectedDist').value;
	var indicatorName=document.getElementById('indicatorNameSelected').value;
	document.CMCHISReportFrom.method='POST';
	document.CMCHISReportFrom.action=contextPath+"/cmchisGovtHospitalIndicatorCategory.do?directorateId="+directorateId+"&category="+category+"&month="+month+"&year="+year+"&indicatorName="+indicatorName+"&district="+district;
	document.CMCHISReportFrom.submit();
}
$(document).on("click", "div#pvtState > #pvtTable tr", function(e) {
	var selectedIndicator=($(this).find('th:first').text());
	//document.getElementById("indicatorNameSelected").value=selectedIndicator;
	var directorateId = 17;
	var category=document.getElementById("category").value;
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;

	if(selectedIndicator === 'Indicator'){
		return;
	}
	else{
		document.getElementById("Loading").style.display="inline";
		document.getElementById("LoadingImage").style.display="inline";
	$.ajax({
		type: "POST",
		url: "cmchisDistrictData.do",
		'data':{
			category:category,year:year,month:month,selectedIndicator:selectedIndicator,directorateId:directorateId
		},
		success: function(result){
			document.getElementById("Loading").style.display="none";
			document.getElementById("LoadingImage").style.display="none";
			document.getElementById('SelectedIndicatorName').value=selectedIndicator;			
			if(result === ""){
				$('#pvtDist').empty();
				$('#pvtInst').empty();
				document.getElementById("noDistrictData").style.display="inline";
				document.getElementById("noInstData").style.display="inline";		
				document.getElementById("SelectedIndicatorName").value="";
				document.getElementById("SelectedDist").value="";
				document.getElementById("DistSelected").style.display="none";
			}
			else{
				var data = JSON.parse(result);
				var indPvtDistData=data.indPvtDistData;
				var indPvtInstData=data.indPvtInstData;
				var District = data.district;
				document.getElementById("indicatorNameSelected").value=selectedIndicator;
				document.getElementById('SelectedDist').value=District;
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var sum =  utils.aggregators["Sum"];
				var derivers = $.pivotUtilities.derivers;
				if(typeof indPvtDistData == 'undefined' || indPvtDistData.length === 0){
					$('#pvtDist').empty();
					$('#tabs').empty();
					document.getElementById("noDistrictData").style.display="inline";
					document.getElementById("noInstData").style.display="inline";		
					document.getElementById("SelectedIndicatorName").value="";
					document.getElementById("SelectedDist").value="";
					document.getElementById("DistSelected").style.display="none";
				}else{
					document.getElementById("indicatorNameSelected").value=selectedIndicator;
					$("#pvtDist").pivot(
						indPvtDistData, {
						    rows: ["District"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
				}
				if(typeof indPvtInstData == 'undefined' || indPvtInstData.length === 0){
					$('#pvtInst').empty();
					document.getElementById("noInstData").style.display="inline";
					document.getElementById("SelectedDist").value="";
					document.getElementById("DistSelected").style.display="none";
				}else{
				document.getElementById("SelectedDist").value=District;
				document.getElementById("DistSelected").style.display="inline";
				$("#pvtInst").pivot(
						indPvtInstData, {
							rows: ["Institution"],
						    cols: ["Institution_Type"],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
				}
			}
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
	}
});

$(document).on("click", "div#pvtDist > #pvtTable tr th.pvtRowLabel", function(e) {
    var selectedDist=(this.innerText);
	var seletecdInd=document.getElementById("indicatorNameSelected").value;
	var category=document.getElementById("category").value;
	var directorateId = 17;
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	$.ajax({
		type: "POST",
		url: "cmchisInstitutionData.do",
		'data':{
			seletecdInd:seletecdInd,category:category,year:year,month:month,selectedDist:selectedDist,directorateId:directorateId
		},
		success: function(result){
			if(result === ""){
				$('#pvtInst').empty();
				document.getElementById("noInstData").style.display="inline";	
				document.getElementById("SelectedDist").value="";
				document.getElementById("DistSelected").style.display="none";
			}else{
			document.getElementById('SelectedDist').value=selectedDist;
			var data = JSON.parse(result);
			var indPvtInstData=data.indPvtInstData;
			if(typeof indPvtInstData == 'undefined' || indPvtInstData.length === 0)
				{
					$('#pvtInst').empty();
					document.getElementById("noInstData").style.display="inline";
					document.getElementById("SelectedDist").value="";
					document.getElementById("DistSelected").style.display="none";
				}
			else{
			document.getElementById("noInstData").style.display="none";
			document.getElementById("SelectedDist").value=selectedDist;
			document.getElementById("DistSelected").style.display="inline";
			var utils = $.pivotUtilities;
			var heatmap =  utils.renderers["Table"];
			var sumOverSum =  utils.aggregators["Sum over Sum"];
			var sum =  utils.aggregators["Sum"];
			var derivers = $.pivotUtilities.derivers;
			$("#pvtInst").pivot(
					indPvtInstData, {
					    rows: ["Institution"],
					    cols: ["Institution_Type"],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
			}
			}
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
});
</script>
</html>