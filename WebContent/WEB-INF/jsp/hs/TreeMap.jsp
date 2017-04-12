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
<script src="js/highcharts.js"></script>
<script src="js/heatmap.js"></script>
<script src="js/treemap.js"></script>
<script src="js/CdNcd.js"></script>
<script src="js/sdgs.js"></script>
<script src="js/script.js"></script>
<body onload ="onLoad();">
<form id =sdgsForm name="sdgsForm" method="POST" action="TreeMapServlet" >
<div id="mainDiv" style="margin-top:-520px;">
<input type="hidden" id="submitType" name="submitType"/>
			<div style="width:100%;">
			<table>
				<tr>
					<td style="font-weight:bold;"> Indicator </td>
					<td style="padding-left:20px;">
						<select id="indicators" name="indicators" class="dropDown" onchange="changeInd('<%=request.getContextPath()%>');">
							<option value="maternal mortality rate">Maternal Mortality Rate</option>
							<option value="infant mortality rate">Infant Mortality Rate</option>
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
				</tr>			
			</table>
				<div id="placeholdertop" style="background:#E9FFDB;width:100%; height:10%;">
				<P id = "analyticsheader" style="font-size:small;font-weight:bold;">Communicable Disease - Analytics</P>
				</div>
				<div style="width:100%;background:white; height:45% ">	
					<div style="width:100%;">
						<div id="chart-container0" style="float:left;width:20%;padding-top:10px; ">
						<P style="font-size:small;font-weight:bold;" >CD Report </P>
						<table id="indTable" name="jsonData"  style="font-size:small;height:350; border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
						 <tr style="font-size:small">
						 <td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white "> Disease </td>
						 <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Incidence </td>
						 </tr>
						 <%
						 JSONArray cdata=(JSONArray)request.getAttribute("gcd");
						 	for(int i=0;i<cdata.length();i++){
						 		JSONObject row=cdata.getJSONObject(i);%>
						 		<tr  style="font-size:small">
							 		<td onclick="showName(this,'CD');" style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("name")%></td>
							 		<td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("value")%></td>
						 		</tr>
						 	<%}
						 %>
						</table>
						</div>
							<div id="TreeMapOnLoadCd" style="width:40%; height:100%;float:left; "></div>
							<div id="TreeMapOnClickCd" style="width:40%; height:100%;float:right;"></div>
						</div>	
				</div>
				
				<div style="float:left;width:100%; height:50%;">	
				<div id="placeholdermid2" style="background:#96DEFF;width:100%;margin-top: 0px; height:6%;">
				<P style="font-size:small;font-weight:bold;vertical-align: middle;" >NCD - Analytics </P>
				</div>
				<div style="width:100%;">
				<div id="chart-containerncd" style="float:left; width:20%;padding-top:10px;">
						<P style="font-size:small;font-weight:bold;" >NCD Report </P>
						<table id="indTable" name="jsonData"  style="font-size:small;height:auto; border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
						 <tr style="font-size:small">
						 <td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white "> Disease </td>
						 <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white "> Incidence </td>
						 </tr>
						 <%
						 JSONArray ncdata=(JSONArray)request.getAttribute("gncd");
						 	for(int i=0;i<ncdata.length();i++){
						 		JSONObject row=ncdata.getJSONObject(i);%>
						 		<tr  style="font-size:small">
							 		<td onclick="showName(this,'NCD');" style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("name")%></td>
							 		<td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small"><%=row.get("value")%></td>
						 		</tr>
						 	<%}
						 %>
						</table>
						</div>
						<div id="TreeMapOnLoadNcd" style="width:40%;background:#ff9933;height:100%;float:left; "></div>
						<div id="TreeMapOnClickNcd" style="width:40%;background:#ff8855; height:100%;float:left;"></div>
				</div>
				</div>
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
var colorList={"Ariyalur":"#f7a35c","Chennai":"#8B8989","Coimbatore":"#8B6969","Cuddalore":"#CD9B9B","Dharmapuri":"#f15c80",
		"Dindugal":"#A52A2A","Erode":"#FF4040","Kancheepuram":"#7cb5ec","Kanyakumari":"#FF9955","Karur":"#FFB52B",
		"Krishnagiri":"#e4d354","Madurai":"#777733","Nagapattinam":"#4F4F2F","Namakkal":"#2b908f","Perambalur":"#D9D919","Pudukottai":"#EEEE00",
		"Ramanathapuram":"#f45b5b","Salem":"#90ed7d","Sivaganga":"#66CD00","Thanjavur":"#76EEC6","The Nilgiris":"#00F7F7","Theni":"#63D1F4",
		"Thoothukudi":"#91e8e1","Tiruchirapalli":"#B0E2FF","Tirunelveli":"#4E9FFE","Tiruppur":"#7171C6","Tiruvallur":"#483D8B","Tiruvannamalai":"#9A32CD",
		"Tiruvarur":"#D15FEE","Vellore":"#FF4D94","Villupuram":"#EE799F","Virudhunagar":"#ff9d67"};
var distDataCd=[];
var distDataNcd=[];
var colorValues=["#f7a35c","#8B8989","#8B6969","#8085e9","#CD9B9B","#f15c80","#A52A2A","#FF4040","#7cb5ec","#FF9955",
				"#FFB52B","#e4d354","#777733","#4F4F2F","#434348","#2b908f","#D9D919","#EEEE00","#f45b5b","#90ed7d",
				"#66CD00","#76EEC6","#00F7F7","#63D1F4","#91e8e1","#B0E2FF","#4E9FFE","#7171C6","#483D8B","#9A32CD",
				"#D15FEE","#FF4D94","#EE799F"];
function onLoad(){
	var districtDataNcd= <%= request.getAttribute("districtDataNcd")%>;
	var districtDataCd= <%= request.getAttribute("districtDataCd")%>;
	for(var i=0;i<districtDataCd.length;i++){
		var distCd=districtDataCd[i].name;		
		var color=colorList[distCd];
		dtDataCd={"name":districtDataCd[i].name,"value":districtDataCd[i].value,"color":color};
		distDataCd.push(dtDataCd);
	}
	for(var j=0;j<districtDataNcd.length;j++){
		var distNcd=districtDataNcd[j].name;		
		var color=colorList[distNcd];
		dtDataNcd={"name":districtDataNcd[j].name,"value":districtDataNcd[j].value,"color":color};
		distDataNcd.push(dtDataNcd);
	}
	treeMapOnLoadCd(distDataCd);
	treeMapOnLoadNcd(distDataNcd);
}
function showInstDataNcd(distName){
	var jsonData=[];
	var distColor=colorList[distName];
	if(disease=="ByDisease")
		{
			var submitType="ByDisease";
		}
	$.ajax({
		type: "POST",
		url: "showInstDataNcd.do",
		'data':{
			distName:distName,header:"NCD",submitType:submitType,generalName:generalName
		},
		success: function(result){
			 	var data = JSON.parse(result);
			 	var institutionData=data.instData;
			 	var grandChildData=data.grandChildDataNcd;
			 	for(var i=0;i<institutionData.length;i++){
			 		var instData=institutionData[i].id;
			 		instList={"id":instData,"name":instData,"color":distColor};
			 		jsonData.push(instList);
			 	}
			 	for(var j=0;j<grandChildData.length;j++){
			 			grandChildObjNcd={"name":grandChildData[j].name,"parent":grandChildData[j].insName,"value":grandChildData[j].value};
			 		jsonData.push(grandChildObjNcd);
			 	}
	 	treeMapOnClickNcd(jsonData,distName);
		 },
		error: function () {
	    	  $errorMessage.text("Onchange Error");
	    }});
}
function showInstDataCd(distName){
	var jsonData=[];
	var distColor=colorList[distName];
	if(disease=="ByDisease")
	{
		var submitType="ByDisease";
	}
	$.ajax({
		type: "POST",
		url: "showInstDataCd.do",
		'data':{
			distName:distName,header:"CD",submitType:submitType,generalName:generalName
		},
		success: function(result){
			 	var data = JSON.parse(result);
			 	var institutionData=data.instData;
			 	var grandChildData=data.grandChildDataCd;
			 	for(var i=0;i<institutionData.length;i++){
			 		var instData=institutionData[i].id;
			 		instList={"id":instData,"name":instData,"color":distColor};
			 		jsonData.push(instList);
			 	}
			 	for(var j=0;j<grandChildData.length;j++){
			 				grandChildObjCd={"name":grandChildData[j].name,"parent":grandChildData[j].insName,"value":grandChildData[j].value};
			 		jsonData.push(grandChildObjCd);
			 	}
	 	treeMapOnClickCd(jsonData,distName);
		 },
		error: function () {
	    	  $errorMessage.text("Onchange Error");
	    }});
}
function showName(key,val){
	disease = "ByDisease";
	generalName=key.innerText;
	var param = key.innerText;
	var cd=[];
	var ncd=[];
	var flag="category";
		$.ajax({
			type: "POST",
			url: "showGeneralNameData.do",
			'data':{
				param:param,flag:flag
			},
			success: function(result){
				if (val == 'NCD') {$('#TreeMapOnClickNcd').empty();}
				else if(val=='CD') {$('#TreeMapOnClickCd').empty();} 
				 	var data = JSON.parse(result);
				 	var distDataCD=data.distDataCD;
				 	var distDataNCD=data.distDataNCD;
				 	for(var i=0;i<distDataCD.length;i++){
				 		var distCd=distDataCD[i].name;		
						var color=colorList[distCd];
						dtDataCd={"name":distDataCD[i].name,"value":distDataCD[i].value,"color":color};
						cd.push(dtDataCd);
				 	}
				 	for(var i=0;i<distDataNCD.length;i++){
				 		var distNcd=distDataNCD[i].name;		
						var color=colorList[distNcd];
						dtDataNcd={"name":distDataNCD[i].name,"value":distDataNCD[i].value,"color":color};
						ncd.push(dtDataNcd);
				 	}
				 	if(cd !=''){
				 	treeMapOnLoadCd(cd);
				 	}
				 	if(ncd!=''){
					treeMapOnLoadNcd(ncd);
				 	}
			 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		    }});
	 } 
function changeInd(){
	var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value;
	var contextPath='<%=request.getContextPath()%>';
	var method="get";
	var action="sdgs.do";	
	ChangeDiseaseIndicator(indName,contextPath,method,action);
} 
</script>
</form>
</body>

</html>