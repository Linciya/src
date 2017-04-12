<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="org.json.JSONArray"%>
    <%@page import="org.json.JSONObject"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap-combined.min.css"></script> -->
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="pivot/js/jquery-ui.min.js"></script>
<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"  />
<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"  />
<script src="pivot/js/pivot.min.js"></script>
<script src="pivot/js/c3.min.js"></script> 
<script src="pivot/js/c3_renderers.min.js"></script> 
<script src="pivot/js/d3.min.js"></script>
<script type="text/javascript">
  var tableToExcel = (function() {            
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>
<script type="text/javascript">
  var tableToExcelReport = (function() {	 
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById("grid-basic")    
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>
<style type="text/css">
nav ul#menu li a {
 display: block;
 height:50px;
 font-size: 2em;
 line-height: 50px;
 color: #fff;
 text-decoration: none;
 padding: 0 15px;
}
/* DMS Styels */
/* ul,li {
    background: hsla(0, 0%, 0%, 0);
    border: 0;
    font-size: 12px;
    margin: 0;
    outline: 0;
    padding: 0;
    vertical-align: baseline;
    font: 20px "Droid Sans", Arial, "Helvetica Neue", "Lucida Grande", sans-serif;   

} */
li {
    display: list-item;
    text-align: -webkit-match-parent;
    width: auto;  
    font-size: 11px; 
   /*  padding-left: 1px;     */
    padding: 0px;    
}
.tabs-nav {
    list-style: none;
    margin: 0;
    padding: 0;    
     text-shadow:none;
    text-decoration:none;  
}
.tabs-nav li:first-child a {
    border-right: 0;
    -moz-border-radius-topleft: 6px;
    -webkit-border-top-left-radius: 6px;
    border-top-left-radius: 6px; 
    
}
.tabs-nav .tab-active a {
    background: /* #FFE5CC */#428bca;
   /*  border-bottom-color: hsla(0, 0%, 0%, 0); */
    color: white/* hsl(85, 54%, 51%) */;
    /* color:#33BEFF; */
    cursor: default;
        width: 170px;
    text-shadow:none;
    text-decoration:none;
     -webkit-border-top-left-radius: 15px 15px;
     -webkit-border-top-right-radius: 15px 15px;
      -moz-border-radius-topleft: 15px 15px;
     -moz-border-radius-topright: 15px 15px;
      border-top-left-radius: 15px 15px;
	  border-top-right-radius: 15px 15px;  
}
.tabs-nav a {
   /*  background: hsl(120, 11%, 96%); */
    background:#B2D5DE;
  /*   border: 1px solid hsl(210, 6%, 79%); */
    border: 1px solid #8dc63f;
   /*  color: hsl(215, 6%, 57%); */
      color: green;
    display: block;
    text-shadow:none; 
    font-size: 15px;
    font-weight: bold;   
    height: 40px;   
    line-height: 44px;
    text-align: center;
    text-decoration: none;
    width: auto;
    -webkit-border-top-left-radius: 15px 15px;
     -webkit-border-top-right-radius: 15px 15px;
      -moz-border-radius-topleft: 15px 15px;
     -moz-border-radius-topright: 15px 15px;
      border-top-left-radius: 15px 15px;
	border-top-right-radius: 15px 15px; 
}
.tabs-nav li {
    float: left;    
}
.tabs-stage {
     /* border: 1px solid hsl(210, 6%, 79%); */
    -webkit-border-radius: 0 0 6px 6px;
    -moz-border-radius: 0 0 6px 6px;
    -ms-border-radius: 0 0 6px 6px;
    -o-border-radius: 0 0 6px 6px;
    border-radius: 0 0 6px 6px;
    border-top: 0;
    clear: both;
    margin-bottom: 20px;
    position: relative;
    top: -1px;
    width: 423px;
    -webkit-border-top-left-radius: 15px 15px;
     -webkit-border-top-right-radius: 15px 15px;
      -moz-border-radius-topleft: 15px 15px;
     -moz-border-radius-topright: 15px 15px;
      border-top-left-radius: 15px 15px;
	border-top-right-radius: 15px 15px; 
}
.tabs-stage p {
    margin: 0;
    padding: 20px;
    color: hsl(0, 0%, 33%);
}

/* DMS Styels */

.searchMenu{
margin-left:270px;
margin-top:13px;
z-index: 12;
}
#districtTable tr td.firstColumnName:HOVER,td.secondColumnName:HOVER,td.thirdColumnName:HOVER,td.fourthColumnName:HOVER{
    cursor:pointer;
	text-decoration: underline;
}
.dashBoardParent{
margin-top: -540px;
}
.dashBoardSecond{
position: absolute;
}
table.pvtTable{
width:100%;
}
#pvt1 table.pvtTable{
height: 70px;
}
nav ul#menu li a {
    display: block;
    height: 30px;
    font-size: 1.4em;
    line-height: 30px;
    color: #fff;
    text-decoration: none;
    padding: 0 15px;
}
#mainDiv {
margin-left: -10px;
}
body{
background: #ffffcc;
}
.exportDataDIv{
margin-left:720px;
margin-top:-25px;
}
</style> 
<!-- District Table  -->
<style>
table#districtTable {
    font-family: thahoma, sans-serif;
    border-collapse: collapse;
    width: 100%;
    font-size: 12px;
}
table#districtTable th {
    background-color: #dddddd;
    background-image: -moz-linear-gradient(center top , green, green);
    background-image: -webkit-gradient(linear, 0 0, 0 bottom, from(#F8F8F8), to(#ECECEC), color-stop(.0, #ECECEC));
    border-top: medium none;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
    height: 30px;
    text-align:left;
    width:20px;
}
table#districtTable td {
    border: 1px solid #87CEFA;
    text-align: left;
    padding: 3px;
    width:20px;
}

table#districtTable tr:nth-child(even) {
    background-color: #dddddd;
}

table#dashBoardTableId {
    margin: 0px auto;
    width: 774px;
    border: 1px solid #D7D7D9;
    padding: 4px;
    height: 277px;
    position: relative;
    font-size:12px;
    font-family:Tahoma, Geneva, Verdana;
}

table#dashBoardTableId thead {
    position: absolute;
    left: 5px;
    top: 5px;
    right: 5px;
    width: 1000px;
}

table#dashBoardTableId thead tr {
    margin: 0px 0px 1px;
    font-size:12px;
    font-family:Tahoma;
}

table#dashBoardTableId thead tr th {
    border-bottom: 1px solid #FFFFFF;
     font-size:12px;
    font-family:Tahoma;
}
table#dashBoardTableId tr td.indicatorState:HOVER {
	cursor:pointer;
	text-decoration: underline;
}
table#dashBoardTableId thead tr th:nth-child(1) {
    text-align: left;
    background: #D4D4D4;
    padding: 13px 9px 8px;
    width: 400px;
     font-size:12px;
    font-family:Tahoma;
}
table#dashBoardTableId thead tr th:nth-child(3) {
    text-align: left;
    background: #D4D4D4;
    padding: 13px 9px 8px;
    width: 141px;
    font-size:12px;
    font-family:Tahoma;
}

table#dashBoardTableId thead tr th:nth-child(even) {
    text-align: center;
    background: #D4D4D4;
    padding: 0px 9px;
    width: 150px;
     font-size:12px;
    font-family:Tahoma;
}
table#dashBoardTableId tbody {
    position: absolute;
    top: 40px;
    overflow-x: hidden;
    overflow-y: auto;
    height: 230px;
    width: 762px;
    left: 5px;
    right: 5px;
    bottom: 5px;
    font-size:12px;
    font-family:Tahoma;
}

table#dashBoardTableId tbody tr {}

table#dashBoardTableId tbody tr:nth-child(odd) {
    background: #F7F7F7;
}

table#dashBoardTableId tbody tr:nth-child(even) {
    background: #F0F0F0;
}

table#dashBoardTableId tbody tr td:nth-child(1) {
    width: 435px;
}
table#dashBoardTableId tbody tr td:nth-child(3) {
    width: 140px;
}

table#dashBoardTableId tbody tr td:nth-child(even) {
    width: 115px;
    border-right: #FFFFFF solid 1px;
}

table#dashBoardTableId tbody tr td {
    padding: 7px 9px 8px 9px;
    border-bottom: 1px solid #FFFFFF;
}

table#dashBoardTableId tbody tr:last-of-type td {
    border-bottom: 0 none;
}
</style>
<!-- District End  -->
</head>
<body style="width:100%;">
<div id="dashBoardParent" class="dashBoardParent" style="width:100%;">
<div id="topDIV" class="topDIV" style="width:100%;height:160px;">
<label style="font-size: 12px;font-weight: bold;"><spring:message code="shdrc_directorate_short_name${directorateId}"/> <spring:message code="shdrc_dashboard_zone"/></label>
<div id="searchMenu" class="searchMenu" >
<form id="indicatorForm" class="indicatorForm" method="POST">
<label id="freqLabel"><spring:message code="label_searchcriteria_frequency"/></label> <select  id="indFrequency" name="indFrequency" class="indFrequency" style="width:150px;">
<c:forEach var="frncy" items="${IndFrncyList}">
    			<option value='<c:out value="${frncy}"/>'>${frncy} </option>
			</c:forEach>
</select>
<label id="yearLabel"><spring:message code="label_searchcriteria_year"/></label>  
	<select id="year" name="year" class="dropDown">
		<c:forEach var="year" items="${yearList}">
    			<option value='<c:out value="${year}"/>'>${year} </option>
			</c:forEach>
	</select> 
<label id="monthLabel"><spring:message code="label_searchcriteria_month"/></label> 
	<select id="month" name="month" class="dropDown">
		<c:forEach var="months" items="${monthsList}">
                		<option value='<c:out value="${months.id}"/>'>${months.name} </option> 
            		</c:forEach> 
	</select>
<button  id="searchIndicator" class="searchIndicator" onclick="searchIndicatorsByFilter();"><spring:message code="label_searchcriteria_search"/></button>
</form>
<div id="exportDataDIv" class="exportDataDIv"><label style=" font-size:12px;font-family:Tahoma;">Select Div to Export </label><select id="exportDIVData" name="exportDIVData" class="exportDIVData" style="width:110px;height:20px;">
<option value="-Select Level-">-Select Level-</option>
<option value="tabs-stage">Dashboard Level</option>
<option value="dashBoardSecond">District Level</option>
<option value="pvt1">Institution Level</option>
</select> 
<button onclick="exportDataSelected();"><spring:message code="label_exporttoexcel"/></button></div>
</div>
<input id="saerchDashStateIndicators" type="hidden" name="" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_state_search"/>"/>
<input id="saerchDashDistrict" type="hidden" name="" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_district_search"/>"/>
<input id="saerchDashInstitution" type="hidden" name="" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_institution_search"/>"/>
<div id="dashBoardFirst" class="dashBoardFirst" style="width:50%;background:#ffffcc;float:left;height:auto;margin-right:10px;margin-top:-3px;">
<ul class="tabs-nav">
   <li class=""><a class="Daily" href="#tab-1" rel="nofollow" style="font-size: 12px;"><spring:message code="shdrc_directorate_dashboard_tab_Daily"/></a>
    </li>       
</ul>
<div class="tabs-stage">
    <div id="tab-1" style="display:none;">
      <!-- <table id="grid-basic" class="table table-condensed table-hover table-striped" style="font-size:5px;" border="1" width=640;">
    <thead>
        <tr>
            <th data-column-id="id" data-type="numeric">Dashboard Name</th>
            <th data-column-id="sender">State</th>            
            <th data-column-id="received" data-order="desc">Dashboard Figure</th>
        </tr>
    </thead>
    <tbody id="indicatorDaily">    
    </tbody>
</table> -->
<table id="dashBoardTableId" cellpadding="0" cellspacing="0" summary="">
    <thead>
        <tr>
            <th>Dashboard Name</th>
            <th>State</th>
            <th>Dashboard Value</th>
        </tr>
    </thead>
    <tbody id="dashBoardTableTbodyId">
    </tbody>
</table>

    </div>     
</div>
</div>
<div id="dashBoardSecond" class="dashBoardSecond" style="width:50%;height:auto;background:#ffffcc;overflow:auto;margin-left:785px;margin-top:37px;border-color: red;">
<div style="height:21px;background: rgb(135, 206, 250);">
<label style="text-shadow: none;font-weight: bold;line-height:22px;color:#4E4B4B;font-size:12px;font-family:Tahoma"><spring:message code="shdrc_directorate_drilldown_district"/></label><label id="districtLable" style="color:#4E4B4B;font-weight: bold;font-size: 11px"></label>
<%-- <button style="float:right;"onclick="tableToExcel('pvt','sheet1')"><spring:message code="label_exporttoexcel"/></button> --%>
</div>
<%-- <div id="districtPreviewContent" style="height:150px; margin-top:117px;margin-left:200px;font-weight: bold;text-shadow: none;color:#4E4B4B"><spring:message code="shdrc_directorate_drilldown_district_msg"/></div> --%>
<!-- <div id="pvt" style="width:100%; height:290px"></div> -->
<table id="districtTable"  style="width:100%;overflow:auto;">
  <tr>
    <th>Central TN+</th>
    <th>Value</th>
    <th>West TN+</th>
    <th>Value</th>
    <th>South TN+</th>
    <th>Value</th>
    <th>North TN+</th>
    <th>Value</th>    
  </tr>
  <tbody id="districtTableTbody">
  </tbody>
</table>
</div>
</div>
<div id="dashBoardThird" class="dashBoardThird" style="width:99%;height:100px;background:#ffffcc;margin-top:188px;position:absolute;">
<div style="height:21px;background: rgb(135, 206, 250);width:100%;">
<label style="text-shadow: none;font-weight: bold;line-height:22px;color:#4E4B4B;background: rgb(135, 206, 250);font-size:12px;font-family:Tahoma"><spring:message code="shdrc_directorate_drilldown_institution"/></label><label id="institutionLable" style="color:#4E4B4B;font-weight: bold;font-size: 11px"></label>
<%-- <button style="float:right;"onclick="tableToExcel('pvt1','sheet1')"><spring:message code="label_exporttoexcel"/></button> --%>
</div>
<div id="institutionPreview" class="institutionPreview" style="position:absolute;text-align: center;">
<div id="institutionPreviewContent" style="margin-top:40px;margin-left:450px;font-weight: bold;text-shadow: none;color:#4E4B4B;font-size:12px;font-family:Tahoma"><spring:message code="shdrc_directorate_drilldown_institution_msg"/></div>
</div>
<div id="pvt1" style="width:100%;overflow: auto;">
</div>
</div>
</div>
<input type="hidden" id="selectedIndName" class="selectedIndName">
<input type="hidden" id="initialTabName" class="initialTabName" value="${initialTabName}">
<input type="hidden" id="dailyInd" class="dailyInd" value="<spring:message code="option_frequency_Daily"/>">
<input type="hidden" id="monthlyInd" class="monthlyInd" value="<spring:message code="option_frequency_monthly"/>">
<input type="hidden" id="tabSearchCriteriaName" class="tabSearchCriteriaName" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_tab_action_search"/>">
<div id="preContent" style="margin-left:250px;margin-top:100px;font-weight: normal;font-size: 12px;font-size:12px;font-family:Tahoma">
<p style="color:black;">No Data Available</p>
</div>
</body>
<script>
$('.tabs-nav a').on('click', function (event) {
 event.preventDefault();
 var activeTabName=this.innerText;
 if(activeTabName==="Daily Indicator"){
	 $('#indicatorMonthly').empty();
	 $('#indFrequency').val($("#dailyInd").val()); 
	 
 }
 else if(activeTabName==="Monthly Indicator"){
	 $('#indicatorDaily').empty();
	 $('#indFrequency').val($("#monthlyInd").val()); 
	 
 }
 
 $('.tab-active').removeClass('tab-active');
 $(this).parent().addClass('tab-active');
 $('.tabs-stage div').hide();
 /* var tabSearchCriteria=$("#tabSearchCriteriaName").val();
 var month= $('#month').val();
 var year= $('#year').val();
 var indCategory= $('#indFrequency').val();
 var tempDirectorateId=${directorateId};
 $.ajax({		
		 type: "POST",
		 url: tabSearchCriteria,
		 async: false,
	     dataType: 'text',
		 data:jQuery.param({Year:year,Month:month,IndFrequency:indCategory,DirectorateID:tempDirectorateId}),
		 success: function(result){ 
			 var res=JSON.parse(result);			 
			 var indDataList=res.indicatorDetailsforDistrict;
			 var divTempName;
			 if(activeTabName==="Daily Indicator"){
				 divTempName="indicatorDaily";				
			 }else if(activeTabName==="Monthly Indicator"){
				 divTempName="indicatorMonthly";				
			 }			
				if(indDataList.length <= 0){
					 $("#preContent").show();		 
					 $("#"+divTempName).append($("#preContent"));
				}else{
				 for(var i in indDataList) {
					 var toolTipData =indDataList[i]['ThresholdTooltip'].replace(/\s/g,'&nbsp;');
				 $("#"+divTempName).append('<tr"><td id="indicatorName" class="indicatorName">'+indDataList[i]['Indicator']+'</td><td  onclick="callNext(this);" class="indicatorState" id="indicatorState">'+indDataList[i]['State']+'</td><td title='+toolTipData+' id="indicatorVal"  bgcolor='+indDataList[i]['Threshold']+'>'+indDataList[i]['Value']+'</td></tr>'); 
				}
				}
		 },
	 	 error: function(result) {	    	
	             
	     }}); */
 $($(this).attr('href')).show();
});
var inTabName=$("#initialTabName").val();
$('.tabs-nav a.'+inTabName).trigger('click');
$( document ).ready(function() {
	document.getElementById("freqLabel").style.display = 'none';
	document.getElementById("indFrequency").style.display = 'none';
	document.getElementById("year").style.display = 'none';
	document.getElementById("month").style.display = 'none';
	document.getElementById("searchIndicator").style.display = 'none';
	document.getElementById("yearLabel").style.display = 'none';
	document.getElementById("monthLabel").style.display = 'none';
	$("#districtPreviewContent").show();
	$("#preContent").hide();
	$("#districtTable").hide();
	$("#institutionPreview").show();
	var indYr=${indicatorYer};
	var indMnt=${indicatorMnth};
	var dirID=${directorateId};
	if(indYr==null){}else{
	$("#year").val(indYr);
	}
	if(indMnt==null){}else{
	$("#month").val(indMnt);
	}	var indDataList=${indJsonArray};	
	var tempDataDiv;
	var initialTempTab=$("#initialTabName").val();
	 if(initialTempTab==="Daily"){
		 tempDataDiv="indicatorDaily"; 
	 }
	 else if(initialTempTab==="Monthly"){
		 tempDataDiv="indicatorMonthly";
	 }	 
	if(indDataList.length <= 0){
		 $("#preContent").show();		 
		 $("#"+tempDataDiv).append($("#preContent"));
		 	
	}else{
	 for(var i in indDataList) {	
		 var toolTipData =indDataList[i]['ThresholdTooltip'];
	 $("#dashBoardTableTbodyId").append('<tr"><td id="indicatorName" class="indicatorName">'+indDataList[i]['Indicator']+'</td><td  class="indicatorState" id="indicatorState">'+indDataList[i]['State']+'</td><td title='+toolTipData+' id="indicatorVal"  bgcolor='+indDataList[i]['Threshold']+'>'+indDataList[i]['Value']+'</td></tr>'); 
	 }
	 var rowCount=$("#dashBoardTableTbodyId tr").length;
	 if(rowCount>=8){
		 $("table#dashBoardTableId thead tr th:nth-child(3)").css('width','158px');
		 $("table#dashBoardTableId tbody").css('width','762px');
	 }else{
		 $("table#dashBoardTableId thead tr th:nth-child(3)").css('width','158px');
		 $("table#dashBoardTableId tbody tr td:nth-child(3)").css('width','158px');
		 
	 }
	}
	$('table#dashBoardTableId tbody tr td.indicatorState').eq(0).trigger('click');
	
});
function searchIndicatorsByFilter(){
	var tempDirectorateId=${directorateId};
	var form=document.getElementById("indicatorForm"); 
    var hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "directorateId");
	hiddenField.setAttribute("value", tempDirectorateId);	
	form.appendChild(hiddenField);	
	document.body.appendChild(form);	
	$('#indicatorForm').attr('action', $("#saerchDashStateIndicators").val()).submit();
}
var repeatCount=0;
$(document).on('click','table#dashBoardTableId tbody tr td.indicatorState',function() {
	    var selectedIndicator=($(this).closest('tr').children('td:first').text());
	    $('#selectedIndName').val(selectedIndicator);
	    $('#districtLable').text(" - " +selectedIndicator);
	    var saerchDashDistrict=$("#saerchDashDistrict").val();
	    var month= $('#month').val();
	    var year= $('#year').val();
	    var indCategory= $('#indFrequency').val();
	    var tempDirectorateId=${directorateId};
	    if(selectedIndicator!=null){
	      $.ajax({		
	 		 type: "POST",
	 		 url: saerchDashDistrict,	
	 		 async: false,
			 dataType: 'text',
	 		 data:jQuery.param({SelectedIndicatorName:selectedIndicator,Year:year,Month:month,IndFrequency:indCategory,DirectorateID:tempDirectorateId}),
	 		 success: function(result){ 	
	 			    var utils = $.pivotUtilities;
	 			    var res=JSON.parse(result);
	 			    var inddata=res.indicatorDetailsforDistrict; 			
	 			   if(Object.keys(inddata).length === 0){
	 				  
	 				  $("#districtTableTbody").empty();	
	 			      if(repeatCount<=1){
	 			    	 repeatCount++;
	 			      $('table#dashBoardTableId tbody tr td.indicatorState').eq(1).trigger('click');
	 			      }
	 			      return;
	 			    }
	 			   else{
	 				  $("#districtTable").show();
	 				  $("#districtPreviewContent").hide();
	 				  var rowCountOfDistTable=0;
	 				  var centralLevel=0;
	 				  var southLevel=0;
	 				  var westLevel=0;
	 				  var northLevel=0;	
	 				  $("#districtTableTbody").empty();	 				 
	 					 for(var i in inddata) {	 						
	 						if(inddata[i][2]==='Central Plus'){	 							
	 							centralLevel++;
	 							if(rowCountOfDistTable<centralLevel){
	 								 rowCountOfDistTable++;
	 								 $("#districtTableTbody").append('<tr id="row'+rowCountOfDistTable+'"><td id="'+rowCountOfDistTable+'_1_name" class="firstColumnName" onclick="interFace(this.innerHTML);">'+inddata[i][0]+'</td><td id="'+rowCountOfDistTable+'_1_value" style="color: white;background-color:'+inddata[i][3]+'">'+inddata[i][1]+'</td><td id="'+rowCountOfDistTable+'_2_name" class="secondColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_2_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_3_name" class="thirdColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_3_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_4_name" class="fourthColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_4_value" style="color: white;background-color:'+inddata[i][3]+'"></td></tr>');								
	 							}else{	 
	 								 $("#"+centralLevel+"_1_name").html(inddata[i][0]);
	 								 $("#"+centralLevel+"_1_value").html(inddata[i][1]);
	 								$("#"+centralLevel+"_1_value").css("background-color"  , inddata[i][3]);
	 								$("#"+centralLevel+"_1_value").css("color"  , "white");
	 								
	 							}	 						   
	 						}
	 						if(inddata[i][2]==='West Plus'){	
	 							westLevel++;	 							
                                if(rowCountOfDistTable<westLevel){
                                	 rowCountOfDistTable=rowCountOfDistTable+1;
 	 								 $("#districtTableTbody").append('<tr id="row'+rowCountOfDistTable+'"><td id="'+rowCountOfDistTable+'_1_name" class="firstColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_1_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_2_name" class="secondColumnName" onclick="interFace(this.innerHTML);">'+inddata[i][0]+'</td><td id="'+rowCountOfDistTable+'_2_value" style="color: white;background-color:'+inddata[i][3]+'">'+inddata[i][1]+'</td><td id="'+rowCountOfDistTable+'_3_name" class="thirdColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_3_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_4_name" class="fourthColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_4_value" style="color: white;background-color:'+inddata[i][3]+'"></td></tr>');
                                	 			
	 							}else{
	 								 $("#"+westLevel+"_2_name").html(inddata[i][0]);
	 								 $("#"+westLevel+"_2_value").html(inddata[i][1]);	 								
	 								$("#"+westLevel+"_2_value").css("background-color"  , inddata[i][3]);
	 								$("#"+westLevel+"_2_value").css("color"  , "white");
	 								 
	 							}	
		 					}	
	 						if(inddata[i][2]==='South Plus'){	 							
	 							 southLevel++;	 							
                                 if(rowCountOfDistTable<southLevel){
                                	 rowCountOfDistTable=rowCountOfDistTable+1;
	 								 $("#districtTableTbody").append('<tr id="row'+rowCountOfDistTable+'"><td id="'+rowCountOfDistTable+'_1_name" class="firstColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_1_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_2_name" class="secondColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_2_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_3_name" class="thirdColumnName" onclick="interFace(this.innerHTML);">'+inddata[i][0]+'</td><td id="'+rowCountOfDistTable+'_3_value" style="color: white;background-color:'+inddata[i][3]+'">'+inddata[i][1]+'</td><td id="'+rowCountOfDistTable+'_4_name" class="fourthColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_4_value" style="color: white;background-color:'+inddata[i][3]+'"></td></tr>');
                                	 	
	 							 }else{
	 								$("#"+southLevel+"_3_name").html(inddata[i][0]);
	 								$("#"+southLevel+"_3_value").html(inddata[i][1]);	
	 								$("#"+southLevel+"_3_value").css("background-color" , inddata[i][3]);
	 								$("#"+southLevel+"_3_value").css("color"  , "white");
	 								
	 							}	
	 							}
	 						if(inddata[i][2]==='North Plus'){	 							
	 							northLevel++;	 							
								if(rowCountOfDistTable<northLevel){
									 rowCountOfDistTable=rowCountOfDistTable+1;
	 								 $("#districtTableTbody").append('<tr id="row'+rowCountOfDistTable+'"><td id="'+rowCountOfDistTable+'_1_name" class="firstColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_1_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_2_name" class="secondColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_2_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_3_name" class="thirdColumnName" onclick="interFace(this.innerHTML);"></td><td id="'+rowCountOfDistTable+'_3_value" style="color: white;background-color:'+inddata[i][3]+'"></td><td id="'+rowCountOfDistTable+'_4_name" class="fourthColumnName" onclick="interFace(this.innerHTML);">'+inddata[i][0]+'</td><td id="'+rowCountOfDistTable+'_4_value" style="color: white;background-color:'+inddata[i][3]+'">'+inddata[i][1]+'</td></tr>');
										
	 							}else{
	 								 $("#"+northLevel+"_4_name").html(inddata[i][0]);
	 								 $("#"+northLevel+"_4_value").html(inddata[i][1]);	 								
	 								$("#"+northLevel+"_4_value").css("background-color"  , inddata[i][3]);
	 								$("#"+northLevel+"_4_value").css("color"  , "white");
	 								
	 							}	
	 							}
	 						
	 						}
	 					$('table#districtTable tbody tr td.firstColumnName').eq(0).trigger('click');
	 						//$("#districtTableTbody").append('<tr><td>'+inddata[i][0]+'</td><td >'+inddata[i][1]+'</td><td >'+inddata[i][2]+'</td></tr>');
	 					//$("#districtTableTbody").append('<tr><td>'+inddata[i]['District']+'</td><td >'+inddata[i][5]+'</td><td>'+inddata[i][4]['Zone'==='West']+'</td><td >'+inddata[i][5]+'</td><td>'+inddata[i][4]['Zone'==='South']+'</td><td >'+inddata[i][5]['Zone'==='South']+'</td><td>'+inddata[i][4]['Zone'==='North']+'</td><td >'+inddata[i][5]['Zone'==='North']+'</td></tr>'); 
	 					}		    
	 		 },
	 			  
	 		error: function (xhr, status, error) {
                alert("Internal Error Occured-Please Contact System Administrator");
		    }});
	    }
 });
</script>
<script type="text/javascript">
function interFace(val){
/* $(document).on("click", "#pvtTable tr th.pvtRowLabel", function(e)  {*/
	var selectedDisrtict=val;
	var indicatorNameTemp= $('#selectedIndName').val();
	 var saerchDashInstitution=$("#saerchDashInstitution").val();
	 var month= $('#month').val();
	    var year= $('#year').val();
	    $('#institutionLable').text(" - " +$('#selectedIndName').val());
	    var indCategory= $('#indFrequency').val();
	    var tempDirectorateId=${directorateId};
	$.ajax({		
		 type: "POST",
		 url: saerchDashInstitution,	
		 async: false,
		 dataType: 'text',
		 data: jQuery.param({ Disrtict: selectedDisrtict, Indicator : indicatorNameTemp,Year:year,Month:month,IndFrequency:indCategory,DirectorateID:tempDirectorateId}),		 
		 success: function(result){ 	
			   var utils = $.pivotUtilities;
			    var res=JSON.parse(result);
			    var inddata=res.indicatorDetailsforDistrict;	
			    var colorCodesTemp=new Array();
			    if(tempDirectorateId==2){
 			    for(var i in inddata){	 			    	
 			    	colorCodesTemp.push(inddata[i][4]);
 			    }}else{
 			    	for(var i in inddata){	 			    	
 	 			    	colorCodesTemp.push(inddata[i][3]);
 	 			    }	
 			    }
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
			    $("#dashBoardThird").css({height:"130px"});
				$("#pvt1").pivot(
						  inddata, {
						    rows: ["District"],
						    cols: ["Institution"],						  
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum",
						    rendererName: "Line Chart",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
				
				var count=1;	 			   
 				$("#pvt1 table.pvtTable").find("tr").find('td.pvtVal').each(function() {	 					
 					 if(count<colorCodesTemp.length){
 				     $(this).css('background-color', colorCodesTemp[count]);
 				     $(this).css('color', 'white');	 				 
 				     count=count+1;
 					 }	 					
 				}); 
 				$("#pvt1 table.pvtTable").find("tr").find('th.pvtTotalLabel:nth-child(1)').hide();
				$("#pvt1 table.pvtTable").find("tr").find('td.pvtTotal').each(function() {	 				
	 			  $(this).hide();
	 			});
				$("#pvt1 table.pvtTable").find("tr").find('td.pvtTotal:last').show();
				$("#pvt1 table.pvtTable").find("tr").find('td.pvtTotal:nth-last-child(2)').hide();
				$("#pvt1 table.pvtTable").find("tr").find('td.pvtGrandTotal').hide();
				$("#institutionPreviewContent").hide();
				$("#institutionPreview").hide();
				$("#dashBoardThird").show(); 
				if(tempDirectorateId==17){
					$("#pvt1 table.pvtTable").find("tr").find('th.pvtRowTotalLabel').hide();
					$("#pvt1 table.pvtTable").find("tr").find('td.rowTotal').hide();
				}
	    },
	    error: function (xhr, status, error) {
            alert("Internal Error Occured-Please Contact System Administrator");
	    }});
/* }); */
}

function exportDataSelected(){
	var selectedDivVal=$("#exportDIVData").val();
	if(selectedDivVal==="-Select Level-"){
		alert('Please select at least one level to export');
	}
	else if(selectedDivVal==="tabs-stage"){
		tableToExcelReport('tabs-stage','sheet1');
	}else{
		tableToExcel(selectedDivVal,'sheet1')
	}
}
</script>
</html>