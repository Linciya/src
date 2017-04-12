<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MA Indicator Zone</title>
	<link rel="stylesheet" href="css/HSAutocomplete.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/jquery.scrolling-tabs.css">
	<script src="jquery/jquery-1.11.1.min.js"></script>
	<script src="pivot/js/jquery-ui.min.js"></script>
	<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
	<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"/>
	<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"/>
	<script src="pivot/js/pivot.min.js"></script>
	<script src="pivot/js/c3.min.js"></script>
	<script src="pivot/js/c3_renderers.min.js"></script>
	<script src="pivot/js/d3.min.js"></script>
	<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.scrolltabs.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<style>
.nav-tabs{
	height:30px;
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: none;
}
ul.nav-tabs li {
	height:30px;
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
	height:30px;
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
	width:500px;
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
	border: none;
}
div#pvtState > #pvtTable{
	min-height: 208px;
}
div#pvtDist > #pvtTable{
	min-height: 180px;
	min-width:100%;
} 
div#pvtInst > #pvtTable{
	min-height: 220px;
	min-width:100%;
}
</style>
<body onload="onLoad();">
<input type="hidden" id="indicatorNameSelected" name="indicatorNameSelected"/>
<input type="hidden" id="generalCategory" name="generalCategory"/>
<div class="zonesMainDiv">
<div id="directorateNameHeader"><spring:message code="shdrc_directorate_short_name${directorateId}"/><spring:message code="shdrc_indicator_zone"/></div>
<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
	<table>
		<tr id="filters">
			<td class="searchCriteria"><spring:message code="label_indicator_category"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				 <select id="category" name="category" class="reportDropDown">
					<c:forEach var="indCatList" items="${IndicatorCategoryList}">
						<option value='<c:out value="${indCatList}"/>'>${indCatList} </option> 
					</c:forEach>
				</select>
			</td>
			<td class="searchCriteria"><spring:message code="label_searchcriteria_frequency"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="frequency" name="frequency" class="reportDropDown" onchange="changeFrequency();" style="width:100px;">
					<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
					<option value="timeperiod"><spring:message code="option_frequency_timeperiod"/></option>
				</select>
			</td>
			<td class="searchCriteria"><label id="yearName" style="font-weight: normal;"><spring:message code="label_searchcriteria_year"/></label></td>	
			<td class="searchCriteria" style="padding-left:3px;">
				<select id="year" name="year" class="reportDropDown" style="width:70px;">
					<c:forEach var="years" items="${yearList}">
						<option value='<c:out value="${years}"/>'>${years} </option> 
					</c:forEach>
				</select>
			</td>	
			<td class="searchCriteria" ><label id="monthName" style="font-weight: normal;"><spring:message code="label_searchcriteria_month"/></label></td>
			<td class="searchCriteria" style="padding-left:3px;">
				<select id="month" name="month" class="reportDropDown" style="width:90px;">
					<c:forEach var="months" items="${monthsList}">
						<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
					</c:forEach>
				</select>
			</td>
			<td class="searchCriteria" ><label id="timePeriodFrom" style="font-weight: normal;"><spring:message code="label_searchcriteria_from"/></label></td>
			<td class="searchCriteria" style="padding-left:3px;">
				<input type="text" id="txtFrom" style="width:100px;background: #DDFF99;"/>
			</td>
			<td class="searchCriteria" ><label id="timePeriodTo" style="font-weight: normal;"><spring:message code="label_searchcriteria_to"/></label></td>
			<td class="searchCriteria" style="padding-left:3px;">
				<input type="text" id="txtTo" style="width:100px;background: #DDFF99;"/>
			</td>
			<td class="searchCriteria">
				<button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button>
			</td>
			<td class="searchCriteria"><label id="exportLabel" style="font-weight: normal;"><spring:message code="label_searchcriteria_export"/></label></td>	
			<td class="searchCriteria" style="padding-left:3px;">
				<select id="exportTable" name="exportTable" class="reportDropDown" style="width: 100px;">
					<option value="">-- Select Level --</option>
					<option value="pvtState">State Level</option>
					<option value="pvtDist">District Level</option>
					<option value="pvtInst">Institution Level</option>
				</select>
			</td>
			<td class="searchCriteria"><input type="button" id="exportButton" name="exportButton" onclick="exportToExcel();" value="<spring:message code="label_exporttoexcel"/>"></td>
			<td class="searchCriteria"><label id="Loading" style=""><spring:message code="label_Loading"/></label><img id="LoadingImage" src="images/ajax-loader.gif" alt="Progressing" style="width:30px;height:30px;"></td>
		</tr>
	</table>
	</div>	
	<div style="width:99.3%;">
			<div id="StateDiv" align="center" style="width:29%;height:250px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
				<div style="background:#e1eaea; width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
					<label id="Statewise" style="float: left;margin-top: 3px;"><spring:message code="label_state_level"/></label>
					
				</div>
				<label id="noStateData" style="margin-left:-150px;margin-top: 80px;position: absolute;"><spring:message code="label_shownodata"/></label>
				<div id="pvtState" class="pvtState" style="width:28.6%;height:225px; overflow:scroll;position: absolute;"></div>
			</div>
			
			<div id="DistDiv" align="center" style="width:70%;height:250px;float:right;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
				<div id="tabs" style="width:100%;height: 30px;">
					<ul class="nav nav-tabs" role="tablist" style="height:30px;list-style-type: none;margin: 0; padding: 0;overflow: hidden; border: none;">
					<c:forEach var="column" items="${generalCategoryList}">
			 			<li role="presentation" style="height: 30px;"><a href="#" style="" onclick="tabChange(this)" role="tab" data-toggle="tab">${column}</a></li>
					</c:forEach> 
					</ul>
				</div>
				<div id="tab-content" style="background:#e1eaea;width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
					<label id="Districtwise" style="float:left;margin-top: -5px;"><spring:message code="label_district_level"/></label>
					<input type="text" id="SelectedIndicatorName" style="background: none;border: none;margin-top: -9px;text-align: center;" value="" readonly="readonly"/>
				</div>
				<label id="noDistrictData" style="margin-left:-150px;margin-top:70px;position: absolute;"><spring:message code="label_shownodata"/></label>
				<div id="pvtDist" class="pvtDist" style="width:69%;height:190px; overflow:scroll;position: absolute;"></div>
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
</div>
</body>
<script>
;(function() {
	  'use strict';
	  $(activate);
	  function activate() {
	    $('.nav-tabs').scrollingTabs();
	  }
	}());
function exportToExcel(){
	var selectedLevel=$("#exportTable").val();
	if(selectedLevel===""){
		alert('Please select at least one level to export');
	}else{
		tableToExcel(selectedLevel,'sheet1')
	}
}
</script>
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
           
           
           
             if (!table.nodeType) table = document.getElementById(table)
           var selectedCategory=document.getElementById("category");
       	
			if (selectedCategory != 'undefined') {
				var categoryName=selectedCategory.options[selectedCategory.selectedIndex].value; 
			 }
			var selectedFrequency=document.getElementById("frequency");
			if (selectedFrequency != 'undefined') {
				var FrequencyName=$("#frequency").val();
			}
			
			var selectedYear=document.getElementById("year");
				if (selectedYear != 'undefined') {
					var year=$("#year").val(); 
					
				}
				var selectedMonth=document.getElementById("month");
				if (selectedMonth != 'undefined') {
					var month=$("#month").val();/* selectedMonth.options[selectedMonth.selectedIndex].value;  */
					
				}
				var selectedExportTable=document.getElementById("exportTable");
				if (selectedExportTable != 'undefined') {
					var ExportTable=selectedExportTable.options[selectedExportTable.selectedIndex].value; 
					 if(ExportTable ==='pvtState'){
						var ExportTableName = "State Level";
						}
					else if(ExportTable ==='pvtDist'){
					var indicatorName=$("#SelectedIndicatorName").val();
						 if (indicatorName != 'undefined') {
							 var indicatorName=$("#SelectedIndicatorName").val();
							}
						 var ExportTableName = "District Level"+"-"+indicatorName;
						
						}
					else if(ExportTable ==='pvtInst'){
					var SelectedDist=$("#SelectedDist").val();
						 if (SelectedDist != 'undefined') {
							 var selectedDistName=$("#SelectedDist").val();
							
							}
						 var ExportTableName = "Institution Level"+"-"+selectedDistName;
						
						
						}
					
				}
				var selectedTimePeriodFrom=$("#txtFrom").val();
				
				 if (selectedTimePeriodFrom != 'undefined') {
					 var selectedTimePeriodFrom=$("#txtFrom").val();
						
					}
				 var selectedTimePeriodTo=$("#txtTo").val();
					
				 if (selectedTimePeriodTo != 'undefined') {
					 var selectedTimePeriodTo=$("#txtTo").val();
					
					}
				
				 
			/* 	 $("#pvtState").find('tr').find('th').css("background", "#00b2ff");
				 $("#pvtState").find('tr').find('th').css("border", "1px groove black");
				 $("#pvtState").find('tr').find('th').css("border-collapse", "collapse");
				 $("#pvtState").find('tr').find('td').css("border", "1px groove black");
				 $("#pvtState").find('tr').find('td').css("border-collapse", "collapse");
				 
				 ("#pvtDist").find('tr').find('th').css("background", "#00b2ff");
				 $("#pvtDist").find('tr').find('th').css("border", "1px groove black");
				 $("#pvtDist").find('tr').find('th').css("border-collapse", "collapse");
				 $("#pvtDist").find('tr').find('td').css("border", "1px groove black");
				 $("#pvtDist").find('tr').find('td').css("border-collapse", "collapse");
				 
				 ("#pvtInst").find('tr').find('th').css("background", "#00b2ff");
				 $("#pvtInst").find('tr').find('th').css("border", "1px groove black");
				 $("#pvtInst").find('tr').find('th').css("border-collapse", "collapse");
				 $("#pvtInst").find('tr').find('td').css("border", "1px groove black");
				 $("#pvtInst").find('tr').find('td').css("border-collapse", "collapse"); */
				 
				 
				 
				$("#pvtState").find('tr:first').find('th').css("background", "#00b2ff");
				 $("#pvtState").find('tr').find('th').css("border", "1px groove black");
				$("#pvtState").find('tr').find('th').css("border-collapse", "collapse");
				 $("#pvtState").find('tr').find('td').css("border", "1px groove black");
				$("#pvtState").find('tr').find('td').css("border-collapse", "collapse");
				 
				 $("#pvtDist").find('tr:first').find('th').css("background", "#00b2ff");
				$("#pvtDist").find('tr:nth-child(2)').find('th').css("background", "#00b2ff");
				 $("#pvtDist").find('tr').find('th').css("border", "1px groove black");
					$("#pvtDist").find('tr').find('th').css("border-collapse", "collapse");
					 $("#pvtDist").find('tr').find('td').css("border", "1px groove black");
					$("#pvtDist").find('tr').find('td').css("border-collapse", "collapse");
				 
				 
				 
				 $("#pvtInst").find('tr:first').find('th').css("background", "#00b2ff");
				 $("#pvtInst").find('tr:nth-child(2)').find('th').css("background", "#00b2ff");
				 $("#pvtInst").find('tr').find('th').css("border", "1px groove black");
					$("#pvtInst").find('tr').find('th').css("border-collapse", "collapse");
					 $("#pvtInst").find('tr').find('td').css("border", "1px groove black");
					$("#pvtInst").find('tr').find('td').css("border-collapse", "collapse");
				 
				var innnertable;	
				if (FrequencyName == 'timeperiod') {
					
					innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Category</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>From</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+selectedTimePeriodFrom+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>To</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+selectedTimePeriodTo+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Select Level</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+ExportTableName+'</b></td></tr>'+table.innerHTML;
					}
			if (FrequencyName == 'monthly') {
				
			innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Category</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+month+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Select Level</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+ExportTableName+'</b></td></tr>'+table.innerHTML;
			}
			
			var ctx = {worksheet: name || 'Worksheet',table: innnertable}
			 $("#pvtState").find('th').css("background-color", "#e6EEEE");
			 $("#pvtDist").find('th').css("background-color", "#e6EEEE");
			 $("#pvtInst").find('th').css("background-color", "#e6EEEE");
			
			 $("#pvtState").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
			 $("#pvtState").find('tr').find('td').css("border", "0.1px solid #CDCDCD");
           
			 $("#pvtDist").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
			 $("#pvtDist").find('tr').find('td').css("border", "0.1px solid #CDCDCD");
			 $("#pvtInst").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
			 $("#pvtInst").find('tr').find('td').css("border", "0.1px solid #CDCDCD");
           
          //  var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
            window.location.href = uri + base64(format(template, ctx))
          }
        })()
</script>
<script>
function onLoad(){
	document.getElementById("Loading").style.display="none";
	document.getElementById("LoadingImage").style.display="none";
	document.getElementById("timePeriodFrom").style.display="none";
    document.getElementById("txtFrom").style.display="none";    
    document.getElementById("timePeriodTo").style.display="none"; 
    document.getElementById("txtTo").style.display="none";          
    document.getElementById("year").style.display="inline";
    document.getElementById("yearName").style.display="inline";
    document.getElementById("monthName").style.display="inline";
    document.getElementById("month").style.display="inline";
    document.getElementById("noStateData").style.display="none";
    document.getElementById("noDistrictData").style.display="none";
    document.getElementById("noInstData").style.display="none";
	var indPvtStateData = <%= request.getAttribute("indPvtStateData") %>;
	var indPvtDistData = <%= request.getAttribute("indPvtDistData") %>;
	var indPvtInstData = <%= request.getAttribute("indPvtInstData") %>;
	var selectedIndicator = '<%= request.getAttribute("selectedIndicator") %>';
	var selectedDistrict = '<%= request.getAttribute("selectedDistrict") %>';
	var generalCategory = '<%= request.getAttribute("generalCategory") %>';
	var month = '<%= request.getAttribute("month") %>';
	var year = '<%= request.getAttribute("year") %>';
	var indicatorCategory = '<%= request.getAttribute("indicatorCategory") %>';
	$('#category').val(indicatorCategory);
	$('#month').val(month);
	$('#year').val(year);
	document.getElementById('generalCategory').value=generalCategory;	
	document.getElementById("indicatorNameSelected").value=selectedIndicator;
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
					    rows: ["Indicator","State","Value"],
					    cols: [],
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });  
		}
	}
	if(indPvtDistData === null){
		$('#pvtDist').empty();		
		$('#tabs').empty();
		document.getElementById("noDistrictData").style.display="inline";
		document.getElementById("SelectedIndicatorName").value="";
	}else{
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
			document.getElementById('SelectedIndicatorName').value=selectedIndicator;
			$("#pvtDist").pivot(
					indPvtDistData, {
						rows: ["District"],
					    cols: ["GeneralName"],
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
						rows: ["Hud_Type","Hud_Name","Block_Name","Institution"],
					    cols: ["GeneralName"],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
		}
	}	
}
function onSearch(){
	document.getElementById("Loading").style.display="inline";
	document.getElementById("LoadingImage").style.display="inline";
	var category=document.getElementById("category").value;
	var frequency=document.getElementById("frequency").value;
	var fromYear=null;
	var toYear=null;
	var fromMonth=null;
	var toMonth=null;
	var directorateId = 7;
	if(frequency == "monthly"){
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		if(year != ""){
			fromYear=year;
			toYear=year;
		}
		if(month != ""){
			var fromMonth=month;
			var toMonth=month;
		}
	}
	if(frequency == "timeperiod"){
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
	}
$.ajax({
		type: "POST",
		url: "maOnSearch.do",
		'data':{
			category:category,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,directorateId:directorateId
		},
		success: function(result){
			document.getElementById("Loading").style.display="none";
			document.getElementById("LoadingImage").style.display="none";
			if(result=== ""){
				$('#pvtState').empty();
				$('#pvtDist').empty();
				$('#pvtInst').empty();
				document.getElementById("noStateData").style.display="inline";
				document.getElementById("noDistrictData").style.display="inline";
				document.getElementById("noInstData").style.display="inline";		
				document.getElementById("SelectedIndicatorName").value="";
				document.getElementById("SelectedDist").value="";
				document.getElementById("DistSelected").style.display="none";
			}else{
			var data = JSON.parse(result);			
			var indPvtStateData=data.indPvtStateData;
			var indPvtDistData=data.indPvtDistData;
			var indPvtInstData=data.indPvtInstData;
			var selectedIndicator=data.selectedIndicator;
			var selectedDist=data.selectedDist;
			var generalCategory=data.generalCategory;
			var generalCategoryList = data.generalCategoryList;			
			document.getElementById("SelectedIndicatorName").value=selectedIndicator;
			document.getElementById('SelectedDist').value=selectedDist;
			document.getElementById('generalCategory').value=generalCategory;
			document.getElementById("indicatorNameSelected").value=selectedIndicator;
			if(typeof generalCategoryList == 'undefined' || generalCategoryList.length == 0){}
			else{
				var inserRow='';
				inserRow='<ul class="nav nav-tabs" role="tablist" style="height:30px;list-style-type: none;margin: 0;padding: 0;overflow: hidden;border: none;">';
				$('#tabs').find('ul').remove();
				for(var i=0;i<generalCategoryList.length;i++){
					inserRow +='<li  role="presentation" style="height:30px;text-align:left;width:100px;background: #ffffcc;border:1px solid #0076a3;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;float: left;"><a href="#" onclick=tabChange(this) role="tab" data-toggle="tab" style="margin-left:-1px;margin-top:-1px;word-wrap: break-word;width:100px;height:30px;display: block;color: black;text-align: center;text-decoration: none;transition: 0.5s;font-size: 10px;text-align: center;float:left;">'+generalCategoryList[i]+'</a></li>';
				}
				inserRow += '</ul>';
				$(".scrtabs-tabs-fixed-container").append(inserRow);
			}
			var utils = $.pivotUtilities;
			var heatmap =  utils.renderers["Table"];
			var sumOverSum =  utils.aggregators["Sum over Sum"];
			var derivers = $.pivotUtilities.derivers;
			if(typeof indPvtStateData == 'undefined' || indPvtStateData.length === 0){
				$('#pvtState').empty();
				$('#pvtDist').empty();
				$('#tabs').empty();
				document.getElementById("noStateData").style.display="inline";
				document.getElementById("noDistrictData").style.display="inline";
				document.getElementById("SelectedIndicatorName").value="";
			}else{
				$("#pvtState").pivot(
						indPvtStateData, {
						    rows: [ "Indicator","State","Value"],
						    cols: [],
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
			}
			if(typeof indPvtDistData == 'undefined' || indPvtDistData.length === 0){
				$('#pvtDist').empty();
				$('#tabs').empty();
				document.getElementById("noDistrictData").style.display="inline";
				document.getElementById("noInstData").style.display="inline";			
				document.getElementById("SelectedIndicatorName").value="";
				document.getElementById("SelectedDist").value="";
				document.getElementById("DistSelected").style.display="none";
			}else{
				$("#pvtDist").pivot(
						indPvtDistData, {
							rows: ["District"],
						    cols: ["GeneralName"],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
			}
			if(typeof indPvtInstData == 'undefined' || indPvtInstData.length === 0){
				$('#pvtInst').empty();
				document.getElementById("noInstData").style.display="inline";
				document.getElementById("SelectedIndicatorName").value="";
				document.getElementById("SelectedDist").value="";
				document.getElementById("DistSelected").style.display="none";
			}else{
				document.getElementById("DistSelected").style.display="inline";
				$("#pvtInst").pivot(
						indPvtInstData, {
							rows: ["Hud_Type","Hud_Name","Block_Name","Institution"],
						    cols: ["GeneralName"],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
			}
			}
			
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
}
function changeFrequency(){
    var selectedFreq=document.getElementById("frequency");
    var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;
    
    if(freqName=='monthly'){
                    document.getElementById("timePeriodFrom").style.display="none";
                    document.getElementById("txtFrom").style.display="none";    
                    document.getElementById("timePeriodTo").style.display="none"; 
                    document.getElementById("txtTo").style.display="none";          
                    document.getElementById("year").style.display="inline";
                    document.getElementById("yearName").style.display="inline";
                    document.getElementById("monthName").style.display="inline";
                    document.getElementById("month").style.display="inline";
    } 
    else if(freqName=='timeperiod'){
                    document.getElementById("year").style.display="none";
                    document.getElementById("yearName").style.display="none";
                    document.getElementById("monthName").style.display="none";
                    document.getElementById("month").style.display="none";
                    document.getElementById("timePeriodFrom").style.display="inline";
                    document.getElementById("txtFrom").style.display="inline"; 
                    document.getElementById("timePeriodTo").style.display="inline";
                    document.getElementById("txtTo").style.display="inline"; 
                    document.getElementById("year").value="";
                    document.getElementById("month").value="";
                    
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
    } 
}
</script>
<script type="text/javascript">
function tabChange(category){
	 var generalCategory=category.innerText;
	 var seletecdInd=document.getElementById("indicatorNameSelected").value;
	 document.getElementById('generalCategory').value=generalCategory;
	 var directorateId = 7;
		var category=document.getElementById("category").value;
		var frequency=document.getElementById("frequency").value;
		if(frequency == "monthly"){
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			if(year != ""){
				fromYear=year;
				toYear=year;
			}
			if(month != ""){
				var fromMonth=month;
				var toMonth=month;
			}
		}
		if(frequency == "timeperiod"){
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
		}
		$.ajax({
			type: "POST",
			url: "maOnTabChange.do",
			'data':{
				category:category,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,seletecdInd:seletecdInd,directorateId:directorateId,generalCategory:generalCategory
			},
			success: function(result){
				if(result===""){
					$('#pvtDist').empty();
					$('#pvtInst').empty();
					document.getElementById("noDistrictData").style.display="inline";
					document.getElementById("noInstData").style.display="inline";		
					document.getElementById("SelectedIndicatorName").value="";
					document.getElementById("SelectedDist").value="";
					document.getElementById("DistSelected").style.display="none";
				}else{
				var data = JSON.parse(result);
				var indPvtDistData=data.indPvtDistData;
				var indPvtInstData=data.indPvtInstData;
				var generalCategory = data.generalCategory; 
				var District = data.District;
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
					$("#pvtDist").pivot(
						indPvtDistData, {
						    rows: ["District"],
						    cols: ["GeneralName"],
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
					document.getElementById('SelectedDist').value=District;
				$("#pvtInst").pivot(
						indPvtInstData, {
							rows: ["Hud_Type","Hud_Name","Block_Name","Institution"],
						    cols: ["GeneralName"],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
				}
				}
			 },
				error: function () {
			    	  $errorMessage.text("Onchange Error");
			}});
} 
/*  var all_li = $('ul.nav-tabs li a');
 $('ul.nav-tabs li a').on('click', function () {
	 all_li.removeClass('selected');
     $(this).closest('ul.nav-tabs li a').addClass('selected');
 }); */
</script>
<script type="text/javascript">
$(document).on("click", "div#pvtState > #pvtTable tr", function(e) {
	var selectedIndicator=($(this).find('th:first').text());
	document.getElementById("indicatorNameSelected").value=selectedIndicator;
	var directorateId = 7;
	var category=document.getElementById("category").value;
	var frequency=document.getElementById("frequency").value;
	
	if(frequency == "monthly"){
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		if(year != ""){
			fromYear=year;
			toYear=year;
		}
		if(month != ""){
			var fromMonth=month;
			var toMonth=month;
		}
	}
	if(frequency == "timeperiod"){
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
	}
	if(selectedIndicator === 'Indicator'){
		return;
	}
	else{
		document.getElementById("Loading").style.display="inline";
		document.getElementById("LoadingImage").style.display="inline";
	$.ajax({
		type: "POST",
		url: "maDistrictData.do",
		'data':{
			category:category,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,selectedIndicator:selectedIndicator,directorateId:directorateId
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
			var generalCategoryList = data.generalCategoryList;
			var indPvtInstData=data.indPvtInstData;
			var generalCategory = data.generalCategory;
			var District = data.district;
			document.getElementById('generalCategory').value=generalCategory;
			document.getElementById('SelectedDist').value=District;
			if(typeof generalCategoryList == 'undefined' || generalCategoryList.length == 0){}
			else{
				var inserRow='';
				inserRow='<ul class="nav nav-tabs" role="tablist" style="height:30px;list-style-type: none;margin: 0;padding: 0;overflow: hidden;border: none;">';
				$('#tabs').find('ul').remove();
				for(var i=0;i<generalCategoryList.length;i++){
					inserRow +='<li  role="presentation" style="height:30px;text-align:left;width:100px;background: #ffffcc;border:1px solid #0076a3;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;float: left;"><a href="#" onclick=tabChange(this) role="tab" data-toggle="tab" style="margin-left:-1px;margin-top:-1px;word-wrap: break-word;width:100px;height:30px;display: block;color: black;text-align: center;text-decoration: none;transition: 0.5s;font-size: 10px;text-align: center;float:left;">'+generalCategoryList[i]+'</a></li>';
				}
				inserRow += '</ul>';
				$(".scrtabs-tabs-fixed-container").append(inserRow);
			}
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
				$("#pvtDist").pivot(
					indPvtDistData, {
					    rows: ["District"],
					    cols: ["GeneralName"],
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
						rows: ["Hud_Type","Hud_Name","Block_Name","Institution"],
					    cols: ["GeneralName"],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
			}
			}
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
	}
});

$(document).on("click", "div#pvtDist > #pvtTable tr th.pvtRowLabel", function(e) {
    var selectedDist=(this.innerText);
	var seletecdInd=document.getElementById("indicatorNameSelected").value;
	var category=document.getElementById("category").value;
	var frequency=document.getElementById("frequency").value;
	var directorateId = 7;
	var generalCategory = document.getElementById("generalCategory").value;
	if(frequency == "monthly"){
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		if(year != ""){
			fromYear=year;
			toYear=year;
		}
		if(month != ""){
			var fromMonth=month;
			var toMonth=month;
		}
	}
	if(frequency == "timeperiod"){
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
	}
	$.ajax({
		type: "POST",
		url: "maInstitutionData.do",
		'data':{
			seletecdInd:seletecdInd,category:category,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,selectedDist:selectedDist,directorateId:directorateId,generalCategory:generalCategory
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
					    rows: ["Hud_Type","Hud_Name","Block_Name","Institution"],
					    cols: ["GeneralName"],
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
					    aggregatorName: "Sum over Sum",
					    rendererName: "Table",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  });
			}
			}
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
});
</script>
</html>