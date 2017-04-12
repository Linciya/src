<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
          <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
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
	<script type="text/javascript">
  var tableToExcelReport = (function() {	 
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById("pvtLeft");
    var dashboardType= $("#dashboardTypeId").val();
    var frequency=$("#indFrequency").val();
    var year=$("#year").val();
    var monthTemp=$("#month").val();
    var month= $("#month option[value="+monthTemp+"]").text();
    $("#pvtTable").find('tr:first').find('th').css("background", "#00b2ff");    
    var innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>DashboardType</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+dashboardType+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+frequency+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML;
    
    /*  var innnertable='<tr><td style="color:blue"><b>DashBoard Type</b></td><td style="color:blue"><b>'+dashBoardType+'</b></td></tr><tr><td style="color:blue"><b>Frequency</b></td><td style="color:blue"><b>'+frequency+'</b></td></tr><tr><td style="color:blue"><b>Year</b></td><td style="color:blue" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue"><b>Month</b></td><td style="color:blue" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML; */
    var ctx = {worksheet: name || 'Worksheet', table: innnertable}
    $("#pvtTable").find('tr:first').find('th').css("background", "#e6EEEE");
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>
	<script type="text/javascript">
  var tableToExcelReportTemp = (function() {	 
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById("pvtRight");
    var dashboardType= $("#dashboardTypeId").val();
    var frequency=$("#indFrequency").val();
    var year=$("#year").val();
    var monthTemp=$("#month").val();
    var month= $("#month option[value="+monthTemp+"]").text();
    $(".pvtTable").find('tr:first').find('th').css("background", "#00b2ff");    
    var innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>DashboardType</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+dashboardType+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+frequency+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML;
    
    /*  var innnertable='<tr><td style="color:blue"><b>DashBoard Type</b></td><td style="color:blue"><b>'+dashBoardType+'</b></td></tr><tr><td style="color:blue"><b>Frequency</b></td><td style="color:blue"><b>'+frequency+'</b></td></tr><tr><td style="color:blue"><b>Year</b></td><td style="color:blue" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue"><b>Month</b></td><td style="color:blue" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML; */
    var ctx = {worksheet: name || 'Worksheet', table: innnertable}
    $(".pvtTable").find('tr:first').find('th').css("background", "#e6EEEE");
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>
		<style>
		.searchMenu{
margin-left:270px;
margin-top:-13px;
}
#mainDiv {
margin-left: -10px;
}
.exportDataDIv{
margin-left:823px;
margin-top:-37px;
font-size:13px;
font-family:Tahoma

}
#pvtTable{
width:100%;
}
		</style>
</head>

<body onload="onLoad()">
<div id="mainTopDiv">
<div id="topDiv" style="margin-top:-532px;">
<label style="font-size: 12px;font-weight: bold;"><spring:message code="shdrc_directorate_short_name${directorateId}"/>BCP <spring:message code="shdrc_dashboard_zone"/></label>
<div id="searchMenu" class="searchMenu" >
<form id="indicatorForm" class="indicatorForm">
<label>Dashboard Type</label> <select id="dashboardTypeId" name="dashboardTypeId" class="dashboardTypeId" onchange="dashBoardTypeChange();" style="width:170px;">
<option value="DashBoard">DashBoard</option>
<option value="BCP (Before 2015)">BCP (Before 2015)</option>
<option value="BCP (After 2015)">BCP (After 2015)</option>
</select>
<label><spring:message code="label_searchcriteria_frequency"/></label> <select id="indFrequency" name="indFrequency" class="indFrequency" style="width:150px;">
<option value="Monthly">Monthly</option>
</select>
<label><spring:message code="label_searchcriteria_year"/></label>  
	<select id="year" name="year" class="dropDown">
		<c:forEach var="year" items="${yearList}">
    			<option value='<c:out value="${year}"/>'>${year} </option>
			</c:forEach>
	</select> 
<label><spring:message code="label_searchcriteria_month"/></label> 
	<select id="month" name="month" class="dropDown">
		<c:forEach var="months" items="${monthsList}">
                		<option value='<c:out value="${months.id}"/>'>${months.name} </option> 
            		</c:forEach> 
	</select>
</form>
<div id="exportDataDIv" class="exportDataDIv"><button  id="searchIndicator" class="searchIndicator" onclick="searchIndicatorsByFilter();"><spring:message code="label_searchcriteria_search"/></button><label style="font-size:12px;font-family:Tahoma">Select Div to Export </label><select id="exportDIVData" name="exportDIVData" class="exportDIVData" style="width:110px;height:20px;">
<option value="-Select Level-">-Select Level-</option>
<option value="pvtLeft">State Level</option>
<option value="pvtRight">District Level</option>
</select> 
<button onclick="exportDataSelected();"><spring:message code="label_exporttoexcel"/></button></div>
</div>
</div>
<div id="leftSidePvtTable" style="float:left;width: 50%;overflow: auto;margin-top: 3px;">
<div style="width:100%;background: lightblue;"><label style="font-size: 12px;font-family: tahoma;font-weight: bold;">State Level</label></div>
<div id="pvtLeft" style="width:100%;height: 500px;overflow: auto"></div>
</div>
<div id="rightSidePvtTable" style="float:right;width: 50%;overflow: auto;margin-top: 3px;">
<div style="width:100%;background: lightblue;"><label style="font-size: 12px;font-family: tahoma;font-weight: bold;">District Level</label></div>
<div id="pvtRight" style="width:100%;height: 500px;overflow: auto"></div>
</div>
<input id="bcpTempName" type="hidden" value="${bcpName}">
<input id="forwardNLEPBCP" type="hidden" value="nlepBCPDashBoard.do">
<input id="forwardNLEPDashBoard" type="hidden" value="nlepDashboardZone.do">
</div>
<script>
function onLoad(){	
var jsonArray=${jsonArray};
var jsonRight=${jsonArrayRight};
var directorateId=${directorateId};
var bcpName=$("#bcpTempName").val();
var indYr=${indicatorYer};
var indMnth=${indicatorMnth};
$("#year").val(indYr);
$("#month").val(indMnth);
$("#dashboardTypeId").val(bcpName);
var utils = $.pivotUtilities;
var heatmap =  utils.renderers["Table"];
var sumOverSum =  utils.aggregators["Sum over Sum"];
var derivers = $.pivotUtilities.derivers;
		$("#pvtLeft").pivot(
				jsonArray, {
					rows: ["General_Type","General_Name"],
				    cols: [],
				    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
				    aggregatorName: "Sum over Sum",
				    rendererName: "Table",
			        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
				  });  
		$("#pvtRight").pivot(
				jsonRight, {
					rows: ["District","General_Type","General_Name"],
				    cols: [],
				    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
				    aggregatorName: "Sum over Sum",
				    rendererName: "Table",
			        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
				  });  
	}
function dashBoardTypeChange(){
	var tempDirectorateId=${directorateId};
	var form=document.getElementById("indicatorForm"); 
    var hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "directorateId");
	hiddenField.setAttribute("value", tempDirectorateId);	
	form.appendChild(hiddenField);	
	document.body.appendChild(form);
	var dashBoardType=$("#dashboardTypeId").val();
	if(dashBoardType=='DashBoard'){	
		document.getElementById("indicatorForm").method = "get";
		$('#indicatorForm').attr('action', $("#forwardNLEPDashBoard").val()).submit();
	}else{
		document.getElementById("indicatorForm").method = "post";
		$('#indicatorForm').attr('action', $("#forwardNLEPBCP").val()).submit();
	}
}
function searchIndicatorsByFilter(){
	    var tempDirectorateId=${directorateId};
	    var dashBoardType= $("#dashboardTypeId").val();
	    var year=$("#year").val();
	    var month=$("#month").val();
	      $.ajax({		
	 		 type: "POST",
	 		 url: "searchNLEPBCPDashBoard.do",
			 dataType: 'text',
	 		 data:jQuery.param({dashboardTypeId:dashBoardType,directorateId:tempDirectorateId,year:year,month:month}),
	 		 success: function(result){ 
	 			    $("#pvtLeft").empty();
	 			    $("#pvtRight").empty();
	 			    var res=JSON.parse(result);
	 			    var jsonRight=res.jsonArrayRight;	
	 			    var jsonArray=res.jsonArray;
	 			    var utils = $.pivotUtilities;
	 				var heatmap =  utils.renderers["Table"];
	 				var sumOverSum =  utils.aggregators["Sum over Sum"];
	 				var derivers = $.pivotUtilities.derivers;	 				
	 				$("#pvtLeft").pivot(
	 						jsonArray, {
	 							rows: ["General_Type","General_Name"],
	 						    cols: [],
	 						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
	 						    aggregatorName: "Sum over Sum",
	 						    rendererName: "Table",
	 					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
	 						  });
	 				$("#pvtRight").pivot(
	 						jsonRight, {
	 							rows: ["District","General_Type","General_Name"],
	 						    cols: [],
	 						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
	 						    aggregatorName: "Sum over Sum",
	 						    rendererName: "Table",
	 					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
	 						  });  

	 				
	 	    },
	 	    error: function(result) {	    	
	             
	         }});
  
}
function exportDataSelected(){
	var typeOfData=$("#exportDIVData").val();
	if(typeOfData==="-Select Level-"){
		alert('Please select at least one level to export');
	}
	else if(typeOfData=='pvtLeft'){
		tableToExcelReport('pvtLeft','Sheet1');
	}else{
		tableToExcelReportTemp('pvtRight','Sheet1');
	}
}
</script>
</body>
</html>