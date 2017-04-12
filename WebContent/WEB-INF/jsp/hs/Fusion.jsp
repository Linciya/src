<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.json.JSONArray"%>
    <%@page import="org.json.JSONObject"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<Style>
#headerTable {
    padding:0px;
    border-collapse: collapse;
}
.selected {
    background-color:#F7DC6F;
}
#indTable1{
 	width: 30em;
}
#indTable {
    width: 30em;
    margin: 5em auto;
    background: #ccc;
}

#indTable1 thead {
    background: #000;
    color: #fff;
}
#indTable1 td {
    width: auto;
    padding: 0.3em;
}
#indTable td {
    width: auto;
    padding: 0.3em;
}

#indTable tbody {
    background: #ccc;
}

div.pager {
    text-align: center;
    margin: 2em auto;
}

div.pager span {
    display: inline-block;
    width: 1.8em;
    height: 1.8em;
    line-height: 1.8;
    text-align: center;
    cursor: pointer;
    background: #000;
    color: #fff; 
    margin-right: 0.5em;
}

div.pager span.active {
    background: #c00;
}
/* #mainDiv{
	margin-top:-10px;
} */

</Style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SDGS Indicators</title>
		<script src="js/Fusion.js"></script>
		<script src="js/fusioncharts.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
		<script src="js/fusioncolumn3d.js"></script>
		<script src="js/fusionpie.js"></script>
		<script src="js/sdgs.js"></script>
		<script src="js/script.js"></script>
		<!-- <script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
		<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.fint.js?cacheBust=56"></script>
		 -->
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
</head>
<body onload ="onLoad();">
<form id =sdgsForm name="sdgsForm">
<div id="mainDiv" style="margin-top:-520px;"> 
<input type="hidden" id="submitType" name="submitType"/>
			<div style="width:100%;">
			<table id="headerTable">
				<tr>
					<td style="font-weight:bold;"> Indicator </td>
					<td style="padding-left:20px;">
						<select id="indicators" name="indicators" class="dropDown" onchange="changeInd('<%=request.getContextPath()%>');">
							<option value="maternal mortality rate">Maternal Mortality Rate</option>
							<option value="infant mortality rate">Infant Mortality Rate</option>
							<option value="CD Indicators">CD Indicators</option>
							<option value="NCD Indicators">NCD Indicators</option>
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
							<!-- <option value="jan">January</option>
							<option value="feb">February</option> -->
							<c:forEach var="months" items="${monthsList}"> 
	                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
	                		</c:forEach> 
						</select> 
					</td>	
				</tr>			
			</table>
				<div id="placeholdertop" style="background:#E9FFDB;width:100%; height:10%;">
				<P id = "analyticsheader" style="font-size:small;font-weight:bold;"><%= request.getAttribute("selectedInd") %> - Analytics</P>
				</div>
				<div style="width:100%;background:white; height:45% ">	
					<div style="width:100%;">
						<div id="chart-container0" style="float:left;width:25%;">
						<P style="font-size:small;font-weight:bold;" >District-wise Report </P>
						<table id="indTable1" style="width:100%;font-size:small;height:auto; border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
						<%-- <c:forEach var="Test" items="${jsonData}"> 
							<tr id="${Test.indicator}" onclick="showName(this);"><td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small">${Test.value}</td></tr>
						 </c:forEach> --%>
						 <thead>
						 <tr style="font-size:small">
						 <td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white "> District Name </td>
						 <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Death </td>
						 <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Birth </td>
						 <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Rate </td>
						 </tr>
						 </thead>
						 <tbody id="indTable" class="paginated" name="jsonData"  >
						 <%
						 JSONArray data=(JSONArray)request.getAttribute("jsonData");
						 	for(int i=0;i<data.length();i++){
						 		JSONObject row=data.getJSONObject(i);%>
						 		<%-- <%=row.get("label")%> --%>
						 		<tr id=<%=row.get("label")%> style="font-size:small">
							 		<td onclick="showName(this);" style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small "><%=row.get("label")%></td>
							 		<td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("value")%></td>
							 		<td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("live")%></td>
						 		    <td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("rate")%></td>
						 		</tr>
						 	<%}%>
						 </tbody>
						</table>
						</div>
						<div id="doughnut2dChart" style="float:right;width: 25%;">	</div>
						<div id="barChart" style="float:left;width:25%;"></div>
						<div id="heatMapChart" style="float:left;width:25%;"></div>
					</div>	
				</div>
				
				<div style="float:left;width:100%; height:43%;">	
				<div id="placeholdermid2" style="background:#96DEFF;width:100%;margin-top: 0px; height:6%;">
				<P style="font-size:small;font-weight:bold;vertical-align: middle;" ><%= request.getAttribute("selectedInd") %> -  Factors </P>
				</div>
				<div style="width:100%;">	
					<div id="multiAxisLineChart" style="float:right;width:25%;"> </div>
					<div id="pareto2dChart" style="float:left;width:25%;">	</div>
					<div id="horizontalBarChart" style="float:right;width:25%;">	</div>
					<div id="multiSeriesChart" style="float:left;width:25%;"> </div>
				</div>
				</div>
		</div>
		</div>
</form>	
</body>
<script>

var form = $('#sdgsForm');
var flag = 0;
 $('td', 'indTable').each(function(i) {
    $(this).text(i+1);
});
$('tbody.paginated').each(function() {
    var currentPage = 0;
    var numPerPage = 12;
    var $table = $(this);
    $table.bind('repaginate', function() {
        $table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
    });
    $table.trigger('repaginate');
    var numRows = $table.find('tr').length;
    var numPages = Math.ceil(numRows / numPerPage);
    var $pager = $('<div class="pager"></div>');
    for (var page = 0; page < numPages; page++) {
        $('<span class="page-number"></span>').text(page + 1).bind('click', {
            newPage: page
        }, function(event) {
            currentPage = event.data['newPage'];
            $table.trigger('repaginate');
            $(this).addClass('active').siblings().removeClass('active');
        }).appendTo($pager).addClass('clickable');
    }
    $pager.insertAfter($table).find('span.page-number:first').addClass('active');
}); 

var all_tr = $('#indTable tr');
$('#indTable td').on('click', function () {
    all_tr.removeClass('selected');
    $(this).closest('#indTable tr').addClass('selected');
});
//ChartProperties
var heatMapProperties={"type": 'heatmap',"renderAt": 'heatMapChart',"width": '500',"height": '300',"dataFormat": 'json',"theme": "fint","showPlotBorder": "0","gradient": "1","colorRangeCode": "#e24b1a","startLabel": "Good","endLabel": "Poor", "colorRangeColorCode1": "#6da81e","colorLabel1": "Good","colorRangeColorCode2": "#f6bc33","colorLabel2": "Average","colorRangeColorCode3": "#e24b1a","colorLabel3": "Bad"};
var barChartProperties={"type": 'stackedcolumn2dline',"renderAt": 'barChart', "width": '400',"height": '350',"dataFormat": 'json',"showPercentValues": "1","showPercentInTooltip": "0","enableSmartLabels": "1","decimals": "1","skipOverlapLabels": "1","theme": "fint","seriesname": "Type Comparison","showValues":"0"};
var pareto2dChartProperties={"type": 'pareto2d',"renderAt": 'pareto2dChart', "width": '350',"height": '350',"dataFormat": 'json',"paletteColors": "#e44a00,#f8bd19,#6baa01,#008ee4,#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000","bgAlpha": "0","showBorder": "0","decimals": "2","borderAlpha": "20","labelDistance": "15","is2D": "1"};
var multiSeriesChartProperties={"type": 'mscombi2d',"renderAt": 'multiSeriesChart', "width": '375',"height": '400',"dataFormat": 'json',"showBorder": "0","showValues": "0","paletteColors": "#0075c2,#1aaf5d,#f2c500","bgColor": "#ffffff","showCanvasBorder": "0","canvasBgColor": "#ffffff","captionFontSize": "14",
        "subcaptionFontSize": "14","subcaptionFontBold": "0","divlineColor": "#999999","divLineIsDashed": "1","divLineDashLen": "1","divLineGapLen": "1","showAlternateHGridColor": "0","usePlotGradientColor": "0","toolTipColor": "#ffffff","toolTipBorderThickness": "0","toolTipBgColor": "#000000","toolTipBgAlpha": "80",
        "toolTipBorderRadius": "2","toolTipPadding": "5","legendBgColor": "#ffffff","legendBorderAlpha": '0',"legendShadow": '0',"legendItemFontSize": '10',"legendItemFontColor": '#666666',"seriesName1": "For Current Month","showValues": "1","seriesName2": "For last Month","renderAs1": "line","seriesName3": "Previous to Last Month",
        "renderAs2": "area"};
var horizontalBarChartProperties={"type": 'bar2d',"renderAt": 'horizontalBarChart', "width": '450',"height": '350',"dataFormat": 'json',"paletteColors": "#e44a00,#f8bd19,#6baa01,#008ee4,#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000","bgColor": "#ffffff","showBorder": "0","legendBorderAlpha": "1","legendBgAlpha": "1","legendShadow": "1",
		"placevaluesInside": "1","valueFontColor": "#ffffff","alignCaptionWithCanvas": "1","showHoverEffect":"0","captionFontSize": "14","subcaptionFontSize": "14","subcaptionFontBold": "0","divlineColor": "#999999","divLineIsDashed": "0","divLineDashLen": "1","divLineGapLen": "1","showAlternateHGridColor": "0","toolTipColor": "#ffffff",
		"toolTipBorderThickness": "0","toolTipBgColor": "#000000","toolTipBgAlpha": "80","toolTipBorderRadius": "2","toolTipPadding": "5","seriesname": "AN Details","showValues":"0"};
var doughnut2dChartProperties={"type": 'doughnut2d',"renderAt": 'doughnut2dChart', "width": '500',"height": '350',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000","bgColor": "#ffffff","showBorder": "0","use3DLighting": "0","showShadow": "0","enableSmartLabels": "0","startingAngle": "310","showLabels": "0","showPercentValues": "1","showLegend": "1",
		"legendShadow": "0","legendBorderAlpha": "0","centerLabelBold": "1","showTooltip": "0","decimals": "0","captionFontSize": "14","subcaptionFontSize": "14","subcaptionFontBold": "0","seriesname": "Food Products",
        "showValues":"0"};
var multiAxisLineChartProperties={"type": 'multiaxisline',"renderAt": 'multiAxisLineChart', "width": '400',"height": '400',"dataFormat": 'json',"id": 'revenue-chart',"theme": "fint","titlepos": "left","tickwidth": "10","divlineisdashed": "1","numdivlines": "14","seriesnameGT": "Age wise < 18","seriesnameLT": "Age wise < 18"};

function onLoad(){

	document.getElementById("indicators").value='<%= request.getAttribute("selectedInd") %>';
	var chartColumnHeader=<%= request.getAttribute("chartColumnHeader") %>;
	var chartRange=<%= request.getAttribute("chartRange") %>;
	
	//heatMap
	var heatMapHeader=chartColumnHeader[1];
	var heatMapSubCaption="By High Incidence";
	var heatMapYAxisName="Last 3 Months";
	var heatMapXAxisName="Features";
	var heatMapData=<%= request.getAttribute("heatMapChildList") %>;
	var mngood=chartRange[0];
	var mxgood=chartRange[1];
	var mnavg=chartRange[2];
	var mxavg=chartRange[3];
	var mnpoor=chartRange[4];
	var mxpoor=chartRange[5];
	var captionAlignment="centre";
	//barChart
	var barChartHeader=chartColumnHeader[0];
	var barChartSubCaption="Current Month";
	var barChartData = <%= request.getAttribute("nca") %>;
	//pareto2dChart
	var pareto2dChartData = <%= request.getAttribute("risk") %>;
	var pareto2dChartSubcaption = " For the current Month";
	var pareto2dChartHeader=chartColumnHeader[3];
	//MultiSeriesChart
	var multiSeriesChartSubcaption="For the month";
	var multiSeriesChartYAxisName="Delivery Count";
	var multiSeriesChartXAxisName="Month";
	var multiSeriesChartdel1 = <%= request.getAttribute("del1") %>;
	var multiSeriesChartdel2 = <%= request.getAttribute("del2") %>;
	var multiSeriesChartdel3 = <%= request.getAttribute("del3") %>;
	var multiSeriesChartHeader=chartColumnHeader[4];
	//horizontalBarChart
	var horizontalBarChartData = <%= request.getAttribute("anm") %>;
	var horizontalBarChartHeader=chartColumnHeader[5];
	var horizontalBarChartSubCaption="For the Current Month";
	var horizontalBarChartYAxisname="Indicator Name";
	//doughnut2dChart
	var doughnut2dChartData = <%= request.getAttribute("jsonData") %>;
	var doughnut2dChartHeader=chartColumnHeader[2];
	var doughnut2dChartSubCaption="For Current Month";
	//multiAxisLineChart
	var multiAxisLineChartHeader=chartColumnHeader[6];
	var multiAxisLineChartXAxisname="Month";
	var multiAxisLineGT=<%= request.getAttribute("axisLineGT") %>;
	var multiAxisLineLT=<%= request.getAttribute("axisLineLT") %>;
	
	/* var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value; */
	var currentMonth = "<%= request.getAttribute("currentMonth") %>";
	var currentYear = <%= request.getAttribute("currentYear") %>;
	document.getElementById('month').value=currentMonth;
	document.getElementById('year').value=currentYear;
	document.getElementById('frequency').value='monthly';
	
	heatMap(heatMapProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,heatMapData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
	barChart(barChartProperties,barChartSubCaption,barChartData,barChartHeader);
	pareto2dChart(pareto2dChartProperties,pareto2dChartSubcaption,pareto2dChartData,pareto2dChartHeader);
	multiSeriesChart(multiSeriesChartProperties,multiSeriesChartSubcaption,multiSeriesChartXAxisName,multiSeriesChartYAxisName,multiSeriesChartdel1,multiSeriesChartdel2,multiSeriesChartdel3,multiSeriesChartHeader);
	horizontalBarChart(horizontalBarChartProperties,horizontalBarChartSubCaption,horizontalBarChartYAxisname,horizontalBarChartData,horizontalBarChartHeader);
	doughnut2dChart(doughnut2dChartProperties,doughnut2dChartSubCaption,doughnut2dChartData,doughnut2dChartHeader);
	multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,multiAxisLineGT,multiAxisLineLT,multiAxisLineChartHeader);
}


</script>
<script>


function showName(key){
	var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value;
	var selectedMonth=document.getElementById("month");
	var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
	var param = key.innerText;
	
	$.ajax({
		type: "POST",
		url: "showInstData.do",
		'data':  { 
			districtName:param,monthName:monthName,indName:indName
		    },
		    success: function (result) {
		    	var data = JSON.parse(result);
		    	var chartColumnHeader=data.chartColumnHeader;
				var chart1Header=chartColumnHeader[0];
				var chartRange=data.chartRange;
				//heatMap
				var heatMapHeader=chartColumnHeader[1];
				var heatMapSubCaption="By High Incidence";
				var heatMapYAxisName="Last 3 Months";
				var heatMapXAxisName="Features";
				var heatMapData=data.childListHM;
				var mngood=chartRange[0];
				var mxgood=chartRange[1];
				var mnavg=chartRange[2];
				var mxavg=chartRange[3];
				var mnpoor=chartRange[4];
				var mxpoor=chartRange[5];
				var captionAlignment="centre";
				//barChart
				var barChartHeader=chartColumnHeader[5];
				var barChartSubCaption="Current Month";
				var barChartData=data.ncList;
				//pareto2dChart
				var pareto2dChartData = data.lbdlist;
				var pareto2dChartSubcaption = " For the current Month";
				var pareto2dChartHeader=chartColumnHeader[3];
				//MultiSeriesChart
				var multiSeriesChartSubcaption="For the month";
				var multiSeriesChartYAxisName="Delivery Count";
				var multiSeriesChartXAxisName="Month";
				var multiSeriesChartHeader=chartColumnHeader[4];
				var multiSeriesChartdel1 = data.dellist;
				var multiSeriesChartdel2 = data.dellist1;
				var multiSeriesChartdel3 = data.dellist2;
				//horizontalBarChart
				var horizontalBarChartData = data.indlist;
				var horizontalBarChartHeader=chartColumnHeader[5];
				var horizontalBarChartSubCaption="For the Current Month";
				var horizontalBarChartYAxisname="Indicator Name";
				//doughnut2dChart
				var doughnut2dChartData = data.instlist;
				var doughnut2dChartHeader=chartColumnHeader[2];
				var doughnut2dChartSubCaption="For Current Month";
				//multiAxisLineChart
				var multiAxisLineChartHeader=chartColumnHeader[6];
				var multiAxisLineChartXAxisname="Month";
				var multiAxisLineGT=data.axisLineGT1;
				var multiAxisLineLT=data.axisLineLT1;
				
		    	heatMap(heatMapProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,heatMapData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
		    	barChart(barChartProperties,barChartSubCaption,barChartData,barChartHeader);
		    	pareto2dChart(pareto2dChartProperties,pareto2dChartSubcaption,pareto2dChartData,pareto2dChartHeader);
		    	multiSeriesChart(multiSeriesChartProperties,multiSeriesChartSubcaption,multiSeriesChartXAxisName,multiSeriesChartYAxisName,multiSeriesChartdel1,multiSeriesChartdel2,multiSeriesChartdel3,multiSeriesChartHeader);
		    	horizontalBarChart(horizontalBarChartProperties,horizontalBarChartSubCaption,horizontalBarChartYAxisname,horizontalBarChartData,horizontalBarChartHeader);
		    	doughnut2dChart(doughnut2dChartProperties,doughnut2dChartSubCaption,doughnut2dChartData,doughnut2dChartHeader);
		    	multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,multiAxisLineGT,multiAxisLineLT,multiAxisLineChartHeader);
		      },
		      error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			    }});
 	}
/* function changeFrequency(){
var selectedFreq=document.getElementById("frequency");
var freqName=selectedFreq.options[selectedFreq.selectedIndex].value;
 if(freqName=='yearly'){
	document.getElementById("year").style.display="inline";
	document.getElementById("yearName").style.display="inline";
	document.getElementById("monthName").style.display="none";
	document.getElementById("month").style.display="none";	
} 
if(freqName=='monthly'){
	document.getElementById("year").style.display="inline";
	document.getElementById("yearName").style.display="inline";
	document.getElementById("monthName").style.display="inline";
	document.getElementById("month").style.display="inline";	
} 
 if(freqName=='timeperiod'){
	document.getElementById("year").style.display="none";
	document.getElementById("yearName").style.display="none";
	document.getElementById("timePeriodFrom").style.display="inline";
	document.getElementById("timePeriodTo").style.display="inline";
	document.getElementById("monthName").style.display="none";
	document.getElementById("month").style.display="none";
} 
} */

function changeInd(){
 	var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value;
	var contextPath='<%=request.getContextPath()%>';
	var method="get";
	if(indName=='maternal mortality rate' || indName=='infant mortality rate'){
		var action="sdgs.do";	
	}
	else if(indName=='CD Indicators'){
		var action="showOnLoadTreeMapData.do";	
	}
	else if(indName=='NCD Indicators'){
		var action="showOnLoadNCDData.do";	
	}
	ChangeDiseaseIndicator(indName,contextPath,method,action);
}
function changeMonth(){
var selectedInd=document.getElementById("indicators");
var indName=selectedInd.options[selectedInd.selectedIndex].value;
var selectedMonth=document.getElementById("month");
var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
$.ajax({
	type: "POST",
	url: "onChangeMonth.do",
	'data':{
		monthName:monthName,monthName:monthName,indName:indName
	},
	 success: function(result){
		 	var data = JSON.parse(result);
		 	var chartColumnHeader=data.chartColumnHeader;
			var chart1Header=chartColumnHeader[0];
			var chartRange=data.chartRange;
			//hetaMap
			var heatMapHeader=chartColumnHeader[1];
			var heatMapSubCaption="By High Incidence";
			var heatMapYAxisName="Last 3 Months";
			var heatMapXAxisName="Features";
			var heatMapData=data.heatMapChildList;
			var mngood=chartRange[0];
			var mxgood=chartRange[1];
			var mnavg=chartRange[2];
			var mxavg=chartRange[3];
			var mnpoor=chartRange[4];
			var mxpoor=chartRange[5];
			var captionAlignment = "centre";
			//barChart
			var barChartHeader=chartColumnHeader[5];
			var barChartSubCaption="Current Month";
			var barChartData=data.nca;
			//pareto2dChart
			var pareto2dChartData = data.risk;
			var pareto2dChartSubcaption = " For the current Month";
			var pareto2dChartHeader=chartColumnHeader[3];
			//MultiSeriesChart
			var multiSeriesChartSubcaption="For the month";
			var multiSeriesChartYAxisName="Delivery Count";
			var multiSeriesChartXAxisName="Month";
			var multiSeriesChartHeader=chartColumnHeader[4];
			var multiSeriesChartdel1 = data.del1;
			var multiSeriesChartdel2 = data.del2;
			var multiSeriesChartdel3 = data.del3;
			//horizontalBarChart
			var horizontalBarChartData = data.anm;
			var horizontalBarChartHeader=chartColumnHeader[5];
			var horizontalBarChartSubCaption="For the Current Month";
			var horizontalBarChartYAxisname="Indicator Name";
			//doughnut2dChart
			var doughnut2dChartData = data.array;
			var doughnut2dChartHeader=chartColumnHeader[2];
			var doughnut2dChartSubCaption="For Current Month";
			//multiAxisLineChart
			var multiAxisLineChartHeader=chartColumnHeader[6];
			var multiAxisLineChartXAxisname="Month";
			var multiAxisLineGT=data.axisLineGT;
			var multiAxisLineLT=data.axisLineLT;
			
	    	heatMap(heatMapProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,heatMapData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
	    	barChart(barChartProperties,barChartSubCaption,barChartData,barChartHeader);
	    	pareto2dChart(pareto2dChartProperties,pareto2dChartSubcaption,pareto2dChartData,pareto2dChartHeader);
	    	multiSeriesChart(multiSeriesChartProperties,multiSeriesChartSubcaption,multiSeriesChartXAxisName,multiSeriesChartYAxisName,multiSeriesChartdel1,multiSeriesChartdel2,multiSeriesChartdel3,multiSeriesChartHeader);
	    	horizontalBarChart(horizontalBarChartProperties,horizontalBarChartSubCaption,horizontalBarChartYAxisname,horizontalBarChartData,horizontalBarChartHeader);
	    	doughnut2dChart(doughnut2dChartProperties,doughnut2dChartSubCaption,doughnut2dChartData,doughnut2dChartHeader);
	    	multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,multiAxisLineGT,multiAxisLineLT,multiAxisLineChartHeader);
	 },
	 error: function (xhr, status, error) {
         alert("Internal Error Occured-Please Contact System Administrator");
	    }});
}
</script> 

</html>