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
    background: /* #FFE5CC */#90EEBF;
   /*  border-bottom-color: hsla(0, 0%, 0%, 0); */
    color: #4682B4/* hsl(85, 54%, 51%) */;
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
    border: 1px solid black;
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
margin-left:670px;
margin-top:-15px;
}
#grid-basic tr td.indicatorState:HOVER {
	cursor: pointer;
}
#grid-basic tr,td{
font-size: 12px;
font-family: Tahoma;
text-shadow:none;
text-decoration:none;
}
.dashBoardParent{
margin-top: -520px;
}
.dashBoardSecond{
position: absolute;
}
table.pvtTable{
width:100%;
}
#pvt1 table.pvtTable{
height: 170px;
}
nav ul#menu li a {
    display: block;
    height: 50px;
    font-size: 1.4em;
    line-height: 50px;
    color: #fff;
    text-decoration: none;
    padding: 0 15px;
}
#mainDiv {
margin-left: -10px;
}
</style> 
</head>
<body style="width:100%;background:#E7FFE7;">
<div id="dashBoardParent" class="dashBoardParent" style="width:100%;">
<div id="topDIV" class="topDIV" style="width:100%;height:150px;">
<label style="font-size: 12px;font-weight: bold;"><spring:message code="shdrc_directorate_dashboard1_header"/></label>
<div id="searchMenu" class="searchMenu" >
<form id="indicatorForm" class="indicatorForm" method="POST" action="dmsSearchIndicatorList.do">
<lable><spring:message code="label_searchcriteria_frequency"/></lable> <select id="indFrequency" name="indFrequency" class="indFrequency" style="width:150px;">
<option value="Monthly">Monthly</option>
</select>
<lable><spring:message code="label_searchcriteria_year"/></lable>  
	<select id="year" name="year" class="dropDown">
		<c:forEach var="year" items="${yearList}">
    			<option value='<c:out value="${year}"/>'>${year} </option>
			</c:forEach>
	</select> 
<lable><spring:message code="label_searchcriteria_month"/></lable> 
	<select id="month" name="month" class="dropDown">
		<c:forEach var="months" items="${monthsList}">
                		<option value='<c:out value="${months.id}"/>'>${months.name} </option> 
            		</c:forEach> 
	</select>
<button  id="searchIndicator" class="searchIndicator" onclick="searchIndicatorsByFilter();"><spring:message code="label_searchcriteria_search"/></button>
</form>
</div>

<div id="dashBoardFirst" class="dashBoardFirst" style="width:50%;background:#4682B4;float:left;height:auto;margin-right:10px;margin-top:-10px;overflow: scroll;">
<ul class="tabs-nav">
    <li class=""><a href="#tab-1" rel="nofollow" style="font-size: 12px;"><spring:message code="shdrc_directorate_dashboard_tab_Monthly"/></a>
    </li>
   <button style="float:right;"onclick="tableToExcelReport('tabs-stage','sheet1')"><spring:message code="label_exporttoexcel"/></button>   
</ul>
<div class="tabs-stage">
    <div id="tab-1" style="display:none;background:#4682B4;height:240px;">
      <table id="grid-basic" class="table table-condensed table-hover table-striped" style="border: 1px solid #B2D5DE;overflow: scroll;;border-collapse: collapse;color:white;" border="1" width="650">
    <thead>
        <tr>
            <th data-column-id="id" data-type="numeric">Dashboard Name</th>
            <th data-column-id="sender">State</th>            
            <th data-column-id="received" data-order="desc">Dashboard Figure</th>
        </tr>
    </thead>
    <tbody id="indicatorData">    
    </tbody>
</table>
    </div>   
</div>
</div>
<div id="dashBoardSecond" class="dashBoardSecond" style="width:49%;height:auto;background:#B2D5DE;overflow:scroll;margin-left:672px;margin-top:-10px;">
<div style="height:21px;">
<label style="text-shadow: none;font-weight: bold;"><spring:message code="shdrc_directorate_drilldown_district"/></label>
<button style="float:right;"onclick="tableToExcel('pvt','sheet1')"><spring:message code="label_exporttoexcel"/></button>
</div>
<div id="districtPreview" class="districtPreview" style="position:absolute;">
<div id="districtPreviewContent" style="margin-top:80px;margin-left:200px;font-weight: bold;text-shadow: none;"><spring:message code="shdrc_directorate_drilldown_district_msg"/></div>
</div>
<div id="pvt" style="width:100%; height:280px "></div>
</div>
</div>
<div id="dashBoardThird" class="dashBoardThird" style="width:99%;height:195px;background:#B2D5DE;margin-top:175px;overflow: auto;position:absolute;">
<div style="height:21px;">
<label style="text-shadow: none;font-weight: bold;"><spring:message code="shdrc_directorate_drilldown_institution"/></label>
<button style="float:right;"onclick="tableToExcel('pvt1','sheet1')"><spring:message code="label_exporttoexcel"/></button>
</div>
<div id="institutionPreview" class="institutionPreview" style="position:absolute;text-align: center;">
<div id="institutionPreviewContent" style="margin-top:80px;margin-left:450px;font-weight: bold;text-shadow: none;"><spring:message code="shdrc_directorate_drilldown_institution_msg"/></div>
</div>
<div id="pvt1" style="width:100%;">
</div>
</div>
</div>
<input type="hidden" id="selectedIndName" class="selectedIndName">
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
	$("#institutionPreview").show();
	var indYr=${indicatorYer};
	var indMnt=${indicatorMnth};
	if(indYr==null){}else{
	$("#year").val(indYr);
	}
	if(indMnt==null){}else{
	$("#month").val(indMnt);
	}
	var indDataList=${indJsonArray};
	if(indDataList.length <= 0){
		alert('No Data Available.');
		return false;
	}else{
	 for(var i in indDataList) {
		 var toolTipData =indDataList[i]['ThresholdTooltip'].replace(/\s/g,'&nbsp;');
	 $("#indicatorData").append('<tr"><td id="indicatorName" class="indicatorName">'+indDataList[i]['Indicator']+'</td><td  onclick="callNext(this);" class="indicatorState" id="indicatorState">'+indDataList[i]['State']+'</td><td title='+toolTipData+' id="indicatorVal"  bgcolor='+indDataList[i]['Threshold']+'>'+indDataList[i]['Value']+'</td></tr>'); 
	}
	}
	<%-- var tempFrncy=<%request.getParameter("indicatorFrqncy");%>
	 var tempYer=<%request.getParameter("indicatorYer");%>
	 var tempMnth=<%request.getParameter("indicatorMnth");%>
	 if(!tempFrncy.isEmpty()){
		 $("#indFrequency").val(tempFrncy);
	 }
	 if(tempYer!=''){
		 $("#year").val(tempYer);
	 }
	 if(tempMnth!=''){
		 $("#month").val(tempMnth);
	 } --%>
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
	$("#indicatorForm").submit();
}
function callNext(x){		 
	$("table#grid-basic tbody tr").click(function(){
	    var selectedIndicator=($(this).find('td:first').html());
	    $('#selectedIndName').val(selectedIndicator);
	    if(selectedIndicator!=null){
	      $.ajax({		
	 		 type: "POST",
	 		 url: "dmsReportForDistrict.do",	
	 		 async: false,
			 dataType: 'text',
	 		 data:jQuery.param({SelectedIndicatorName:selectedIndicator}),
	 		 success: function(result){ 	
	 			    var utils = $.pivotUtilities;
	 			    var res=JSON.parse(result);
	 			    var inddata=res.indicatorDetailsforDistrict;			  
	 				var heatmap =  utils.renderers["Table"];
	 				var sumOverSum =  utils.aggregators["Sum over Sum"];
	 				var derivers = $.pivotUtilities.derivers;	 				
	 				$("#pvt").pivot(
	 						  inddata, {
	 						    rows: ["District"],
	 						    cols: ["Indicator"],	 						   
	 						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
	 						    aggregatorName: "Sum",
	 						    rendererName: "Line Chart",
	 					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
	 						  }); 
	 				$("#districtPreviewContent").hide();
	 				$("#districtPreview").hide();				
	 				$("#dashBoardSecond").show();
	 	    },
	 	    error: function(result) {	    	
	             
	         }});
	    }
    });	
}
</script>
<script type="text/javascript">
$(document).on("click", "#pvtTable tr th.pvtRowLabel", function(e) {
	var selectedDisrtict=this.innerText;
	var indicatorNameTemp= $('#selectedIndName').val();
	$.ajax({		
		 type: "POST",
		 url: "dmsReportForInstitution.do",	
		 async: false,
		 dataType: 'text',
		 data: jQuery.param({ Disrtict: selectedDisrtict, Indicator : indicatorNameTemp}),		 
		 success: function(result){ 	
			   var utils = $.pivotUtilities;
			    var res=JSON.parse(result);
			    var inddata=res.indicatorDetailsforDistrict;			   
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;				
				$("#pvt1").pivot(
						  inddata, {
						    rows: ["District"],
						    cols: ["Institution"],						  
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),
						    aggregatorName: "Sum",
						    rendererName: "Line Chart",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  });
				$("#institutionPreviewContent").hide();
				$("#institutionPreview").hide();
				$("#dashBoardThird").show();
	    },
	    error: function(result) {	    	
           
       }});
});
</script>
</html>