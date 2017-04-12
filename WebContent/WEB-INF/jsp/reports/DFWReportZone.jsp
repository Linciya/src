<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<Style>
			.c3-line, .c3-focused {stroke-width: 3px !important;}
			.c3-bar {stroke: white !important; stroke-width: 1;}
			.c3 text { font-size: 12px; color: grey;}
			.tick line {stroke: white;}
			.c3-axis path {stroke: grey;}
			.c3-circle { opacity: 1 !important; }
			
		</Style>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>DFW Report Zone</title>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="pivot/js/jquery-ui.min.js"></script>
		<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
		<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"  />
		<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"  />
		<link href="css/menu-vertical.css" rel="stylesheet" type="text/css" />
		<script src="js/menu-vertical.js" type="text/javascript"></script>
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
	           if (!table.nodeType) table = document.getElementById("pvt")
	          // var criteria=document.getElementById("searchCriteria");
	          
	           
	          if (!table.nodeType) table = document.getElementById(table)
	         
	           var selectedCategory=document.getElementById("reportNameHeader").innerText;
				if (selectedCategory != 'undefined') {
					var categoryName=document.getElementById("reportNameHeader").innerText; 
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
				
					var selectedTimePeriodFrom=$("#txtFrom").val();
					
					 if (selectedTimePeriodFrom != 'undefined') {
						 var selectedTimePeriodFrom=$("#txtFrom").val();
							
						}
					 var selectedTimePeriodTo=$("#txtTo").val();
						
					 if (selectedTimePeriodTo != 'undefined') {
						 var selectedTimePeriodTo=$("#txtTo").val();
						
						}
					 $("#pvt").find('tr:first').find('th').css("background", "#00b2ff");
					 $("#pvt").find('tr').find('th').css("border", "1px groove black");
					 $("#pvt").find('tr').find('th').css("border-collapse", "collapse");
					 $("#pvt").find('tr').find('td').css("border", "1px groove black");
					 $("#pvt").find('tr').find('td').css("border-collapse", "collapse");
					var innnertable;	
					if (FrequencyName == 'timeperiod') {
						
						innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Report Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>From</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+selectedTimePeriodFrom+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>To</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+selectedTimePeriodTo+'</b></td></tr>'+table.innerHTML;
						}
				if (FrequencyName == 'monthly') {
					
				innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Report Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML;
				}
				
				var ctx = {worksheet: name || 'Worksheet',table: innnertable}
				 
				 $("#pvt").find('th').css("background-color", "#e6EEEE");
				 $("#pvt").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
				 $("#pvt").find('tr').find('td').css("border", "0.1px solid #CDCDCD");
	           
	           //var ctx = {worksheet: name || 'Worksheet',table: table.innerHTML}
	           window.location.href = uri + base64(format(template, ctx))
	         }
	       })()
		</script>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>	
		<style>
			div#pvt > #pvtTable{
				/* min-height: 180px; */
				min-width:100%;
			} 
			#mainDiv nav{
			margin-left: -10px;
		}
		#menu-v li > ul.sub > li > ul.sub >li a{
			cursor: pointer;
		}
		</style>
	</head>
	
	<body onload ="onLoad();" style="font-family: Tahoma;">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
	 	<div class="zonesMainDiv" style="margin-left: -9px;">		
			<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_report_zone"/>
			<span style="float:right;margin-right:150px;font-size:12px;cursor:pointer" onclick="getEmployeeReport('<%=request.getContextPath()%>','/dfwReportZoneEmployeeReport.do');">Employee Report</span>
			</div>	
			<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
			 	<table id="searchCriteria">
					<tr >
						<td class="searchCriteria"> 
							<ul id="menu-v">
							  <li><a>Report Name</a>
							        <ul class="sub">
									    <li style="width:130px;"><a>State</a>
									    	<ul class="sub">
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_19"/>','reportChange');"><spring:message code="shdrc_report_zone10_19"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_23"/>','reportChange');"><spring:message code="shdrc_report_zone10_23"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_25"/>','reportChange');"><spring:message code="shdrc_report_zone10_25"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_29"/>','reportChange');"><spring:message code="shdrc_report_zone10_29"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_31"/>','reportChange');"><spring:message code="shdrc_report_zone10_31"/></a></li> 
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_33"/>','reportChange');"><spring:message code="shdrc_report_zone10_33"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_35"/>','reportChange');"><spring:message code="shdrc_report_zone10_35"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_37"/>','reportChange');"><spring:message code="shdrc_report_zone10_37"/></a></li>
									        </ul>
									    </li>
									    <li style="width:130px;"><a>District</a>
									        <ul class="sub">
									           <li style="width:250px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_12"/>','reportChange');"><spring:message code="shdrc_report_zone10_12"/></a></li>
									           <li style="width:250px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_20"/>','reportChange');"><spring:message code="shdrc_report_zone10_20"/></a></li>
									           <li style="width:250px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_26"/>','reportChange');"><spring:message code="shdrc_report_zone10_26"/></a></li>
									           <li style="width:250px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_36"/>','reportChange');"><spring:message code="shdrc_report_zone10_36"/></a></li>										         
									        </ul>
									    </li>
									    <li style="width:130px;"><a>Institution</a>
									        <ul class="sub">
									            <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_21"/>','reportChange');"><spring:message code="shdrc_report_zone10_21"/></a></li>
									        </ul>
									    </li>
									    <li style="width:130px;"><a>Others</a>
									     	<ul class="sub" style="width:320px;height:250px;overflow-y: auto;" >
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_1"/>','reportChange');"><spring:message code="shdrc_report_zone10_1"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_2"/>','reportChange');"><spring:message code="shdrc_report_zone10_2"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_3"/>','reportChange');"><spring:message code="shdrc_report_zone10_3"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_4"/>','reportChange');"><spring:message code="shdrc_report_zone10_4"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_5"/>','reportChange');"><spring:message code="shdrc_report_zone10_5"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_6"/>','reportChange');"><spring:message code="shdrc_report_zone10_6"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_7"/>','reportChange');"><spring:message code="shdrc_report_zone10_7"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_8"/>','reportChange');"><spring:message code="shdrc_report_zone10_8"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_9"/>','reportChange');"><spring:message code="shdrc_report_zone10_9"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_10"/>','reportChange');"><spring:message code="shdrc_report_zone10_10"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_11"/>','reportChange');"><spring:message code="shdrc_report_zone10_11"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_12"/>','reportChange');"><spring:message code="shdrc_report_zone10_12"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_13"/>','reportChange');"><spring:message code="shdrc_report_zone10_13"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_14"/>','reportChange');"><spring:message code="shdrc_report_zone10_14"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_15"/>','reportChange');"><spring:message code="shdrc_report_zone10_15"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_16"/>','reportChange');"><spring:message code="shdrc_report_zone10_16"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_17"/>','reportChange');"><spring:message code="shdrc_report_zone10_17"/></a></li>										            
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_18"/>','reportChange');"><spring:message code="shdrc_report_zone10_18"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_22"/>','reportChange');"><spring:message code="shdrc_report_zone10_22"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_24"/>','reportChange');"><spring:message code="shdrc_report_zone10_24"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_27"/>','reportChange');"><spring:message code="shdrc_report_zone10_27"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_28"/>','reportChange');"><spring:message code="shdrc_report_zone10_28"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_30"/>','reportChange');"><spring:message code="shdrc_report_zone10_30"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_32"/>','reportChange');"><spring:message code="shdrc_report_zone10_32"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_34"/>','reportChange');"><spring:message code="shdrc_report_zone10_34"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_38"/>','reportChange');"><spring:message code="shdrc_report_zone10_38"/></a></li>
									            <%-- <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_39"/>','reportChange');"><spring:message code="shdrc_report_zone10_39"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_40"/>','reportChange');"><spring:message code="shdrc_report_zone10_40"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_41"/>','reportChange');"><spring:message code="shdrc_report_zone10_41"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_42"/>','reportChange');"><spring:message code="shdrc_report_zone10_42"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_43"/>','reportChange');"><spring:message code="shdrc_report_zone10_43"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_44"/>','reportChange');"><spring:message code="shdrc_report_zone10_44"/></a></li> --%>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_46"/>','reportChange');"><spring:message code="shdrc_report_zone10_46"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_47"/>','reportChange');"><spring:message code="shdrc_report_zone10_47"/></a></li>
									            <li><a onclick="changeYearMonth('<spring:message code="shdrc_report_zone10_48"/>','reportChange');"><spring:message code="shdrc_report_zone10_48"/></a></li>	
									         </ul>
									    </li>							
							    	</ul>
							    </li>
							</ul>
						</td>
						<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_frequency"/></td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="frequency" name="frequency" class="reportDropDown" onchange="changeFrequency();">
							<!--<option value="yearly">Yearly</option> -->
								<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
								<option value="timeperiod"><spring:message code="option_frequency_timeperiod"/></option>
							</select> 
						</td>		
						<td class="searchCriteria" style="padding-left:20px;"><label id="yearName"><spring:message code="label_searchcriteria_year"/></label> <label id="timePeriodFrom"><spring:message code="label_searchcriteria_from"/></label></td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="year" name="year" class="reportDropDown">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select> 
							
							<input type="text" id="txtFrom"/>
						</td>	
						<td class="searchCriteria" style="padding-left:20px;"><label id="monthName"><spring:message code="label_searchcriteria_month"/></label> <label id="timePeriodTo"><spring:message code="label_searchcriteria_to"/></label></td>
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="month" name="month" class="reportDropDown">
									<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="months" items="${monthsList}">
		                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
		                		</c:forEach> 
							</select> 
							
							<input type="text" id="txtTo" />
						</td>	
						<td class="searchCriteria">
							<button onclick="changeYearMonth('','timeperiodChange');"><spring:message code="label_searchcriteria_search"/></button>
						</td>
						<td class="searchCriteria" style="padding-left:30px;"><label id="Loading"><spring:message code="label_Loading"/></label></td>
		                <td class="searchCriteria" style="padding-left:2px;"><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:30px;"></td>							
					</tr>			
					<div><button style="float:right;margin-right:10px;margin-top:9px;"onclick="tableToExcel('pvtTable','sheet1')"><spring:message code="label_exporttoexcel"/></button></div>
				</table>
				</div>
				<div id="reportNameHeader"></div>
			<div id="pvt" class="pivotTableStyle"></div>
			<div id="noDataMsg" align="center" style="width:100%;padding-top:70px;height:380px;"><p>This Report has no data for the selected Month and Year </p></div> 
			</div>	
			<script type="text/javascript">		
			$("#menu-v li").not($('#menu-v li sub li a')).click(function (e) {
		        $('ul.sub').not( $(this).children()).slideUp("slow");
		        $(this).children("ul.sub").slideToggle("slow");
		        e.stopPropagation()
		    });
			
			function onLoad(){
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
				document.getElementById("timePeriodFrom").style.display="none";
				document.getElementById("txtFrom").style.display="none"; 	
				document.getElementById("timePeriodTo").style.display="none"; 
				document.getElementById("txtTo").style.display="none"; 	
				var month = "<%= request.getAttribute("month") %>";
				var year = <%= request.getAttribute("year") %>;
				var reportZoneData = <%= request.getAttribute("reportZoneData") %>;
				var reportName = "<%= request.getAttribute("reportName") %>";
				document.getElementById('year').value=year;
				document.getElementById('month').value=month;
				document.getElementById('reportNameHeader').innerText=reportName;
				if(reportZoneData!=null && reportZoneData.length>2){
					document.getElementById("noDataMsg").style.display="none";
					document.getElementById("pvt").style.display="block";
					pivotTable(reportZoneData,reportName,month,year);
				}
				else{
					document.getElementById("pvt").style.display="none";
					document.getElementById("noDataMsg").style.display="block";
				}
			}
			
			function changeYearMonth(selectedReportName,changeReq){
				document.getElementById("Loading").style.display="inline";
				document.getElementById("LoadingImage").style.display="inline";
				var reportName = null;
				var fromMonth = null;
				var fromYear = null;
				var toMonth = null;
				var toYear = null;
				
				if(changeReq=="reportChange"){
					reportName=selectedReportName;
					document.getElementById("reportNameHeader").innerHTML = reportName;
				}
				else if(changeReq=="timeperiodChange"){
					reportName=document.getElementById("reportNameHeader").innerHTML;
				}
				
				var selectedFreq=document.getElementById("frequency");
				var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;
				if(freqName=='monthly'){				
					var selectedMonth=document.getElementById("month");
					 if (selectedMonth != 'undefined') {
						var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
					}
					var year=document.getElementById("year");
					if(year!='undefined'){
						var selectedYear=year.options[year.selectedIndex].value;
					}
					fromMonth = monthName;
					fromYear = selectedYear;
					toMonth = monthName;
					toYear = selectedYear;
				}
				else if(freqName=='timeperiod'){
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
				
				var directorateId = document.getElementById("directorateId").value;
				
				$.ajax({
					type:"POST",
					url:'dfwReportZoneSearchChange.do',
					'data':{
						reportName:reportName,directorateId:directorateId,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear
					},
					 success: function(result){
						 	var data = JSON.parse(result);
						 	if(data!=null && data.length>2){
								document.getElementById("noDataMsg").style.display="none";
								document.getElementById("pvt").style.display="block";
								pivotTable(data,reportName,toMonth,toYear);
							}
							else{
								document.getElementById("pvt").style.display="none";
								document.getElementById("noDataMsg").style.display="block";
								document.getElementById("Loading").style.display="none";
								document.getElementById("LoadingImage").style.display="none";
							}		 	
					 },
					 error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					    }});
				}
			
			function pivotTable(data,reportName,month,year){					
				var rowName;	
				rowName=getRowName(reportName,month,year);	
				var colName=getColName(reportName); 
				
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
				var aggregatorValue=getAggregator(reportName);
				$("#pvt").pivot(
					data, {
					    rows:rowName,
					    cols: colName,
					    aggregator: aggregatorValue, 
					    aggregatorName: "Sum over Sum",
					    rendererName: "Line Chart",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					}
				);
				 var reportStyle=getReportStyle(reportName); 
				 document.getElementById("Loading").style.display="none";
					document.getElementById("LoadingImage").style.display="none";
			}	
			
			 function getReportStyle(reportName){
				if((reportName=="DFW_Female_Sterilisation") || (reportName=="DFW_Male_Sterilisation_New") || (reportName=="DFW_IUCD_Performance") 
							|| (reportName=="DFW_PPIUCD_Performance") || (reportName=="DFW_Total_Sterilisation") || (reportName=="DFW_CC_Programme") 
							|| (reportName=="DFW_OP_Programme") || (reportName=="DFW_Sterilisation_Performance_Comparison")
							|| (reportName=="Sterilisation_IUCD_Performance") || (reportName=="DFW_IUCD_Performance_Comparison") 
							|| (reportName=="Sterilization_Acceptors_2_Less_Than_2") || (reportName=="Sterilization_Acceptors_One_Child") || (reportName=="MTP_Performance")
							|| (reportName=="DFW Performance with respect to ELD") || (reportName=="DFW Performance of Methods") || (reportName=="DFW Performance - Sharing of Contribution")){
					$('tbody > tr > th .pvtColTotalLabel, .colTotal, .pvtGrandTotal').css({"display":"none"});
					$('thead > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal').css({"display":"none"});
					$('table.pvtTable .pvtRowTotalLabel').css({"display":"none"});
					$('table.pvtTable .pvtColTotalLabel').css({"display":"none"});
					$('table.pvtTable .pvtTotalLabel').css({"display":"none"});
				}
				 else if((reportName=="Contraceptive_Stock_Position") || (reportName=="District_Wise_Hospital_Deliveries")
						|| (reportName=="PHC_Sterilization") || (reportName=="Hospital_Sterilization") || (reportName=="DFW_DERep_AccreditedPvtHosplDist")
						|| (reportName=="DFW_DERep_AccreditedPvtHosplState") || (reportName=="DFW_DERep_DrugSupply") || (reportName=="DFW_DERep_Equipment")
						|| (reportName=="DFW_DERep_EquipmentState") || (reportName=="DFW_DERep_Finance") || (reportName=="DFW_DERep_FinanceState")
						|| (reportName=="DFW_DERep_HRDFWBConsolidation") || (reportName=="DFW_DERep_HRDistrict") || (reportName=="DFW_DERep_HRInstitution")
						|| (reportName=="DFW_DERep_HRInstDistrictConsolidation") || (reportName=="DFW_DERep_HRState") || (reportName=="DFW_DERep_Indemnity")
						|| (reportName=="DFW_DERep_KitsState") || (reportName=="DFW_DERep_ProposedTrainingState") || (reportName=="DFW_DERep_TrainingState")
						|| (reportName=="DFW_DERep_VehiclesState") || (reportName=="DFW_DERep_Kits") || (reportName=="DFW_DERep_ProposedTraining") 
						|| (reportName=="DFW_DERep_Training") || (reportName=="DFW_DERep_Vehicles")){
					$('thead > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal').css({"display":"none"});
					$('table.pvtTable .pvtRowTotalLabel').css({"display":"none"});
				}
			} 
			
			function getRowName(reportName,month,year){
				var rowName;		
				if((reportName=="DFW_Female_Sterilisation") || (reportName=="DFW_Male_Sterilisation_New") || (reportName=="DFW_IUCD_Performance") 
						|| (reportName=="DFW_PPIUCD_Performance") || (reportName=="DFW_Total_Sterilisation") || (reportName=="DFW_CC_Programme") 
						|| (reportName=="DFW_OP_Programme")){
					rowName=["District","eld","proportionate","Previous month","Current month","Upto month","per_wrt_eld","rank_by_per_wrt_eld"];
				}
				else if((reportName=="Contraceptive_Stock_Position") || (reportName=="District_Wise_Hospital_Deliveries")
						|| (reportName=="PHC_Sterilization") || (reportName=="Hospital_Sterilization") || (reportName=="DFW_DERep_AccreditedPvtHosplDist")
						|| (reportName=="DFW_DERep_HRDFWBConsolidation") || (reportName=="DFW_DERep_HRDistrict")|| (reportName=="DFW_DERep_HRInstDistrictConsolidation")){
					rowName=["District"];
				}
				else if((reportName=="DFW_Sterilisation_Performance_Comparison")|| (reportName=="Sterilisation_IUCD_Performance") 
						|| (reportName=="DFW_IUCD_Performance_Comparison")){
					rowName=["District","Current Year","Previous Year","Inc Dec","Per Inc Dec"];
				}
				else if((reportName=="Sterilization_Acceptors_2_Less_Than_2") || (reportName=="Sterilization_Acceptors_One_Child")){
					rowName=["District","Total Sterilization","Sterilization with less than 2 children","Per Sterilization with less than 2 children","Rank"];
				}
				else if((reportName=="DFW_DERep_AccreditedPvtHosplState") || (reportName=="DFW_DERep_EquipmentState") || (reportName=="DFW_DERep_FinanceState")
						|| (reportName=="DFW_DERep_HRState")|| (reportName=="DFW_DERep_KitsState") || (reportName=="DFW_DERep_ProposedTrainingState") 
						|| (reportName=="DFW_DERep_TrainingState") || (reportName=="DFW_DERep_VehiclesState")){
					rowName=["Indicator"];
				}
				else if((reportName=="DFW_DERep_DrugSupply") || (reportName=="DFW_DERep_Equipment") || (reportName=="DFW_DERep_Finance")
						 || (reportName=="DFW_DERep_HRInstitution") || (reportName=="DFW_DERep_Indemnity") || (reportName=="DFW_DERep_Kits") 
						 || (reportName=="DFW_DERep_ProposedTraining") || (reportName=="DFW_DERep_Training") || (reportName=="DFW_DERep_Vehicles")){
					rowName=["District","Institution Type","Institution Name"];
				}
				else if(reportName=="MTP_Performance"){	
					rowName=["District","Sterilisation upto" + " " + month + " " + year,"IUD upto" + " " + month + " " + year,
					         "OP_CC upto" + " " + month + " " + year,"Total upto" + " " + month + " " + year,"Last Year","Inc/Dec"];
				}
				else if(reportName=="DFW Performance with respect to ELD"){
					rowName=["Programme","Annual eld","Performance during" + " " + month + " " + year,"Performance upto" + " " + month + " " + year,
					         "Percentage wrt eld"];
				}
				else if(reportName=="DFW Performance of Methods"){
					rowName=["Method","Current","Previous","Increase/Decrease","Percentage of Increase/Decrease"];
				}
				else if(reportName=="DFW Performance - Sharing of Contribution"){
					rowName=["Department","Current Year","Percentage of Performance","Previous Year","Increase/Decrease"];
				}
				return rowName;
			}
			
			function getColName(reportName){
				var colName;		
				if((reportName=="Contraceptive_Stock_Position") || (reportName=="District_Wise_Hospital_Deliveries")
						|| (reportName=="PHC_Sterilization") || (reportName=="Hospital_Sterilization") || (reportName=="DFW_DERep_DrugSupply")){
					colName=["Indicator"];
				}	
				else if((reportName=="DFW_DERep_AccreditedPvtHosplDist") || (reportName=="DFW_DERep_Equipment") || (reportName=="DFW_DERep_Finance")
						|| (reportName=="DFW_DERep_HRDFWBConsolidation") || (reportName=="DFW_DERep_HRDistrict") || (reportName=="DFW_DERep_HRInstitution")
						|| (reportName=="DFW_DERep_HRInstDistrictConsolidation") || (reportName=="DFW_DERep_Indemnity") || (reportName=="DFW_DERep_Kits") 
						|| (reportName=="DFW_DERep_ProposedTraining") || (reportName=="DFW_DERep_Training")	|| (reportName=="DFW_DERep_Vehicles")){
					colName=["Indicator","General Name"];
				}
				else if((reportName=="DFW_DERep_AccreditedPvtHosplState") || (reportName=="DFW_DERep_EquipmentState") || (reportName=="DFW_DERep_FinanceState")
						 || (reportName=="DFW_DERep_HRState")|| (reportName=="DFW_DERep_KitsState") || (reportName=="DFW_DERep_ProposedTrainingState") 
						 || (reportName=="DFW_DERep_TrainingState") || (reportName=="DFW_DERep_VehiclesState")){
					colName=["General Name"];
				}
				/* else if(reportName=="MTP_Performance"){
					colName=["Indicator Category"];
				} */
				return colName;
			} 
		
		 function getAggregator(reportName){
			var aggregatorValue;
			if((reportName=="DFW_Female_Sterilisation") || (reportName=="DFW_Male_Sterilisation_New") || (reportName=="DFW_IUCD_Performance") 
					|| (reportName=="DFW_PPIUCD_Performance") || (reportName=="DFW_Total_Sterilisation") || (reportName=="DFW_CC_Programme") 
					|| (reportName=="DFW_OP_Programme") || (reportName=="DFW_Sterilisation_Performance_Comparison")|| (reportName=="Sterilisation_IUCD_Performance") 
					|| (reportName=="DFW_IUCD_Performance_Comparison") || (reportName=="Sterilization_Acceptors_2_Less_Than_2") 
					|| (reportName=="Sterilization_Acceptors_One_Child") || (reportName=="MTP_Performance")){
				aggregatorValue = $.pivotUtilities.aggregators["Integer Sum"]([""]);
			}
			else if((reportName=="Contraceptive_Stock_Position") || (reportName=="District_Wise_Hospital_Deliveries")
					|| (reportName=="PHC_Sterilization") || (reportName=="Hospital_Sterilization") || (reportName=="DFW_DERep_AccreditedPvtHosplDist")
					|| (reportName=="DFW_DERep_AccreditedPvtHosplState") || (reportName=="DFW_DERep_DrugSupply") || (reportName=="DFW_DERep_Equipment")
					|| (reportName=="DFW_DERep_EquipmentState") || (reportName=="DFW_DERep_Finance") || (reportName=="DFW_DERep_FinanceState")
					|| (reportName=="DFW_DERep_HRDFWBConsolidation") || (reportName=="DFW_DERep_HRDistrict") || (reportName=="DFW_DERep_HRInstitution")
					|| (reportName=="DFW_DERep_HRInstDistrictConsolidation") || (reportName=="DFW_DERep_HRState") || (reportName=="DFW_DERep_Indemnity")
					|| (reportName=="DFW_DERep_KitsState") || (reportName=="DFW_DERep_ProposedTrainingState") || (reportName=="DFW_DERep_TrainingState")
					|| (reportName=="DFW_DERep_VehiclesState") || (reportName=="DFW_DERep_Kits") || (reportName=="DFW_DERep_ProposedTraining") 
					|| (reportName=="DFW_DERep_Training") || (reportName=="DFW_DERep_Vehicles")){
				aggregatorValue = $.pivotUtilities.aggregators["Integer Sum"](["Value"]);
			}
			return aggregatorValue;
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
					document.getElementById("txtFrom").value=""; 	
					document.getElementById("txtTo").value=""; 	
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
					
			        var searchMinDate = "-6y";
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
			
			function getEmployeeReport(contextPath,actionServlet){
				var directorateId = document.getElementById("directorateId").value;
		 			document.location.href=contextPath+actionServlet+'?directorateId='+directorateId;
		 	}
		</script> 
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
	</body>
</html>