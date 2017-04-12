<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>108 Ambulance Prediction Report</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="js/d3.v3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>	
		<script src="js/script.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<style>
			rect.bordered {
		        stroke: #E6E6E6;
		        stroke-width:2px;   
		      }
		
		      text.mono {
		        font-size: 9pt;
		        font-family: Consolas, courier;
		        fill: #aaa;
		      }
		
		      text.axis-workweek {
		        fill: #000;
		      }
		
		      text.axis-worktime {
		        fill: #000;
		      }
		      
			.createNewTable{
				display: none; /* Hidden by default */
			    position: fixed; /* Stay in place */
			    z-index: 1; /* Sit on top */
			    padding-top: 150px; /* Location of the box */
			    left: 0;
			    top: 90px;
			    width: 98%; /* Full width */
			    height: 300px; /* Full height */
			    overflow: auto; /* Enable scroll if needed */
			}
			/* Modal Content */
			.createNewTable-content{
				position: relative;
			    background-color: #fefefe;
			    margin: auto;
			    padding: 0;
			    border: 1px solid #888;
			    width: 95%;
			    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
			    -webkit-animation-name: animatetop;
			    -webkit-animation-duration: 0.4s;
			    animation-name: animatetop;
			    animation-duration: 0.4s
			}
			/* Add Animation */
			@-webkit-keyframes animatetop {
			    from {top:-300px; opacity:0}
			    to {top:0; opacity:1}
			}
			
			@keyframes animatetop {
			    from {top:-300px; opacity:0}
			    to {top:0; opacity:1}
			}
			
			/* The Close Button */
			.createNewTable-reportClose{
			    color: red;
			    float: right;
			    font-size: 28px;
			    font-weight: bold;
			    line-height: 20px;
			}
			.createNewTable-reportClose:hover,
			.createNewTable-reportClose:focus {
			    color: white;
			    text-decoration: none;
			    cursor: pointer;
			}
			.createNewTable-header {
			    padding: 2px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;   
			    line-height: 12px;     
			}
			.createNewTable-body {
			padding: 12px 16px;
			overflow: auto;
			}
			.createNewTable-footer {
			    padding: 2px 16px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;
			}
			/* Toggle Menu CSS Start */
                     div#dm{
                           width:1000px;
                     }
                     .dropdown{
                           margin-left: 100px;
                     }
                     div#drop{
                           margin-top:-19px;
                           margin-right:30px;
                     }
                     .row{
                           padding-left:25px; 
                           margin:5px 5px;
                     }
                     a#click{
                            background:none;
                            outline: none;
                           cursor: pointer;
                           font-family: Arial, Helvetica, sans-serif;
                           font-size:16px;
                            color:black;
                            text-decoration: none;
                     }
                     a#click:hover{
                           color:#d43653;
                     }
                     a#click:onclick{
                           color:#f2f2f2;
                     }
                     .col-xs-4{  
                           width:140px;
                           height:45px;
                           color:#737373;
                     }
                     .col-xs-4:hover{
                           color:#fff;
                           background:#ff9933;
                     }
                     .arrow{
                            color:#ff9933;
                     }
                     .ex-link .arrow{
                            float:left;
                            margin-left: 8px;
                     }
                     .row a:hover .arrow{color:#999;}
                     
                     /* Toggle Menu End*/
		</style>
	</head>
	
	<body onload="onLoad();">
		<div style="width:100%">
			<div id="directorateNameHeader"><b>Incident Prediction Report for next month</b></div>	
			<div id="searchCriteriaTable" style="border-bottom:solid 0.1px #2B65EC;">
				<table>
					<tr>
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_district"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<select id="predictionDistrict" name="predictionDistrict" class="reportDropDown" style="width:150px;">
								<c:forEach var="predDistrict" items="${predictionDistrictsList}">
									<option value='<c:out value="${predDistrict.name}"/>'>${predDistrict.name} </option>
								</c:forEach>
							</select>
						</td>
					
						<td class="searchCriteria" style="padding-left:10px;"><spring:message code="label_searchcriteria_emergencyType"/></td>
						<td class="searchCriteria" style="padding-left:3px;">	
							<select id="PredictionEmergencyType" name="PredictionEmergencyType" class="reportDropDown" style="width:150px;">
								<option value=""><spring:message code="option_select"/></option> 
								<c:forEach var="PredEmerType" items="${predictionEmerTypeList}">
									<option value='<c:out value="${PredEmerType.name}"/>'>${PredEmerType.name} </option>
								</c:forEach>
							</select>
						</td>	
						<td class="searchCriteria">
							<button onclick="getTalukPrediction();"><spring:message code="label_searchcriteria_search"/></button>
						</td>	
						<td class="searchCriteria"><label id="Loading"><spring:message code="label_Loading"/></label><img id="LoadingImage" src="images/siren.gif" alt="Progressing" style="width:30px;height:30px;"></td>
						
						<td class="searchCriteria" style="float:right;margin-right:10px;margin-bottom:5px;margin-top:5px;">
							<button style="background-color:#FFF8C6;color:black;" onclick="getCaseReport();">Case Report</button>
						</td>
						<td class="searchCriteria" style="padding-left:25px;float:right;margin-right:10px;margin-bottom:5px;margin-top:5px;">
							<button style="background-color:#FFF8C6;color:black;" onclick="getIncidentReport();">Incident Report</button>
						</td>
					</tr>
				</table>
				
				<div class="nav navbar-nav navbar-right" id="drop">
         			<div class="dropdown">
              		<a id="click" href="#" data-toggle="dropdown" style="font-size: 13px;margin-left: -45px;font-weight: bold;color:blue;"><u>BROWSE ALL DASHBOARD  &#9776;</u></a>
       				<div class="dropdown-menu" id="dm">
         <div class="row"> 
             <a class="ex-link" href="<%=request.getContextPath()%>/108GPSStatus.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">GPS Status</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/totalCaseAvailed.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Total Cases Availed</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108TotalTrips.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Total Trips</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108cycleTime.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Cycle Time</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/kilometersCovered.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Kilometers Covered</div></a>
             <!-- <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Hot Spot Alert</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Ambulance @Base Location</div></a> -->
         </div>
         <!-- <div class="row">
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Ambulance on Case</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Ambulance @ Hot Spot</div></a> 
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Vehicles Down</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Idle Time</div></a>
             <a class="ex-link" href="#"><div class="arrow">&#10146;</div><div class="col-xs-4">Cycle Time</div></a>
         </div> -->
         <div class="row">                
         	<a class="ex-link" href="<%=request.getContextPath()%>/ambulanceReport.do"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">360 View</div></a> 
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Trauma (Vehicular)"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Trauma Emergency</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Pregnancy related"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Pregnancy</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Fire/Burns"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Fire Burn</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Neonatal(upto 1 month)"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Neonatal</div></a>            
         </div>
         <div class="row">   
         <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Accidental Poisoning"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Poison</div></a>              
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Allergic Reactions"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Allergy Alert</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Disasters due to Natural elements"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Natural Disaster</div></a>
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Animal Attack"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Animal Bite</div></a>  
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Epilepsy"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Epilepsy</div></a>            
         </div>
         <div class="row">  
         <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Paediatric(1-12years)"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Paediatric-Emergencies</div></a>               
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Diabetes"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Diabetes</div></a> 
             <a class="ex-link" href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Fevers / Infections"><div class="arrow">&#10146;</div><div class="col-xs-4" style="color:black;">Fever</div></a>
          </div>
          </div>
        </div>
    </div>
			
			</div>
			<div id="talukPredictionChart">
				<div style="background-color:teal;color:white;padding-left:20px;">Prediction for Taluk by Hour</div>
				<div id="createNewTable-body"  align="center" style="font-size:8px;margin-left: 20px;height:280px;overflow: auto;"></div>
			</div>
			<div id="villagePredictionChart">
				<div style="background-color:teal;color:white;padding-left:20px;">Prediction for Village by Hour</div>
				<div id="createNewTable-body1"  align="center" style="font-size:8px;margin-left: 20px;height:280px;overflow: auto;"></div>
			</div>
		</div>
		
		<script>
			var predictionTalukData;
			var predictionVillageData;
			var PredictionDistrictName;
			
			function onLoad(){
				document.getElementById("Loading").style.display="none";
				document.getElementById("LoadingImage").style.display="none"; 
				predictionTalukData = <%= request.getAttribute("predictionTalukData") %>;
				predictionVillageData = <%= request.getAttribute("predictionVillageData") %>;
				PredictionDistrictName = "<%= request.getAttribute("PredictionDistrict") %>";
				
				$("#createNewTable-body").empty();
				$("#createNewTable-body1").empty();
				
				getPredictionChart("#createNewTable-body",predictionTalukData);
				getPredictionChart("#createNewTable-body1",predictionVillageData);
			}
			
			function getPredictionChart(renderDiv,heatMapData){
				
				var heatMapDataLength = heatMapData.length;

				var margin = { top: 50, right: 0, bottom: 100, left: 150 },
				          width = 1400 - margin.left - margin.right,
				          height = heatMapDataLength*1.1,
				          gridSize = Math.floor(width / 50),
				          legendElementWidth = gridSize*2,
				          buckets = 9,
				          colors =["#1a9850","#66bd63","#a6d96a","#d9ef8b","#ffffbf","#fee08b","#fdae61","#f46d43","#d73027"];
				
				var dataArray = heatMapData;
				        
				var xAxisDuplicateValues=[];
				for (var i=0;i<heatMapData.length;i++){
					xAxisDuplicateValues.push(heatMapData[i].district);
				}
				var xAxisUniqueArray = xAxisDuplicateValues.filter(function(elem, pos) {
					  return xAxisDuplicateValues.indexOf(elem) == pos;
					});
				var xAxisValues=xAxisUniqueArray; 
				
				var duplicatesArray=[];
				for (var i=0;i<heatMapData.length;i++){
					duplicatesArray.push(heatMapData[i].hours);
				}
				var uniqueArray = duplicatesArray.filter(function(elem, pos) {
					  return duplicatesArray.indexOf(elem) == pos;
					});
				var yAxisValues=uniqueArray; 
				        
		        var dataHandler = function(error, data) {
				  console.log("data=", data);
		          var colorScale = d3.scale.quantile()
		              .domain([0, buckets - 1, d3.max(data, function (d) { return d.value; })])
		              .range(colors); 

		          var svg = d3.select(renderDiv).append("svg")
		              .attr("width", width + margin.left + margin.right)
		              .attr("height", height + margin.top + margin.bottom)
		              .append("g")
		              .attr("transform", "translate(" + margin.left + "," + margin.top + ")");		
		          
		          svg.append('defs')
		            .append('pattern')
		            .attr('id', 'diagonalHatch')
		            .attr('patternUnits', 'userSpaceOnUse')
		            .attr('width', 4)
		            .attr('height', 4)
		            .append('path')
		            .attr('d', 'M-1,1 l2,-2 M0,4 l4,-4 M3,5 l2,-2')
		            .attr('stroke', '#000000')
		            .attr('stroke-width', 1);
		          
		          var xAxisLabels = svg.selectAll(".xAxisLabel")
		             .attr("class", "rowLabels")
				     .data(xAxisValues)
				     .enter().append("text")
					 .text(function (d) { return d; })
					 .attr("x", 0)
					 .attr("y", function (d, i) { return i * gridSize; })
					 .style("text-anchor", "end")
					 .attr("transform", function(d, i) {
	                	return "translate(-3," + gridSize / 1.5 + ")";})
	             	 .attr("class", "rowLabel mono")
	             	 .on("click",getVillagePrediction);         					
					
				 var yAxisLabels = svg.selectAll(".yAxisLabel")
				 	.attr("class", "colLabels")
				    .data(yAxisValues)
				    .enter().append("text")
				    .text(function(d) { return d; })
		   			.attr("x", 0)
		            .attr("y", function(d, i) {
		                return (i * gridSize);})
		            .style("text-anchor", "left")
		   		    .attr("transform", function(d, i) {
		                return "translate(" + gridSize / 2 + ", -13) rotate(-90) rotate(45, 0, " + (i * gridSize) + ")";})
		            .attr("class", "colLabel mono");
				 
				 var heatMap = svg.selectAll(".yAxis")
				   .data(data)
				   .enter().append("rect")
				   .attr("x", function(d) { return (d.yAxis - 1) * gridSize; })
				   .attr("y", function(d) { return (d.xAxis - 1) * gridSize; })
				   .attr("rx", 4)
	               .attr("ry", 4)
				   .attr("class", "yAxis bordered")
				   .attr("width", gridSize)
	               .attr("height", gridSize)
				   .style("fill",function(d) {
		                 if (d.value != -1) return colors[0];
		                else return "url(#diagonalHatch)"; 
		            });		          

		          heatMap.transition().duration(3000)
		              .style("fill", function(d){
			                if (d.value != -1) return colorScale(d.value);
			                else return "url(#diagonalHatch)"; 
			      });

		          heatMap.append("title").text(function(d) {
		        	  if (d.value != -1) return d.value;
		                else return "No Data";
		          });
		              
		         var legend = svg.selectAll(".legend")
		              .data([0].concat(colorScale.quantiles()), function(d) { return d; })
		              .enter().append("g")
		              .attr("class", "legend");

		          legend.append("rect")
		            .attr("x", function(d, i) { return legendElementWidth * i; })
		            .attr("y", height)
		            .attr("width", legendElementWidth)
		            .attr("height", gridSize / 2)
		            .style("fill", function(d, i) { return colors[i]; });

		          legend.append("text")
		            .attr("class", "mono")
		            .text(function(d) { return "= " + Math.round(d); })
		            .attr("x", function(d, i) { return legendElementWidth * i; })
		            .attr("y", height + gridSize); 
		      }
		      dataHandler(null, dataArray); 		      
			}
			
			function getTalukPrediction(){
				document.getElementById("Loading").style.display="inline";
				document.getElementById("LoadingImage").style.display="inline";
				var predictionDistrict;
				var predictionEmerType;
				
				var selectedDistrict=document.getElementById("predictionDistrict");
				if (selectedDistrict != 'undefined') {
					predictionDistrict=selectedDistrict.options[selectedDistrict.selectedIndex].value; 
				 }	
				var selectedEmergencyType=document.getElementById("PredictionEmergencyType");
				if (selectedEmergencyType != 'undefined') {
					predictionEmerType=selectedEmergencyType.options[selectedEmergencyType.selectedIndex].value; 
				 }					
					
				$.ajax({
					type:"POST",
					url:'ambulancePredictionOnSearch.do',
					'data':{
						predictionDistrict:predictionDistrict,predictionEmerType:predictionEmerType,predictionmethodName:"PredDistChange"
					},
					 success: function(result){
						document.getElementById("Loading").style.display="none";
						document.getElementById("LoadingImage").style.display="none";
					 	var data = JSON.parse(result);					
					 	var predictionOnSearchTalukData = data.predictionTalukData;
						var predictionOnSearchVillageData = data.predictionVillageData;	
						
						$("#createNewTable-body").empty();
						$("#createNewTable-body1").empty();
						
						getPredictionChart("#createNewTable-body",predictionOnSearchTalukData);
						getPredictionChart("#createNewTable-body1",predictionOnSearchVillageData);
					 },
					 error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					 }});
			}			
			
			function getVillagePrediction(d){
				document.getElementById("Loading").style.display="inline";
				document.getElementById("LoadingImage").style.display="inline";
				var predictionDistrict;
				var predictionEmerType;
				var predictionTalukName;
				
				var selectedDistrict=document.getElementById("predictionDistrict");
				if (selectedDistrict != 'undefined') {
					predictionDistrict=selectedDistrict.options[selectedDistrict.selectedIndex].value; 
				 }	
				var selectedEmergencyType=document.getElementById("PredictionEmergencyType");
				if (selectedEmergencyType != 'undefined') {
					predictionEmerType=selectedEmergencyType.options[selectedEmergencyType.selectedIndex].value; 
				 }	
				predictionTalukName = d;
					
				$.ajax({
					type:"POST",
					url:'ambulancePredictionOnSearch.do',
					'data':{
						predictionDistrict:predictionDistrict,predictionTalukName:predictionTalukName,predictionEmerType:predictionEmerType,
							predictionmethodName:"PredTalukChange"
					},
					 success: function(result){
						document.getElementById("Loading").style.display="none";
						document.getElementById("LoadingImage").style.display="none";
					 	var data = JSON.parse(result);	
						var predictionOnSearchVillageData = data.predictionVillageData;						
					
						$("#createNewTable-body1").empty();
						getPredictionChart("#createNewTable-body1",predictionOnSearchVillageData);
					 },
					 error: function (xhr, status, error) {
			            alert("Internal Error Occured-Please Contact System Administrator");
					 }});
			}
			
			function getIncidentReport(){
				var contextpath='<%=request.getContextPath()%>'; 				
				document.location.href=contextpath+"/"+'ambulanceReport.do'; 
			}
			
			function getCaseReport(){
				var contextpath='<%=request.getContextPath()%>'; 				
				document.location.href=contextpath+"/"+'ambulanceCaseReport.do'; 
			}
		</script>
	</body>
</html>