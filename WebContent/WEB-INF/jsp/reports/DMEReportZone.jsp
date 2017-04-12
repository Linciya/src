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
		<title>DME Report Zone</title>
		<!-- <script src="js/script.js"></script> -->
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<link rel="stylesheet" href="css/multiple-select.css">
		<script src="js/multiple-select.js"></script>
		<script type="text/javascript">
		  var tableToExcel = (function() {            
	         var uri = 'data:application/vnd.ms-excel;base64,'
	           , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
	           , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
	           , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
	         return function(table, name) {
	           if (!table.nodeType) table = document.getElementById(table)
	          // var criteria=document.getElementById("searchCriteria");
	           
	           
	           
	           
              
               var selectedReportName=document.getElementById("reportName");
           	
    			if (selectedReportName != 'undefined') {
    				var reportName=selectedReportName.options[selectedReportName.selectedIndex].value; 
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
    					
    					innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Report Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+reportName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>From</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+selectedTimePeriodFrom+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>To</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+selectedTimePeriodTo+'</b></td></tr>'+table.innerHTML;
    					}
    			if (FrequencyName == 'monthly') {
    				
    			innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Report Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+reportName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Frequency</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+FrequencyName+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+year+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Month</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+month+'</b></td></tr>'+table.innerHTML;
    			}
    			
    			var ctx = {worksheet: name || 'Worksheet',table: innnertable}
	           
	           
	           
    			 $("#pvt").find('th').css("background-color", "#e6EEEE");
				 $("#pvt").find('tr').find('th').css("border", "0.1px solid #CDCDCD");
				 $("#pvt").find('tr').find('td').css("border", "0.1px solid #CDCDCD");
	           
	          // var ctx = {worksheet: name || 'Worksheet',table: table.innerHTML}
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
		/* to hide both row and column totals 
			.pvtTotal, .pvtTotalLabel, .pvtGrandTotal {display: none} */
			
		/* to hide column total
		 tbody > tr > th.pvtTotalLabel, .colTotal, .pvtGrandTotal { display: none; } */
		 
		/* to hide row total */
		/* thead > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal { display: none; }
		
		 table.pvtTable .pvtRowTotalLabel {
		    display: none;
		}  */
		</style>
	</head>
	
	<body onload ="onLoad();" style="font-family: Tahoma;">
		<script src="pivot/js/jquery-ui.min.js"></script>
		<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
		<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"  />
		<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"  />
		<script src="pivot/js/pivot.min.js"></script>
		<script src="pivot/js/c3.min.js"></script> 
		<script src="pivot/js/c3_renderers.min.js"></script> 
		<script src="pivot/js/d3.min.js"></script>
		
		
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>">
		<input id="freqName"  type="hidden" name="freqName" value="monthly">
	 	<div class="zonesMainDiv" style="margin-left: -9px;">		
			<div id="directorateNameHeader"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_report_zone"/></div>	
				<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
			 	<table id="searchCriteria">
					<tr>
						<td class="searchCriteria"><spring:message code="label_searchcriteria_reports"/></td>
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="reportName" name="reportName" class="reportDropDown" style="width:250px;" onchange="changeInstDropdown(); changeFrequency(); newReportChange();">
								<option value="<spring:message code="shdrc_report_zone8_1"/>"><spring:message code="shdrc_report_zone8_1"/></option>
								<option value="<spring:message code="shdrc_report_zone8_2"/>"><spring:message code="shdrc_report_zone8_2"/></option>
								<option value="<spring:message code="shdrc_report_zone8_3"/>"><spring:message code="shdrc_report_zone8_3"/></option>
								<option value="<spring:message code="shdrc_report_zone8_4"/>"><spring:message code="shdrc_report_zone8_4"/></option>
								<option value="<spring:message code="shdrc_report_zone8_5"/>"><spring:message code="shdrc_report_zone8_5"/></option>
								<option value="<spring:message code="shdrc_report_zone8_6"/>"><spring:message code="shdrc_report_zone8_6"/></option>	
								<option value="<spring:message code="shdrc_report_zone8_7"/>"><spring:message code="shdrc_report_zone8_7"/></option>
								<option value="<spring:message code="shdrc_report_zone8_8"/>"><spring:message code="shdrc_report_zone8_8"/></option>
								<option value="<spring:message code="shdrc_report_zone8_9"/>"><spring:message code="shdrc_report_zone8_9"/></option>
								<option value="<spring:message code="shdrc_report_zone8_10"/>"><spring:message code="shdrc_report_zone8_10"/></option>
								<option value="<spring:message code="shdrc_report_zone8_11"/>"><spring:message code="shdrc_report_zone8_11"/></option>
								<option value="<spring:message code="shdrc_report_zone8_12"/>"><spring:message code="shdrc_report_zone8_12"/></option>
								<option value="<spring:message code="shdrc_report_zone8_13"/>"><spring:message code="shdrc_report_zone8_13"/></option>
								<option value="<spring:message code="shdrc_report_zone8_14"/>"><spring:message code="shdrc_report_zone8_14"/></option>
								<option value="<spring:message code="shdrc_report_zone8_15"/>"><spring:message code="shdrc_report_zone8_15"/></option>
								<option value="<spring:message code="shdrc_report_zone8_16"/>"><spring:message code="shdrc_report_zone8_16"/></option>
								<option value="<spring:message code="shdrc_report_zone8_17"/>"><spring:message code="shdrc_report_zone8_17"/></option>
								<option value="<spring:message code="shdrc_report_zone8_18"/>"><spring:message code="shdrc_report_zone8_18"/></option>
								<option value="<spring:message code="shdrc_report_zone8_19"/>"><spring:message code="shdrc_report_zone8_19"/></option>
								<option value="<spring:message code="shdrc_report_zone8_20"/>"><spring:message code="shdrc_report_zone8_20"/></option>
								<option value="<spring:message code="shdrc_report_zone8_21"/>"><spring:message code="shdrc_report_zone8_21"/></option>
								<option value="<spring:message code="shdrc_report_zone8_22"/>"><spring:message code="shdrc_report_zone8_22"/></option>
								<option value="<spring:message code="shdrc_report_zone8_23"/>"><spring:message code="shdrc_report_zone8_23"/></option>
								<option value="<spring:message code="shdrc_report_zone8_24"/>"><spring:message code="shdrc_report_zone8_24"/></option>
								<option value="<spring:message code="shdrc_report_zone8_25"/>"><spring:message code="shdrc_report_zone8_25"/></option>
								<option value="<spring:message code="shdrc_report_zone8_26"/>"><spring:message code="shdrc_report_zone8_26"/></option>
								<option value="<spring:message code="shdrc_report_zone8_27"/>"><spring:message code="shdrc_report_zone8_27"/></option>
								<option value="<spring:message code="shdrc_report_zone8_28"/>"><spring:message code="shdrc_report_zone8_28"/></option>
								<option value="<spring:message code="shdrc_report_zone8_29"/>"><spring:message code="shdrc_report_zone8_29"/></option>
								<option value="<spring:message code="shdrc_report_zone8_30"/>"><spring:message code="shdrc_report_zone8_30"/></option>
								<option value="<spring:message code="shdrc_report_zone8_31"/>"><spring:message code="shdrc_report_zone8_31"/></option>
								<option value="<spring:message code="shdrc_report_zone8_32"/>"><spring:message code="shdrc_report_zone8_32"/></option>
								<option value="<spring:message code="shdrc_report_zone8_33"/>"><spring:message code="shdrc_report_zone8_33"/></option>
								<option value="<spring:message code="shdrc_report_zone8_34"/>"><spring:message code="shdrc_report_zone8_34"/></option>
								<option value="<spring:message code="shdrc_report_zone8_35"/>"><spring:message code="shdrc_report_zone8_35"/></option>
								<option value="<spring:message code="shdrc_report_zone8_36"/>"><spring:message code="shdrc_report_zone8_36"/></option>
								<option value="<spring:message code="shdrc_report_zone8_37"/>"><spring:message code="shdrc_report_zone8_37"/></option>
								<option value="<spring:message code="shdrc_report_zone8_38"/>"><spring:message code="shdrc_report_zone8_38"/></option>
								<option value="<spring:message code="shdrc_report_zone8_39"/>"><spring:message code="shdrc_report_zone8_39"/></option>
								<option value="<spring:message code="shdrc_report_zone8_40"/>"><spring:message code="shdrc_report_zone8_40"/></option>
								<option value="<spring:message code="shdrc_report_zone8_41"/>"><spring:message code="shdrc_report_zone8_41"/></option>
								<option value="<spring:message code="shdrc_report_zone8_42"/>"><spring:message code="shdrc_report_zone8_42"/></option>
								<option value="<spring:message code="shdrc_report_zone8_43"/>"><spring:message code="shdrc_report_zone8_43"/></option>
								<option value="<spring:message code="shdrc_report_zone8_44"/>"><spring:message code="shdrc_report_zone8_44"/></option>
								<option value="<spring:message code="shdrc_report_zone8_45"/>"><spring:message code="shdrc_report_zone8_45"/></option>
								<option value="<spring:message code="shdrc_report_zone8_46"/>"><spring:message code="shdrc_report_zone8_46"/></option>
								<option value="<spring:message code="shdrc_report_zone8_47"/>"><spring:message code="shdrc_report_zone8_47"/></option>
								<option value="<spring:message code="shdrc_report_zone8_48"/>"><spring:message code="shdrc_report_zone8_48"/></option>
								<option value="<spring:message code="shdrc_report_zone8_49"/>"><spring:message code="shdrc_report_zone8_49"/></option>
								<option value="<spring:message code="shdrc_report_zone8_50"/>"><spring:message code="shdrc_report_zone8_50"/></option>
								<option value="<spring:message code="shdrc_report_zone8_51"/>"><spring:message code="shdrc_report_zone8_51"/></option>
								<option value="<spring:message code="shdrc_report_zone8_52"/>"><spring:message code="shdrc_report_zone8_52"/></option>
								<option value="<spring:message code="shdrc_report_zone8_53"/>"><spring:message code="shdrc_report_zone8_53"/></option>
								<option value="<spring:message code="shdrc_report_zone8_54"/>"><spring:message code="shdrc_report_zone8_54"/></option>
								<option value="<spring:message code="shdrc_report_zone8_55"/>"><spring:message code="shdrc_report_zone8_55"/></option>
								<option value="<spring:message code="shdrc_report_zone8_56"/>"><spring:message code="shdrc_report_zone8_56"/></option>
								<option value="<spring:message code="shdrc_report_zone8_57"/>"><spring:message code="shdrc_report_zone8_57"/></option>
								<option value="<spring:message code="shdrc_report_zone8_58"/>"><spring:message code="shdrc_report_zone8_58"/></option>
								<option value="<spring:message code="shdrc_report_zone8_59"/>"><spring:message code="shdrc_report_zone8_59"/></option>
								<option value="<spring:message code="shdrc_report_zone8_60"/>"><spring:message code="shdrc_report_zone8_60"/></option>
								<option value="<spring:message code="shdrc_report_zone8_61"/>"><spring:message code="shdrc_report_zone8_61"/></option>
								<option value="<spring:message code="shdrc_report_zone8_62"/>"><spring:message code="shdrc_report_zone8_62"/></option>
								<option value="<spring:message code="shdrc_report_zone8_63"/>"><spring:message code="shdrc_report_zone8_63"/></option>
								<option value="<spring:message code="shdrc_report_zone8_64"/>"><spring:message code="shdrc_report_zone8_64"/></option>
								<option value="<spring:message code="shdrc_report_zone8_65"/>"><spring:message code="shdrc_report_zone8_65"/></option>
								<option value="<spring:message code="shdrc_report_zone8_66"/>"><spring:message code="shdrc_report_zone8_66"/></option>
								<option value="<spring:message code="shdrc_report_zone8_67"/>"><spring:message code="shdrc_report_zone8_67"/></option>
								<option value="<spring:message code="shdrc_report_zone8_68"/>"><spring:message code="shdrc_report_zone8_68"/></option>
								<option value="<spring:message code="shdrc_report_zone8_69"/>"><spring:message code="shdrc_report_zone8_69"/></option>
								<option value="<spring:message code="shdrc_report_zone8_70"/>"><spring:message code="shdrc_report_zone8_70"/></option>
								<option value="<spring:message code="shdrc_report_zone8_71"/>"><spring:message code="shdrc_report_zone8_71"/></option>
								<option value="<spring:message code="shdrc_report_zone8_72"/>"><spring:message code="shdrc_report_zone8_72"/></option>
								<option value="<spring:message code="shdrc_report_zone8_73"/>"><spring:message code="shdrc_report_zone8_73"/></option>
								<option value="<spring:message code="shdrc_report_zone8_74"/>"><spring:message code="shdrc_report_zone8_74"/></option>
								<option value="<spring:message code="shdrc_report_zone8_75"/>"><spring:message code="shdrc_report_zone8_75"/></option>
								<option value="<spring:message code="shdrc_report_zone8_76"/>"><spring:message code="shdrc_report_zone8_76"/></option>
								<option value="<spring:message code="shdrc_report_zone8_77"/>"><spring:message code="shdrc_report_zone8_77"/></option>
								<option value="<spring:message code="shdrc_report_zone8_78"/>"><spring:message code="shdrc_report_zone8_78"/></option>
								<option value="<spring:message code="shdrc_report_zone8_79"/>"><spring:message code="shdrc_report_zone8_79"/></option>
								<option value="<spring:message code="shdrc_report_zone8_80"/>"><spring:message code="shdrc_report_zone8_80"/></option>
								<option value="<spring:message code="shdrc_report_zone8_81"/>"><spring:message code="shdrc_report_zone8_81"/></option>
								<option value="<spring:message code="shdrc_report_zone8_82"/>"><spring:message code="shdrc_report_zone8_82"/></option>
								<option value="<spring:message code="shdrc_report_zone8_83"/>"><spring:message code="shdrc_report_zone8_83"/></option>
								<option value="<spring:message code="shdrc_report_zone8_84"/>"><spring:message code="shdrc_report_zone8_84"/></option>
								<option value="<spring:message code="shdrc_report_zone8_85"/>"><spring:message code="shdrc_report_zone8_85"/></option>
								<option value="<spring:message code="shdrc_report_zone8_86"/>"><spring:message code="shdrc_report_zone8_86"/></option>
								<option value="<spring:message code="shdrc_report_zone8_87"/>"><spring:message code="shdrc_report_zone8_87"/></option>
								<option value="<spring:message code="shdrc_report_zone8_88"/>"><spring:message code="shdrc_report_zone8_88"/></option>
							</select> 
						</td>
						<td class="searchCriteria" style="padding-left:5px;"><spring:message code="label_searchcriteria_frequency"/></td>	
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="frequency" name="frequency" class="reportDropDown" style="width:95px;" onchange="changeFrequency(); getFileName();">
							<!--<option value="yearly">Yearly</option> -->
								<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
								<option value="timeperiod"><spring:message code="option_frequency_timeperiod"/></option>
							</select> 
						</td>		
						<td class="searchCriteria" style="padding-left:5px;"><label id="yearName"><spring:message code="label_searchcriteria_year"/></label> 
																			  <label id="timePeriodFrom"><spring:message code="label_searchcriteria_from"/></label>
																			  <label id="timePeriodFromYear"><spring:message code="label_searchcriteria_from"/></label>
						 </td>	
						<td class="searchCriteria" style="padding-left:3px;">
							<select id="year" name="year" class="reportDropDown" style="width:65px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select> 
							
							<input type="text" id="txtFrom" style="width:65px;"/>
							
							<select id="fromYear" name="fromYear" class="reportDropDown" style="width:65px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select> 
						</td>	
						
						<td class="searchCriteria">
							<label id="monthName"><spring:message code="label_searchcriteria_month"/></label>
 						    <label id="timePeriodTo"><spring:message code="label_searchcriteria_to"/></label>
 						    <label id="timePeriodToYear"><spring:message code="label_searchcriteria_to"/></label>
						</td>
						<td class="searchCriteria">
							<select id="month" name="month" class="reportDropDown" style="width:85px;">
									<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="months" items="${monthsList}">
		                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
		                		</c:forEach> 
							</select> 
							
							<input type="text" id="txtTo" style="width:65px;"/>
							
							<select id="toYear" name="toYear" class="reportDropDown" style="width:65px;">
								<option value=""><spring:message code="option_select"/></option> 
									<c:forEach var="year" items="${yearList}">
				     				<option value='<c:out value="${year}"/>'>${year} </option>
				 					</c:forEach>
							</select> 
						</td>
						<td class="searchCriteria" style=""><label id="dateLabel"><spring:message code="label_searchcriteria_date"/></label></td>
						<td class="searchCriteria" style="">
							<!-- <input type="text" id="date" style="width: 100px;background-color: #DDFF99;"/> -->
							<input type="text" class="inputText" id="date" name="searchDate" readonly="readonly" style="width: 100px;background-color: #DDFF99;">
						</td>
						
						<td class="searchCriteria" >
							<label id="institutionTypeLabel">Ins type</label>
							<label id="postTypeLabel">Post type</label>
						</td>
						<td class="searchCriteria" >
							<select id="institutionType" name="institutionType" style="width:170px;" class="reportDropDown" onchange="getInstitutionList();">
								 <c:forEach var="institutionType" items="${institutionTypeList}">
								     <option value='<c:out value="${institutionType.name}"/>'>${institutionType.name} </option>
								 </c:forEach>
							</select>
							
							<select id="postType" name="postType" style="width:170px;" class="reportDropDown" onchange="getPostList();">
								 <c:forEach var="postType" items="${postTypeList}">
								     <option value='<c:out value="${postType.name}"/>'>${postType.name} </option>
								 </c:forEach>
							</select>
						</td>
						
						<td class="searchCriteria">
							<label id="institutionLabel">Ins Name</label>
							<label id="postLabel">Post Name</label>
						</td>
						<td class="searchCriteria">
							<label id="institutionValue">
								<select id="institutionName" name="institutionName" style="width:250px;" class="reportDropDown" multiple="multiple">
									 <c:forEach var="institution" items="${institutionList}">
									     <option value='<c:out value="${institution.id}"/>'>${institution.name} </option>
									 </c:forEach>
								</select>
							</label>
							<label id="postValue">
								<select id="postName" name="postName" style="width:250px;" class="reportDropDown" multiple="multiple">
									 <c:forEach var="post" items="${postList}">
									     <option value='<c:out value="${post.id}"/>'>${post.name} </option>
									 </c:forEach>
								</select>
							</label>
						</td>
						<td id="fileNameLabel" class="searchCriteria" style="padding-left:5px;">File Name</td>
						<td id="fileNameValue" class="searchCriteria" style="padding-left:3px;">
							<select id="fileName" name="fileName" style="width:150px;" class="reportDropDown">
								<c:forEach var="fileNames" items="${fileNames}">
								     <option value='<c:out value="${fileNames}"/>'>${fileNames} </option>
								 </c:forEach>
							</select>
						</td>		
						<td class="searchCriteria"><button onclick="changeYearMonth();"><spring:message code="label_searchcriteria_search"/></button></td>	
						<td class="searchCriteria" style="padding-left:30px;"><label id="Loading"><spring:message code="label_Loading"/></label></td>
		                <td class="searchCriteria" style="padding-left:2px;"><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:30px;"></td>
					</tr>			
					<div ><button style="float:right;margin-top:7px;"onclick="tableToExcel('pvtTable','sheet1')"><spring:message code="label_exporttoexcel"/></button></div>
				</table>
				
				</div>	
			<div id="pvt" class="pivotTableStyle"></div>
			<div id="noDataMsg" align="center" style="width:100%;padding-top:70px;height:380px;"><p>This Report has no data for the selected Month and Year </p></div> 
			</div>
				
			<script type="text/javascript">		
			
			function onLoad(){
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";

				$("#fileName").hide();
				$("#fileNameLabel").hide();
				$("#date").hide();
				$("#dateLabel").hide();				
				
				document.getElementById("institutionTypeLabel").style.display="none";
				document.getElementById("institutionType").style.display="none";
				document.getElementById("institutionLabel").style.display="none";
				document.getElementById("institutionValue").style.display="none";
				document.getElementById("postTypeLabel").style.display="none";
				document.getElementById("postType").style.display="none";
				document.getElementById("postLabel").style.display="none";
				document.getElementById("postValue").style.display="none";
				document.getElementById("timePeriodFrom").style.display="none";
				document.getElementById("txtFrom").style.display="none"; 	
				document.getElementById("timePeriodTo").style.display="none"; 
				document.getElementById("txtTo").style.display="none"; 	
				document.getElementById("timePeriodFromYear").style.display="none";
				document.getElementById("timePeriodToYear").style.display="none"; 
				document.getElementById("fromYear").style.display="none";
				document.getElementById("toYear").style.display="none"; 
				var month = "<%= request.getAttribute("month") %>";
				var year = <%= request.getAttribute("year") %>;
				var reportZoneData = <%= request.getAttribute("reportZoneData") %>;
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
				$('#institutionName').multipleSelect({
			    	filter: true,
			    	placeholder:"All Institutions"
			    });
				$('#postName').multipleSelect({
			    	filter: true,
			    	placeholder:"All Posts"
			    });
			}
			
			function changeYearMonth(){
				document.getElementById("Loading").style.display="inline";
				document.getElementById("LoadingImage").style.display="inline";
				var fromMonth = null;
				var fromYear = null;
				var toMonth = null;
				var toYear = null;
				var fileName=null;
				var date=null;
				var frequency=null;
				var selectedReport=document.getElementById("reportName");
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
				var directorateId = document.getElementById("directorateId").value;
				var selectedInstitutionName=$('#institutionName').val();
				if(selectedInstitutionName!=null){
					var institutionName=selectedInstitutionName.toString();
				}
				var selectedPostName=$('#postName').val();
				if(selectedPostName!=null){
					var postName=selectedPostName.toString();
				}
				var selectedFreq=document.getElementById("frequency");
				var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;
				
				if(((reportName=='DME_DENGUE  REPORT (Year wise)') || (reportName=="DME_AH1N1  REPORT (Year wise)") 
						|| (reportName=="DME_EBOLA  REPORT (Year wise)") || (reportName=="DME_TICK FEVER REPORT (Year wise)"))
						&& (freqName=='monthly')){
					var year=document.getElementById("year");
					if(year!='undefined'){
						var selectedYear=year.options[year.selectedIndex].value;
					}
					fromMonth = "";
					fromYear = selectedYear;
					toMonth = "";
					toYear = selectedYear;
				}
				else if(reportName == 'Data Availability Institution Wise'){
					fileName=$('#fileName').val();
					frequency=$('#frequency').val();
					date=$('#date').val();
				}
				else if(((reportName=='DME_DENGUE  REPORT (Year wise)') || (reportName=="DME_AH1N1  REPORT (Year wise)") 
						|| (reportName=="DME_EBOLA  REPORT (Year wise)") || (reportName=="DME_TICK FEVER REPORT (Year wise)"))
						&& (freqName=='timeperiod')){
					var fromYearValue=document.getElementById("fromYear");
					if(fromYearValue!='undefined'){
						var selectedFromYearValue=fromYearValue.options[fromYearValue.selectedIndex].value;
					}
					var toYearValue=document.getElementById("toYear");
					if(toYearValcue!='undefined'){
						var selectedToYearValue=toYearValue.options[toYearValue.selectedIndex].value;
					}
					fromMonth = "";
					fromYear = selectedFromYearValue;
					toMonth = "";
					toYear = selectedToYearValue;
				}
				else{				
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
				}
				$.ajax({
					type:"POST",
					url:'dmeReportZoneSearchChange.do',
					'data':{
						reportName:reportName,directorateId:directorateId,fromMonth:fromMonth,fromYear:fromYear,toMonth:toMonth,toYear:toYear,
						institutionName:institutionName,date:date,fileName:fileName,frequency:frequency,postName:postName
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
			
			function getInstitutionList(){
				var selectedInsType=document.getElementById("institutionType");
				var institutionType=selectedInsType.options[selectedInsType.selectedIndex].value;
				
				$.ajax({
					type:"POST",
					url:'dmeReportZoneInstTypeChange.do',
					'data':{
						institutionType:institutionType
					},
					success: function(result){
						 var jsonData = JSON.parse(result);
						 
						 $('#institutionName option').each(function(index, option) {
							    $(option).remove();
							});						 
						 var $select = $('#institutionName');
						 $.each(jsonData, function(idx, obj) { 
						 $opt = $("<option />", {
			                    value: obj.id,
			                    text: obj.name
			                });
						 $select.append($opt).multipleSelect("refresh");
						 });		
					},
					error: function (xhr, status, error) {
			        	alert("Internal Error Occured-Please Contact System Administrator");
					}});
			}
			
			function getPostList(){
				var selectedPostType=document.getElementById("postType");
				var postType=selectedPostType.options[selectedPostType.selectedIndex].value;
				
				$.ajax({
					type:"POST",
					url:'dmeReportZonePostTypeChange.do',
					'data':{
						postType:postType
					},
					 success: function(result){
						 var jsonData = JSON.parse(result);						 
						 $('#postName option').each(function(index, option) {
							    $(option).remove();
							});						 
						 var $select = $('#postName');
						 $.each(jsonData, function(idx, obj) { 
						 $opt = $("<option />", {
			                    value: obj.id,
			                    text: obj.name
			                });
						 $select.append($opt).multipleSelect("refresh");
						 });
					},
					error: function (xhr, status, error) {
			           alert("Internal Error Occured-Please Contact System Administrator");
					}});
			}
			
			function pivotTable(data,reportName){
				var rowName = getRowName(reportName);	
				var colName = getColName(reportName); 			
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
				var aggregatorValue=getAggregator(reportName);
				$("#pvt").pivot(
						data, {
						    rows:rowName,
						    cols:colName,
						    aggregator: aggregatorValue, 
						    aggregatorName: "Sum over Sum",
						    rendererName: "Line Chart",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 
				 var reportStyle=getReportStyle(reportName); 
				 document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none";
			}
			
			 function getReportStyle(reportName){
				 if((reportName=="DME_DENGUE REPORT (Date Wise)") || (reportName=="DME_EBOLA REPORT (Date Wise)") || (reportName=="DME_AH1N1 REPORT (Date Wise)") 
					|| (reportName=="DME_TICK FEVER REPORT (Date Wise)") || (reportName=="DME_DENGUE  REPORT (Institution wise)") || (reportName=="DME_AH1N1  REPORT (Institution wise)") 
					|| (reportName=="DME_EBOLA  REPORT (Institution wise)") || (reportName=="DME_TICK FEVER REPORT (Institution wise)") || (reportName=="DME_DENGUE REPORT (Monthwise)") 
					|| (reportName=="DME_AH1N1 REPORT (Monthwise)") || (reportName=="DME_EBOLA REPORT (Monthwise)") || (reportName=="DME_TICK FEVER REPORT (Monthwise)")
					|| (reportName=="DME_DENGUE  REPORT (Year wise)") || (reportName=="DME_AH1N1  REPORT (Year wise)") || (reportName=="DME_EBOLA  REPORT (Year wise)") 
					|| (reportName=="DME_TICK FEVER REPORT (Year wise)") || (reportName=="DME_Caesarean Report") || (reportName=="DME_MAJOR MINOR TOTAL SURGERIES")
					|| (reportName=="DME_DEPT INST MONTHWISE SURGERIES REPORT") || (reportName=="DME_Dept wise instwise OP report")
					|| (reportName=="DME_Institution wise Dept wise report") || (reportName=="DME_Deliveries Maternal Death")
					|| (reportName=="DME_Lab Investigation") || (reportName=="DME_Lab Monthwise") || (reportName=="DME_NEONATAL DEATH - Out Born & InBorn")
					|| (reportName=="DME_DOG BITE CASES MONTHWISE STATISTICS") || (reportName=="DME_DOG BITE STATISTICS") || (reportName=="DME_LAB results")
					|| (reportName=="DME_Post Mortem Report") || (reportName=="DME_Blood Bag and Hospital Diet Report") || (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED") 
					|| (reportName=="DME_SC ST Representation_Group_A") || (reportName=="DME_SC ST Representation_Group_B") || (reportName=="DME_SC ST Representation_Group_C") 
					|| (reportName=="DME_SC ST Representation_Group_D") || (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Post_wise)")
					|| (reportName=="DME_Cadre Strength(Inst_wise Post_wise)")
					|| (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Consolidate)") || (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Consolidate))")
					|| (reportName=="DME_Cadre_Strength(Inst_wise Consolidate)") || (reportName=="DME_Cadre Strength(Post_wise Consolidate)") 
					|| (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Inst_wise)") || (reportName=="DME_Cadre Strength(Post_wise Inst_wise)")){ 
				 	$('thead > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal').css({"display":"none"});
					$('table.pvtTable .pvtRowTotalLabel').css({"display":"none"});
				 }
				 else if((reportName=="DME_LINE_LIST_DENGUE") || (reportName=="DME_LINE_LIST_H1N1") || (reportName=="DME_LINE_LIST_TICK_FEVER")
						 || (reportName=="DME_LINE_LIST_EBOLA") || (reportName=="DME_LINE_LIST_DEATH_DENGUE") || (reportName=="DME_LINE_LIST_DEATH_H1N1")
							|| (reportName=="DME_LINE_LIST_DEATH_TICK_FEVER") || (reportName=="DME_LINE_LIST_DEATH_EBOLA")){
				 	$('tbody > tr > th .pvtColTotalLabel, .colTotal, .pvtGrandTotal').css({"display":"none"});
					$('thead > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal').css({"display":"none"});
					$('table.pvtTable .pvtRowTotalLabel').css({"display":"none"});
					$('table.pvtTable .pvtColTotalLabel').css({"display":"none"});
					$('table.pvtTable .pvtTotalLabel').css({"display":"none"});
				 }
				 else if(reportName == "Data Availability Institution Wise"){
					 $('table.pvtTable > tr > th .pvtRowTotalLabel, .rowTotal, .pvtGrandTotal').css({"display":"none"});
					 $('table.pvtTable .pvtColTotalLabel').css({"display":"none"});
					 $('table.pvtTable .pvtTotalLabel').css({"display":"none"});
				 }
			} 
			 
			 function getAggregator(reportName){
					var aggregatorValue;
					if((reportName=="DME_LINE_LIST_DENGUE") || (reportName=="DME_LINE_LIST_H1N1") || (reportName=="DME_LINE_LIST_TICK_FEVER") 
							|| (reportName=="DME_LINE_LIST_EBOLA") || (reportName=="DME_LINE_LIST_DEATH_DENGUE") || (reportName=="DME_LINE_LIST_DEATH_H1N1")
							|| (reportName=="DME_LINE_LIST_DEATH_TICK_FEVER") || (reportName=="DME_LINE_LIST_DEATH_EBOLA")){
						aggregatorValue = $.pivotUtilities.aggregators["Integer Sum"]([""]);
					}
					else {
						aggregatorValue = $.pivotUtilities.aggregators["Integer Sum"](["Value"]);
					}
					return aggregatorValue;
				} 
			
			function getRowName(reportName){
				var rowName;		
				if((reportName=="DME_DENGUE REPORT (Date Wise)") || (reportName=="DME_EBOLA REPORT (Date Wise)") || (reportName=="DME_AH1N1 REPORT (Date Wise)") || (reportName=="DME_TICK FEVER REPORT (Date Wise)")){
					rowName=["Date"];
				}
				else if((reportName=="DME_DENGUE  REPORT (Institution wise)") || (reportName=="DME_AH1N1  REPORT (Institution wise)") || (reportName=="DME_EBOLA  REPORT (Institution wise)") || (reportName=="DME_TICK FEVER REPORT (Institution wise)")){
					rowName=["Institution Name"];
				}
				else if((reportName=="DME_DENGUE REPORT (Monthwise)") || (reportName=="DME_AH1N1 REPORT (Monthwise)") || (reportName=="DME_EBOLA REPORT (Monthwise)") || (reportName=="DME_TICK FEVER REPORT (Monthwise)")){
					rowName=["Year","Month"];
				}
				else if((reportName=="DME_DENGUE  REPORT (Year wise)") || (reportName=="DME_AH1N1  REPORT (Year wise)") || (reportName=="DME_EBOLA  REPORT (Year wise)") || (reportName=="DME_TICK FEVER REPORT (Year wise)")){
					rowName=["Year"];
				}	
				else if((reportName=="DME_ACCIDENT AND EMERGENCY") || (reportName=="DME_BRAIN DEATH DECLARED STATISTICS") || (reportName=="DME_CLEFT LIP AND PALATE SURGERIES STATISTICS") 
						|| (reportName=="DME_CT Scan") || (reportName=="DME_TOTAL DELIVERIES") || (reportName=="DME_ECG TAKEN") 
						|| (reportName=="DME_IMMUNISATION PERFORMANCE") || (reportName=="DME_STERILISATION PERFORMANCE STATISTICS")
						|| (reportName=="DME_DELIVERIES") || (reportName=="DME_IMAGING STUDIES STATISTICS") || (reportName=="DME_LITHOTRIPSY STATISTICS") 
						|| (reportName=="DME_LIVE BIRTHS") || (reportName=="DME_MAJOR MINOR TOTAL SURGERIES") || (reportName=="DME_RENAL TRANSPLANTS STATISTICS") 
						|| (reportName=="DME_MASTER HEALTH CHECKUP") || (reportName=="DME_Deliveries Maternal Death") || (reportName=="DME_Lab Investigation") 
						|| (reportName=="DME_lab investigations statistics") || (reportName=="DME_Bio Chemistry Report") || (reportName=="DME_Micro Biology Report")
						|| (reportName=="DME_Pathology Report") || (reportName=="DME_Cancer Control Programme") || (reportName=="DME_Post Mortem Report") 
						|| (reportName=="DME_Blood Bag and Hospital Diet Report") || (reportName=="DME_Caesarean Report") || (reportName=="DME_INPATIENT MONTHWISE")
						|| (reportName=="DME_DELIVERIES STATISTICS") || (reportName=="DME_IMAGING STUDIES") || (reportName=="DME_Sterilisation Statistics")
						|| (reportName=="DME_IMMUNISATION_ NEONATAL AND INFANT DEATHS") || (reportName=="DME_NEONATAL DEATH - Out Born & InBorn") || (reportName=="DME_LAB results")
						|| (reportName=="DME_SNAKE BITE CASES STATISTICS") || (reportName=="DME_maternal") || (reportName=="DME_DOG BITE STATISTICS")
						|| (reportName=="DME_Instwise month wise Dog bites and Rabies Death") || (reportName=="DME_Cancer cases treated and Mortality")
						|| (reportName=="DME_Cadaver")){
					rowName=["Institution Name"];
				}
				else if((reportName=="DME_Institution wise ip report")){
					rowName=["Department"];
				}
				else if((reportName=="DME_SNAKE BITE CASES MONTHWISE STATISTICS") || (reportName=="DME_DOG BITE CASES MONTHWISE STATISTICS")){
					rowName=["Month"];
				}
				else if((reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED") || (reportName=="DME_SC ST Representation_Group_A")
						 || (reportName=="DME_SC ST Representation_Group_B") || (reportName=="DME_SC ST Representation_Group_C") 
						 || (reportName=="DME_SC ST Representation_Group_D")){
					rowName=["Sl.No","Name of the Post"];
				}
				else if(reportName=="DME_SC ST Representation_Abstract"){
					rowName=["Sl.No","Group"];
				}
				else if(reportName=="DME_DEPT INST MONTHWISE SURGERIES REPORT"){
					rowName=["Department","Institution Name","Month"];
				}
				else if((reportName=="DME_Genderwise OP IP") || (reportName=="DME_Lab Monthwise") || (reportName=="DME_INFANT DEATHS, NEONATAL DEATHS MONTHWISE")){
					rowName=["Institution Name","Month"];
				}
				else if(reportName=="DME_Dept wise instwise OP report"){
					rowName=["Department","Institution Name"];
				}
				else if(reportName=="DME_Institution wise Dept wise report"){
					rowName=["Institution Name","Department"];
				}
				else if(reportName=="DME_monthwise inst wise dog bite cases"){
					rowName=["Month","Institution Name"];
				}
				else if(reportName=="DME_LINE_LIST_DENGUE"){
					rowName=["Serial No","Institution Name","Patient Name","Age","Sex","Address","Referral Hospital Name","Whether Recovered","Death",
					         "Fever Cases","Dengue Cases"];
				}
				else if(reportName=="DME_LINE_LIST_H1N1"){
					rowName=["Serial No","Institution Name","Patient Name","Age","Sex","Address","Referral Hospital Name","Whether Recovered","Death",
					         "Fever Cases","AH1N1 Cases"];
				}
				else if(reportName=="DME_LINE_LIST_TICK_FEVER"){
					rowName=["Serial No","Institution Name","Patient Name","Age","Sex","Address","Referral Hospital Name","Whether Recovered","Death",
					         "Fever Cases","Tick Fever Cases"];
				}
				else if(reportName=="DME_LINE_LIST_EBOLA"){
					rowName=["Serial No","Institution Name","Patient Name","Age","Sex","Address","Referral Hospital Name","Whether Recovered","Death",
					         "Fever Cases","Ebola Cases"];
				}
				else if(reportName=="DME_LINE_LIST_DEATH_DENGUE"){
					rowName=["Serial No","Institution Name","Patient Name","Age","Sex","Address","Phone No","Referral Hospital Name",
					         "Platelet less than 1 lakh","Igm Plus","Ns1ag Plus"];
				}
				else if((reportName=="DME_LINE_LIST_DEATH_H1N1") || (reportName=="DME_LINE_LIST_DEATH_TICK_FEVER") 
						|| (reportName=="DME_LINE_LIST_DEATH_EBOLA")){
					rowName=["Serial No","Institution Name","Patient Name","Age","Sex","Address","Phone No","Referral Hospital Name"];
				}
				else if(reportName == "Data Availability Institution Wise"){
					rowName=["File Name","District","Institution Name"];
				}
				else if(reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Post_wise)"){
					rowName=["Serial No","Institution Name","Name of the Post"];
				}
				else if(reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Consolidate)"){
					rowName=["Serial No","Institution Name"];
				}
				else if(reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Consolidate)"){
					rowName=["Serial No","Name of the Post"];
				}
				else if(reportName == "DME_Cadre Strength(Inst_wise Post_wise)"){
					rowName=["Serial No","Institution Name","Name of the Post"];
				}
				else if(reportName == "DME_Cadre_Strength(Inst_wise Consolidate)"){
					rowName=["Serial No","Institution Name"];
				}
				else if(reportName == "DME_Cadre Strength(Post_wise Consolidate)"){
					rowName=["Serial No","Name of the Post"];
				}
				else if((reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Inst_wise)") || (reportName=="DME_Cadre Strength(Post_wise Inst_wise)")){
					rowName=["Serial No","Name of the Post","Institution Name"];
				}
				return rowName;
			}
			
			function getColName(reportName){
				var colName;		
				if((reportName=="DME_DENGUE REPORT (Date Wise)") || (reportName=="DME_EBOLA REPORT (Date Wise)") || (reportName=="DME_AH1N1 REPORT (Date Wise)") 
						|| (reportName=="DME_TICK FEVER REPORT (Date Wise)") || (reportName=="DME_DENGUE  REPORT (Institution wise)") || (reportName=="DME_AH1N1  REPORT (Institution wise)") 
						|| (reportName=="DME_EBOLA  REPORT (Institution wise)") || (reportName=="DME_TICK FEVER REPORT (Institution wise)") || (reportName=="DME_DENGUE REPORT (Monthwise)") 
						|| (reportName=="DME_AH1N1 REPORT (Monthwise)") || (reportName=="DME_EBOLA REPORT (Monthwise)") || (reportName=="DME_TICK FEVER REPORT (Monthwise)")
						|| (reportName=="DME_DENGUE  REPORT (Year wise)") || (reportName=="DME_AH1N1  REPORT (Year wise)") || (reportName=="DME_EBOLA  REPORT (Year wise)") 
						|| (reportName=="DME_TICK FEVER REPORT (Year wise)")){
					colName=["Indicator","General Name"];
				}
				else if((reportName=="DME_DELIVERIES") || (reportName=="DME_IMAGING STUDIES STATISTICS") || (reportName=="DME_LITHOTRIPSY STATISTICS") 
						|| (reportName=="DME_LIVE BIRTHS") || (reportName=="DME_MAJOR MINOR TOTAL SURGERIES") || (reportName=="DME_RENAL TRANSPLANTS STATISTICS") 
						|| (reportName=="DME_MASTER HEALTH CHECKUP") || (reportName=="DME_Deliveries Maternal Death") || (reportName=="DME_Lab Investigation") 
						|| (reportName=="DME_lab investigations statistics") || (reportName=="DME_Bio Chemistry Report") || (reportName=="DME_Micro Biology Report")
						|| (reportName=="DME_Pathology Report") || (reportName=="DME_Cancer Control Programme") || (reportName=="DME_Post Mortem Report") 
						|| (reportName=="DME_Blood Bag and Hospital Diet Report") || (reportName=="DME_Caesarean Report") || (reportName=="DME_Institution wise ip report")
						|| (reportName=="DME_SNAKE BITE CASES MONTHWISE STATISTICS") || (reportName=="DME_SNAKE BITE CASES STATISTICS") 
						|| (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED") || (reportName=="DME_SC ST Representation_Group_A")
						|| (reportName=="DME_SC ST Representation_Group_B") || (reportName=="DME_SC ST Representation_Group_C") 
						|| (reportName=="DME_SC ST Representation_Group_D") || (reportName=="DME_SC ST Representation_Abstract")
						|| (reportName=="DME_DEPT INST MONTHWISE SURGERIES REPORT") || (reportName=="DME_Genderwise OP IP")
						|| (reportName=="DME_Dept wise instwise OP report") || (reportName=="DME_Institution wise Dept wise report") || (reportName=="DME_INFANT DEATHS, NEONATAL DEATHS MONTHWISE")
						|| (reportName=="DME_Cadaver") || (reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Inst_wise)") 
						|| (reportName=="DME_Cadre Strength(Post_wise Inst_wise)") || (reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Post_wise)")
						|| (reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Consolidate)") || (reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Consolidate)")
						|| (reportName == "DME_Cadre Strength(Inst_wise Post_wise)") || (reportName == "DME_Cadre_Strength(Inst_wise Consolidate)")
						|| (reportName == "DME_Cadre Strength(Post_wise Consolidate)")){
					colName=["Indicator"];
				}
				else if((reportName=="DME_INPATIENT MONTHWISE") || (reportName=="DME_maternal")){
					colName=["Month"];
				}
				else if((reportName=="DME_DELIVERIES STATISTICS") || (reportName=="DME_IMAGING STUDIES") || (reportName=="DME_Sterilisation Statistics")
						|| (reportName=="DME_IMMUNISATION_ NEONATAL AND INFANT DEATHS") || (reportName=="DME_NEONATAL DEATH - Out Born & InBorn") || (reportName=="DME_LAB results")
						|| (reportName=="DME_Lab Monthwise")){
					colName=["General Name"];
				}
				else if((reportName=="DME_DOG BITE CASES MONTHWISE STATISTICS") || (reportName=="DME_DOG BITE STATISTICS")){
					colName=["Indicator Category","Indicator"];
				}
				else if(reportName=="DME_monthwise inst wise dog bite cases"){
					colName=["Indicator Category"];
				}
				else if(reportName=="DME_Instwise month wise Dog bites and Rabies Death"){
					colName=["Month","Indicator Category"];
				}
				else if(reportName=="DME_Cancer cases treated and Mortality"){
					colName=["Indicator Category","General Name"];
				}
				return colName;
			}

			function changeFrequency(){
				var selectedFreq=document.getElementById("frequency");
				var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;
				
				var selectedReport=document.getElementById("reportName");
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
				
				if(((reportName=='DME_DENGUE  REPORT (Year wise)') || (reportName=="DME_AH1N1  REPORT (Year wise)") 
						|| (reportName=="DME_EBOLA  REPORT (Year wise)") || (reportName=="DME_TICK FEVER REPORT (Year wise)"))
						&& (freqName=='monthly')){
					document.getElementById("timePeriodFrom").style.display="none";
					document.getElementById("txtFrom").style.display="none"; 	
					document.getElementById("timePeriodTo").style.display="none"; 
					document.getElementById("txtTo").style.display="none"; 	
					document.getElementById("year").style.display="inline";
					document.getElementById("yearName").style.display="inline";
					document.getElementById("monthName").style.display="none";
					document.getElementById("month").style.display="none";
					document.getElementById("month").value=""; 	
					document.getElementById("txtFrom").value=""; 	
					document.getElementById("txtTo").value=""; 	
					document.getElementById("timePeriodFromYear").style.display="none";
					document.getElementById("timePeriodToYear").style.display="none"; 
					document.getElementById("fromYear").style.display="none";
					document.getElementById("toYear").style.display="none"; 
					document.getElementById("fromYear").value=""; 	
					document.getElementById("toYear").value=""; 	
				}
				else if(((reportName=='DME_DENGUE  REPORT (Year wise)') || (reportName=="DME_AH1N1  REPORT (Year wise)") 
						|| (reportName=="DME_EBOLA  REPORT (Year wise)") || (reportName=="DME_TICK FEVER REPORT (Year wise)"))
						&& (freqName=='timeperiod')){
					document.getElementById("year").style.display="none";
					document.getElementById("yearName").style.display="none";
					document.getElementById("monthName").style.display="none";
					document.getElementById("month").style.display="none";
					document.getElementById("timePeriodFrom").style.display="none";
					document.getElementById("txtFrom").style.display="none"; 
					document.getElementById("timePeriodTo").style.display="none";
					document.getElementById("txtTo").style.display="none";
					document.getElementById("year").value="";
					document.getElementById("month").value="";
					document.getElementById("txtFrom").value=""; 	
					document.getElementById("txtTo").value=""; 	
					document.getElementById("timePeriodFromYear").style.display="inline";
					document.getElementById("timePeriodToYear").style.display="inline"; 
					document.getElementById("fromYear").style.display="inline";
					document.getElementById("toYear").style.display="inline"; 
				}
				else{
					if(freqName=='monthly' && reportName != 'Data Availability Institution Wise'){
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
						document.getElementById("timePeriodFromYear").style.display="none";
						document.getElementById("timePeriodToYear").style.display="none"; 
						document.getElementById("fromYear").style.display="none";
						document.getElementById("toYear").style.display="none"; 
						document.getElementById("fromYear").value=""; 	
						document.getElementById("toYear").value=""; 	
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
						document.getElementById("timePeriodFromYear").style.display="none";
						document.getElementById("timePeriodToYear").style.display="none"; 
						document.getElementById("fromYear").style.display="none";
						document.getElementById("toYear").style.display="none"; 
						document.getElementById("fromYear").value=""; 	
						document.getElementById("toYear").value="";
				        var searchMinDate = "-6y";
				        var searchMaxDate = "-m";
				        if ((new Date()).getDate() <= 9) {
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
			} 
			
			function changeInstDropdown(){
				var selectedReport=document.getElementById("reportName");
				if (selectedReport != 'undefined') {
					var reportName=selectedReport.options[selectedReport.selectedIndex].value; 
				 }
				
				if((reportName=="DME_DENGUE REPORT (Date Wise)") || (reportName=="DME_EBOLA REPORT (Date Wise)") || (reportName=="DME_AH1N1 REPORT (Date Wise)") 
						|| (reportName=="DME_TICK FEVER REPORT (Date Wise)") || (reportName=="DME_DENGUE  REPORT (Institution wise)") || (reportName=="DME_AH1N1  REPORT (Institution wise)") 
						|| (reportName=="DME_EBOLA  REPORT (Institution wise)") || (reportName=="DME_TICK FEVER REPORT (Institution wise)") || (reportName=="DME_DENGUE REPORT (Monthwise)") 
						|| (reportName=="DME_AH1N1 REPORT (Monthwise)") || (reportName=="DME_EBOLA REPORT (Monthwise)") || (reportName=="DME_TICK FEVER REPORT (Monthwise)")
						|| (reportName=="DME_DENGUE  REPORT (Year wise)") || (reportName=="DME_AH1N1  REPORT (Year wise)") || (reportName=="DME_EBOLA  REPORT (Year wise)") 
						|| (reportName=="DME_TICK FEVER REPORT (Year wise)") || (reportName == "DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Inst_wise Post_wise)")
						|| (reportName == "DME_Cadre Strength(Inst_wise Post_wise)")){
					document.getElementById("institutionLabel").style.display="inline";
					document.getElementById("institutionValue").style.display="inline";
					document.getElementById("institutionTypeLabel").style.display="inline";
					document.getElementById("institutionType").style.display="inline";
					document.getElementById("postTypeLabel").style.display="none";
					document.getElementById("postType").style.display="none";
					document.getElementById("postLabel").style.display="none";
					document.getElementById("postValue").style.display="none";
				}
				else if((reportName=="DME_THREE PERCENT RESERVATION FOR DIFFERENTLY ABLED(Post_wise Inst_wise)") || 
						(reportName=="DME_Cadre Strength(Post_wise Inst_wise)")){
					document.getElementById("institutionLabel").style.display="none";
					document.getElementById("institutionValue").style.display="none";
					document.getElementById("institutionTypeLabel").style.display="none";
					document.getElementById("institutionType").style.display="none";
					document.getElementById("postTypeLabel").style.display="inline";
					document.getElementById("postType").style.display="inline";
					document.getElementById("postLabel").style.display="inline";
					document.getElementById("postValue").style.display="inline";
				}
				else{
					document.getElementById("institutionLabel").style.display="none";
					document.getElementById("institutionValue").style.display="none";
					document.getElementById("institutionTypeLabel").style.display="none";
					document.getElementById("institutionType").style.display="none";
					document.getElementById("postTypeLabel").style.display="none";
					document.getElementById("postType").style.display="none";
					document.getElementById("postLabel").style.display="none";
					document.getElementById("postValue").style.display="none";
				}
			}
			var prevReportName=null;
			function newReportChange(){
				var reportName=$('#reportName').val();
				if(reportName == 'Data Availability Institution Wise'){
					prevReportName = reportName;
					$("#frequency option[value='timeperiod']").remove();
					$("#frequency").append('<option value="Daily">Daily</option>');
					$("#fileName").show();
					$("#fileNameLabel").show();
					$("#date").show();
					$("#dateLabel").show();		
					getCalender();
					$("#year").hide();
					$("#yearName").hide();
					$("#monthName").hide();
					$("#month").hide();					
					var freqName=$("#freqName").val();
					$("#frequency").val(freqName);
				}else if(prevReportName == 'Data Availability Institution Wise'){
					prevReportName=reportName;
					$("#frequency option[value='Daily']").remove();
					$("#frequency").append('<option value="timeperiod">Time Period</option>');
					$("#fileName").hide();
					$("#fileNameLabel").hide();
					$("#date").datepicker("destroy");
					$("#date").hide();
					$("#dateLabel").hide();	
					$("#year").show();
					$("#yearName").show();
					$("#monthName").show();
					$("#month").show();
				}
			}
			function getFileName(){
				var frequency=$("#frequency").val();
				$("#freqName").val(frequency);
				if(frequency == 'Daily' || frequency == 'monthly'){
					$.ajax({
						type:"POST",
						url:'getFileNames.do',
						'data':{
							frequency:frequency
						},
						 success: function(result){
							 	//var data = JSON.parse(result);
							 	//var fileNames=result.fileNames;
							 	var res=JSON.parse(result);
							 	$("#fileName").empty();
							 	var temp;
							 	for(i=0;i<res.length;i++){
							 		temp+='<option value='+res[i]+'>'+res[i]+'</option>';
							 	}
							 	$("#fileName").append(temp);
						 },
						 error: function (xhr, status, error) {
				                alert("Internal Error Occured-Please Contact System Administrator");
						    }});
				}
			}
			function getCalender(){
				 $( "#date" ).datepicker({
						dateFormat: 'yy-mm-dd',
						});				
			}
		</script> 
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
	
	</body>
</html>