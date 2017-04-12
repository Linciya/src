<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="pivot/js/jquery-ui.min.js"></script>
<script src="pivot/js/jquery.ui.touch-punch.min.js"></script>
<link rel="stylesheet" type="text/css" href="pivot/css/pivot.min.css"  />
<link rel="stylesheet" type="text/css" href="pivot/css/c3.min.css"  />
<script src="pivot/js/pivot.min.js"></script>
<script src="pivot/js/c3.min.js"></script> 
<script src="pivot/js/c3_renderers.min.js"></script> 
<link rel="stylesheet" href="css/multiple-select.css">
<script src="js/multiple-select.js"></script>
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
<style>
#mainDiv {
margin-left: -10px;
width:100%;
}
#ESIMainDiv{
width:100%;
margin-top:-523px;
margin-left:-10px;
position:absolute;
}
img{
width:100%;
}
#identifierFooter{
width:100%;
}
table.pvtUi{
width:95%;
overflow: scroll;
}
</style>
</head>
<body>
<div id="ESIMainDiv">
<div id="searchCriteriaTable" style="background: lightgreen;width:99.6%;font-size: 15px;"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_freehand_zone"/></div>	
<%-- Year : <select id="year" name="year" class="dropDown" onchange="freeHandZoneBySearch();">
								<c:forEach var="year" items="${yearList}">
					     			<option value='<c:out value="${year}"/>'>${year} </option>
					 			</c:forEach>
</select>  --%>
	<table>
		<tr>			
			<td class="searchCriteria" style="padding-left:20px;">Indicator Category</td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="indicatorCategory" name="indicatorCategory" class="indicatorCategory" onchange="onCategoryChange();">
					<c:forEach var="category" items="${indCategory}">
                   		<option value='<c:out value="${category}"/>'>${category} </option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:40px;">Indicator Name</td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="indicatorName" name="indicatorName" class="reportDropDown" multiple="multiple" onclick="onIndicatorNameChange();">
					<c:forEach var="indnames" items="${indNamesByCategory}">
                   		<option id="indicatorId" value='<c:out value="${indnames.id}"/>'>${indnames.name} </option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:60px;">Year</td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="year" name="year" class="year" >
					<c:forEach var="years" items="${yearList}">
                   		<option value='<c:out value="${years}"/>'>${years}</option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria">&nbsp;&nbsp;<button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
		</tr>			
	</table>
<div id="pvt" style="width:100%;overflow: scroll;height:480px;">
</div>
</div>
<input type="hidden" id="freeHandZoneBySearch" value="<spring:message code="shdrc_freehandbysearch_zone${directorateId}_action"/>">
<input type="hidden" id="onIndCategoryChange" value="<spring:message code="shdrc_onCategoryChangeSearch_zone${directorateId}_action"/>">
<input type="hidden" id="onIndNamChange" value="<spring:message code="shdrc_onIndicatorChangeSearch_zone${directorateId}_action"/>">
</body>
<script type="text/javascript">
$(document).ready(function(){
	var indID=${directorateId};
	var inddata=${indJsonArray};	
	$('#indicatorName').multipleSelect({
    	filter: true
    });
	var currentYear=${currentYear};
	$("#year").val(currentYear)
	if(inddata=='' || inddata=='null'){}else{
	$("#pvt").pivotUI(
			  inddata, {
				    rows: ["State_Name","District_Name","HUD_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category","Time_Month_Name","Time_Reg_Year"],		    	 						   
				    /* vals: ["Ind_Value"], */
				    aggregatorName: "Sum",
				    rendererName: "Table",
				    renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
			  }); 
	}
})
/* function freeHandZoneByOnChange(){
	var indicatorCategory=$("#indicatorCategory").val();	
	var saerchFreeHandZone=$("#freeHandZoneBySearch").val();
	$.ajax({		
		 type: "POST",
		 url: saerchFreeHandZone,	
		 async: false,
		 dataType: 'text',
		 data: jQuery.param({IndicatorCategory:indicatorCategory}),		 
		 success: function(result){ 
			 var res=JSON.parse(result);
			 var inddata=res.freeHandZoneData;
			 
			if(inddata=='' || inddata=='null'){}else{
					$("#pvt").pivotUI(
							  inddata, {
							    rows: ["State_Name","District_Name","HUD_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category","Time_Month_Name","Time_Reg_Year"],			    	 						   
							    vals: ["Ind_Value"],
							    aggregatorName: "Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
					}
		 },
		 error: function(result) {	    	
	           
		 }});
} */
function onCategoryChange(){
	var indicatorCategory=$("#indicatorCategory").val();
	var onIndCategoryChange=$("#onIndCategoryChange").val();
	/* $("#indicatorName").remove(); */
	$('#indicatorName option').remove();
	$('#indicatorName').multipleSelect({
    	refresh: true
    });
	
	$.ajax({		
		 type: "POST",
		 url: onIndCategoryChange,	
		 async: false,
		 dataType: 'text',
		 data: jQuery.param({IndicatorCategory:indicatorCategory}),		 
		 success: function(result){	
			    var jsonData = JSON.parse(result);
		    	var $select = $('#indicatorName');  
		    	$.each(jsonData, function(idx, obj) { 
	                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
	               });
		    	$('#indicatorName').multipleSelect({
		        	refresh: true
		        });
		 },
		 error: function(result) {	    	
	           
		 }});
}
 $("select#indicatorName").multipleSelect({   
	  onClick: function(view) {
	  onIndicatorNameChange();
	  },
      onCheckAll: function() {
	  onIndicatorNameChange();
      }
});
$('select#indicatorName').multipleSelect('checkAll');
function onIndicatorNameChange(){
	var indicatorCategory=$("#indicatorCategory").val();
	var selectedIndicatorName=$("#indicatorName").val();
	var onIndNamChange=$("#onIndNamChange").val();
	var directorateId=${directorateId};
	if(selectedIndicatorName==null){
		
	}else{
	 var selectedIndicatorNames=selectedIndicatorName.toString();
	  $('#year').empty();
	  $.ajax({		
		 type: "POST",
		 url: onIndNamChange,
		 async: false,
		 dataType: 'text',
		 data: jQuery.param({IndicatorCategory:indicatorCategory,IndicatorName:selectedIndicatorNames,DirectorateId:directorateId}),		 
		 success: function(result){ 
			 var res=JSON.parse(result);		   
			for(var i in res){
				$('#year').append('<option value='+res[i]+'>'+res[i]+'<option>');
			}
			$('#year option:last').remove();
		 },
		 error: function(result) {	    	
	           
		 }});
	}
}
function onSearch(){
	var indicatorCategory=$("#indicatorCategory").val();
	var indicatorName=$('#indicatorName').val();
	var indicatorNameVal=indicatorName.toString();
	var year=$('#year').val();
	var searchFreeHandZone=$("#freeHandZoneBySearch").val();
	var directorateId=${directorateId};
	$.ajax({		
		 type: "POST",
		 url: searchFreeHandZone,	
		 async: false,
		 dataType: 'text',
		 data: jQuery.param({directorateId:directorateId,IndicatorCategory:indicatorCategory,IndicatorName:indicatorNameVal,Year:year}),		 
		 success: function(result){ 
			 var res=JSON.parse(result);
			 var inddata=res.freeHandZoneData;			 
			 if(inddata=='' || inddata=='null'){}else{
					$("#pvt").pivotUI(
							inddata, {
							    rows: ["State_Name","District_Name","HUD_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category","Time_Month_Name","Time_Reg_Year"],			    	 						   
							    vals: ["Ind_Value"],
							    aggregatorName: "Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
					}
		 },
		 error: function(result) {	    	
	           
		 }});
}
</script>

</html>