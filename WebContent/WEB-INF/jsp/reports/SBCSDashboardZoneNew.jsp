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
		<title>SBCS Report Zone</title>
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
					
					var innnertable;	
					if (FrequencyName == 'timeperiod') {
						
						innnertable='<tr><td style="color:blue"><b>Report Name</b></td><td style="color:blue"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue"><b>Frequency</b></td><td style="color:blue"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue"><b>From</b></td><td style="color:blue" align="left"><b>'+selectedTimePeriodFrom+'</b></td></tr><tr><td style="color:blue"><b>To</b></td><td style="color:blue" align="left"><b>'+selectedTimePeriodTo+'</b></td></tr>'+table.innerHTML;
						}
				if (FrequencyName == 'monthly') {
					
				innnertable='<tr><td style="color:blue"><b>Report Name</b></td><td style="color:blue"><b>'+categoryName+'</b></td></tr><tr><td style="color:blue"><b>Frequency</b></td><td style="color:blue"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue"><b>Year</b></td><td style="color:blue" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue"><b>Month</b></td><td style="color:blue" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML;
				}
				
				var ctx = {worksheet: name || 'Worksheet',table: innnertable}
	           
	           
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
		}.pivotTableStyle1{
			height:440px;
			width:100%;
			overflow:auto;
		/* 	position:absolute; */
			box-shadow: 0 0 1em olive;
			border-radius:10px;
		}
		</style>
	</head>
	
	<body onload ="onLoad();" style="font-family: Tahoma;">
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
	 	<div class="zonesMainDiv" style="margin-left: -9px;">		
			<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_report_zone"/>
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
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_1"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_1"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_4"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_4"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_7"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_7"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_10"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_10"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_13"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_13"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_16"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_16"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_19"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_19"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_22"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_22"/></a></li>
									    	 </ul>
									    </li>
									    <li style="width:130px;"><a>District</a>
									        <ul class="sub">
									           <li style="width:250px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_2"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_2"/></a></li>
									       	   <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_5"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_5"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_8"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_8"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_11"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_11"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_14"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_14"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_17"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_17"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_20"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_20"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_23"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_23"/></a></li>
									       	</ul>
									    </li>
									    <li style="width:130px;"><a>Institution</a>
									        <ul class="sub">
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_3"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_3"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_6"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_6"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_9"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_9"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_12"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_12"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_15"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_15"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_18"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_18"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_21"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_21"/></a></li>
									           <li style="width:240px;"><a onclick="changeYearMonth('<spring:message code="shdrc_dashboard_zone_new13_24"/>','reportChange');"><spring:message code="shdrc_dashboard_zone_new13_24"/></a></li>
									        </ul>
									    </li>							
							    	</ul>
							    </li>
							</ul>
						</td>
						<td class="searchCriteria" style="padding-left:20px;"><spring:message code="label_searchcriteria_frequency"/></td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="frequency" name="frequency" class="reportDropDown" onchange="changeFrequency();">
								<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
							</select> 
						</td>		
						<td class="searchCriteria" style="padding-left:20px;"><label id="yearName"><spring:message code="label_searchcriteria_year"/></label></td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="year" name="year" class="reportDropDown">
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select>
						</td>	
						<td class="searchCriteria" style="padding-left:20px;"><label id="monthName"><spring:message code="label_searchcriteria_month"/></label></td>
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="month" name="month" class="reportDropDown">
								<c:forEach var="months" items="${monthsList}">
		                    		<option value='<c:out value="${months.id}"/>'>${months.name} </option> 
		                		</c:forEach> 
							</select>
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
				<div id="pvt" class="pivotTableStyle1"></div>
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
				var month = "<%= request.getAttribute("indicatorMnth") %>";
				var year = <%= request.getAttribute("indicatorYer") %>;
				var reportZoneData = <%= request.getAttribute("indJsonArray") %>;
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
				
				if(changeReq=="reportChange"){
					reportName=selectedReportName;
					document.getElementById("reportNameHeader").innerHTML = reportName;
				}
				else if(changeReq=="timeperiodChange"){
					reportName=document.getElementById("reportNameHeader").innerHTML;
				}				
				var selectedMonth=document.getElementById("month");
				 if (selectedMonth != 'undefined') {
					var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
				}
				var year=document.getElementById("year");
				if(year!='undefined'){
					var selectedYear=year.options[year.selectedIndex].value;
				}				
				var directorateId = document.getElementById("directorateId").value;
				
				$.ajax({
					type:"POST",
					url:'sbcsDashboardZoneNewSearchChange.do',
					'data':{
						reportName:reportName,directorateId:directorateId,monthName:monthName,selectedYear:selectedYear
					},
					 success: function(result){
						 	var data = JSON.parse(result);
						 	if(data!=null && data.length>0){
								document.getElementById("noDataMsg").style.display="none";
								document.getElementById("pvt").style.display="block";
								pivotTable(data,reportName,monthName,selectedYear);
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
				n = reportName.lastIndexOf('-');
				var newReportName = reportName.substring(n+1).trim();
				rowName=getRowName(reportName,newReportName,month,year);	
				var colName=getColName(reportName,newReportName); 
				
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
				$("#pvt").pivot(
					data, {
					    rows:rowName,
					    cols: colName,
					    aggregator: $.pivotUtilities.aggregators["Integer Sum"](["Value"]), 
					    aggregatorName: "Sum over Sum",
					    rendererName: "Line Chart",
				        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					}
				);
				 var reportStyle=getReportStyle(reportName,newReportName); 
				 document.getElementById("Loading").style.display="none";
				 document.getElementById("LoadingImage").style.display="none";
			}	
			
			 function getReportStyle(reportName,newReportName){
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
			
			function getRowName(reportName,newReportName,month,year){
				var rowName;		
				if(newReportName == "State wise"){
					if(reportName == "Eye Donation - State wise"){
						rowName=["Indicator"];
					}else if(reportName == "Finance - State wise"){
						rowName=["Indicator Category"];
					}else{
						rowName=["Indicator"];	
					}
				}	
				else if(newReportName == "District wise"){
					if(reportName == "Eye Donation - State wise"){
						rowName=["Indicator","General Name"];
					}else if(reportName == "Finance - State wise"){
						rowName=["Indicator Category","Indicator Name"];
					}else{
						rowName=["Indicator"];	
					}
				}
				else if(newReportName == "Institution wise"){
					if(reportName == "Eye Donation - State wise"){
						rowName=["Indicator","General Name","District"];
					}else if(reportName == "Finance - State wise"){
						rowName=["Indicator","Indicator Name","District"];
					}else{
						rowName=["Indicator","District"];	
					}
				}				
				return rowName;
			}
			
			function getColName(reportName,newReportName){
				var colName;		
				if(newReportName == "State wise"){
					if(reportName == "Eye Donation - State wise"){
						colName=["General Name"];
					}else if(reportName == "Finance - State wise"){
						colName=["Indicator Name"];
					}else{
						colName;	
					}
				}	
				else if(newReportName == "District wise"){
						colName=["District"];
				}
				else if(newReportName == "Institution wise"){
						colName=["Institution"];
				}
				return colName;
			}
		</script> 
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
	</body>
</html>