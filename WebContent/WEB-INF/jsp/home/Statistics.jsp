<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data Statistics</title>
<script src="jquery/jquery-1.11.1.min.js"></script>
  <link rel="stylesheet" href="css/statisticsFilter.min.css">   
 
 <script>
       $(document).on('mobileinit', function () {
           $.mobile.ignoreContentEnabled = true;
       });
   </script> 
  <script src="js/statisticsFilter.min.js"></script>
 
<style>
#indTable tr:nth-child(even){
			color:black;
			background-color: #f2f2f2;
		}
		
		#indTable tr:nth-child(odd){
			color:black;
			background-color: #ffffff;
		}
		
		#indStatTable td{
			padding-left:5px;
			padding-right:5px;
		}
		
		#testGrid tr:nth-child(even){
			color:black;
			background-color: #f2f2f2;
		}
		
		#testGrid tr:nth-child(odd){
			color:black;
			background-color: #ffffff;
		}
		
		#testGrid tbody:nth-child(even){
			color:black;
			background-color: #f2f2f2;
		}
		
		#testGrid tbody:nth-child(odd){
			color:black;
			background-color: #ffffff;
		}
		
		#searchCriteriaTable{
			background-image: linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
			background-image: -o-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
			background-image: -moz-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
			background-image: -webkit-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
			background-image: -ms-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
			border-bottom:solid 0.1px #2B65EC;
			margin-top:1px;
		}
		
</style>
</head>

<body onload="bodyOnLoad();">
	<div id="wait" style="display:none;width:200px;height:89px;position:absolute;top:40%;left:50%;right:50%;padding:2px;"><img src='images/load_image.gif'  width="85" height="85" /><br>Fetching Data..</div> 
<%-- <div style="background:#4863A0; margin-bottom: -7.6px;height:50px;"><img src='images/statistics-icon.png' style="width:90px;height:41.4px;margin-left:40%;padding-right:40px;"/><center style="margin-left:10%;margin-top:-30px;color:white;">Data Statistics of Indicators</center></div> --%>
<div id="searchCriteriaTable"><center style="color:black;">Data Statistics of Indicators</center></div>
<div style="width:100%;background:#E9FFDB; overflow:auto;height:700px;">
<div style="width:40%;float:left;margin-left:10px;">
 <input id="filterTable-input" data-type="search" placeholder="Search For Indicators..." >
   <label style="font-weight:bold;margin-top:10px;">List of Indicators</label>
  <table id="indTable" name="indTable" class="indicatorTable" style="border-collapse:collapse;margin-top: 8px;width:590px;" data-filter="true" data-input="#filterTable-input">
		<c:forEach var="indicator" items="${indicatorList}">
			<tr id="${indicator}" onclick="showIndStatistics(this);"><td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small">${indicator}</td></tr>
		 </c:forEach>
		</table>
		</div>
			<div id="statTable" style="width:50%;float:right;" data-enhance="false">

	<table style="margin-top:20px;margin-right:25px;float:right;">
			<tr>
		<td width="60px;">
			<select id="directorateName" name="directorateName" onchange="changeDirectorate();">
				 <c:forEach var="directorate" items="${directorateList}">
				     <option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
				 </c:forEach>
			</select>
		</td>
		</tr>
		</table>
 	 <div id="content" style="width:50%;float:right;margin-right:20%;margin-top:25%;"><p align="center">Click on the Indicator name to view the statistics
		 of that particular Indicator.<br><br> 
		You can also search the Indicator by entering keyword in search box.</p></div>
		
		<div id="statData"> 
		<div id="indName" style="font-size:14px;font-weight:bold;margin-top:10%;"></div>
		<div style="font-size:14px;font-weight:bold;margin-top:3%;">Basic Statistics:</div>
			<table id="indStatTable" align="left" border="1" style="border-collapse:collapse; margin:auto;margin-top:3%;">
			<thead style="background:#428bca;color:white;">
			<tr><td width="140px;" align="center">Minimum Value</td><td width="140px;" align="center">Maximum Value</td><td width="265px;" align="center">Data available upto</td></tr>			
			</thead>
			<tbody id="indStatValue" style="background:#ffffff;">
			</tbody>
			</table>
			<table id="indBasicStatTable" align="left" border="1" style="border-collapse:collapse; margin: auto;margin-top:3%;">
			<thead style="background:#428bca;color:white;">
			<tr><td width="140px;" align="center">Mean</td><td width="140px;" align="center">Median</td><td width="145px;" align="center">Standard Deviation</td><td width="140px;" align="center">Variance</td></tr>			
			</thead>
			<tbody id="indBasicStatValue" style="background:#ffffff;">
			</tbody>
			</table>
			<div style="font-size:14px;font-weight:bold;margin-top:20%;">Percentile Values:</div>
				<table id="indPercentileTable" align="left" border="1" style="border-collapse:collapse;margin: auto;margin-top:3%;">
			<thead style="background:#428bca;color:white;">
			<tr><td width="140px;" align="center">25 Percentile</td><td width="140px;" align="center">50 Percentile</td><td width="140px;" align="center">75 Percentile</td><td width="140px;" align="center">100 Percentile</td></tr>			
			</thead>
			<tbody id="indPercentileValue" style="background:#ffffff;">
			</tbody>
			</table>
			
			<div style="font-size:14px;font-weight:bold;margin-top:10%;">District-wise Data Availability:</div>
			<table id="testGrid" align="left" border="1" style="border-collapse:collapse; margin: auto;margin-top:3%;width:560px;">
				<thead>
				<tr style="background-color:#428bca;color:white;">
				<th><label style="padding-top:5px;"><%=request.getAttribute("year")%></label></th>
				<th style="font-size:12;">Jan</th>
				<th style="font-size:12;">Feb</th>
				<th style="font-size:12;">Mar</th>
				<th style="font-size:12;">Apr</th>
				<th style="font-size:12;">May</th>
				<th style="font-size:12;">Jun</th>
				<th style="font-size:12;">Jul</th>
				<th style="font-size:12;">Aug</th>
				<th style="font-size:12;">Sep</th>
				<th style="font-size:12;">Oct</th>
				<th style="font-size:12;">Nov</th>
				<th style="font-size:12;">Dec</th>
				</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			</div>
		</div>
		</div>
		
		 <script>
		$(document).ready(function(){
		    $(document).ajaxStart(function(){
		        $("#wait").css("display", "block");
		    });
		    $(document).ajaxComplete(function(){
		        $("#wait").css("display", "none");
		    });
		});
		 </script> 
		 
		<script>		
		function showIndStatistics(key){
	        $("#wait").css("display", "block");
			var directorateId;
			var directorate = document.getElementById("directorateName");
			if (directorate != 'undefined') {
				directorateId = directorate.options[directorate.selectedIndex].value;
			}
			var indName=key.innerText;
			$.ajax({type:"POST",
				url:'indicatorStatistics.do',
				'data':  { 
					indName:indName,directorateId:directorateId
				},
				
				success: function (output) {
					if(output!=''){
						  $("#wait").css("display", "none");
					var data = JSON.parse(output);	
					var jsonData = data.indStatisticsData;
					var indDataAvailabity = data.indDataAvailabity;
					
					   $("#indName").empty();
					 $("#indName").append(''+jsonData[0].indicatorName+'');
					document.getElementById('content').style.display="none"; 
					document.getElementById('statData').style.display="inline";
					   var $select=$('#indStatTable tbody');
						$select.find('tr').remove();
						var $select1=$('#indBasicStatTable tbody');
						$select1.find('tr').remove();
						var $select2=$('#indPercentileTable tbody');
						$select2.find('tr').remove();
						var $select3=$('#testGrid tbody');
						$select3.find('td').remove();
					 $("#indStatTable tbody").append('<tr><td style="text-align: center"> '+jsonData[0].minValue+' </td><td style="text-align: center"> '+jsonData[0].maxValue+'</td><td style="text-align: center" colspan="2">'+jsonData[0].date+'</td></tr>');
					 $("#indBasicStatTable tbody").append('<tr><td style="text-align: center">'+jsonData[0].mean+'</td><td style="text-align: center"></td><td style="text-align: center">'+jsonData[0].standardDeviation+'</td><td style="text-align: center">'+jsonData[0].variance+'</td></tr>');
					 $("#indPercentileTable tbody").append('<tr><td style="text-align: center"></td><td style="text-align: center"></td><td style="text-align: center"></td><td style="text-align: center"></td></tr>');
					 
						 var monthAvailability;
							var distHTML = ''; 
							var  distValueHTML = ''; 
					     for(i=0;i<indDataAvailabity.length;i++){
						monthAvailability=[indDataAvailabity[i].janValue,indDataAvailabity[i].febValue,indDataAvailabity[i].marValue,indDataAvailabity[i].aprValue,
				  		                        indDataAvailabity[i].mayValue,indDataAvailabity[i].junValue,indDataAvailabity[i].julValue,indDataAvailabity[i].augValue,
				  		                        indDataAvailabity[i].sepValue,indDataAvailabity[i].octValue,indDataAvailabity[i].novValue,indDataAvailabity[i].decValue,indDataAvailabity[i].districtName];
				         var rowName='<tr>';
				         distHTML =rowName+'<td rowspan="2" style="font-size:small;">'+indDataAvailabity[i].districtName+'</td>'; 
				    $('#testGrid tbody').append(distHTML);
				         for(j=0;j<12;j++){  
				        	 if(monthAvailability[j]=="Y"){
				        		 distValueHTML ='<td><input type="checkbox" id="'+indDataAvailabity[i].districtName+"_"+j+'" value='+j+' onclick="return false"></td></tr>';
				        		 $('#testGrid tbody').append(distValueHTML);
				        		 document.getElementById(indDataAvailabity[i].districtName+'_'+j).checked=true; 
				             } 
				        	 else{
				        		 distValueHTML ='<td><input type="checkbox" id="'+j+'" value='+j+' style="background: red;-webkit-appearance: none;-moz-appearance: none;height: 11px;width: 11px;border:1px solid black;border-radius:2px;" onclick="return false"></td></tr>';
				        		 $('#testGrid tbody').append(distValueHTML);
				             }            
				         }				   
					     }
					}
			   	    },
			    error: function () {
			    $("#errorMessage").text("Error");				    
		    }}); 
		} 
		
		function changeDirectorate(){
			var directorateId;
			  var directorate = document.getElementById("directorateName");
			   if (directorate != 'undefined') {
				   directorateId = directorate.options[directorate.selectedIndex].value;
			   }	
			$.ajax({type:"POST",
				url:'statisticsDirectorateChange.do',
				'data':  { 
					directorateId:directorateId
				},
				
				success: function (output) {
					var jsonData = JSON.parse(output);
					var ulHTML = ''; 
					var $select=$('#indTable');
					$select.find('tr').remove();
					document.getElementById('statData').style.display="none"; 
					document.getElementById('content').style.display="inline"; 
					$.each(jsonData, function (idx, obj) {
						ulHTML += '<tr id='+obj+' onclick=showIndStatistics(this);><td style="border: 1px solid black; border-collapse: collapse;cursor:pointer;font-size:small">' + obj+ '</td></tr>';	
						
					});
					$('#indTable').append(ulHTML);				
				},
			    error: function () {
			    $("#errorMessage").text("Error");				    
		    }}); 
		}
		
		function bodyOnLoad(){
			document.getElementById('statData').style.display="none"; 
		}		
		
		$("#indTable tr").hover(
		  function () {
		    $(this).css("background","#B8D246");
		  }, 
		  function () {
		    $(this).css("background","");
		  }
		);

		</script>	
		
</body>
</html>