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
margin-top:-13px;
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
margin-top:-30px;
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
}

table#districtTable tr:nth-child(even) {
    background-color: #dddddd;
}
#districtTable tr td.zoneName:HOVER{
    cursor:pointer;
	text-decoration: underline;
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
<div id="dashBoardParent" class="dashBoardParent" style="width:100%;overflow: auto">
<div id="topDIV" class="topDIV" style="width:100%;height:160px;">
<label style="font-size: 12px;font-weight: bold;"><spring:message code="shdrc_directorate_short_name${directorateId}"/> <spring:message code="shdrc_dashboard_zone"/></label>
<div id="searchMenu" class="searchMenu" >
<form id="indicatorForm" class="indicatorForm" method="POST">
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
<button  id="searchIndicator" class="searchIndicator" onclick="searchIndicatorsByFilter();"><spring:message code="label_searchcriteria_search"/></button>
</form>
<div id="exportDataDIv" class="exportDataDIv"><label style="font-size:12px;font-family:Tahoma">Select Div to Export </label><select id="exportDIVData" name="exportDIVData" class="exportDIVData" style="width:110px;height:20px;">
<option value="-Select Level-">-Select Level-</option>
<option value="tabs-stage">Dashboard Level</option>
<option value="districtTable">District Level</option>
<option value="pvt1">Institution Level</option>
</select> 
<button onclick="exportDataSelected();"><spring:message code="label_exporttoexcel"/></button></div>
</div>
<input id="saerchDashStateIndicators" type="hidden" name="" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_state_search"/>"/>
<input id="saerchDashDistrict" type="hidden" name="" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_district_search"/>"/>
<input id="saerchDashInstitution" type="hidden" name="" value="<spring:message code="shdrc_directorate${directorateId}_dashboard_institution_search"/>"/>
<div id="dashBoardFirst" class="dashBoardFirst" style="width:50%;background:#ffffcc;float:left;height:auto;margin-right:10px;margin-top:-3px;">
<ul class="tabs-nav">
    <li class=""><a href="#tab-1" rel="nofollow" style="font-size: 12px;height: 30px;line-height: 32px;"><spring:message code="shdrc_directorate_dashboard_tab_Monthly"/></a>
    </li>
</ul>
<div class="tabs-stage">
    <div id="tab-1" style="display:none;background:none;">
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
<div id="dashBoardSecond" class="dashBoardSecond" style="width:50%;height:auto;background:#ffffcc;overflow:auto;margin-left:785px;margin-top:27px;border-color: red;">
<div style="height:21px;background: rgb(135, 206, 250);">
<label style="white-space: nowrap;width: 100px;overflow: hidden; text-overflow: ellipsis;border: 0px solid #000000;display: inline-block;font-weight: bold;line-height:22px;color:#4E4B4B;font-family:Tahoma;font-size: 12px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;"><spring:message code="shdrc_directorate_drilldown_district"/></label><label id="districtLable" style="color:#4E4B4B;font-weight: bold;font-family:Tahoma;font-size: 12px;white-space: nowrap;width: 700px;overflow: hidden; text-overflow: ellipsis;border: 0px solid #000000;display: inline-block;font-weight: bold;line-height:22px;color:#4E4B4B;font-family:Tahoma;font-size: 12px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;"></label>
</div>
<div id="districtPreviewContent" style="height:150px; margin-top:117px;margin-left:200px;font-weight: bold;text-shadow: none;color:#4E4B4B"><spring:message code="shdrc_directorate_drilldown_district_msg"/></div>
<table id="districtTable"  style="width:100%;overflow:auto;">
  <tr>
    <th data-column-id="region">Region</th>
    <th data-column-id="distValue">Value</th>   
  </tr>
  <tbody id="districtTableTbody">
  </tbody>
</table>
</div>
</div>
<div id="dashBoardThird" class="dashBoardThird" style="width:99%;height:118px;background:#ffffcc;margin-top:188px;position:absolute;">
<div style="height:21px;background: rgb(135, 206, 250);width:100%;">
<label style="text-shadow: none;font-weight: bold;line-height:22px;color:#4E4B4B;background: rgb(135, 206, 250);font-family:Tahoma;font-size: 12px;"><spring:message code="shdrc_directorate_drilldown_institution"/></label><label id="institutionLable" style="color:#4E4B4B;font-weight: bold;font-family:Tahoma;font-size: 12px;"></label>
<%-- <button style="float:right;"onclick="tableToExcel('pvt1','sheet1')"><spring:message code="label_exporttoexcel"/></button> --%>
</div>
<div id="institutionPreview" class="institutionPreview" style="position:absolute;text-align: center;">
<div id="institutionPreviewContent" style="margin-top:65px;margin-left:450px;font-weight: bold;text-shadow: none;color:#4E4B4B"><spring:message code="shdrc_directorate_drilldown_institution_msg"/></div>
</div>
<div id="pvt1" style="width:100%;overflow: auto;">
</div>
</div>
</div>
<input type="hidden" id="selectedIndName" class="selectedIndName">
<div id="preContent" style="margin-left:250px;margin-top:100px;font-weight: normal;font-size: 12px;">
No Data Available
</div>
</body>
<script>
$('.tabs-nav a').on('click', function (event) {
 event.preventDefault();
 $('.tab-active').removeClass('tab-active');
 $(this).parent().addClass('tab-active');
 $('.tabs-stage div').hide();
 $($(this).attr('href')).show();
});

$('.tabs-nav a:first').trigger('click');
$( document ).ready(function() {
	$("#districtPreview").show();
	$("#preContent").hide();
	$("#districtPreviewContent").show();
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
	}
	var indDataList=${indJsonArray};
	if(indDataList.length <= 0){
		 $("#preContent").show();		 
		 $("#dashBoardTableTbodyId").append($("#preContent"));
		 $("table#dashBoardTableId thead tr th:nth-child(3)").css('width','158px');
		 $("table#dashBoardTableId tbody tr td:nth-child(3)").css('width','158px');	
		 	
	}else{
	 $("#dashBoardTableTbodyId").empty();
	 for(var i in indDataList) {
		 var toolTipData =indDataList[i]['ThresholdTooltip'].replace(/\s/g,'&nbsp;');
	 $("#dashBoardTableTbodyId").append('<tr"><td id="indicatorName" class="indicatorName">'+indDataList[i]['Indicator']+'</td><td class="indicatorState" id="indicatorState">'+indDataList[i]['State']+'</td><td title='+toolTipData+' id="indicatorVal" style="color:white;" bgcolor='+indDataList[i]['Threshold']+'>'+indDataList[i]['Value']+'</td></tr>'); 
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
	 		 async: true,
			 dataType: 'text',
	 		 data:jQuery.param({SelectedIndicatorName:selectedIndicator,Year:year,Month:month,IndFrequency:indCategory,DirectorateID:tempDirectorateId}),
	 		 success: function(result){ 	
	 			    var utils = $.pivotUtilities;
	 			    var res=JSON.parse(result);
	 			    var inddata=res.indicatorDetailsforDistrict; 			
	 			    if(Object.keys(inddata).length === 0){
	 			    	if(repeatCount<1){
		 			    	 repeatCount++;
		 			         $('table#dashBoardTableId tbody tr td.indicatorState').eq(1).trigger('click');
		 			      }
	 			    	return;
	 			    }
	 			   else{
	 				  $("#districtTable").show();
	 				  $("#districtPreviewContent").hide();
	 				  $("#districtTableTbody").empty();	 				 
	 					 for(var i in inddata) {
	 						var toolTipData =inddata[i][2].replace(/\s/g,'&nbsp;');
		 					 $("#districtTableTbody").append('<tr"><td id="zoneName" class="zoneName" onclick="interFace(this.innerHTML);">'+inddata[i][0]+'</td><td title='+toolTipData+' id="zoneVal"  bgcolor='+inddata[i][3]+'>'+inddata[i][1]+'</td></tr>'); 						
	 						}
	 					$('table#districtTable tbody tr td.zoneName').eq(0).trigger('click');	 						
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
		 async: true,
		 dataType: 'text',
		 data: jQuery.param({ Disrtict: selectedDisrtict, Indicator : indicatorNameTemp,Year:year,Month:month,IndFrequency:indCategory,DirectorateID:tempDirectorateId}),		 
		 success: function(result){ 	
			   var utils = $.pivotUtilities;
			    var res=JSON.parse(result);
			    var inddata=res.indicatorDetailsforDistrict;	
			    var colorCodesTemp=new Array();
			    for(var i in inddata){	 			    	
 	 			    	colorCodesTemp.push(inddata[i][4]);
 	 		    }	
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
				$("#pvt1").pivot(
						  inddata, {
						    rows: ["Zone"],
						    cols: ["Institution"],						  
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum",
						    rendererName: "Line Chart",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
				if(Object.keys(inddata).length === 0){
 			    	alert('No Institution data for '+selectedDisrtict+' district');
 			    }
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
				if(tempDirectorateId==1){
					$("#pvt1 table.pvtTable").find("tr").find('th.pvtRowTotalLabel').hide();
					$("#pvt1 table.pvtTable").find("tr").find('td.rowTotal').hide();
				}
	    },
	    error: function (xhr, status, error) {
            alert("Internal Error Occured-Please Contact System Administrator");
	    }});
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