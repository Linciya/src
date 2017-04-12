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

table#grid-basic {
     border: 1px solid #CCCCCC;
     border-spacing: 0;
     height:100px;
     font-size: 10px;
}
table#grid-basic th {
    background-color: #DCE9F9;
    background-image: -moz-linear-gradient(center top , #F8F8F8, #ECECEC);
    background-image: -webkit-gradient(linear, 0 0, 0 bottom, from(#F8F8F8), to(#ECECEC), color-stop(.4, #F8F8F8));
    border-top: medium none;   
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
}

table#grid-basic td, table#grid-basic th {
     border: 1px solid #ECECEC; 
     text-align: left;
     font-size: 12px;
     width:82%;
}
/* table#grid-basic tr td:nth-child(3) {
    width: 100%;
} */
.searchMenu{
margin-left:270px;
margin-top:-535px;
}
#grid-basic tr td.indicatorState:HOVER {
	cursor:pointer;
	text-decoration: underline;
}
#districtTable tr td.firstColumnName:HOVER,td.secondColumnName:HOVER,td.thirdColumnName:HOVER,td.fourthColumnName:HOVER{
    cursor:pointer;
	text-decoration: underline;
}
#grid-basic tr,td{
font-size: 12px;
font-family: Tahoma;
text-shadow:none;
text-decoration:none;
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
<!--  -->
<style>
table#topleftdistrictTable {
    font-family: thahoma, sans-serif;
    border-collapse: collapse;
    width: 100%;
    font-size: 12px;
}
table#topleftdistrictTable th {
    background-color: #dddddd;
    background-image: -moz-linear-gradient(center top , green, green);
    background-image: -webkit-gradient(linear, 0 0, 0 bottom, from(#F8F8F8), to(rgb(135, 206, 250)), color-stop(.0, rgb(135, 206, 250)));
    border-top: medium none;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
    height: 30px;
    text-align:left;
    width:20px;
}
table#topleftdistrictTable td {
    border: 1px solid #87CEFA;
    text-align: left;
    padding: 3px;
    width:20px;
}

table#topleftdistrictTable tr:nth-child(even) {
    background-color: #dddddd;
}

</style>
<!-- district end -->

<!--  -->
<style>
.toprightdistrictTable {
    font-family: thahoma, sans-serif;
    border-collapse: collapse;
    width: 100%;
    font-size: 12px;    
}
table#toprightdistrictTable th {
    background-color: #dddddd;
    background-image: -moz-linear-gradient(center top , green, green);
    background-image: -webkit-gradient(linear, 0 0, 0 bottom, from(#F8F8F8), to(rgb(135, 206, 250)), color-stop(.0, rgb(135, 206, 250)));
    border-top: medium none;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
    height: 30px;
    text-align:left;
    width:20px;
}
table#toprightdistrictTable td {
    border: 1px solid #87CEFA;
    text-align: left;
    padding: 3px;
    width:20px;    
}

table#toprightdistrictTable tr:nth-child(even) {
    background-color: #dddddd;
}





table#bottomdistrictTable {
    font-family: thahoma, sans-serif;
    border-collapse: collapse;
    width: 100%;
    font-size: 12px;
}
table#bottomdistrictTable th {
    background-color: #dddddd;
    background-image: -moz-linear-gradient(center top , green, green);
    background-image: -webkit-gradient(linear, 0 0, 0 bottom, from(#F8F8F8), to(rgb(135, 206, 250)), color-stop(.0, rgb(135, 206, 250)));
    border-top: medium none;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
    height: 30px;
    text-align:left;
    width:20px;
}
table#bottomdistrictTable td {
    border: 1px solid #87CEFA;
    text-align: left;
    padding: 3px;
    width:20px;
}

table#bottomdistrictTable tr:nth-child(even) {
    background-color: #dddddd;
}

</style>
</head>
<body style="width:100%;">

<div id="searchMenu" class="searchMenu" >

<form id="indicatorForm" class="indicatorForm" action="tnmscSearchIndicatorList.do" method="POST">
<label id="directorateNameHeader" style="margin-left:-275px;margin-top:200px;font-size: 12px;font-weight: bold;"><spring:message code="shdrc_directorate_short_name${directorateId}"/> <spring:message code="shdrc_dashboard_zone"/></label>
&nbsp;&nbsp;&nbsp;TNMSC Dashboard <select id="dashBoardName" name="dashBoardName" class="dashBoardName"  style="width:450px;">
<option value="<spring:message code="shdrc_dashboard_zone3_1"/>"><spring:message code="shdrc_dashboard_zone3_1"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_2"/>"><spring:message code="shdrc_dashboard_zone3_2"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_3"/>"><spring:message code="shdrc_dashboard_zone3_3"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_10"/>"><spring:message code="shdrc_dashboard_zone3_10"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_12"/>"><spring:message code="shdrc_dashboard_zone3_12"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_13"/>"><spring:message code="shdrc_dashboard_zone3_13"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_14"/>"><spring:message code="shdrc_dashboard_zone3_14"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_7"/>"><spring:message code="shdrc_dashboard_zone3_7"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_8"/>"><spring:message code="shdrc_dashboard_zone3_8"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_9"/>"><spring:message code="shdrc_dashboard_zone3_9"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_19"/>"><spring:message code="shdrc_dashboard_zone3_19"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_20"/>"><spring:message code="shdrc_dashboard_zone3_20"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_21"/>"><spring:message code="shdrc_dashboard_zone3_21"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_18"/>"><spring:message code="shdrc_dashboard_zone3_18"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_11"/>"><spring:message code="shdrc_dashboard_zone3_11"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_15"/>"><spring:message code="shdrc_dashboard_zone3_15"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_16"/>"><spring:message code="shdrc_dashboard_zone3_16"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_17"/>"><spring:message code="shdrc_dashboard_zone3_17"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_22"/>"><spring:message code="shdrc_dashboard_zone3_22"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_4"/>"><spring:message code="shdrc_dashboard_zone3_4"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_5"/>"><spring:message code="shdrc_dashboard_zone3_5"/></option>
<option value="<spring:message code="shdrc_dashboard_zone3_6"/>"><spring:message code="shdrc_dashboard_zone3_6"/></option>
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
<button  id="searchIndicator" class="searchIndicator" onclick="dashBoardChangeRequest();"><spring:message code="label_searchcriteria_search"/></button>
</form>
<div id="exportDataDIv" class="exportDataDIv"><label>Select Div to Export </label><select id="exportDIVData" name="exportDIVData" class="exportDIVData" style="width:110px;height:20px;">
<option value="-Select Level-">-Select Level-</option>
<option value="topleftdistrictTable">Left Table</option>
<option value="toprightdistrictTable">Right Table</option>
</select> 
<button onclick="exportDataSelected();"><spring:message code="label_exporttoexcel"/></button></div>
</div>
<div id="topView" style="width:100%;height:300px;margin-left:-5px;">
<div id="leftDIV" style="float:left;width:49%;border-style: solid;border-color:rgba(11, 171, 41, 0.17);height:300px;overflow-x: auto;">
</div>
<div id="rightDIV" style="float:right;width:50%;border-style: solid;border-color:rgba(11, 171, 41, 0.17);border-collapse: collapse;height:300px;overflow-x: auto;">
</div>
</div>
<div id="bottomView" style="width:100%;height:300px;margin-left:-5px;">
<div id="bottomDIV" style="float:left;width:100%;border-style: solid;border-color:rgba(11, 171, 41, 0.17);border-collapse: collapse;height:300px;overflow-x: auto;">
</div>
</div>
<input id="hideTempDashName" type="hidden" value="<%=request.getAttribute("dashBoardName")%>">
<input id="jsonArrayFirstTable" type="hidden" value="<%=request.getAttribute("jsonArrayFirstTable")%>">
<input id="jsonArraySecondTable" type="hidden" value="<%=request.getAttribute("jsonArraySecondTable")%>">
<input id="headerFirstlist" type="hidden" value="<%=request.getAttribute("headerFirstlist")%>">
<input id="headerSecondlist" type="hidden" value="<%=request.getAttribute("headerSecondlist")%>">
</body>
<script type="text/javascript">
		  var tableToExcel = (function() {            
          var uri = 'data:application/vnd.ms-excel;base64,'
            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
          return function(table, name) {
            if (!table.nodeType) table = document.getElementById(table) 
          /*  table=document.getElementById(elementId).getElementsByTagName('table')[0]; */
           /* //alert("table content"+table.innerHTML); */
           
            
            var selecteddashBoardName=document.getElementById("dashBoardName");
           	
        	if (selecteddashBoardName != 'undefined') {
        		
        		
        		var dashBoardNameVal=selecteddashBoardName.options[selecteddashBoardName.selectedIndex].value;
            }
        	var selectedMonth=document.getElementById("month");
        	
         	
        	 if (selectedMonth != 'undefined') {
        		var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
        		
        		if(monthName == 0){
                	var monthNameVal = "January";
        			
        		}
        		else if(monthName == 1){
                	var monthNameVal = "February";
        			
        		}
        		else if(monthName == 2){
                	var monthNameVal = "march";
        			
        		}
        		else if(monthName == 3){
                	var monthNameVal = "April";
        			
        		}
        		else if(monthName == 4){
                	var monthNameVal = "may";
        			
        		}
        		else if(monthName == 5){
                	var monthNameVal = "June";
        			
        		}
        		else if(monthName == 6){
                	var monthNameVal = "July";
        			
        		}
        		else if(monthName == 7){
                	var monthNameVal = "Auguest";
        			
        		}
        		else if(monthName == 8){
                	var monthNameVal = "September";
        			
        		}
        		else if(monthName == 9){
                	var monthNameVal = "October";
        			
        		}
        		else if(monthName == 10){
                	var monthNameVal = "November";
        			
        		}
        		else if(monthName == 11){
                	var monthNameVal = "December";
        			
        		}
             
        	}
        	 var selectedYear=document.getElementById("year");
        		if(selectedYear!='undefined'){
        			var YearName=selectedYear.options[selectedYear.selectedIndex].value;
        			
        		}
        		$("#topleftdistrictTable").find('th').css("background-color", "#00b2ff");
        		$("#toprightdistrictTable").find('th').css("background-color", "#00b2ff");
        		 $("#topleftdistrictTable").find('tr').find('th').css("border", "1px groove black");
     			$("#topleftdistrictTable").find('tr').find('th').css("border-collapse", "collapse");
     			 $("#topleftdistrictTable").find('tr').find('td').css("border", "1px groove black");
     			$("#topleftdistrictTable").find('tr').find('td').css("border-collapse", "collapse");
     			
     			 $("#toprightdistrictTable").find('tr').find('th').css("border", "1px groove black");
     			$("#toprightdistrictTable").find('tr').find('th').css("border-collapse", "collapse");
     			 $("#toprightdistrictTable").find('tr').find('td').css("border", "1px groove black");
     			$("#toprightdistrictTable").find('tr').find('td').css("border-collapse", "collapse");
        		
        	var innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>TNMSC Dashboard Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+dashBoardNameVal+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+monthNameVal+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+YearName+'</b></td></tr>'+table.innerHTML;

            var ctx = {worksheet: name || 'Worksheet', table:innnertable}
            
            $("#topleftdistrictTable").find('tr').find('th').css("border", "0.1px solid #87CEFA");
            $("#topleftdistrictTable").find('tr').find('td').css("border", "0.1px solid #87CEFA");
            $("#toprightdistrictTable").find('tr').find('th').css("border", "0.1px solid #87CEFA");
            $("#toprightdistrictTable").find('tr').find('td').css("border", "0.1px solid #87CEFA");
            
            
            
            window.location.href = uri + base64(format(template, ctx))
          }
        })()
</script>
<script>
$( document ).ready(function() {
	$("#topleftdistrictTable").empty();
	$("#toprightdistrictTable").empty();
	var tempdashboard=$("#hideTempDashName").val();
	var tempYear=${Year};
	var tempMonth=${Month};
	var tempscreenNo=${noOfScreens};
	$("#dashBoardName").val(tempdashboard)
	$("#year").val(tempYear);
	$("#month").val(tempMonth);
	var dirID=${directorateId};
	if(tempdashboard=='PD Account Balance' || tempdashboard=='No. of drug items not finalized in current year tender' || tempdashboard=='Un-utilized Passbooks'){
		if(tempscreenNo==2){
			var dirID=${directorateId};
			$("#bottomDIV").hide();
			var indDataList=<%=request.getAttribute("jsonArrayFirstTable")%>;
		    var indDataList1=<%=request.getAttribute("jsonArraySecondTable")%>;
			var arr =<%=request.getAttribute("headerFirstlist")%>;
			var arr1 =<%=request.getAttribute("headerSecondlist")%>;
			//first table start
			 var resultstring='<table id="topleftdistrictTable">';
		     for(var j=0;j<arr.length;j++){
		             //array arr contains the field names in this case
		         resultstring+= '<th>'+ arr[j] + '</th>';
		     }
		     var count;
		     var dataLength=arr.length-1;
		     var bgcolor;
		     $(indDataList).each(function(i, result) {
		         // resultset is in json format
		          count=0;
		          bgcolor='';
		         resultstring+='<tr>';
		         for(var j=0;j<arr.length;j++){
		        	 if(dataLength===count){
		             	bgcolor='style="color:white;background-color:'+result[dataLength+1]+'"';
		              }
		        	 resultstring+='<td id="topleftdistrictTable_'+count+'" '+ bgcolor+'>'+ result[j]+ '</td>';
		        	 count++;
		         }         
		         resultstring+='</tr>';
		     });
		     resultstring+='</table>';
		         $('#leftDIV').html(resultstring);
			
		         //first table end
			
			    //second table start
		         var resultstring='<table id="toprightdistrictTable" class="toprightdistrictTable">';
		         for(var j=0;j<arr1.length;j++){
		                 //array arr contains the field names in this case
		             resultstring+= '<th>'+ arr1[j] + '</th>';
		         }
		         var count;
		         var dataLength=arr1.length-1;
		         var bgcolor;
		         $(indDataList1).each(function(i, result) {
		             // resultset is in json format
		             count=0;
		             bgcolor='';
		             resultstring+='<tr>';
		             for(var j=0;j<arr1.length;j++){                
		                 if(dataLength===count){
		                	bgcolor='style="color:white;background-color:'+result[dataLength+1]+'"';
		                 }
		                 resultstring+='<td id="toprightdistrictTable_'+count+'" '+ bgcolor+'>'+ result[j]+ '</td>';
		                 count++;
		             }
		             resultstring+='</tr>';
		         });
		         resultstring+='</table>';
		             $('#rightDIV').html(resultstring);
		             $('table#toprightdistrictTable tr td:eq(1)').css('min-width','120px');
		        }//If condition end
	}
	
	if(tempdashboard=='Nil ground Stock' ||tempdashboard=='Nil QC-passed Stock' ||tempdashboard=='Less Stock' ||tempdashboard=='No. of suppliers of a Drug Items' || tempdashboard=='Blacklisted Products or Firm in current tender(by Performance)' ||  tempdashboard=='QC Result pending (Tablets or Capsules)' || tempdashboard=='QC Result pending (Fluids)' || tempdashboard=='Blacklisted Products or Firm in current tender(by Quality)' || tempdashboard=='ASV,ARV,TT,TCV Stock' || tempdashboard=='Empanelled Laboratories for Sample Testing' || tempdashboard=='Online Indent non-performance' || tempdashboard=='Local Purchase' || tempdashboard=='Hospital Stock' || tempdashboard=='Hypertensive, Diabeties, IV-Fluid, Cancer, Narcotic Stock'){
		if(tempscreenNo==1){
			$("table#topleftdistrictTable").css("height","500px");
			$("table#topleftdistrictTable").css("overflow","auto");
			var dirID=${directorateId};
			$("#bottomDIV").hide();
			$("#rightDIV").hide();
			
			var indDataList=<%=request.getAttribute("jsonArrayFirstTable")%>;
			var arr =<%=request.getAttribute("headerFirstlist")%>;
			//first table start
			 var resultstring='<table id="topleftdistrictTable">';
		     for(var j=0;j<arr.length;j++){
		             //array arr contains the field names in this case
		         resultstring+= '<th>'+ arr[j] + '</th>';
		     }
		     var count;
		     var dataLength=arr.length-1;
		     var bgcolor;
		     $(indDataList).each(function(i, result) {
		         // resultset is in json format
		          count=0;
		          bgcolor='';
		         resultstring+='<tr>';
		         for(var j=0;j<arr.length;j++){
		        	 if(dataLength===count){
		             	bgcolor='style="color:white;background-color:'+result[dataLength+1]+'"';
		              }
		        	 resultstring+='<td id="topleftdistrictTable_'+count+'" '+ bgcolor+'>'+ result[j]+ '</td>';
		        	 count++;
		         }         
		         resultstring+='</tr>';
		     });
		     resultstring+='</table>';
		         $('#leftDIV').html(resultstring);
		         if(tempdashboard=='No. of suppliers of a Drug Items'){
		        	 $('table#topleftdistrictTable tr td:eq(1)').css('min-width','500px');
		        	 $('table#topleftdistrictTable tr td:eq(2)').css('min-width','10px');
		         }
		         if(tempdashboard=='Blacklisted Products or Firm in current tender(by Performance)'||tempdashboard=='Blacklisted Products or Firm in current tender(by Quality)'||tempdashboard=='QC Result pending (Tablets or Capsules)'||tempdashboard=='QC Result pending (Fluids)'||tempdashboard=='Empanelled Laboratories for Sample Testing'){
		        	 $('table#topleftdistrictTable tr td:eq(0)').css('min-width','600px');
		         }
		}
	}
	
	if(tempdashboard=='Warranty or AMC Expiry Date for Category A and B 1 Equipments'){
		if(tempscreenNo==3){
			var dirID=${directorateId};			
			var indDataList=<%=request.getAttribute("jsonArrayFirstTable")%>;
		    var indDataList1=<%=request.getAttribute("jsonArraySecondTable")%>;
		    var indDataList2=<%=request.getAttribute("jsonArrayThirdTable")%>;
			var arr =<%=request.getAttribute("headerFirstlist")%>;
			var arr1 =<%=request.getAttribute("headerSecondlist")%>;
			var arr2 =<%=request.getAttribute("headerThirdlist")%>;
			//first table start
			 var resultstring='<table id="topleftdistrictTable">';
		     for(var j=0;j<arr.length;j++){
		             //array arr contains the field names in this case
		         resultstring+= '<th>'+ arr[j] + '</th>';
		     }
		     var count;
		     var dataLength=arr.length-1;
		     var bgcolor;
		     $(indDataList).each(function(i, result) {
		         // resultset is in json format
		          count=0;
		          bgcolor='';
		         resultstring+='<tr>';
		         for(var j=0;j<arr.length;j++){
		        	 if(dataLength===count){
		             	bgcolor='style="color:white;background-color:'+result[dataLength+1]+'"';
		              }
		        	 resultstring+='<td id="topleftdistrictTable_'+count+'" '+ bgcolor+'>'+ result[j]+ '</td>';
		        	 count++;
		         }         
		         resultstring+='</tr>';
		     });
		     resultstring+='</table>';
		         $('#leftDIV').html(resultstring);
			
		         //first table end
			
			    //second table start
		         var resultstring='<table id="toprightdistrictTable" class="toprightdistrictTable">';
		         for(var j=0;j<arr1.length;j++){
		                 //array arr contains the field names in this case
		             resultstring+= '<th>'+ arr1[j] + '</th>';
		         }
		         var count;
		         var dataLength=arr1.length-1;
		         var bgcolor;
		         $(indDataList1).each(function(i, result) {
		             // resultset is in json format
		             count=0;
		             bgcolor='';
		             resultstring+='<tr>';
		             for(var j=0;j<arr1.length;j++){                
		                 if(dataLength===count){
		                	bgcolor='style="color:white;background-color:'+result[dataLength+1]+'"';
		                 }
		                 resultstring+='<td id="toprightdistrictTable_'+count+'" '+ bgcolor+'>'+ result[j]+ '</td>';
		                 count++;
		             }
		             resultstring+='</tr>';
		         });
		         resultstring+='</table>';
		             $('#rightDIV').html(resultstring);
		             $('table#toprightdistrictTable tr td:eq(1)').css('min-width','120px');
		             
		             //Second Table End
		             
		             //Third Table Start
		             var resultstring='<table id="bottomdistrictTable" class="bottomdistrictTable">';
			         for(var j=0;j<arr2.length;j++){
			                 //array arr contains the field names in this case
			             resultstring+= '<th>'+ arr2[j] + '</th>';
			         }
			         var count;
			         var dataLength=arr2.length-1;
			         var bgcolor;
			         $(indDataList2).each(function(i, result) {
			             // resultset is in json format
			             count=0;
			             bgcolor='';
			             resultstring+='<tr>';
			             for(var j=0;j<arr2.length;j++){                
			                 if(dataLength===count){
			                	bgcolor='style="color:white;background-color:'+result[dataLength+1]+'"';
			                 }
			                 resultstring+='<td id="bottomdistrictTable_'+count+'" '+ bgcolor+'>'+ result[j]+ '</td>';
			                 count++;
			             }
			             resultstring+='</tr>';
			         });
			         resultstring+='</table>';
			             $('#bottomDIV').html(resultstring);
		        }
	}
       
});

function exportDataSelected(){
	var selectedDivVal=$("#exportDIVData").val();
	if(selectedDivVal==="-Select Level-"){
		alert('Please select at least one level to export');
	}
	else if(selectedDivVal==="toprightdistrictTable"){
		tableToExcel('toprightdistrictTable','sheet1');
	}else{
		tableToExcel("topleftdistrictTable",'sheet1')
	}
}
</script>
</html>