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
		<title>DFW Report Zone Employee Report</title>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="pivot/js/jquery-ui.min.js"></script>
		<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
		<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"  />
		<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"  />
		<link href="css/menu-vertical.css" rel="stylesheet" type="text/css" />
		<script src="js/menu-vertical.js" type="text/javascript"></script>
		<script src="pivot/js/pivotui.min.js"></script>
		<script src="pivot/js/tips_data.min.js"></script>
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
	           if (!table.nodeType) table = $( ".pvtTable");
	          // var criteria=document.getElementById("searchCriteria");
	           var ctx = {worksheet: name || 'Worksheet',table: table.innerHTML}
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
			
			.pvtTotal, .pvtTotalLabel, .pvtGrandTotal {display: none}
		</style>
	</head>
	
	<body onload ="onLoad();" style="font-family: Tahoma;">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
	 	<div class="zonesMainDiv">		
			<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - Employee Report
			<span style="float:right;margin-right:150px;font-size:12px;cursor:pointer" onclick="getReportZone('<%=request.getContextPath()%>','/dfwReportZone.do');">Report Zone</span>
			</div>	
			<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
			 	<table id="searchCriteria">
					<tr >
						<td class="searchCriteria"><spring:message code="label_searchcriteria_reports"/></td>	
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="reportName" name="reportName" class="reportDropDown" style="width:250px;"> <!-- onchange="changeReportName();" -->
								<%-- <option value="<spring:message code="shdrc_report_zone10_39"/>"><spring:message code="shdrc_report_zone10_39"/></option>
								<option value="<spring:message code="shdrc_report_zone10_40"/>"><spring:message code="shdrc_report_zone10_40"/></option>
								<option value="<spring:message code="shdrc_report_zone10_41"/>"><spring:message code="shdrc_report_zone10_41"/></option>
								<option value="<spring:message code="shdrc_report_zone10_42"/>"><spring:message code="shdrc_report_zone10_42"/></option>
								<option value="<spring:message code="shdrc_report_zone10_43"/>"><spring:message code="shdrc_report_zone10_43"/></option>
								<option value="<spring:message code="shdrc_report_zone10_44"/>"><spring:message code="shdrc_report_zone10_44"/></option> --%>
							<option value="<spring:message code="shdrc_report_zone10_45"/>"><spring:message code="shdrc_report_zone10_45"/></option>
							</select> 
						</td>	
						<td class="searchCriteria" style="padding-left:5px;"><spring:message code="label_searchcriteria_frequency"/></td>	
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="frequency" name="frequency" class="reportDropDown" style="width:100px;" onchange="changeFrequency();">
							<!--<option value="yearly">Yearly</option> -->
								<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
								<option value="timeperiod"><spring:message code="option_frequency_timeperiod"/></option>
							</select> 
						</td>		
						<td class="searchCriteria" style="padding-left:5px;"><label id="yearName"><spring:message code="label_searchcriteria_year"/></label> <label id="timePeriodFrom"><spring:message code="label_searchcriteria_from"/></label></td>	
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="year" name="year" class="reportDropDown" style="width:70px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select> 
							
							<input type="text" id="txtFrom"/>
						</td>	
						<td class="searchCriteria" style="padding-left:5px;"><label id="monthName"><spring:message code="label_searchcriteria_month"/></label> <label id="timePeriodTo"><spring:message code="label_searchcriteria_to"/></label></td>
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="month" name="month" class="reportDropDown" style="width:90px;">
									<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="months" items="${monthsList}">
		                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
		                		</c:forEach> 
							</select> 
							
							<input type="text" id="txtTo" />
						</td>	
						<%-- <td class="searchCriteria" style="padding-left:5px;">
							<label id="lblCommunity">Community</label>
							<label id="lblDesignation">Designation</label>
							<label id="lblGender">Gender</label>
							<label id="lblGroup">Group/Category</label>
							<label id="lblMaritalStatus">Marital Status</label> 
						</td>
							<td class="searchCriteria" style="padding-left:3px;">
								<select name="community" id="community" size="1" class="reportDropDown">
									<option value="">--Select--</option>
								    <option value="SC/ST">SC/ST</option>
								    <option value="MBC">MBC</option>
								    <option value="DNC">DNC</option>
								    <option value="BC muslim">BC muslim</option>
								    <option value="BC Others">BC Others</option>
								    <option value="OC">OC</option>
								</select>
								
								 <select name="designation" id="designation" size="1" class="reportDropDown">
									 <option value="">--Select--</option>
								     <c:forEach var="designation" items="${postList}">
									 <option value='<c:out value="${designation.name}"/>'>${designation.name} </option>
									 </c:forEach>
								</select>
							
								<select id="gender" name="gender" class="reportDropDown">
									<option value="">--Select--</option>
									<option value="M">Male</option> 
									<option value="F">Female</option> 
									<option value="TG">TG</option> 
								</select>								
								
								<select name="groupCategory" id="groupCategory" size="1" class="reportDropDown">
									<option value="">--Select--</option>
								    <option value="A">A</option>
								    <option value="B">B</option>
								    <option value="C">C</option>
								    <option value="D">D</option>
								</select>
								
								<select id="maritalStatus" name="maritalStatus" class="reportDropDown">
		  							<option value="">--Select--</option>
		  							<option value="Unmarried">Unmarried</option>
									<option value="Married">Married</option>
						 			<option value="Widow">Widow</option>
								</select> 
				         </td> --%>
						
						<td class="searchCriteria">
							<button id="searchBtn" onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button>
						</td>							
					</tr>						
					<div><button style="float:right;margin-right:10px;margin-top:5px;"onclick="tableToExcel('pvtTable','sheet1')"><spring:message code="label_exporttoexcel"/></button></div>
				</table>
				
				
				</div>
				<%-- <div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
				<div id="empReportSearch"> 
					<table id="searchCriteria">
						<tr>
							<td class="searchCriteria" >Community</td>
							<td class="searchCriteria" style="padding-left:3px;">
								<select name="community" id="community" size="1" class="reportDropDown">
									<option value="">--Select--</option>
								    <option value="SC/ST">SC/ST</option>
								    <option value="MBC">MBC</option>
								    <option value="DNC">DNC</option>
								    <option value="BC muslim">BC muslim</option>
								    <option value="BC Others">BC Others</option>
								    <option value="OC">OC</option>
								</select>
							</td>
							<td class="searchCriteria" >Designation</td>
							<td class="searchCriteria" style="padding-left:3px;">
								<select name="designation" id="designation" size="1" class="reportDropDown">
									 <option value="">--Select--</option>
								     <c:forEach var="designation" items="${postList}">
									 <option value='<c:out value="${designation.name}"/>'>${designation.name} </option>
									 </c:forEach>
								</select>
							</td>
							<td class="searchCriteria" >Gender</td>
							<td class="searchCriteria" style="padding-left:3px;">
								<select id="gender" name="gender" class="reportDropDown">
									<option value="">--Select--</option>
									<option value="M">Male</option> 
									<option value="F">Female</option> 
									<option value="TG">TG</option> 
								</select>
							</td>
							<td class="searchCriteria" >Group/Category</td>
							<td class="searchCriteria" style="padding-left:3px;">
								<select name="groupCategory" id="groupCategory" size="1" class="reportDropDown">
									<option value="">--Select--</option>
								    <option value="A">A</option>
								    <option value="B">B</option>
								    <option value="C">C</option>
								    <option value="D">D</option>
								</select>
							</td>
							<td class="searchCriteria" >Marital Status</td>
							<td class="searchCriteria" style="padding-left:3px;">
								<select id="maritalStatus" name="maritalStatus" class="reportDropDown">
		  							<option value="">--Select--</option>
		  							<option value="Unmarried">Unmarried</option>
									<option value="Married">Married</option>
						 			<option value="Widow">Widow</option>
								</select>
							</td>	
							<td class="searchCriteria">
							<button onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button>
						</td>						        
						</tr>
					</table>
				</div>
				</div> --%>
			<div id="pvt" class="pivotTableStyle"></div>
			<div id="noDataMsg" align="center" style="width:100%;padding-top:70px;height:380px;"><p>This Report has no data for the selected Month and Year </p></div> 
			</div>	
			<script type="text/javascript">		
			
			function onLoad(){
				document.getElementById("timePeriodFrom").style.display="none";
				document.getElementById("txtFrom").style.display="none"; 	
				document.getElementById("timePeriodTo").style.display="none"; 
				document.getElementById("txtTo").style.display="none"; 
				/* document.getElementById('empReportSearch').style.display="none";
				document.getElementById('lblDesignation').style.display="none";
				document.getElementById('designation').style.display="none";
				document.getElementById('lblGender').style.display="none";
				document.getElementById('gender').style.display="none";
				document.getElementById('lblCommunity').style.display="inline";
				document.getElementById('community').style.display="inline";
				document.getElementById('lblGroup').style.display="none";
				document.getElementById('groupCategory').style.display="none";
				document.getElementById('lblMaritalStatus').style.display="none";
				document.getElementById('maritalStatus').style.display="none";	
				document.getElementById('searchBtn').style.display="inline"; */
				var month = "<%= request.getAttribute("month") %>";
				var year = <%= request.getAttribute("year") %>;
				var reportZoneData = <%= request.getAttribute("reportZoneEmpData") %>;
				var reportName = "<%= request.getAttribute("reportName") %>";
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
				var reportName = null;
				var fromMonth = null;
				var fromYear = null;
				var toMonth = null;
				var toYear = null;
				
				/* if(changeReq=="reportChange"){
					reportName=selectedReportName;
					document.getElementById("reportNameHeader").innerHTML = reportName;
				}
				else if(changeReq=="timeperiodChange"){
					reportName=document.getElementById("reportNameHeader").innerHTML;
				} */
				var selectedReport=document.getElementById("reportName");
				var reportName=selectedReport.options[selectedReport.selectedIndex].value;
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
					url:'dfwReportZoneEmployeeReportSearchChange.do',
					'data':{
						 reportName:reportName,directorateId:directorateId,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear
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
							}		 	
					 },
					 error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					    }}); 
				}
			
			function pivotTable(data,reportName){
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];

				$("#pvt").pivotUI(
						data, {
				    rows: ["Employee Name","GPF CPS no","Gender","Designation","Pay Band","Duty Pay","Grade Pay","Recruited by","Group","Community",				
			"Date of birth","First Appointment post","First Appointment DOJ","Regularisation Date","Probation Declaration date","Retirement Date",
			"Increment Due Month","SLS Due Date","Physical Status","Punishments","Nominee Details","District Name","Institution Name","Transfer Status",
			"Retirement Type","Transfer Type","Working Location","Marital Status","Qualification","UG Major","PG Major"],
				    /* cols: [""], */
				   /*  aggregator: sumOverSum(["Pay Band", "Duty Pay"]),
				    renderer: heatmap */
				    aggregatorName: "Sum over Sum",
				    rendererName: "Heatmap",
			        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
				  });
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
			
			function getReportZone(contextPath,actionServlet){
				var directorateId = document.getElementById("directorateId").value;
		 			document.location.href=contextPath+actionServlet+'?directorateId='+directorateId;
		 	}
			
			/* function changeReportName(){
				var selectedReport=document.getElementById("reportName");
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
				if(reportName=="DFW_EmpForm_GenderWise"){
					document.getElementById('empReportSearch').style.display="none";
					document.getElementById('lblDesignation').style.display="none";
					document.getElementById('designation').style.display="none";
					document.getElementById('lblGender').style.display="inline";
					document.getElementById('gender').style.display="inline";	
					document.getElementById('lblCommunity').style.display="none";
					document.getElementById('community').style.display="none";
					document.getElementById('lblGroup').style.display="none";
					document.getElementById('groupCategory').style.display="none";
					document.getElementById('lblMaritalStatus').style.display="none";
					document.getElementById('maritalStatus').style.display="none";
					document.getElementById('searchBtn').style.display="inline";
				}
				else if(reportName=="DFW_EmpForm_DesgWise"){
					document.getElementById('empReportSearch').style.display="none";
					document.getElementById('lblGender').style.display="none";
					document.getElementById('gender').style.display="none";
					document.getElementById('lblDesignation').style.display="inline";
					document.getElementById('designation').style.display="inline";	
					document.getElementById('lblCommunity').style.display="none";
					document.getElementById('community').style.display="none";
					document.getElementById('lblGroup').style.display="none";
					document.getElementById('groupCategory').style.display="none";
					document.getElementById('lblMaritalStatus').style.display="none";
					document.getElementById('maritalStatus').style.display="none";
					document.getElementById('searchBtn').style.display="inline";
				}
				else if(reportName=="DFW_EmpForm_CommunityWise"){
					document.getElementById('empReportSearch').style.display="none";
					document.getElementById('lblDesignation').style.display="none";
					document.getElementById('designation').style.display="none";
					document.getElementById('lblGender').style.display="none";
					document.getElementById('gender').style.display="none";
					document.getElementById('lblCommunity').style.display="inline";
					document.getElementById('community').style.display="inline";
					document.getElementById('lblGroup').style.display="none";
					document.getElementById('groupCategory').style.display="none";
					document.getElementById('lblMaritalStatus').style.display="none";
					document.getElementById('maritalStatus').style.display="none";	
					document.getElementById('searchBtn').style.display="inline";
				}
				else if(reportName=="DFW_EmpForm_Group wise"){
					document.getElementById('empReportSearch').style.display="none";
					document.getElementById('lblDesignation').style.display="none";
					document.getElementById('designation').style.display="none";
					document.getElementById('lblGender').style.display="none";
					document.getElementById('gender').style.display="none";
					document.getElementById('lblCommunity').style.display="none";
					document.getElementById('community').style.display="none";
					document.getElementById('lblGroup').style.display="inline";
					document.getElementById('groupCategory').style.display="inline";
					document.getElementById('lblMaritalStatus').style.display="none";
					document.getElementById('maritalStatus').style.display="none";		
					document.getElementById('searchBtn').style.display="inline";
				}
				else if(reportName=="DFW_EmpForm_MaritalStatus wise"){
					document.getElementById('empReportSearch').style.display="none";
					document.getElementById('lblDesignation').style.display="none";
					document.getElementById('designation').style.display="none";
					document.getElementById('lblGender').style.display="none";
					document.getElementById('gender').style.display="none";
					document.getElementById('lblCommunity').style.display="none";
					document.getElementById('community').style.display="none";
					document.getElementById('lblGroup').style.display="none";
					document.getElementById('groupCategory').style.display="none";
					document.getElementById('lblMaritalStatus').style.display="inline";
					document.getElementById('maritalStatus').style.display="inline";		
					document.getElementById('searchBtn').style.display="inline";
				}
				else if(reportName=="DFW_EmpForm_EmployeeGrid"){
					document.getElementById('empReportSearch').style.display="inline";
					document.getElementById('lblDesignation').style.display="none";
					document.getElementById('designation').style.display="none";
					document.getElementById('lblGender').style.display="none";
					document.getElementById('gender').style.display="none";
					document.getElementById('lblCommunity').style.display="none";
					document.getElementById('community').style.display="none";
					document.getElementById('lblGroup').style.display="none";
					document.getElementById('groupCategory').style.display="none";
					document.getElementById('lblMaritalStatus').style.display="none";
					document.getElementById('maritalStatus').style.display="none";				
					document.getElementById('searchBtn').style.display="none";
				}
			} */
		</script> 
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
	</body>
</html>