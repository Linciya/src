<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONException" %>
 	    <%@page import="org.json.JSONObject"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>108 Ambulance Cycle Time</title>
		
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<script src="js/d3.v3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>	
		<script src="js/script.js"></script>
		<script src="js/fusioncharts.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.powercharts.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
		<script src="js/ambHighcharts.js"></script> 
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
		
		<style>		     			
			body {
			  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
			  position: relative;
			  width: 300px;
			}
			
			.axis text {
			  font: 10px sans-serif;
			}
			
			.axis path,
			.axis line {
			  fill: none;
			  stroke: #000;
			  shape-rendering: crispEdges;
			}
			
			.bar {
			  fill: steelblue;
			  fill-opacity: .9;
			}
			
			.x.axis path {  display: none; }
			.legend{
			    margin-bottom:76px;
			    display:inline-block;
			    border-collapse: collapse;
			    border-spacing: 0px;
			    margin-left:150px;
			    margin-top:80px;
			}
			
			.legend td{
			    padding:4px 5px;
			    vertical-align:bottom;
			    font-size:12px;
			}
			
			.legendFreq, .legendPerc{
			    align:right;
			    width:50px;
			    
			}
			
			.smallbtnStyles{
				color:black;
				font-size: 10px;
				margin-left:15px; 
				width:85px;
				height:18px;				
			}    
			
			                  /* Toggle Menu CSS Start */
                     div#dm{
                           width:1000px;
                     }
                     .dropdown{
                           margin-left: 100px;
                     }
                     div#drop{
                           margin-top:-17px;
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
                     
                     .loader {
					position: fixed;
					left: 0px;
				 	top: 0px;
					width: 100%;
					height: 100%;
					z-index: 9999;
					background: url('images/Load_img.gif') 50% 50% no-repeat rgb(249,249,249);
				    opacity: .8;
					}
		</style>		
	</head>
	
	<body onload="bodyOnLoad();">
	<input id="distName"  type="hidden" name="distName"/>
		<div style="width:100%">
			<div style="width:100%;height:50%;border:0.1px solid black;">
				<div style="color:black;background-color: #b3e6cc;font-size: 13px;font-weight: bold;padding-left:10px;"><b>Cycle Time</b></div>
	<div class="nav navbar-nav navbar-right" id="drop">
    <div class="dropdown">
              <a id="click" href="#" data-toggle="dropdown" style="font-size: 13px;margin-left: -50px;font-weight: bold;color:blue;"><u>BROWSE ALL DASHBOARD  &#9776;</u></a>
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
    		<div style="padding-top:9px;">
                     <label style="font-size:13px;font-weight:bold;color:black;margin-left:10%;">Cycle Time taken drilldown by District</label>
                     <label style="font-size:13px;font-weight:bold;color:black;margin-left:15%;">Cycle Time taken drilldown by Range(mins)</label>
                     <label style="font-size:13px;font-weight:bold;color:black;margin-left:8%;">Legend</label>
            </div>
			<div id="dashboardChart"  align="center" style="margin-left:-150px;font-size:8px;width:100%;height:350px;overflow: auto;"></div>
			</div>
			<div style="width:40%;height:420px;border:0.1px solid black;overflow:auto;margin-left:2px;">
				<div style="background-color:teal;color:white;padding-left:20px">Stack Chart
					<button class="smallbtnStyles"  onclick="getMinMaxValueStack('MAX')" style="border: 0.1px solid #ffd480;">MAX</button>
					<button class="smallbtnStyles"  onclick="getMinMaxValueStack('MIN')" style="border: 0.1px solid #ffd480;">MIN</button>
				</div>
				<div id='stackedChart' style="color:black;float:left;width:40%;"></div>
			</div>
			<div style="background:red;width:28.1%;margin-left:638px;">
			<div style="margin-top:-422px;background-color:teal;color:white;padding-left:20px;">Pie Chart</div>
			<div id='pieChart' style="color:black;width:100%;border:0.1px solid black;overflow:auto;"></div>
			</div>
			<div style="width:31.5%;height:390px;margin-left:900px;margin-top:-420px;float:right;">
			  <div style="background-color:teal;color:white;padding-left:20px;">Comparison Chart
				<button class="smallbtnStyles"  onclick="getMinMaxValueBar('MAX')" style="border: 0.1px solid #ffd480;">MAX</button>
				<button class="smallbtnStyles"  onclick="getMinMaxValueBar('MIN')" style="border: 0.1px solid #ffd480;">MIN</button>
				</div>
				<div id='comparisonBarChart' style="color:black;width:100%;border:0.1px solid black;overflow:auto;margin-top:0px; height:100%;"></div>
			</div>
		</div>
		<div class="loader"></div>   
		
	<script>
	
	var comparisonBarChartProperties={"renderAt": 'comparisonBarChart', "width": '600',"height": '300',"dataFormat": 'json',"paletteColors": "#0075c2,#1aaf5d","bgColor": "#ffffff","showBorder": "0","showHoverEffect":"1","showCanvasBorder": "0","usePlotGradientColor": "0","plotBorderAlpha": "10",
			"legendBorderAlpha": "0","legendShadow": "0","placevaluesInside": "0","valueFontColor": "#ffffff","showXAxisLine": "1","xAxisLineColor": "#999999","divlineColor": "#999999","divLineIsDashed": "1","showAlternateVGridColor": "0","subcaptionFontBold": "0",
			"subcaptionFontSize": "14"};	
	
	function bodyOnLoad(){
		$(".loader").fadeIn();
		var districtName = "<%= request.getAttribute("districtName") %>";
		var cycleTimeData = <%= request.getAttribute("cycleTimeData") %>;
 		var cycleTimeStackData = <%= request.getAttribute("cycleTimeStackData") %>; 
 		var cycleTimePieData = <%= request.getAttribute("cycleTimePieData") %>; 
 		var cycleTimeFirstSeriesData = <%= request.getAttribute("cycleTimeFirstSeriesData") %>; 
 		var cycleTimeSecondSeriesData = <%= request.getAttribute("cycleTimeSecondSeriesData") %>; 
		
		document.getElementById("distName").value = districtName;
 		dashboard('#dashboardChart',cycleTimeData);
		getStackedBarChart(cycleTimeStackData,districtName);
		getPieChart(cycleTimePieData,districtName);
		StaticMSChart("mscolumn2d",comparisonBarChartProperties,"Ambulance Trip time",cycleTimeFirstSeriesData,cycleTimeSecondSeriesData,"Vehicle No");
		$(".loader").fadeOut();
	}
	
 	function districtChange(districtName){
 		document.getElementById("distName").value=districtName;
		
 		$(".loader").fadeIn();
		$.ajax({
			type:"POST",
			url:'cycleTimeDistrictChange.do',
			'data':{
				districtName:districtName
			},
			 success: function(result){
				 var jsonData = JSON.parse(result);
				 var cycleTimeStackData = jsonData.cycleTimeStackData;		 
				 var cycleTimePieData = jsonData.cycleTimePieData;		 
				 var cycleTimeFirstSeriesData = jsonData.cycleTimeFirstSeriesData;		 
				 var cycleTimeSecondSeriesData = jsonData.cycleTimeSecondSeriesData;		
				 
				getStackedBarChart(cycleTimeStackData,districtName);
				getPieChart(cycleTimePieData,districtName);
				StaticMSChart("mscolumn2d",comparisonBarChartProperties,"Ambulance Trip time",cycleTimeFirstSeriesData,cycleTimeSecondSeriesData,"Vehicle No");
				
				$(".loader").fadeOut();

			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			 }});
	}	 
 	
 	function getMinMaxValueStack(buttonClick){
 		var districtName =document.getElementById("distName").value;
 		$(".loader").fadeIn();
		$.ajax({
			type:"POST",
			url:'getMinMaxValueStack.do',
			'data':{
				districtName:districtName,buttonClick:buttonClick
			},
			 success: function(result){
				 var jsonData = JSON.parse(result);	 
				getStackedBarChart(jsonData,districtName);
				$(".loader").fadeOut();
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			 }}); 		
 	}
 	
 	function getMinMaxValueBar(buttonClick){
 		var districtName =document.getElementById("distName").value;
 		$(".loader").fadeIn();
		$.ajax({
			type:"POST",
			url:'getMinMaxValueBar.do',
			'data':{
				districtName:districtName,buttonClick:buttonClick
			},
			 success: function(result){
				 var jsonData = JSON.parse(result);	 
				 var cycleTimeFirstSeriesData = jsonData.cycleTimeFirstSeriesData;
				 var cycleTimeSecondSeriesData = jsonData.cycleTimeSecondSeriesData;
				 StaticMSChart("mscolumn2d",comparisonBarChartProperties,"Ambulance Trip time",cycleTimeFirstSeriesData,cycleTimeSecondSeriesData,"Vehicle No");
				 $(".loader").fadeOut();
			 },
			 error: function (xhr, status, error) {
	                alert("Internal Error Occured-Please Contact System Administrator");
			 }}); 		
 	}

	function dashboard(id, fData){
	    var barColor = 'steelblue';
	    function segColor(c){ return {verylow:"#807dba", low:"#e08214",lowmid:"#41ab5d",mid:"#FF90D5", highmid:"#DA9167",high:"#FFFF50",veryhigh:"#BCC6CC"}[c]; } 
	    
	    // compute total for each state.
	    fData.forEach(function(d){d.total=d.freq.verylow+d.freq.low+d.freq.lowmid+d.freq.mid+d.freq.highmid+d.freq.high+d.freq.veryhigh;});
	    
	    // function to handle histogram.
	    function histoGram(fD){
	        var hG={},    hGDim = {t: 60, r: 0, b: 100, l: 10};
	        hGDim.w = 600 - hGDim.l - hGDim.r, 
	        hGDim.h = 300 - hGDim.t - hGDim.b;
	            
	        //create svg for histogram.
	        var hGsvg = d3.select(id).append("svg")
	            .attr("width", hGDim.w + hGDim.l + hGDim.r)
	            .attr("height", hGDim.h + hGDim.t + hGDim.b).append("g")
	            .attr("transform", "translate(" + hGDim.l + "," + hGDim.t + ")");

	        // create function for x-axis mapping.
	        var x = d3.scale.ordinal().rangeRoundBands([0, hGDim.w], 0.1)
	                .domain(fD.map(function(d) { return d[0]; }));

	        // Add x-axis to the histogram svg.
	        hGsvg.append("g").attr("class", "x axis")
	            /* .attr("transform", "translate(0," + hGDim.h + ")") */
	             .attr("transform", "translate(0," + hGDim.h + ")")
	             .call(d3.svg.axis().scale(x).orient("bottom"))
	       		 .selectAll("text")	
	             .style("text-anchor", "end")
	             .attr("dx", "-.8em")
	             .attr("dy", ".15em")
	             .attr("transform", function(d) {
	                return "rotate(-65)" 
	                });	           

	        // Create function for y-axis map.
	        var y = d3.scale.linear().range([hGDim.h, 0])
	                .domain([0, d3.max(fD, function(d) { return d[1]; })]);

	        // Create bars for histogram to contain rectangles and freq labels.
	        var bars = hGsvg.selectAll(".bar").data(fD).enter()
	                .append("g").attr("class", "bar");
	        
	        //create the rectangles.
	        bars.append("rect")
	            .attr("x", function(d) { return x(d[0]); })
	            .attr("y", function(d) { return y(d[1]); })
	            .attr("width", x.rangeBand())
	            .attr("height", function(d) { return hGDim.h - y(d[1]); })
	            .attr('fill',barColor)
	            .on("mouseover",mouseover)// mouseover is defined below.
	            .on("mouseout",mouseout)// mouseout is defined below.
	            .on("click",click);
	            
	        //Create the frequency labels above the rectangles.
	        bars.append("text").text(function(d){ return d3.format(",")(d[1])})
	            .attr("x", function(d) { return x(d[0])+x.rangeBand()/2; })
	            .attr("y", function(d) { return y(d[1])-5; })
	            .attr("text-anchor", "middle");
	        
	        function mouseover(d){  // utility function to be called on mouseover.
	            // filter for selected state.
	            var st = fData.filter(function(s){ return s.State == d[0];})[0],
	                nD = d3.keys(st.freq).map(function(s){ return {type:s, freq:st.freq[s]};});
	               
	            // call update functions of pie-chart and legend.    
	            pC.update(nD);
	            leg.update(nD);
	        }
	        
	        function mouseout(d){    // utility function to be called on mouseout.
	            // reset the pie-chart and legend.    
	            pC.update(tF);
	            leg.update(tF);
	        }
	        
	        function click(d){
	        	districtChange(d[0]);
	        }
	        
	        // create function to update the bars. This will be used by pie-chart.
	        hG.update = function(nD, color){
	            // update the domain of the y-axis map to reflect change in frequencies.
	            y.domain([0, d3.max(nD, function(d) { return d[1]; })]);
	            
	            // Attach the new data to the bars.
	            var bars = hGsvg.selectAll(".bar").data(nD);
	            
	            // transition the height and color of rectangles.
	            bars.select("rect").transition().duration(500)
	                .attr("y", function(d) {return y(d[1]); })
	                .attr("height", function(d) { return hGDim.h - y(d[1]); })
	                .attr("fill", color);

	            // transition the frequency labels location and change value.
	            bars.select("text").transition().duration(500)
	                .text(function(d){ return d3.format(",")(d[1])})
	                .attr("y", function(d) {return y(d[1])-5; });            
	        }        
	        return hG;
	    }
	    
	    // function to handle pieChart.
	    function pieChart(pD){
	        var pC ={},    pieDim ={w:250, h: 250};
	        pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;
	                
	        // create svg for pie chart.
	        var piesvg = d3.select(id).append("svg")
	            .attr("width", pieDim.w).attr("height", pieDim.h).append("g")
	            .attr("transform", "translate("+pieDim.w/2+","+pieDim.h/2+")");
	        
	        // create function to draw the arcs of the pie slices.
	        var arc = d3.svg.arc().outerRadius(pieDim.r - 10).innerRadius(0);

	        // create a function to compute the pie slice angles.
	        var pie = d3.layout.pie().sort(null).value(function(d) { return d.freq; });

	        // Draw the pie slices.
	        piesvg.selectAll("path").data(pie(pD)).enter().append("path").attr("d", arc)
	            .each(function(d) { this._current = d; })
	            .style("fill", function(d) { return segColor(d.data.type); })
	            .on("mouseover",mouseover).on("mouseout",mouseout);

	        // create function to update pie-chart. This will be used by histogram.
	        pC.update = function(nD){
	            piesvg.selectAll("path").data(pie(nD)).transition().duration(500)
	                .attrTween("d", arcTween);
	        }        
	        // Utility function to be called on mouseover a pie slice.
	        function mouseover(d){
	            // call the update function of histogram with new data.
	            hG.update(fData.map(function(v){ 
	                return [v.State,v.freq[d.data.type]];}),segColor(d.data.type));
	        }
	        //Utility function to be called on mouseout a pie slice.
	        function mouseout(d){
	            // call the update function of histogram with all data.
	            hG.update(fData.map(function(v){
	                return [v.State,v.total];}), barColor);
	        }
	        // Animating the pie-slice requiring a custom function which specifies
	        // how the intermediate paths should be drawn.
	        function arcTween(a) {
	            var i = d3.interpolate(this._current, a);
	            this._current = i(0);
	            return function(t) { return arc(i(t));    };
	        }    
	        return pC;
	    }
	    
	    // function to handle legend.
	    function legend(lD){
	        var leg = {};
	            
	        // create table for legend.
	        var legend = d3.select(id).append("table").attr('class','legend');
	        
	        // create one row per segment.
	        var tr = legend.append("tbody").selectAll("tr").data(lD).enter().append("tr");
	            
	        // create the first column for each segment.
	        tr.append("td").append("svg").attr("width", '16').attr("height", '16').append("rect")
	            .attr("width", '16').attr("height", '16')
				.attr("fill",function(d){ return segColor(d.type); });
	            
	        // create the second column for each segment.
	        tr.append("td").text(function(d){ if(d.type == 'verylow'){return "0 to 30 mins";}
	        else if(d.type == 'low'){return "30 to 45  mins";}
	        else if(d.type == 'lowmid'){return "45 to 60 mins";}
	        else if(d.type == 'mid'){return "60 to 90 mins";}
	        else if(d.type == 'highmid'){return "90 to 120 mins";}
	        else if(d.type == 'high'){return "120 to 180 mins";}
	        else if(d.type == 'veryhigh'){return "180mins and Above";}
	        });

	        // create the third column for each segment.
	        tr.append("td").attr("class",'legendFreq')
	            .text(function(d){ return d3.format(",")(d.freq);});

	        // create the fourth column for each segment.
	        tr.append("td").attr("class",'legendPerc')
	            .text(function(d){ return getLegend(d,lD);});

	        // Utility function to be used to update the legend.
	        leg.update = function(nD){
	            // update the data attached to the row elements.
	            var l = legend.select("tbody").selectAll("tr").data(nD);

	            // update the frequencies.
	            l.select(".legendFreq").text(function(d){ return d3.format(",")(d.freq);});

	            // update the percentage column.
	            l.select(".legendPerc").text(function(d){ return getLegend(d,nD);});        
	        }
	        
	        function getLegend(d,aD){ // Utility function to compute percentage.
	            return d3.format("%")(d.freq/d3.sum(aD.map(function(v){ return v.freq; })));
	        }

	        return leg;
	    }
	    
	    // calculate total frequency by segment for all state.
	    var tF = ['verylow','low','lowmid','mid','highmid','high','veryhigh'].map(function(d){ 
	        return {type:d, freq: d3.sum(fData.map(function(t){ return t.freq[d];}))}; 
	    });    
	    
	    // calculate total frequency by state for all segment.
	    var sF = fData.map(function(d){return [d.State,d.total];});

	    var hG = histoGram(sF), // create the histogram.
	        pC = pieChart(tF), // create the pie-chart.
	        leg= legend(tF);  // create the legend.
	}
	
 	function getStackedBarChart(cycleTimeStackData,districtName){
		 FusionCharts.ready(function(){
			    var fusioncharts = new FusionCharts({
			    type: 'stackedbar2d',
			    renderAt: 'stackedChart',
			    width: '625',
			    height: '500',
			    dataFormat: 'json',
			    dataSource: {
			        "chart": {
			            "caption": "Incident wise Time Analysis in "+districtName,
			            "xAxisname": "Id",
			            "yAxisName": "Cycle Time Taken",
			            //To show value as datavalue and percent value in tooltip
			            "showValues": "0",
			            //"showSum": "1",
			            //Value font color
			            "valueFontColor": "#ffffff",
			            "theme": "fint"
			        },

			        "categories": [{
			            "category": cycleTimeStackData
			        }],

			        "dataset": cycleTimeStackData
			    }
			}
			);
			    fusioncharts.render();
			});
	}
 	
 	function getPieChart(cycleTimePieData,districtName){
 		Highcharts.chart('pieChart', {
 		    chart: {
 		        plotBackgroundColor: null,
 		        plotBorderWidth: null,
 		        plotShadow: false,
 		        type: 'pie'
 		    },
 		    title: {
 		        text: 'Ambulance - Remarks & Count Detail'
 		    },
 		    tooltip: {
 		        pointFormat: '{series.name}: <b>{point.y}</b>'
 		    },
 		    plotOptions: {
 		        pie: {
 		            allowPointSelect: true,
 		            cursor: 'pointer',
 		            dataLabels: {
 		                enabled: false,
 		                format: '<b>{point.name}</b>: {point.y} ', 
 		                style: {
 		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
 		                }
 		            } 
 		        }
 		    },
 		    series: [{
 		        name: 'Count',
 		        colorByPoint: true,
 		        data: cycleTimePieData
 		    }]
 		});
 	}

 	function StaticMSChart(msChartType,multiSeriesChartProperties,ReportName,multiSeriesData1,multiSeriesData2,xaxisName){
 		FusionCharts.ready(function () {
 		    var revenueChart = new FusionCharts({
 		        type: msChartType,
 		        renderAt: multiSeriesChartProperties.renderAt,
 		        width: multiSeriesChartProperties.width,
 		        height: multiSeriesChartProperties.height,
 		        dataFormat: multiSeriesChartProperties.dataFormat,
 		        dataSource: {
 		            "chart": {
 		                "caption": ReportName,
 		                "yAxisname": "Time Taken",
 		                "xAxisname":xaxisName,
 		                "paletteColors": multiSeriesChartProperties.paletteColors,
 		                "bgColor": multiSeriesChartProperties.bgColor,
 		                "showBorder": multiSeriesChartProperties.showBorder,
 		                "showHoverEffect": multiSeriesChartProperties.showHoverEffect,
 		                "showCanvasBorder": multiSeriesChartProperties.showCanvasBorder,
 		                "usePlotGradientColor": multiSeriesChartProperties.usePlotGradientColor,
 		                "plotBorderAlpha": multiSeriesChartProperties.plotBorderAlpha,
 		                "legendBorderAlpha": multiSeriesChartProperties.legendBorderAlpha,
 		                "legendShadow": multiSeriesChartProperties.legendShadow,
 		                "placevaluesInside": multiSeriesChartProperties.placevaluesInside,
 		                "valueFontColor": multiSeriesChartProperties.valueFontColor,
 		                "showXAxisLine": multiSeriesChartProperties.showXAxisLine,
 		                "xAxisLineColor": multiSeriesChartProperties.xAxisLineColor,
 		                "divlineColor": multiSeriesChartProperties.divlineColor,               
 		                "divLineIsDashed": multiSeriesChartProperties.divLineIsDashed,
 		                "showAlternateVGridColor": multiSeriesChartProperties.showAlternateVGridColor,
 		                "subcaptionFontBold": multiSeriesChartProperties.subcaptionFontBold,
 		                "subcaptionFontSize": multiSeriesChartProperties.subcaptionFontSize,
 		                "formatNumberScale": "0"
 		            },            
 		            "categories": [
 		                {
 		                    "category": multiSeriesData1
 		                }
 		            ],            
 		            "dataset": [
 		                {
 		                    "seriesname": multiSeriesData1[0].seriesName,
 		                    "data": multiSeriesData1
 		                }, 
 		                {
 		                    "seriesname": multiSeriesData2[0].seriesName,
 		                    "data": multiSeriesData2
 		                }
 		            ],
 		        }
 		    }).render();    
 		});
 	}				 
	</script>

</body>
</html>