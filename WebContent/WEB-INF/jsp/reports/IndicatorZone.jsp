<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.json.JSONArray"%>
    <%@page import="org.json.JSONObject"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
.indzone{
width: 60.6%;
overflow: acroll;
}
#mainDiv {
  width: 60.6%;
  min-height: 600px;
  margin: 0 auto;
  margin-left:-5px;
}
.identifierLogo{
 width: 60.6%;
}
#identifierFooter{
width: 60.6%;
}
</Style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Key Indicators</title>
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
</head>
<body onload ="onLoad();" style="font-family: Verdana;">
<form id="indzone" name="indzone" method="POST" action="FusionServlet" >
<div style="margin-top:-520px;width:60%;overflow: scroll;">
<div id="header" style="height:15%"> 
			<table>
				<tr>
					<td style="font-weight:bold;"> Indicator </td>
					<td style="padding-left:20px;">
						<select id="indicators" name="indicators" class="dropDown" onchange="changeInd();">
							<option value="Disease Outbreak">Disease Outbreak</option>
						</select> 
					</td>
					<td style="padding-left:40px;font-weight:bold;"> Frequency </td>	
					<td style="padding-left:20px;">
						<select id="frequency" name="frequency" class="dropDown" onchange="changeFrequency();">
							<option value="yearly">Yearly</option>
							<option value="monthly">Monthly</option>
							<!-- <option value="timeperiod">TimePeriod</option> -->
						</select> 
					</td>		
					<td style="padding-left:40px;font-weight:bold;"><label id="yearName">Year</label> <!-- <label id="timePeriodFrom">From</label> --> </td>	
					<td style="padding-left:20px;">
						<select id="year" name="year" class="dropDown">
							<option value="2016">2016</option>
							<option value="2015">2015</option>
						</select> 
					</td>	
					<td style="padding-left:40px;font-weight:bold;"><label id="monthName">Month</label> <!-- <label id="timePeriodTo">To</label> --> </td>
					<td style="padding-left:20px;">
						<select id="month" name="month" class="dropDown" onchange="changeMonth();">
							<c:forEach var="months" items="${monthsList}">
	                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
	                		</c:forEach> 
						</select> 
					</td>	
					<td><input type="button" onclick="tableToExcel('pvtTable', 'sheet1')" value="Export to Excel"></td>
				</tr>			
			</table>
</div>
<div id="pvt" style="width:100%; height:85% "></div>
</div>
<script type="text/javascript">

function onLoad(){
	document.getElementById("indicators").value='<%= request.getAttribute("selectedInd") %>';
	var inddata = <%= request.getAttribute("indData") %>;
	var utils = $.pivotUtilities;
	var heatmap =  utils.renderers["Table"];
	var sumOverSum =  utils.aggregators["Sum over Sum"];
	var derivers = $.pivotUtilities.derivers;
	$("#pvt").pivot(
			  inddata, {
			    rows: [ "Category"],
			    cols: ["District",],
			    vals: ["Value"],
			    aggregatorName: "Sum",
			    rendererName: "Line Chart",
		        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
			  }); 
  
}

function changeInd(){
	var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value;
	var contextPath='<%=request.getContextPath()%>';
	var method="get";
	var action="indicatorZone.do";	
	ChangeDiseaseIndicator(indName,contextPath,method,action);

}
</script>
</form>
</body>
</html>