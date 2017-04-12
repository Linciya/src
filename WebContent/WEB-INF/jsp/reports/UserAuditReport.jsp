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
		<title>User Login Audit Report</title>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<link rel="stylesheet" href="css/multiple-select.css">
		<script src="js/multiple-select.js"></script>
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
           /*  table = '<tr><th class="pvtAxisLabel">User Name</th></tr>'; */
            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
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
		
		/* .pvtTotal, .pvtTotalLabel, .pvtGrandTotal {display: none} */
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
		#dataEntryFooterID{
			margin-top: 450px;
		}
		.pivotTableStyle1 {
		    height: 440px;
		    width: 100%;
		    overflow: auto;
		    /* position: absolute; */
		    box-shadow: 0 0 1em olive;
		    border-radius: 10px;
		}
		</style>
	</head>
		
	<body onload ="onLoad();" style="font-family: Tahoma;">	
	 	<div style="width:100%">
			<div id="directorateNameHeader">User Login Audit Report</div>	
				<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
			 	<table id="searchCriteria">
					<tr>
						<td class="searchCriteria"><spring:message code="label_searchcriteria_directorate"/></td>
						<td class="searchCriteria" style="padding-left:5px;">							
							<select id="directorateName" name="directorateName" class="reportDropDown" style="width:350px;" multiple="multiple">
								 <c:forEach var="directorate" items="${directorateList}">
								     <option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
								 </c:forEach>
							</select>
						</td>
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_frequency"/></td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="frequency" name="frequency" class="reportDropDown" style="width:95px;" onchange="changeFrequency();">
								<option value="yearly">Yearly</option> 
								<option value="monthly"><spring:message code="option_frequency_monthly"/></option>
							</select> 
						</td>		
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_year"/>
						 </td>	
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="year" name="year" class="reportDropDown" style="width:65px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
							</select> 
						</td>	
						<td class="searchCriteria" style="padding-left:10px;"><label id="monthName"><spring:message code="label_searchcriteria_month"/></label>
						</td>
						<td class="searchCriteria" style="padding-left:5px;">
							<select id="month" name="month" class="reportDropDown" style="width:85px;">
									<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="months" items="${monthsList}">
		                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
		                		</c:forEach> 
							</select> 
						</td>
						<td class="searchCriteria"><button onclick="userAuditOnSearch();"><spring:message code="label_searchcriteria_search"/></button></td>	
						
					</tr>			
					<div><button style="float:right;margin-right:10px;margin-top:7px;"onclick="tableToExcel('pvtTable','sheet1')"><spring:message code="label_exporttoexcel"/></button></div>
				</table>
				
				</div>	
			<div id="pvt" class="pivotTableStyle1"></div>
			<div id="noDataMsg" align="center" style="width:100%;padding-top:70px;height:380px;"><p>This Report has no data for the selected Month and Year </p></div> 
		</div>
		
		<script type="text/javascript">		
			
			function onLoad(){
				var month = "<%= request.getAttribute("month") %>";
				var year = <%= request.getAttribute("year") %>;				
				document.getElementById('year').value=year;
				document.getElementById('month').value=month;
				document.getElementById('frequency').value="monthly";
				var userAuditReportData = <%= request.getAttribute("userAuditReportData") %>;
				if(userAuditReportData!=null && userAuditReportData.length>1){
					document.getElementById("noDataMsg").style.display="none";
					document.getElementById("pvt").style.display="block";
					pivotTable(userAuditReportData);
				}
				else{
					document.getElementById("pvt").style.display="none";
					document.getElementById("noDataMsg").style.display="block";
				}
				$('#directorateName').multipleSelect({
			    	filter: true,
			    	placeholder:"All Directorates"
			    });
			}
			
			function userAuditOnSearch(){
				var monthName;
				var selectedDirectorateName=$('#directorateName').val();
				var directorateName=selectedDirectorateName.toString();
				var selectedFreq=document.getElementById("frequency");
				var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;				
				var year=document.getElementById("year");
				if(year!='undefined'){
					var year=year.options[year.selectedIndex].value;
				}
				if(freqName=='monthly'){		
					var selectedMonth=document.getElementById("month");
					 if (selectedMonth != 'undefined') {
						monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
					}
				}
				$.ajax({
					type:"POST",
					url:'userAuditOnSearch.do',
					'data':{
						directorateName:directorateName,year:year,month:monthName,freqName:freqName
					},
					 success: function(result){
						 	var data = JSON.parse(result);
						 	if(data!=null && data.length>1){
								document.getElementById("noDataMsg").style.display="none";
								document.getElementById("pvt").style.display="block";
								pivotTable(data);
							}
							else{
								document.getElementById("pvt").style.display="none";
								document.getElementById("noDataMsg").style.display="block";
							}						 	
					 },
						error: function () {
					    	 $errorMessage.text("Onchange Error");
					    }});
				}
			
			function pivotTable(data){
				var rowName;				
				rowName=["User Name","Directorate Name","Tier","Login Time","IP Address"];		
				var utils = $.pivotUtilities;
				var heatmap =  utils.renderers["Table"];
				var sumOverSum =  utils.aggregators["Sum over Sum"];
				var derivers = $.pivotUtilities.derivers;
				$("#pvt").pivot(
						data, {
						    rows:rowName,
						    /* cols: [""], */
						    aggregator: $.pivotUtilities.aggregators["Integer Sum"]([""]), 
						    aggregatorName: "Sum over Sum",
						    rendererName: "Line Chart",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
						  }); 	   
			}
			
			function changeFrequency(){
				var selectedFreq=document.getElementById("frequency");
				var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;
		
				if(freqName=='monthly'){
					document.getElementById("monthName").style.display="inline";
					document.getElementById("month").style.display="inline";
				} 
				else if(freqName=='yearly'){
					document.getElementById("monthName").style.display="none";
					document.getElementById("month").style.display="none";
					document.getElementById("month").value=""; 	
				}
			} 
		</script> 
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
	
	</body>
</html>