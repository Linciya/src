<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<title>DMS Report Zone</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
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
	           , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
	           , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
	           , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
	         return function(table, name) {
	           if (!table.nodeType) table = document.getElementById(table)
	     
	           var selectedReport=document.getElementById("reportName");
	       	
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
			
			
			var selectedMonth=document.getElementById("month");
		 	
			 if (selectedMonth != 'undefined') {
				var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
				
			}
			 var selectedYear=document.getElementById("year");
			
				if(selectedYear!='undefined'){
					var YearName=selectedYear.options[selectedYear.selectedIndex].value;
				}
				 $("#pvt").find('tr:first').find('th').css("background", "#00b2ff");
					$("#pvt").find('tr:nth-child(2)').find('th').css("background", "#00b2ff");
					$("#pvt").find('tr').find('th').css("border", "1px groove black");
					$("#pvt").find('tr').find('th').css("border-collapse", "collapse");
					
				var innnertable='<table><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Report Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+reportName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+monthName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+YearName+'</b></td></tr>'+table.innerHTML+'</table>';
		     
			
	           var ctx = {worksheet: name || 'Worksheet',table: innnertable}
	           $("#pvt").find('th').css("background-color", "#e6EEEE");
	           $("#pvt").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
	       
		
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
</style>
	</head>
	
	<body onload ="onLoad();" style="font-family: Tahoma;">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
	 	<div class="zonesMainDiv" style="margin-left: -9px;">		
			<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_report_zone"/></div>	
				<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
			 	<table id="searchCriteria">
					<tr>
						<td class="searchCriteria"><spring:message code="label_searchcriteria_reports"/></td>
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="reportName" name="reportName" class="reportDropDown" onchange="reportOnChange();">

								<option value="<spring:message code="shdrc_report_zone1_1"/>"><spring:message code="shdrc_report_zone1_1"/></option>
								<option value="<spring:message code="shdrc_report_zone1_2"/>"><spring:message code="shdrc_report_zone1_2"/></option>
								<option value="<spring:message code="shdrc_report_zone1_3"/>"><spring:message code="shdrc_report_zone1_3"/></option>
								<option value="<spring:message code="shdrc_report_zone1_18"/>"><spring:message code="shdrc_report_zone1_18"/></option>
								<option value="<spring:message code="shdrc_report_zone1_22"/>"><spring:message code="shdrc_report_zone1_22"/></option>
							</select>
						</td>
						
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="frequency" name="frequency" class="reportDropDown" onchange="changeFrequency();">
							<!--<option value="yearly">Yearly</option> -->
								<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
								<option value="timeperiod"><spring:message code="option_frequency_timeperiod"/></option>
							</select> 
						</td>		
						<td class="searchCriteria" style="padding-left:20px;"><label id="yearName"><spring:message code="label_searchcriteria_year"/></label> <label id="timePeriodFrom"><spring:message code="label_searchcriteria_from"/></label></td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="year" name="year" class="reportDropDown" style="width: 70px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select> 
							
							<input type="text" id="txtFrom"/>
						</td>	
						<td class="searchCriteria" style="padding-left:20px;"><label id="monthName"><spring:message code="label_searchcriteria_month"/></label> <label id="timePeriodTo"><spring:message code="label_searchcriteria_to"/></label></td>
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="month" name="month" class="reportDropDown" style="width: 100px;">
									<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="months" items="${monthsList}">
		                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
		                		</c:forEach> 
							</select> 
							
							<input type="text" id="txtTo" />
						</td>
						<td class="searchCriteria" style="padding-left:20px;"><label id="districtName"><spring:message code="label_searchcriteria_district"/></label></td>
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="district" name="district" class="reportDropDown" style="width: 150px;">
									<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="districts" items="${districtList}">
		                    		<option value='<c:out value="${districts.name}"/>'>${districts.name} </option> 
		                		</c:forEach> 
							</select>
						</td>		
						<td class="searchCriteria"><button onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button></td>	
						<td class="searchCriteria" style="padding-left:30px;"><label id="Loading"><spring:message code="label_Loading"/></label></td>
		        <td class="searchCriteria" style="padding-left:2px;"><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:30px;"></td>
					</tr>			
					<div><button style="float:right;margin-right:10px;margin-top:7px;"onclick="tableToExcel('pvtTable','sheet1')"><spring:message code="label_exporttoexcel"/></button></div>
				</table>
				</div>
				
			<div id="pvt"  class="pivotTableStyle" style="width:99%;"></div>
			<div id="noDataMsg" align="center" style="width:100%;padding-top:70px;height:380px;"><p>This Report has no data for the selected Month and Year </p></div> 
				</div>	
			<script type="text/javascript">		
			var reportName;
			var year;
			var month;
			function onLoad(){
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
document.getElementById("timePeriodFrom").style.display="none";
				document.getElementById("txtFrom").style.display="none"; 	
				document.getElementById("timePeriodTo").style.display="none"; 
				document.getElementById("txtTo").style.display="none"; 
				$("#district").hide();
				$("#districtName").hide();				var month = "<%= request.getAttribute("month") %>";
				var year = <%= request.getAttribute("year") %>;
				var reportZoneData = <%= request.getAttribute("reportZoneData") %>;
				reportName = "<%= request.getAttribute("reportName") %>";
				$("#hiddenreportName").val(reportName);
				document.getElementById('year').value=year;
				document.getElementById('month').value=month;
				if(reportZoneData!=null && reportZoneData.length>1){
					document.getElementById("noDataMsg").style.display="none";
					document.getElementById("pvt").style.display="block";
					pivotTable(reportZoneData,reportName);
				}
				else{
					document.getElementById("pvt").style.display="none";
					document.getElementById("noDataMsg").style.display="block";
				}
			}
			
			function changeYearMonth(){
				document.getElementById("Loading").style.display="inline";
				document.getElementById("LoadingImage").style.display="inline";
				var fromMonth = null;
				var fromYear = null;
				var toMonth = null;
				var toYear = null;
				var district = $('#district').val();

				var selectedReport=document.getElementById("reportName");
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
				if(reportName == "Data Availability Status-Institution Wise"){
					if(district == "" || district == null){
						alert("Please select district");
						return false;
					}
				}
				var directorateId = document.getElementById("directorateId").value;
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
				$.ajax({
					type:"POST",
					url:'dmsReportZoneSearchChange.do',
					'data':{
						reportName:reportName,directorateId:directorateId,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,district:district
					},
					 success: function(result){
						 	var data = JSON.parse(result);
						 	if(data!=null && data.length>1){
								document.getElementById("noDataMsg").style.display="none";
								document.getElementById("pvt").style.display="block";
								pivotTable(data,reportName);
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
			
			function pivotTable(data,reportName){
				var rowName;
				if(reportName == "Data Availability Status-Institution Wise"){
					var utils = $.pivotUtilities;
					var heatmap =  utils.renderers["Table"];
					var sumOverSum =  utils.aggregators["Sum over Sum"];
					var derivers = $.pivotUtilities.derivers;
					$("#pvt").pivot(
							data, {
							   rows: ["Indicator","Institution","Value"],
							    //cols: [],
							   // vals:["Value"],
							    //aggregator: $.pivotUtilities.aggregators["Character Sum"](["Value"]),
							    //aggregatorName: "Sum over Sum",
							    rendererName: "Line Chart",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
					 $('table.pvtTable > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal').css({"display":"none"});
					 $('table.pvtTable .pvtColTotalLabel').css({"display":"none"});
					 $('table.pvtTable .pvtTotalLabel').css({"display":"none"});
				}else{
					if(reportName=="Surgeonwise Surgery"){
						rowName=["District","institutionType","institution","Speciality","Doctor"];
					}				
					else{
						rowName=["District","institutionType","institution"];
					}
					var utils = $.pivotUtilities;
					var heatmap =  utils.renderers["Table"];
					var sumOverSum =  utils.aggregators["Sum over Sum"];
					var derivers = $.pivotUtilities.derivers;
					$("#pvt").pivot(
							data, {
							    rows:rowName,
							    cols: ["indicator"],
							    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]), 
							    aggregatorName: "Sum over Sum",
							    rendererName: "Line Chart",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
				}
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
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
			function reportOnChange(){
				var reportName=$('#reportName').val();
				if(reportName == 'Data Availability Status-Institution Wise'){
					/* $("#frequency option[value='timeperiod']").remove(); */
					$("#frequency option[value='timeperiod']").hide();
					$("#district").show();
					$("#districtName").show();
				}
				else{
					/* $("#frequency").append('<option value="timeperiod">Time Period</option>'); */
					$("#frequency option[value='timeperiod']").show();
					$("#district").hide();
					$("#districtName").hide();
				}
				}
			</script> 
			<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
			
		
	</body>
</html>