<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TNMSC Indicator Zone</title>
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
<style>
#reportName{
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
	margin-top:3px;
	width:85px;
	float:right;
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
</head>
<body onload="onLoad();">
<input type="hidden" id="indicatorNameSelected" name="indicatorNameSelected"/>
<div class="zonesMainDiv">
<div id="directorateNameHeader"><spring:message code="shdrc_directorate_short_name${directorateId}"/><spring:message code="shdrc_indicator_zone"/></div>
	<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
	<table>
		<tr id="filters">
			<td class="searchCriteria"><spring:message code="label_indicator_category"/></td>	
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="reportName" name="reportName" class="reportDropDown" style="width:250px;">
				<option value="<spring:message code="shdrc_indicator_zone3_1"/>"><spring:message code="shdrc_indicator_zone3_1"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_2"/>"><spring:message code="shdrc_indicator_zone3_2"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_3"/>"><spring:message code="shdrc_indicator_zone3_3"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_4"/>"><spring:message code="shdrc_indicator_zone3_4"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_5"/>"><spring:message code="shdrc_indicator_zone3_5"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_6"/>"><spring:message code="shdrc_indicator_zone3_6"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_7"/>"><spring:message code="shdrc_indicator_zone3_7"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_8"/>"><spring:message code="shdrc_indicator_zone3_8"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_9"/>"><spring:message code="shdrc_indicator_zone3_9"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_10"/>"><spring:message code="shdrc_indicator_zone3_10"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_11"/>"><spring:message code="shdrc_indicator_zone3_11"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_12"/>"><spring:message code="shdrc_indicator_zone3_12"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_13"/>"><spring:message code="shdrc_indicator_zone3_13"/></option>
				<option value="<spring:message code="shdrc_indicator_zone3_14"/>"><spring:message code="shdrc_indicator_zone3_14"/></option>
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
			<td class="searchCriteria"><label id="Loading" style=""><spring:message code="label_Loading"/></label><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:20px;height:20px;"></td>
		</tr>
	</table>
	</div>
	<div style="width:99.3%;">
		<div id="pvtDiv" style="width:99.3%;height:450px;float:left;border:0.1px solid black;box-shadow: 0 0 1em olive;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
			<div style="background:#e1eaea; width:100%;height: 25px;border-top-left-radius: 10px 10px;border-top-right-radius: 10px 10px;">
				<input type="text" id="SelectedReportName" name="SelectedReportName" value="" style="background: none;border: none;float:left;width:400px;" readonly="readonly"/>				
				<input type="button" id="exportButton" name="exportButton" onclick="tableToExcel('pvtTable','sheet1');" value="<spring:message code="label_exporttoexcel"/>">
			</div>
			<label id="noTableData" style="margin-left:500px;margin-top: 200px;position: absolute;"><spring:message code="label_shownodata"/></label>
			<div id="pvtTable" class="pvtState" style="width:98%;height:425px; overflow:scroll;position: absolute;"></div>
		</div>
	</div>
</div>
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
           
            if (!table.nodeType) table = document.getElementById(table)
           
           
           
            var selectedCategory=document.getElementById("reportName");
       	
			if (selectedCategory != 'undefined') {
				var categoryName=selectedCategory.options[selectedCategory.selectedIndex].value; 
			 }
 
			var selectedYear=document.getElementById("year");
			if (selectedYear != 'undefined') {
				var year=$("#year").val(); 
				
			}
			var selectedMonth=document.getElementById("month");
			if (selectedMonth != 'undefined') {
				var month=$("#month").val();/* selectedMonth.options[selectedMonth.selectedIndex].value;  */
				
			}
			 $("#pvtTable").find('tr:first').find('th').css("background", "#00b2ff");
			 $("#pvtTable").find('tr').find('th').css("border", "1px groove black");
			 $("#pvtTable").find('tr').find('th').css("border-collapse", "collapse");
			 $("#pvtTable").find('tr').find('td').css("border", "1px groove black");
			 $("#pvtTable").find('tr').find('td').css("border-collapse", "collapse");
			
			innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Category</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML;

            var ctx = {worksheet: name || 'Worksheet', table: innnertable}
            
            $("#pvtTable").find('tr:first').find('th').css("background", "#e6EEEE");
            $("#pvtTable").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
			 $("#pvtTable").find('tr').find('td').css("border", "0.1px solid #CDCDCD");
            
            
            window.location.href = uri + base64(format(template, ctx))
          }
        })()
</script>
<script>
/* function exportToExcel(){
	var selectedLevel=$("#exportTable").val();
	if(selectedLevel===""){
		alert('Please select at least one level to export');
	}else{
		tableToExcel(selectedLevel,'sheet1')
	}
} */
function onLoad(){
	document.getElementById("Loading").style.display="none";
	document.getElementById("LoadingImage").style.display="none";
    document.getElementById("month").style.display="inline";
    document.getElementById("noTableData").style.display="none";
	var tnmscPvtData = <%= request.getAttribute("tnmscPvtData") %>;
	var reportName = '<%= request.getAttribute("reportName") %>';
	var month = '<%= request.getAttribute("month") %>';
	var year = '<%= request.getAttribute("year") %>';
	$('#month').val(month);
	$('#year').val(year);
	var utils = $.pivotUtilities;
	var heatmap =  utils.renderers["Table"];
	var sumOverSum =  utils.aggregators["Sum over Sum"];
	var derivers = $.pivotUtilities.derivers;
	if(tnmscPvtData === null){
		document.getElementById("noTableData").style.display="inline";
	}else{
		if(tnmscPvtData.length === 0){
			$('#pvtTable').empty();
			document.getElementById("noTableData").style.display="inline";
		}
		else{
			document.getElementById("noTableData").style.display="none";
			document.getElementById("SelectedReportName").value=reportName;
			if(reportName === "Human Resource"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["IndicatorName"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["IndicatorValue"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			}
			else if(reportName === "Equipment avaliability & working"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["IndicatorName"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Equipment avaliability & working"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			}
			else if(reportName === "Equipment Procurement"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["IndicatorName"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Equipment Procurement"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			}
			else if(reportName === "Drug Procurement"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["IndicatorName","State","Value"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			}
			else if(reportName === "Quality Test"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["IndicatorName","State","Value"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Indicator Total"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			}
			else if(reportName === "Drug Stock"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["IndicatorName"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Drug Stock"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			}
			else if(reportName === "CT & MRI"){
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["Indicator Name","Institution"],
						    cols: [],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Ind_Value"]),
						    aggregatorName: "Sum over Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
			} 
			else{
				$("#pvtTable").pivot(
						tnmscPvtData, {
						    rows: ["Institution Name"],
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Ind_Value"]),
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
	var reportName=document.getElementById("reportName").value;
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	var directorateId = 3;
$.ajax({
		type: "POST",
		url: "tnmscOnSearch.do",
		'data':{
			reportName:reportName,year:year,month:month,directorateId:directorateId
		},
		success: function(result){
			document.getElementById("Loading").style.display="none";
			document.getElementById("LoadingImage").style.display="none";
			if(result=== ""){
				$('#pvtTable').empty();
				document.getElementById("SelectedReportName").value="";
				document.getElementById("noTableData").style.display="inline";
			}else{
			var data = JSON.parse(result);			
			var tnmscPvtData=data.tnmscPvtData;
			var reportName1 = data.reportName;
			document.getElementById("SelectedReportName").value=reportName1;
			var utils = $.pivotUtilities;
			var heatmap =  utils.renderers["Table"];
			var sumOverSum =  utils.aggregators["Sum over Sum"];
			var derivers = $.pivotUtilities.derivers;
			if(typeof tnmscPvtData == 'undefined' || tnmscPvtData.length === 0){
				$('#pvtTable').empty();
				document.getElementById("SelectedReportName").value="";
				document.getElementById("noTableData").style.display="inline";
			}else{
				document.getElementById("SelectedReportName").value=reportName1;
				document.getElementById("noTableData").style.display="none";
				if(reportName1 === "Human Resource"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["IndicatorName"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["IndicatorValue"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				else if(reportName1 === "Equipment avaliability & working"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["IndicatorName"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Equipment avaliability & working"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				else if(reportName1 === "Equipment Procurement"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["IndicatorName"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Equipment Procurement"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				else if(reportName1 === "Drug Procurement"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["IndicatorName"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				else if(reportName1 === "Quality Test"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["IndicatorName","State","Value"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Indicator Total"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				else if(reportName1 === "Drug Stock"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["IndicatorName"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Drug Stock"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				else if(reportName1 === "CT & MRI"){
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["Indicator Name","Institution"],
							    cols: [],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Ind_Value"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				} 
				else{
					$("#pvtTable").pivot(
							tnmscPvtData, {
							    rows: ["Institution Name"],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Ind_Value"]),
							    aggregatorName: "Sum over Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
			}
			}
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
}
</script>
</html>