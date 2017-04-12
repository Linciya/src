<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
		<title>108 Ambulance Total Cases Availed</title>		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/icons.css">
		
		<script src="js/d3.v3.min.js"></script>
		<script type='text/javascript' src="js/overAllView.js"></script> 
		<script type='text/javascript' src='jquery/jquery-1.11.1.min.js'></script> 
		<script src="js/ambHighcharts.js"></script> 
		<script src="js/drilldown.js"></script>
	
					
		<style>		
			path {
				stroke: #fff;
				fill-rule: evenodd;
			}
			
			text {
				font-family: Arial, sans-serif;
				font-size: 12px;
			}
			
			.dropDown{
				width: 150px;
			}
			
			.node {
				cursor: pointer;
			}
			
			.node circle {
		  		fill: #fff;
		  		stroke: steelblue;
		  		stroke-width: 1.5px;
			}
			
			.node text {
		  		font: 10px sans-serif;
			}
			
			.link {
				fill: none;
				stroke: #ccc;
				stroke-width: 1.5px;
			}
			
			#overAllFlow svg{
				height:470px;
			}
			
			.createNewTable{
				display: none; /* Hidden by default */
			    position: fixed; /* Stay in place */
			    z-index: 2; /* Sit on top */
			    /* padding-top: 30px; */ /* Location of the box */
			    left: 0;
			    /* top: 90px; */
			   	margin-left:150px;
			    width: 65%; /* Full width */
			    height: 450px; /* Full height */
			    /* overflow: auto; */ /* Enable scroll if needed */
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
				padding: 2px 16px;
				 height: 400px;
				overflow: auto;
			}
			
			.createNewTable-footer {
			    padding: 2px 16px;
			    background-color: #3fadb5;
			    color: white;
			    height:22px;
			}
			
			#dashboardHeader{
				width:100%;
				background-image: linear-gradient(bottom, #A0E8FF 10%,  #FFC696 90%);
				background-image: -o-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				background-image: -moz-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				background-image: -webkit-linear-gradient(bottom,  #A0E8FF 10%, #FFC696 90%);
				background-image: -ms-linear-gradient(bottom, #A0E8FF 10%, #FFC696 90%);
				padding-left:20px;
			}
			
			.highlightSelected{
				font-weight:bold;
				color: blue;
			}
		</style>
	</head>

	<body onload="bodyOnLoad();">		
		<input id="distName"  type="hidden" name="distName"/>
		<input id="sunburstChartData"  type="hidden" name="sunburstChartData"/>
		<div id="dashboardHeader">Total Cases Availed</div>	
		<div style="width:100%;margin-top: 10px;">
			<div>
				<label style="margin-left:200px;font-size:12px;font-weight: bold;color:black;">District View</label>					
			</div>
			<div id="overAllFlow"  style="float:left;width:40%;overflow-x:none;"></div>
			<div>
				<label style="margin-left:180px;font-size:12px;font-weight: bold;color:black;">Case count at Taluk & Village level</label>	
				<i id="tableIcon" class="fa fa-table" onclick="getCaseCountTable('table')" style="font-size:20px;padding-left:40px;"></i>	
				<i id="barChartIcon" class="fa fa-bar-chart" onclick="getCaseCountTable('chart');" style="font-size:20px;padding-left:40px;"></i>				
			</div>
			<div id="caseCountDrilldownBar"  style="float:left;width:40%;"></div>
			<div id="caseCountTableDiv"  style="float:left;width:40%;">
				<table id="talukCaseCountTable" style="font-size:small;border-collapse:collapse;border: 1px solid black;margin-left: 5px;">
					<thead>
						<tr>
					 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> Taluk Name</th>
					 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Range</th>
					 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Case Count</th>
					 	</tr>
					</thead>
					<tbody>
					</tbody>						
				</table>
				<table id="villageCaseCountTable" style="font-size:small;border-collapse:collapse;border: 1px solid black;margin-left: 5px;">
					<thead>
						<tr>
					 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color: #FFA500; color: white "> Village Name</th>
					 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Range</th>
					 		<th  style="font-size:small;text-align: center; border: 1px solid black; background-color:#FFA500 ; color: white "> Case Count</th>
					 	</tr>
					</thead>
					<tbody>
					</tbody>						
				</table>
			</div>
			<button  onclick="showCaseDetails();">View Sunburst</button>			
		</div> 	
	
		<!-- POP-UP -->   
	    <div id="createNewTable" class="createNewTable">
	    	<div class="createNewTable-content">
	        	<div class="createNewTable-header">
	            	<span class="createNewTable-reportClose">×</span>
	                <label  id="createNewTablePopUpHeading" style="margin-top: 4px;">Sunburst Chart</label>
	            </div>
	           	<div class="createNewTable-body">
	            	<div id="createNewTablePopTbody" style="margin-top:20px;"></div>
	            </div>
	            <div class="createNewTable-footer"></div>
	        </div>                             
	   	</div>                
                  
	
	<script>
		function bodyOnLoad(){
			var treeChartArray = <%=request.getAttribute("treeChartArray") %>;
			var sunburstArray = <%=request.getAttribute("sunburstArray") %>;
			var talukCaseCount = <%=request.getAttribute("talukCaseCount") %>;
			var villageCaseCount = <%=request.getAttribute("villageCaseCount") %>;
			var districtName = "<%=request.getAttribute("districtName") %>";
			var talukCaseCountTableData = <%=request.getAttribute("talukCaseCountTableData") %>;
			var villageCaseCountTableData = <%=request.getAttribute("villageCaseCountTableData") %>;
			
			document.getElementById("sunburstChartData").value = sunburstArray;
			document.getElementById("distName").value = districtName;
			document.getElementById("caseCountTableDiv").style.display = "none";
			document.getElementById("barChartIcon").style.display = "none";
			
			overAllView(treeChartArray);
			getDrillDownChart(talukCaseCount,villageCaseCount,districtName);
			getTalukCaseCountTable(talukCaseCountTableData);
			getVillageCaseCountTable(villageCaseCountTableData);
		}
		
		createNewTable.style.display = "none";
		$('.createNewTable-reportClose').click(function() {
			createNewTable.style.display = "none";
			$("#createNewTablePopTbody").empty();
		});
		$('#createNewTablePopTbody').prop('contenteditable', false);
		
		function getCaseCountTable(method){
			if(method=='table'){
				document.getElementById("caseCountTableDiv").style.display = "inline";
				document.getElementById("caseCountDrilldownBar").style.display = "none";
				document.getElementById("barChartIcon").style.display = "inline";
				document.getElementById("tableIcon").style.display = "none";
			}
			else if(method=='chart'){
				document.getElementById("caseCountTableDiv").style.display = "none";
				document.getElementById("caseCountDrilldownBar").style.display = "inline";
				document.getElementById("barChartIcon").style.display = "none";
				document.getElementById("tableIcon").style.display = "inline";
			}
		}
		
		function showCaseDetails(){
			var createNewTable = document.getElementById('createNewTable');
			createNewTable.style.display = "block";	
			
			$("#createNewTablePopTbody").empty();
			var districtName = document.getElementById("distName").value; 
			
			$.ajax({
				type:"POST",
				url:'totalCaseAvailedSunburst.do',
				'data':{
					districtName:districtName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 getSunburstChart(districtName,jsonData);
					 
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
		}
		
		function getTalukCaseCountTable(talukCaseCountTableData){
			var $select=$('#talukCaseCountTable tbody');
			$select.find('tr').remove();
			  for(i=0;i<talukCaseCountTableData.length;i++){
			  	  	$("#talukCaseCountTable tbody").append('<tr onclick="getOnChangeVillageCaseCountTable(this);"><td style=" border: 1px solid black;"> '+talukCaseCountTableData[i].talukName+' </td><td style="text-align: center; border: 1px solid black;"> '+talukCaseCountTableData[i].range+'</td><td style="text-align:center; border: 1px solid black;">'+talukCaseCountTableData[i].caseCount+'</td></tr>');
			  }
		}
		
		function getVillageCaseCountTable(villageCaseCountTableData){
			var $select=$('#villageCaseCountTable tbody');
			$select.find('tr').remove();
			  for(i=0;i<villageCaseCountTableData.length;i++){
			  	  	$("#villageCaseCountTable tbody").append('<tr><td style=" border: 1px solid black;"> '+villageCaseCountTableData[i].villageName+' </td><td style="text-align: center; border: 1px solid black;"> '+villageCaseCountTableData[i].range+'</td><td style="text-align:center; border: 1px solid black;">'+villageCaseCountTableData[i].caseCount+'</td></tr>');
			  }
		}
		
		function districtChange(districtName){
			$.ajax({
				type:"POST",
				url:'totalCaseAvailedOnChange.do',
				'data':{
					districtName:districtName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 
					 talukCaseCount = jsonData.talukCaseCount;
					 villageCaseCount = jsonData.villageCaseCount;
					 talukCaseCountTableData = jsonData.talukCaseCountTableData;
					 villageCaseCountTableData = jsonData.villageCaseCountTableData;
					 sunburstArray = jsonData.sunburstArray;
					 
					 document.getElementById("sunburstChartData").value = sunburstArray;
					 document.getElementById("distName").value = districtName;
					 
					 getDrillDownChart(talukCaseCount,villageCaseCount,districtName);
					 getTalukCaseCountTable(talukCaseCountTableData);
					 getVillageCaseCountTable(villageCaseCountTableData);
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
		}
		
		function getOnChangeVillageCaseCountTable(talukName){
			var all_tr = $('#villageCaseCountTable tbody tr');
			all_tr.removeClass('highlightSelected');
			$(talukName).addClass('highlightSelected');
			
			var districtName = document.getElementById("distName").value;
			$.ajax({
				type:"POST",
				url:'villageCaseCountTableData.do',
				'data':{
					districtName:districtName,talukName:talukName
				},
				 success: function(result){
					 var jsonData = JSON.parse(result);
					 getVillageCaseCountTable(jsonData);
				 },
				 error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				 }});
		}
		
		function getDrillDownChart(talukCaseCount,villageCaseCount,districtName) {
		    // Create the chart
		    $('#caseCountDrilldownBar').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'For '+districtName ,
		            style: { "color": "#333333", "fontSize": "11px" }
		        },
		        xAxis: {
		            type: 'category'
		        },
		        yAxis : {
		                title: {
		                  text: 'Case Count'
		                }
		             },

		        legend: {
		            enabled: false
		        },

		        plotOptions: {
		            series: {
		                borderWidth: 0,
		                dataLabels: {
		                    enabled: true
		                }
		            }
		        },

		        series: [{
		            name: 'Taluk',
		            colorByPoint: true,
		            data:  talukCaseCount
		        }],
		        drilldown: {
		            series: villageCaseCount            	 
		        }
		    });
		}
		
		function getSunburstChart(districtName,sunburstArray){
			var width1 = 600,
		    height1 = 500,
		    radius = Math.min(width1, height1) / 2;
		
		var x = d3.scale.linear()
		    .range([0, 2 * Math.PI]);
		
		var y = d3.scale.linear()
		    .range([0, radius]);
		
		var color = d3.scale.category20c();
		
		var svg1 = d3.select("#createNewTablePopTbody").append("svg")
		    .attr("width", width1)
		    .attr("height", height1)
		  .append("g")
		    .attr("transform", "translate(" + width1 / 2 + "," + (height1 / 2 + 10) + ")");
		
		var partition = d3.layout.partition()
		    .value(function(d) { return d.size; });
		
		var arc = d3.svg.arc()
		    .startAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))); })
		    .endAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))); })
		    .innerRadius(function(d) { return Math.max(0, y(d.y)); })
		    .outerRadius(function(d) { return Math.max(0, y(d.y + d.dy)); });
		
		/*d3.json(jsonData, function(error, root) {*/
		
		var root =  constructData(sunburstArray);
		
		  var g = svg1.selectAll("g")
		     .data(partition.nodes(root))
		    .enter().append("g");
		
		  var path = g.append("path")
		    .attr("d", arc)
		    .style("fill", function(d) { return color((d.children ? d : d.parent).name); })
		    .on("click", click); 
		
		  var text = g.append("text")   
		      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + computeTextRotation(d) + ")"; })
		        .attr('text-anchor', function (d) { return computeTextRotation(d) >90 ? "end" : "start"; })
		        .attr('text-anchor', "middle")
		        .attr('marign-left', "auto")
		        .attr("dx", "7") // margin
		        .attr("dy", ".50em") // vertical-align        
		        .text(function(d) { return d.name; });
		
		  function click(d) {
		    // fade out all text elements
		    text.transition().attr("opacity", 0);
		
		    path.transition()
		      .duration(750)
		      .attrTween("d", arcTween(d))
		      .each("end", function(e, i) {
		          // check if the animated element's data e lies within the visible angle span given in d
		          if (e.x >= d.x && e.x < (d.x + d.dx)) {
		            // get a selection of the associated text element
		            var arcText = d3.select(this.parentNode).select("text");
		            // fade in the text element and recalculate positions
		            arcText.transition().duration(750)
		              .attr("opacity", 1)
		             /* .attr("transform", function() { return "rotate(" + computeTextRotation(e) + ")" })*/
		              /*.attr("x", function(d) { return y(d.y); });*/
		               .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + computeTextRotation(d) + ")"; })
		               .attr('text-anchor', function (d) { return computeTextRotation(d) > 180 ? "end" : "start"; })
		          }
		      });
		  };
		
		d3.select(self.frameElement).style("height", height1 + "px");
		
		// Interpolate the scales!
		function arcTween(d) {
		  var xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx]),
		      yd = d3.interpolate(y.domain(), [d.y, 1]),
		      yr = d3.interpolate(y.range(), [d.y ? 20 : 0, radius]);
		  return function(d, i) {
		    return i
		        ? function(t) { return arc(d); }
		        : function(t) { x.domain(xd(t)); y.domain(yd(t)).range(yr(t)); return arc(d); };
		  };
		}
		
		function computeTextRotation(d) {
		/*  return (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;*/
			 var ang = (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;
		     return (ang > 90) ? 180 + ang : ang;
		}
		
		function constructData(sunburstArray){		
			var data =sunburstArray;
			var dataMap = data.reduce(function(map, node) {
			    map[node.name] = node;
			    return map;
			}, {});
		
			// create the tree array
			var treearray = [];
			data.forEach(function(node) {
			    // add to parent
			    var parent = dataMap[node.parent];
			    delete node.parent;
			    if (parent) {
			        // create child array if it doesn't exist
			        (parent.children || (parent.children = []))
			            // add node to child array
			            .push(node);
			    } else {
			        // parent is null or missing
			        treearray.push(node);
			    }
			});
				var finaltreemap = {"name":districtName,"children":treearray}
			/*  d3.json("json/flare.json", function(error, flare) {   */
				var flare = finaltreemap;
			
			
			return flare	
		};
	

		
		}
	
	</script>
	</body>	
</html>