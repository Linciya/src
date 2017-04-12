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
		<title>CMCHIS Report Zone</title>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
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
	          // var criteria=document.getElementById("searchCriteria");
	           var ctx = {worksheet: name || 'Worksheet',table: table.innerHTML}
	           window.location.href = uri + base64(format(template, ctx))
	         }
	       })()
		</script>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>	
		<style>
			div#pvt > #pvtTable{
			min-height: 180px; 
			min-width:100%;
		} 
		
		/* .pvtTotal, .pvtTotalLabel, .pvtGrandTotal {display: none} */
		/* to hide column total*/
		 tbody > tr > th .pvtColTotalLabel, .colTotal, .pvtGrandTotal { display: none; } 
		 
		/* to hide row total */
		thead > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal { display: none; }
		
		 table.pvtTable .pvtRowTotalLabel {
		    display: none;
		} 
		table.pvtTable .pvtColTotalLabel {
		    display: none;
		} 
		table.pvtTable .pvtTotalLabel {
		    display: none;
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
							<select id="reportName" name="reportName" class="reportDropDown" style="width: 350px;">
								<option value="<spring:message code="shdrc_report_zone17_1"/>"><spring:message code="shdrc_report_zone17_1"/></option>
								<option value="<spring:message code="shdrc_report_zone17_2"/>"><spring:message code="shdrc_report_zone17_2"/></option>
								<option value="<spring:message code="shdrc_report_zone17_3"/>"><spring:message code="shdrc_report_zone17_3"/></option>
								<option value="<spring:message code="shdrc_report_zone17_4"/>"><spring:message code="shdrc_report_zone17_4"/></option>
								<option value="<spring:message code="shdrc_report_zone17_5"/>"><spring:message code="shdrc_report_zone17_5"/></option>
								<option value="<spring:message code="shdrc_report_zone17_6"/>"><spring:message code="shdrc_report_zone17_6"/></option>	
								<option value="<spring:message code="shdrc_report_zone17_7"/>"><spring:message code="shdrc_report_zone17_7"/></option>
								<option value="<spring:message code="shdrc_report_zone17_8"/>"><spring:message code="shdrc_report_zone17_8"/></option>
								<option value="<spring:message code="shdrc_report_zone17_9"/>"><spring:message code="shdrc_report_zone17_9"/></option>
								<option value="<spring:message code="shdrc_report_zone17_10"/>"><spring:message code="shdrc_report_zone17_10"/></option>
								<option value="<spring:message code="shdrc_report_zone17_11"/>"><spring:message code="shdrc_report_zone17_11"/></option>
								<option value="<spring:message code="shdrc_report_zone17_12"/>"><spring:message code="shdrc_report_zone17_12"/></option>
								<option value="<spring:message code="shdrc_report_zone17_13"/>"><spring:message code="shdrc_report_zone17_13"/></option>
								<option value="<spring:message code="shdrc_report_zone17_14"/>"><spring:message code="shdrc_report_zone17_14"/></option>
								<option value="<spring:message code="shdrc_report_zone17_15"/>"><spring:message code="shdrc_report_zone17_15"/></option>
								<option value="<spring:message code="shdrc_report_zone17_16"/>"><spring:message code="shdrc_report_zone17_16"/></option>
								<option value="<spring:message code="shdrc_report_zone17_17"/>"><spring:message code="shdrc_report_zone17_17"/></option>
								<option value="<spring:message code="shdrc_report_zone17_18"/>"><spring:message code="shdrc_report_zone17_18"/></option>
								<option value="<spring:message code="shdrc_report_zone17_19"/>"><spring:message code="shdrc_report_zone17_19"/></option>
								<option value="<spring:message code="shdrc_report_zone17_20"/>"><spring:message code="shdrc_report_zone17_20"/></option>
								<option value="<spring:message code="shdrc_report_zone17_21"/>"><spring:message code="shdrc_report_zone17_21"/></option>
								<option value="<spring:message code="shdrc_report_zone17_22"/>"><spring:message code="shdrc_report_zone17_22"/></option>
								<option value="<spring:message code="shdrc_report_zone17_23"/>"><spring:message code="shdrc_report_zone17_23"/></option>
								<option value="<spring:message code="shdrc_report_zone17_24"/>"><spring:message code="shdrc_report_zone17_24"/></option>
								<option value="<spring:message code="shdrc_report_zone17_25"/>"><spring:message code="shdrc_report_zone17_25"/></option>
								<option value="<spring:message code="shdrc_report_zone17_26"/>"><spring:message code="shdrc_report_zone17_26"/></option>
								<option value="<spring:message code="shdrc_report_zone17_27"/>"><spring:message code="shdrc_report_zone17_27"/></option>
								<option value="<spring:message code="shdrc_report_zone17_28"/>"><spring:message code="shdrc_report_zone17_28"/></option>
								<option value="<spring:message code="shdrc_report_zone17_29"/>"><spring:message code="shdrc_report_zone17_29"/></option>
							</select> 
						</td>
						<%-- <td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_frequency"/></td>	
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
						</td>	 --%>
						<td class="searchCriteria"><button onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button></td>	
						<td class="searchCriteria" style="padding-left:30px;"><label id="Loading"><spring:message code="label_Loading"/></label></td>
		                <td class="searchCriteria" style="padding-left:2px;"><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:30px;"></td>
					</tr>			
					<div><button style="float:right;margin-right:10px;margin-top:7px;"onclick="tableToExcel('pvtTable','sheet1')"><spring:message code="label_exporttoexcel"/></button></div>
				</table>
				
				</div>	
			<div id="pvt" class="pivotTableStyle"></div>
			<div id="noDataMsg" align="center" style="width:100%;padding-top:70px;height:380px;"><p>This Report has no data for the selected Month and Year </p></div> 
				</div>
			<script type="text/javascript">		
			
			function onLoad(){
				<%-- document.getElementById("timePeriodFrom").style.display="none";
				document.getElementById("txtFrom").style.display="none"; 	
				document.getElementById("timePeriodTo").style.display="none"; 
				document.getElementById("txtTo").style.display="none"; 	
				var month = "<%= request.getAttribute("month") %>";
				var year = <%= request.getAttribute("year") %>; --%>
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
				var reportZoneData = <%= request.getAttribute("reportZoneData") %>;
				var reportName = "<%= request.getAttribute("reportName") %>";
				/* document.getElementById('year').value=year;
				document.getElementById('month').value=month; */
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
				/* var fromMonth = null;
				var fromYear = null;
				var toMonth = null;
				var toYear = null; */
				document.getElementById("Loading").style.display="inline";
				document.getElementById("LoadingImage").style.display="inline";
				var selectedReport=document.getElementById("reportName");
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
				var directorateId = document.getElementById("directorateId").value;
				/* var selectedFreq=document.getElementById("frequency");
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
				} */
				$.ajax({
					type:"POST",
					url:'cmchisReportZoneSearchChange.do',
					'data':{
						reportName:reportName,directorateId:directorateId/* ,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear */
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
				if(reportName=="CMCHIS_Dengue"){				
					rowName=["District_Name","totalcount","totalsum","tn0407count","tn0407amt","tn0422count","tn0422amt","tn0644count","tn0644amt","tn0650count","tn0650amt","tn0669count","tn0669amt"];
				}
				else if((reportName=="CMCHIS-Claims-Zone Wise") || (reportName=="CMCHIS-DC-Zone Wise")){				
					rowName=["District_Name","Amt","Approved","Approved_Claims_Head","Claims_Head_Amt","Total_Approved","Total_Amt_Approved"];	
				}
				else if((reportName=="CMCHIS-Diagnos-Centres-Claims") || (reportName=="CMCHIS-Diagnos-Centres-DC")){				
					rowName=["Diag_Centre","District","Approved_Amt","Claims_Approved"];			
				}
				else if((reportName=="CMCHIS-Medical-College-Gvt") || (reportName=="CMCHIS-Preauth-Hosp Wise - Gvt") || (reportName=="CMCHIS-Preauth-Hosp Wise - Pvt") || (reportName=="CMCHIS-Tie-Up-Pvt")){				
					rowName=["Instituion_Name","District_Name","Approved","Cancelled","Denied","Process"];		
				}
				else if((reportName=="CMCHIS-Preauth-Beneficiary-Govt") || (reportName=="CMCHIS-Preauth-Beneficiary-Pvt")){				
					rowName=["Activity","Nos","Amt"];			
				}
				else if((reportName=="CMCHIS -Preauth-Claims Status-Govt") || (reportName=="CMCHIS-Preauth-Claims  Status-Pvt")){				
					rowName=["Module_Flag","Status","Amt","Count_By_Status"];			
				}
				else if((reportName=="CMCHIS-Preauth Disease Wise - Gvt") || (reportName=="CMCHIS-PreauthDisease Wise - Pvt")){				
					rowName=["General_Type","Preauth_sought","Approved","Cancelled","Need_More_Info","Denied","Process"];	
				}
				else if((reportName=="CMCHIS-Preauth District-Hosp Wise - Gvt") || (reportName=="CMCHIS-Preauth District-Hosp Wise - Pvt")){				
					rowName=["District_Name","Preauth","Amt"];			
				}
				else if(reportName=="CMCHIS-Preauth Hospital Wise Approved-Pvt"){	
					rowName=["Instituion_Name","District_Name","Total","Count"];			
				}
				else if((reportName=="CMCHIS-Preauth Patient-District Wise - Gvt") || (reportName=="CMCHIS-Preauth Patient-District Wise - Pvt")){				
					rowName=["District_Name","Approved","Cancelled","Denied","Process"];			
				}
				else if(reportName=="CMCHIS-Preauth Procedure Wise Approved-Pvt"){				
					rowName=["Package_or_Procedure","District_Name","Total","Count"];			
				}
				else if((reportName=="CMCHIS-Preauth Procedure Wise-Gvt") || (reportName=="CMCHIS-Preauth Procedure Wise-Pvt")){				
					rowName=["Package_or_Procedure","Preauth_sought","Approved","Cancelled","Need_More_Info","Denied","Process","Amt"];			
				}
				else if((reportName=="CMCHIS-Preauth-Spl & Pro Wise - Gvt") || (reportName=="CMCHIS-Preauth-Spl & Pro Wise - Pvt")){				
					rowName=["Category","Package_or_Procedure","Amt"];			
				}
				else if((reportName=="CMCHIS-Procedure-Wise-Claims") || (reportName=="CMCHIS-Procedure-Wise-DC")){				
					rowName=["Package_or_Procedure","Claims_sought","Approved","Cancelled","Need_More_Info","Denied","Process","Amt"];			
				}
				else if((reportName=="CMCHIS-Status-Claims") || (reportName=="CMCHIS-Status-DC")){				
					rowName=["Status","Amt","Count"];			
				}
								
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
				$("#pvt").pivot(
						data, {
						    rows:rowName,
						   /* cols: [], */ 
						  /*   aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]),  */
 							aggregator: $.pivotUtilities.aggregators["Integer Sum"]([""]), 
						    aggregatorName: "Sum over Sum",
						    rendererName: "Line Chart",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 	 
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
			}
			
			/* function changeFrequency(){
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
			}  */
		</script> 
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
	</body>
</html>