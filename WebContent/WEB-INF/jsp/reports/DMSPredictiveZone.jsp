<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DMS PredictiveZone</title>
<script src="js/zingchart-patterns.min.js"></script>
<script src="js/zingchart.min.js"></script>
</head>
<style>
#searchButton{
	widht:30px;
	height:20px;
	background: #0076a3;
	color:white;
	border: none;
	border-top-left-radius: 5px 5px;
	border-top-right-radius: 5px 5px;
	border-bottom-left-radius: 5px 5px;
	border-bottom-right-radius: 5px 5px;
}
</style>
  <style>
    html,
    body,
    #myChart {
      height: 100%;
      width: 100%;
    }
  </style>
<body>
<div id="PredictiveMain" style="margin-top: -520px;">
<div id="filters" style="width: 100%;height: 30px;margin-top: 10px;">
<div id="directorateNameHeader" style="font-weight: bold;font-size: 12px;margin-top: 10px;"><spring:message code="shdrc_directorate_short_name${directorateId}"/> <spring:message code="shdrc_predictive_zone"/></div>
	<div style="margin-left: 200px;margin-top: -17px;">
		<label id="yearName"><spring:message code="label_searchcriteria_year"/></label> <select id="year" name="year">
			<c:forEach var="years" items="${yearList}">
				<option value='<c:out value="${years}"/>'>${years} </option> 
			</c:forEach>
		</select>
		<label id="monthName"><spring:message code="label_searchcriteria_month"/></label> <select id="month" name="month">
			<c:forEach var="months" items="${monthsList}">
				<option value='<c:out value="${months.name}"/>'>${months.name} </option> 
			</c:forEach>
		</select>
		<label id="districtName"><spring:message code="label_searchcriteria_district"/></label> <select id="district" name="district">
			<c:forEach var="districts" items="${districtsList}">
				<option value='<c:out value="${districts.name}"/>'>${districts.name} </option> 
			</c:forEach>
		</select>
		<label id="diseaseName"><spring:message code="label_searchcriteria_disease"/></label> <select id="disease" name="disease">
			<c:forEach var="diseases" items="${diseasesList}">
				<option value='<c:out value="${diseases.name}"/>'>${diseases.name} </option> 
			</c:forEach>
		</select>
		<input type="button" name="searchButton" id="searchButton" value="<spring:message code="label_searchcriteria_search"/>" onclick="onSearch();"/>
	</div>
</div>
	 <div id='myChart' style="margin-top: 100px;"></div>
</div>
</body>
<script>
var myConfig = {
  "type": "heatmap",
  "plotarea": {
    "margin": "dynamic"
  },
  "plot": {
    "aspect": "size"
  },
  "series": [{
    "values": [59, 15, 5, 30, 60, 99, 28, 33, 34, 51, 12, 30, 15, 39, 15, 71, 23, 51, 29, 20]
  }, {
    "values": [34, 32, 87, 65, 9, 17, 40, 12, 17, 22, 13, 42, 46, 27, 42, 33, 17, 63, 47, 42]
  }, {
    "values": [90, 19, 50, 39, 12, 49, 14, 61, 59, 60, 23, 42, 52, 12, 34, 23, 16, 45, 32, 31]
  }, {
    "values": [23, 45, 12, 37, 31, 35, 64, 71, 63, 26, 12, 36, 37, 21, 74, 35, 26, 41, 23, 21]
  }, {
    "values": [43, 50, 59, 60, 61, 49, 23, 14, 51, 46, 21, 63, 24, 12, 42, 31, 33, 25, 12, 15]
  }, {
    "values": [51, 59, 12, 15, 29, 31, 52, 32, 41, 23, 15, 63, 12, 23, 51, 41, 23, 32, 31, 17]
  }, {
    "values": [12, 23, 26, 35, 54, 34, 35, 36, 37, 38, 23, 18, 48, 54, 52, 56, 60, 70, 43, 62]
  }, {
    "values": [15, 59, 60, 61, 15, 79, 11, 21, 6, 19, 3, 28, 17, 34, 5, 20, 13, 15, 16, 31]
  }, {
    "values": [61, 54, 37, 41, 36, 58, 42, 21, 12, 17, 32, 41, 64, 27, 48, 35, 42, 9, 41, 11]
  }, {
    "values": [24, 45, 12, 71, 60, 23, 33, 41, 53, 27, 35, 52, 23, 46, 42, 64, 35, 37, 51, 23]
  }, {
    "values": [63, 62, 23, 63, 54, 73, 26, 36, 47, 63, 23, 45, 75, 32, 45, 16, 35, 24, 52, 3]
  }, {
    "values": [22, 30, 11, 56, 85, 34, 75, 54, 76, 45, 36, 23, 74, 86, 88, 56, 49, 28, 34, 31]
  }, {
    "values": [23, 82, 68, 46, 58, 47, 68, 63, 43, 12, 36, 75, 77, 56, 45, 31, 90, 89, 31, 35]
  }, {
    "values": [16, 85, 86, 74, 54, 65, 73, 47, 30, 31, 34, 35, 58, 51, 64, 26, 23, 12, 43, 40]
  }, {
    "values": [12, 87, 36, 53, 62, 84, 45, 65, 73, 52, 34, 28, 25, 19, 30, 33, 37, 34, 63, 77]
  }]
};

zingchart.render({
  id: 'myChart',
  data: myConfig,
  height: "50%",
  width: "50%"
});
</script>
<script>
function onSearch()
{
	var directorateId = 1;
	var year=document.getElementById("year").value;
	var month=document.getElementById("month").value;
	var district=document.getElementById("district").value;
	var disease=document.getElementById("disease").value;
	$.ajax({
		type: "POST",
		url: "predictiveOnSearch.do",
		'data':{
			directorateId:directorateId,year:year,month:month,district:district,disease:disease
		},
		success: function(result){
			
		 },
			error: function () {
		    	  $errorMessage.text("Onchange Error");
		}});
}
</script>
</html>