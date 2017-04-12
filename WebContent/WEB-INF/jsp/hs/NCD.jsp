<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.json.JSONArray"%>
    <%@page import="org.json.JSONObject"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<style>
table {
    padding:0px;
    border-collapse: collapse;
}
.selected {
    background-color:#F7DC6F;
}
/* #mainDiv{
	margin-top: -10px;
} */
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/fusioncharts.theme.fint.js"></script>
<script src="js/fusioncharts.powercharts.js"></script>
<script src="js/fusioncharts.widgets.js"></script>
<script src="js/sdgs.js"></script>
<script src="js/script.js"></script>
<body onload ="onLoad();">
<form id =sdgsForm name="sdgsForm" >
<div id="mainDiv" style="margin-top:-520px;">
<input type="hidden" id="submitType" name="submitType"/>
<input type="hidden" id="selectedDisease" name="selectedDisease"/>
			<div style="width:100%;">
			<table>
				<tr>
					<td style="font-weight:bold;"> Indicator </td>
					<td style="padding-left:20px;">
						<select id="indicators" name="indicators" class="dropDown" onchange="changeInd('<%=request.getContextPath()%>');">
							<option value="maternal mortality rate">Maternal Mortality Rate</option>
							<option value="infant mortality rate">Infant Mortality Rate</option>
							<option value="CD Indicators">CD Indicators</option>
							<option value="NCD Indicators" selected="selected">NCD Indicators</option>
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
						<select id="year" name="year" class="dropDown" onchange="changeTimePeriod();">
							<option value="2016">2016</option>
							<option value="2015">2015</option>
						</select> 
					</td>	
					<td style="padding-left:40px;font-weight:bold;"><label id="monthName">Month</label> <!-- <label id="timePeriodTo">To</label> --> </td>
					<td style="padding-left:20px;">
						<select id="month" name="month" class="dropDown" onchange="changeTimePeriod();">
							<c:forEach var="months" items="${monthsList}"> 
	                    		<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
	                		</c:forEach> 
						</select> 
					</td>	
				</tr>			
			</table>
				<div id="placeholdertop" style="background:#E9FFDB;width:100%; height:10%;">
				<P id = "analyticsheader" style="font-size:small;font-weight:bold;">Non-Communicable Disease - Analytics</P>
				</div>
				<div style="width:100%;background:white; height:45% ">	
					<div style="width:100%;">
						<div id="chart-container0" style="float:left;width:20%;padding-top:10px; ">
						<P style="font-size:small;font-weight:bold;" >NCD Report </P>
						<table id="indTable" name="jsonData"  style="font-size:small;height:300px; border-collapse:collapse;margin-top: 0px;">
						 <tr  align="center" style="font-size:small">
						 <td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white;width:600px;"> Disease </td>
						 <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white;width:600px;"> Incidence </td>
						 </tr>
						 <%
						 JSONArray cdata=(JSONArray)request.getAttribute("gcd");
						 	for(int i=0;i<cdata.length();i++){
						 		JSONObject row=cdata.getJSONObject(i);%>
						 		<tr  align="center" style="font-size:small">
							 		<td onclick="showName(this,'NCD');" style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("label")%></td>
							 		<td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("value")%></td>
						 		</tr>
						 	<%}
						 %>
						</table>
						</div>
							<div id="ncdChart" style="width:80%; height:100%;float:right;"></div>
							</div>	
							
						
				</div>
				<div id="ncdInstChart" style="width:100%; height:100%;"></div>
		</div>
		</div>
<script>
var all_tr = $('#indTable td');
$('#indTable td').on('click', function () {
    all_tr.removeClass('selected');
    $(this).closest('#indTable td').addClass('selected');
});
var disease;
var generalName;
var form = $('#sdgsForm');
var distDataCd=[];

function onLoad(){
	var districtDataCd= <%= request.getAttribute("districtDataCd")%>;
	var firstCDName= "<%= request.getAttribute("firstCDName")%>";
	var firstCDDistName= "<%= request.getAttribute("firstCDDistName")%>";
	var instDataCd= <%= request.getAttribute("instDataCd")%>;
	CdDistrictChart(districtDataCd,firstCDName);
	CdInstChart(instDataCd,firstCDName,firstCDDistName);
	var month = "<%= request.getAttribute("monthName") %>";
	var year = <%= request.getAttribute("year") %>;
	document.getElementById('year').value=year;
	document.getElementById('month').value=month;	
	document.getElementById('selectedDisease').value=firstCDName;
}

function showName(key,val){
	var disease = key.innerText;
	var selectedMonth=document.getElementById("month");
	 if (selectedMonth != 'undefined') {
		var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
	}
	var year=document.getElementById("year");
	if(year!='undefined'){
		var selectedYear=year.options[year.selectedIndex].value;
	}
	$.ajax({
		type: "POST",
		url: "showCorrespondingNCDData.do",
		'data':{
			header:"CD",disease:disease,month:monthName,year:selectedYear
		},
		success: function(result){
			 	var data = JSON.parse(result);
			 	var districtDataCd=data.districtDataCd;
			 	var institutionData=data.instDataCd;
			 	var firstCDDistName=data.firstCDDistName;
			 	var firstCDName=data.firstCDName;
			 	CdDistrictChart(districtDataCd,firstCDName);
			 	CdInstChart(institutionData,firstCDName,firstCDDistName);
	 	
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
}

function changeTimePeriod(){
	var disease = document.getElementById('selectedDisease').value;
	var selectedMonth=document.getElementById("month");
	 if (selectedMonth != 'undefined') {
		var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
	}
	var year=document.getElementById("year");
	if(year!='undefined'){
		var selectedYear=year.options[year.selectedIndex].value;
	}
	$.ajax({
		type: "POST",
		url: "showCorrespondingNCDData.do",
		'data':{
			header:"CD",disease:disease,month:monthName,year:selectedYear
		},
		success: function(result){
			 	var data = JSON.parse(result);
			 	var districtDataCd=data.districtDataCd;
			 	var institutionData=data.instDataCd;
			 	var firstCDDistName=data.firstCDDistName;
			 	var firstCDName=data.firstCDName;
			 	CdDistrictChart(districtDataCd,firstCDName);
			 	CdInstChart(institutionData,firstCDName,firstCDDistName);
	 	
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
}

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
	ChangeDiseaseIndicator(indName,contextPath,method,action);
} 

function CdDistrictChart(districtDataCd,firstCDName){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: 'column2d',
	        renderAt:'ncdChart',
	        width: '900',
	        height: '450',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": "Non-Communicable Disease - " +firstCDName,
	                "yAxisname": "Indicator Value",
	                "xAxisname":"District",
	                "startingAngle": "20",
	                "showPercentValues": "0",
	                "showPercentInTooltip": "0",
	                "enableSmartLabels": "0",
	                "enableMultiSlicing": "0",
	                "decimals": "1",
	                "showLegend": "1",
	                "theme": "fint",
	                "formatNumberScale": "0"     
	            },
	            	"data": districtDataCd
	            }, "events": {
	                    "dataplotClick": function (evt, data) {
	                        showInstDataCd(data.categoryLabel,firstCDName);
	                    }
	                    }
	    }).render();    
	});       
}

function CdInstChart(instDataCd,firstCDName,firstCDDistName){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: 'column2d',
	        renderAt:'ncdInstChart',
	        width: '1200',
	        height: '300',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": "Non-Communicable Disease - " +firstCDName+ " in " +firstCDDistName,
	                "yAxisname": "Indicator Value",
	                "xAxisname":"Institution",
	                "startingAngle": "20",
	                "showPercentValues": "0",
	                "showPercentInTooltip": "0",
	                "enableSmartLabels": "0",
	                "enableMultiSlicing": "0",
	                "decimals": "1",
	                "showLegend": "1",
	                "theme": "fint",
	                "formatNumberScale": "0"     
	            },
	            "data": instDataCd
	            }, 
	    }).render();    
	});   
}

function showInstDataCd(distName,disease){
	var selectedMonth=document.getElementById("month");
	 if (selectedMonth != 'undefined') {
		var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
	}
	var year=document.getElementById("year");
	if(year!='undefined'){
		var selectedYear=year.options[year.selectedIndex].value;
	}
	$.ajax({
		type: "POST",
		url: "showInstDataNCd.do",
		'data':{
			distName:distName,header:"CD",disease:disease,month:monthName,year:selectedYear
		},
		success: function(result){
			 	var data = JSON.parse(result);
			 	var institutionData=data.instDataCd;
			 	var firstCDDistName=data.firstCDDistName;
			 	var firstCDName=data.firstCDName;
	 	
			 	CdInstChart(institutionData,firstCDName,firstCDDistName);
	 	
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
}

<% String requestURL=request.getRequestURL().toString();
String contextPath=request.getContextPath();
int urlIndex = requestURL.lastIndexOf(contextPath);
String hostName=requestURL.substring(0,urlIndex);
String webUrl =hostName+contextPath+"/";
%>
var webUrl='<%=webUrl%>';
</script>
</form>
</body>

</html>