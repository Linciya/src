<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@page import="gov.shdrc.util.CommonStringList"%>
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
<script src="pivot/js/pivotui.min.js"></script>
<script src="pivot/js/pivot.min.js"></script>
<script src="pivot/js/pivot.js"></script>
<script src="pivot/js/c3.min.js"></script> 
<script src="jquery/ui/1.11.4//jquery-ui.js"></script>
<link rel="stylesheet" href="css/multiple-select.css">
<script src="js/multiple-select.js"></script>
<script src="pivot/js/c3_renderers.min.js"></script> 
<script src="pivot/js/d3.min.js"></script>
<script type="text/javascript">
var tableToExcelExp = (function() {
    var uri = 'data:application/vnd.ms-excel;base64,'
      , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
      , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
      , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
    return function(table, name) {
    	if (!table.nodeType) table =$(".pvtTable").html();
      
     // var criteria=document.getElementById("searchCriteria");
      var indCatgry=$("#indicatorCategory").val();
      var indName=$("#indicatorName").val();
      var indTempData="";
      for(var i=0;i<indName.length;i++){
    	  if(indTempData == ""){
    		  indTempData=$("#indicatorName option[value="+indName[i]+"]").text();
    	  }else{
           indTempData=indTempData+", "+$("#indicatorName option[value="+indName[i]+"]").text();
    	 }
      }
      var indYr=$("#year").val();
  
		innnertable='<table><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Indicator Category</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+indCatgry+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Indicator Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+indTempData+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+indYr+'</b></td></tr>'+table+'</table>';
       

    var ctx = {worksheet: name || 'Worksheet',table: innnertable}
   /*   var innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Indicator Category</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+indCatgry+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Indicator Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+indTempData+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+indYr+'</b></td></tr>'+table.innerHTML; */
	// var ctx = {worksheet: name || 'Worksheet', table: innnertable}
   
    window.location.href = uri + base64(format(template, ctx))
   
   
   //var ctx = {worksheet: name || 'Table',table:innnertable}
   // var ctx = {worksheet: name || 'Worksheet',table: table.innerHTML}
   
     // window.location.href = uri + base64(format(template, ctx))
    }
  })()
var tableToExcel = (function() {            
    var uri = 'data:application/vnd.ms-excel;base64,'
      , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
      , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
      , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
     
    return function(table, name) {
     if (!table.nodeType) table =$(".pvtTable").html();
     
      var indCatgry=$("#indicatorCategory").val();
      var indName=$("#indicatorName").val();
      var indTempData="";
      for(var i=0;i<indName.length;i++){
    	  if(indTempData == ""){
    		  indTempData=$("#indicatorName option[value="+indName[i]+"]").text();
    	  }else{
           indTempData=indTempData+", "+$("#indicatorName option[value="+indName[i]+"]").text();
    	 }
      }
      var indYr=$("#year").val();

      

     
      
	  innnertable='<tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Indicator Category</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+indCatgry+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Indicator Name</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>'+indTempData+'</b></td></tr><tr><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;"><b>Year</b></td><td style="color:blue;background-color:#D1E2F4;border:1px solid black;border-collapse:collapse;" align="left"><b>'+indYr+'</b></td></tr>'+table;
      var ctx = {worksheet: name || 'Table', table: innnertable}
      
      
    //  $("#pvt").find('tr:nth-child(3)').find('th').css("background-color", "#e6EEEE");
     
    
      
    
      window.location.href = uri + base64(format(template, ctx))

     
    }
    
  })
 
  ()
 
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
<body onload="onLoad();">
<div id="ESIMainDiv">
<div id="searchCriteriaTable" style="background: lightgreen;width:99.6%;font-size: 15px;"><b><spring:message code="shdrc_directorate_short_name${directorateId}"/></b> - <spring:message code="shdrc_freehand_zone"/></div>	
	<table id="searchTable">
		<tr>			
			<td class="searchCriteria" style="padding-left:3px;">Indicator Category</td>
			<td class="searchCriteria" style="padding-left:8px;">
				<select id="indicatorCategory" name="indicatorCategory" class="indicatorCategory" onchange="onCategoryChange();" style="background-color: #DDFF99;">
					<c:forEach var="category" items="${indCategory}">
                   		<option value='<c:out value="${category}"/>'>${category} </option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:30px;">Indicator Name</td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="indicatorName" name="indicatorName" class="reportDropDown" multiple="multiple" onclick="onIndicatorNameChange();">
					<c:forEach var="indnames" items="${indNamesByCategory}">
                   		<option id="indicatorId" value='<c:out value="${indnames.id}"/>'>${indnames.name}</option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria" style="padding-left:30px;">Year</td>
			<td class="searchCriteria" style="padding-left:5px;">
				<select id="year" name="year" class="year" style="background-color: #DDFF99;">
					<c:forEach var="years" items="${yearList}">
                   		<option value='<c:out value="${years}"/>'>${years}</option> 
               		</c:forEach>
				</select> 
			</td>
			<td class="searchCriteria"  style="padding-left:30px;">&nbsp;&nbsp;<button name="searchButton" id="searchButton" onclick="onSearch();"><spring:message code="label_searchcriteria_search"/></button></td>		
		    <td  class="searchCriteria" style="padding-left:30px;"><button id="test" style="float:right;"onclick="tempOnClick();"><spring:message code="label_exporttoexcel"/></button></td>
		    <td class="searchCriteria" style="padding-left:30px;"><label id="Loading"><spring:message code="label_Loading"/></label></td>
		    <td class="searchCriteria" style="padding-left:2px;"><img id="LoadingImage" src="images/01-progress.gif" alt="Progressing" style="width:30px;height:30px;"></td>
		</tr>			
	</table>
<div id="pvt" style="width:100%;overflow: scroll;height:480px;"></div>
</div>
<input type="hidden" id="freeHandZoneBySearch" value="<spring:message code="shdrc_freehandbysearch_zone${directorateId}_action"/>">
<input type="hidden" id="onIndCategoryChange" value="<spring:message code="shdrc_onCategoryChangeSearch_zone${directorateId}_action"/>">
<input type="hidden" id="onIndNamChange" value="<spring:message code="shdrc_onIndicatorChangeSearch_zone${directorateId}_action"/>">
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(function(){
    $('select#year option').filter(function(){
        return ($(this).val().trim()=="" && $(this).text().trim()=="");
    }).remove();
});
});
 
function tempOnClick(){
	var indID=${directorateId};
	if(indID==10 || indID==5 || indID==2){
		 $("#pvt").find('tr:nth-child(3)').find('th').css("background", "#00b2ff");
		 $("#pvt").find('tr').find('th').css("border", "1px groove black");
		 $("#pvt").find('tr').find('th').css("border-collapse", "collapse");
		 $("#pvt").find('tr').find('td').css("border", "1px groove black");
		 $("#pvt").find('tr').find('td').css("border-collapse", "collapse");
		 tableToExcelExp('pvtTable','sheet1'); 
		 $("#pvt").find('tr:nth-child(3)').find('th').css("background-color", "#e6EEEE");
		 $("#pvt").find('tr').find('th').css("border", "0.1px solid gray");
		 $("#pvt").find('tr').find('td').css("border", "0.1px solid gray");
		 $(".pvtRendererArea").css("border", "0px solid #CDCDCD");
	}
	else{
	
	
	
	 $("#pvt").find('tr:nth-child(3)').find('th').css("background", "#00b2ff");
	 $("#pvt").find('tr').find('th').css("border", "1px groove black");
	 $("#pvt").find('tr').find('th').css("border-collapse", "collapse");
	 $("#pvt").find('tr').find('td').css("border", "1px groove black");
	 $("#pvt").find('tr').find('td').css("border-collapse", "collapse");
	tableToExcel('pvtTable','sheet1');
	
	 $("#pvt").find('tr:nth-child(3)').find('th').css("background-color", "#e6EEEE");
	 $("#pvt").find('tr').find('th').css("border", "0.1px solid gray");
	 $("#pvt").find('tr').find('td').css("border", "0.1px solid gray");
	 $(".pvtRendererArea").css("border", "0px solid #CDCDCD");
	// $(".pvtTable").css("border", "0.5px solid #CDCDCD");
	 
	
	 
	
	 $("#pvt").find('tr:first').find('td:first').css("border", "0px solid #CDCDCD");
	}
}
function onCategoryChange(){
	var indicatorCategory=$("#indicatorCategory").val();
	var onIndCategoryChange=$("#onIndCategoryChange").val();
	var directorateId=${directorateId};
	$('#indicatorName option').remove();
	$('#indicatorName').multipleSelect({
    	refresh: true
    });
	
	$.ajax({		
		 type: "POST",
		 url: onIndCategoryChange,
		 dataType: 'text',
		 data: jQuery.param({IndicatorCategory:indicatorCategory,directorateId:directorateId}),		 
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
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
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
		 dataType: 'text',
		 data: jQuery.param({IndicatorCategory:indicatorCategory,IndicatorName:selectedIndicatorNames,DirectorateId:directorateId}),		 
		 success: function(result){ 
			 var res=JSON.parse(result);		   
			for(var i in res){
				$('#year').append('<option value='+res[i]+'>'+res[i]+'<option>');
			}
			$(function(){
			    $('select#year option').filter(function(){
			        return ($(this).val().trim()=="" && $(this).text().trim()=="");
			    }).remove();
			});
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
	}
}
function sleep(milliseconds) {
	  var start = new Date().getTime();
	  for (var i = 0; i < 1e7; i++) {
	    if ((new Date().getTime() - start) > milliseconds){
	      break;
	    }
	  } 
	}
function onSearch(){
	document.getElementById("Loading").style.display="inline";
	document.getElementById("LoadingImage").style.display="inline";
	$("#pvt").hide();  
	sleep(2000);
	var indicatorCategory=$("#indicatorCategory").val();
	var indicatorName=$('#indicatorName').val();
	var indicatorNameVal=indicatorName.toString();
	var year=$('#year').val();
	var searchFreeHandZone=$("#freeHandZoneBySearch").val();
	var directorateId=${directorateId};
	$.ajax({		
		 type: "POST",
		 url: searchFreeHandZone,
		 dataType: 'text',
		 data: jQuery.param({directorateId:directorateId,IndicatorCategory:indicatorCategory,IndicatorName:indicatorNameVal,Year:year}),		 
		 success: function(result){
			 var res=JSON.parse(result);
			 var inddata=res.freeHandZoneData;			 
			 if(inddata=='' || inddata=='null'){}else{
				 if(directorateId==12){
					 $("#pvt").pivotUI(
							  inddata, {
								    rows: ["District_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category"],		    	 						   
								    vals: ["Ind_Value","State_Name","HUD_Name"],
								    cols: ["Time_Month_Name","Time_Reg_Year"],
								    aggregatorName: "Sum",
								    rendererName: "Table",
							        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  }); 
					sleep(2000);
					document.getElementById("Loading").style.display="none";
					document.getElementById("LoadingImage").style.display="none";
					$("#pvt").show();
				 }else{
				 $("#pvt").pivotUI(
							inddata, {
							    rows: ["District_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category"],		    	 						   
							    vals: ["Ind_Value","State_Name","HUD_Name"],
							    cols: ["Time_Month_Name","Time_Reg_Year"],
							    aggregatorName: "Sum",
							    rendererName: "Table",
						        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
							  });
				    sleep(500);
				    document.getElementById("Loading").style.display="none";
					document.getElementById("LoadingImage").style.display="none";
					$("#pvt").show();
					}
			 }
		 },
		 error: function (xhr, status, error) {
             alert("Internal Error Occured-Please Contact System Administrator");
		    }});
}
function onLoad(){
	var inddata=null;
	var indID=${directorateId};
	inddata=${indJsonArray};	
	var indtVal=${selectedIndicator};
	$("#indicatorName option[value="+indtVal+"]").prop("selected", true); 
	$('#indicatorName').multipleSelect({
    	filter: true
    });
	var currentYear=${currentYear};
	$("#year").val(currentYear);
	if(inddata=='' || inddata=='null'){
	alert('No data for this criteria');
	}else{
		if(indID==3){
			$("#pvt").pivotUI(
					  inddata, {
						    rows: ["District_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category"],		    	 						   
						    vals: ["Ind_Value","State_Name","HUD_Name"],
						    cols: ["Time_Month_Name","Time_Reg_Year"],
						    aggregatorName: "Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  }); 
			$("#searchTable").css('font-size','12px');
			$("#searchTable").css('font-family','tahoma');
			$("#pvt").css('width','100%');
			$("#pvt").css('height','460px');
			sleep(2000);
			document.getElementById("Loading").style.display="none";
			document.getElementById("LoadingImage").style.display="none";
		}
		else if(indID==17){
			$("#pvt").pivotUI(
					  inddata, {
						    rows: ["District_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category"],		    	 						   
						    vals: ["Ind_Value","State_Name","HUD_Name"],
						    cols: ["Time_Month_Name","Time_Reg_Year"],
						    aggregatorName: "Sum",
						    rendererName: "Table",
					        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
					  }); 
			sleep(2000);
			document.getElementById("Loading").style.display="none";
			document.getElementById("LoadingImage").style.display="none";
		}else{		
	        $("#pvt").pivotUI(
			  inddata, {
				    rows: ["District_Name","Institution_Name","Institution_Type","Indicator_Name","Indicator_Category","General_Type","General_Name","General_Category"],		    	 						   
				    vals: ["Ind_Value","State_Name","HUD_Name"],
				    cols: ["Time_Month_Name","Time_Reg_Year"],
				    aggregatorName: "Sum",
				    rendererName: "Table",
			        renderers: $.extend( $.pivotUtilities.renderers, $.pivotUtilities.c3_renderers)
			  });
			sleep(2000);
			document.getElementById("Loading").style.display="none";
			document.getElementById("LoadingImage").style.display="none";
		}
	}
}
/* $("#test").click(function (e) {
    window.open('data:application/vnd.ms-excel,' + $('#pvt').html());
    e.preventDefault();
}); */
</script>
</html>