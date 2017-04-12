<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
       <head>
              <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
              <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
              <%@ page import="org.json.JSONArray" %>
              <%@ page import="org.json.JSONException" %>
           	  <%@page import="org.json.JSONObject"%>
              <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
              <title>108 Ambulance kilometers covered</title>
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
                     
                     .x.axis path {
                       display: none;
                     }
                     
                     path {  stroke: #fff; }
                     path:hover {  opacity:0.9; }
                     rect:hover {  fill:blue; }
                     .axis {  font: 10px sans-serif; }
                     .legend tr{    border-bottom:1px solid grey; }
                     .legend tr:first-child{    border-top:1px solid grey; }
                     
                     .axis path,
                     .axis line {
                       fill: none;
                       stroke: #000;
                       shape-rendering: crispEdges;
                     }
                     
                     .x.axis path {  display: none; }
                     .legend{
                         margin-bottom:22px;
                         display:inline-block;
                         border-collapse: collapse;
                         border-spacing: 0px;
                         margin-left:150px;
                     }
                     .legend td{
                         padding:4px 5px;
                         vertical-align:bottom;
                         font-size:12px;
                     }
                     .legendFreq, .legendPerc{
                         align:right;
                         width:50px;
                         margin-top:50px;
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
                     
                     div#dataEntryFooterID
                     {
                     margin-top:5px;
                     }
                     div.pager
                     {
                     font-size:13px;
                     }
                     
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
       <body onload="onLoad();">
              <div id="entireId" style="width:100%;margin-left: 20px;margin-top: 5px;">
                     <div id="firstSec" style="width:98%;float:left;">
                     <div id="directorateNameHeader" style="color:black;background-color: #b3e6cc;font-size: 13px;font-weight: bold"><b>Kilometers Covered</b></div>
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
                     <div id="talukPredictionChart" style="float:left;width:99%;border:1px solid black;">
                     <div style="padding-top:9px;">
                     <label style="font-size:13px;font-weight:bold;color:black;margin-left:13%;">Kilometers covered drilldown by District</label>
                     <label style="font-size:13px;font-weight:bold;color:black;margin-left:17%;">Kilometers covered drilldown by Range</label>
                     <label style="font-size:13px;font-weight:bold;color:black;margin-left:10%;">Legend</label>
                     </div>
                     <div id="createNewTable-body"  align="center" style="font-size:8px;height:350px; overflow: auto;margin-left:-200px;"></div>
                     </div>
                     </div>
                     
                     <div id="secondsection" style="width:100%;margin-left: 0px;padding-top: 400px;">
                     <div style="font-size:12px;font-weight:bold;padding-left:20px;width:45.7%;border:1px solid black;">Kilometers covered by Ambulance in 
                     <span style="font-size:12px;font-weight:bold;color: blue;" id='districtNameVal'></span>
                     <button class="smallbtnStyles" onclick="getIftandNonIftValues('ift',null)" style="background:-webkit-linear-gradient(#ffeecc ,#ffa31a);border: 0.1px solid #ffd480;">IFT</button>
                     <button class="smallbtnStyles" onclick="getIftandNonIftValues('nonIft',null)" style="background:-webkit-linear-gradient(#ffeecc ,#ffa31a);border: 0.1px solid #ffd480;">NON IFT</button>
                  <span style="font-size: 11px;color: blue;" id='districtNameVal'></span>
                  <div id="iftCombinationCharts"></div></div>
                     <div id="chart-container0" style="font-size:12px;font-weight:bold;width:50%;height:317px;float:left;margin-left:744.5px;margin-top:-320px;border:1px solid black;overflow:auto;">
                     <table id="indTable1" style="overflow:auto;width:99.9%;font-size:small;height:auto; border-collapse:collapse;margin-top: 0px;" data-filter="true" data-input="#filterTable-input">
                     <thead>
                     <tr id="directorateNameHeader" style="font-size:12px;font-weight:bold;padding-left:20px;">Ambulance- Vehicle Detail <span style="font-size: 11px;color: blue;" id='VehicalNoVal'></span></tr>
                     <tr style="font-size:small">
                     <td  style="font-size:small; border: 1px solid black; background-color: #FFA500; color: white ">Source Location</td>
                     <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white ">Hospital Name</td>
                     <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white ">Ift_Nift</td>
                     <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white ">Emerency Type</td>
                     <td  style="font-size:small; border: 1px solid black; background-color:#FFA500 ; color: white ">Emerency Sub Type</td>
                     </tr>
                     </thead>
                     <tbody id="indTable" name="jsonData"  >
                    </tbody>
                     </table>
                     </div> 
                  </div>    
                     
                     </div>
                     <input type="hidden" id="onloadDistrictVal" value="${districtName}">     
                     <div class="loader"></div>   
<script>
var kilometersCoveredList;
function onLoad(){
	$(".loader").fadeIn();
	var kilometersCoveredAmbData = <%= request.getAttribute("kilometersCoveredAmbData") %>;
	displaykilometersCoveredAmbData(kilometersCoveredAmbData);
	var kilometersCoveredDrilldownData = <%= request.getAttribute("kilometersCoveredDrilldownData") %>;
	dashboard('#createNewTable-body',kilometersCoveredDrilldownData);
	var kmCoveredFirstSeriesData = <%= request.getAttribute("kmCoveredFirstSeriesData") %>;
	var kmCoveredSecondSeriesData = <%= request.getAttribute("kmCoveredSecondSeriesData") %>;
	var normalChartTopRightProperties={"renderAt": 'iftCombinationCharts', "width": '600',"height": '300',"dataFormat": 'json'};
	combinationCharts2Data("column2d",normalChartTopRightProperties,"Kms covered by Ambulance - IFT",kmCoveredFirstSeriesData,kmCoveredSecondSeriesData,"Ambulance Number");
	var districtName =$("#onloadDistrictVal").val();
	document.getElementById('districtNameVal').innerHTML = districtName; 
	var VehicalNo= "<%= request.getAttribute("VehicalNo") %>";
	document.getElementById('VehicalNoVal').innerHTML = VehicalNo;
	$(".loader").fadeOut(); 

	}

function getDrillDownChart(ambKilometersCoveredDatas){
       var margin = {top: 100, right: 20, bottom: 30, left: 40},
    width = 460 - margin.left - margin.right,
    height = 300 - margin.top - margin.bottom;

              var x = d3.scale.ordinal()
                  .rangeRoundBands([0, width], .1, 1);
              
              var y = d3.scale.linear()
                  .range([height, 0]);
              
              var xAxis = d3.svg.axis()
                  .scale(x)
                  .orient("bottom");
              
              var yAxis = d3.svg.axis()
                  .scale(y)
                  .orient("left");
              
              var svg = d3.select("#topRight").append("svg")
                  .attr("width", width + margin.left + margin.right)
                  .attr("height", height + margin.top + margin.bottom)
                .append("g")
                  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
              
              
              var data = ambKilometersCoveredDatas; 
                x.domain(data.map(function(d) { return d.ambNo; }));
                y.domain([0, d3.max(data, function(d) { return d.bbInKm; })]);
              
                svg.append("g")
                    .attr("class", "x axis")
                    .attr("transform", "translate(0," + height + ")")
                    .call(xAxis);

                svg.append("g")
                    .attr("class", "y axis")
                    .call(yAxis)
                  .append("text")
                    .attr("transform", "rotate(-90)")
                    .attr("y", 6)
                    .attr("dy", ".71em")
                    .style("text-anchor", "end")
                    .text("Frequency");
              
                svg.selectAll(".bar")
                    .data(data)
                  .enter().append("rect")
                    .attr("class", "bar")
                    .attr("x", function(d) { return x(d.ambNo); })
                    
                    .attr("width", x.rangeBand())
                    .attr("y", function(d) { return y(d.bbInKm); })
                    .attr("height", function(d) { return height - y(d.bbInKm); })
                    .append("title").text(function(d){return d.bbInMin; }); 
              
                d3.select("input").on("change", change);

                var sortTimeout = setTimeout(function() {
                  d3.select("input").property("checked", true).each(change);
                }, 2000);

function change() {
       clearTimeout(sortTimeout);
    var x0 = x.domain(data.sort(this.checked
        ? function(a, b) { return b.bbInKm - a.bbInKm; }
        : function(a, b) { return d3.ascending(a.ambNo, b.ambNo); })
        .map(function(d) { return d.ambNo; }))
        .copy();

    svg.selectAll(".bar")
        .sort(function(a, b) { return x0(a.ambNo) - x0(b.ambNo); });

    var transition = svg.transition().duration(750),
        delay = function(d, i) { return i * 50; };

    transition.selectAll(".bar")
        .delay(delay)
        .attr("x", function(d) { return x0(d.ambNo); });
    transition.select(".x.axis")
        .call(xAxis)
      .selectAll("g")
        .delay(delay);
  };
       
}
function dashboard(id, fData){
    var barColor = 'SALMON';
    function segColor(c){ return {verylow:"#807dba", low:"#e08214",lowmid:"#41ab5d",mid:"#FF90D5", highmid:"#DA9167",high:"#FFFF50",veryhigh:"#BCC6CC"}[c]; } 
    fData.forEach(function(d){d.total=d.freq.verylow+d.freq.low+d.freq.lowmid+d.freq.mid+d.freq.highmid+d.freq.high+d.freq.veryhigh;});
    // function to handle histogram.
    function histoGram(fD){
        var hG={},    hGDim = {t: 60, r: 50, b: 100, l: 10};
        hGDim.w = 650 - hGDim.l - hGDim.r, 
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
        	var district=d[0];
        	getIftandNonIftValues("ift",district);
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
        var pC ={},    pieDim ={w:200, h: 200, t: 20, r: 40, b: 50, l: 10};
        pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;
       
                
        // create svg for pie chart.
        var piesvg = d3.select(id).append("svg")
            .attr("width", pieDim.w).attr("height", pieDim.h).attr("margin_top", pieDim.h).append("g")
          
           .attr("transform", "translate("+pieDim.w/2.2+","+pieDim.h/2.2+")");
        
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
        tr.append("td").text(function(d){ if(d.type == 'verylow'){return "0 to 15 km";}
        else if(d.type == 'low'){return "15 to 30 km";}
        else if(d.type == 'lowmid'){return "30 to 60 km";}
        else if(d.type == 'mid'){return "60 to 100 km";}
        else if(d.type == 'highmid'){return "100 to 150 km";}
        else if(d.type == 'high'){return "150 to 200 km";}
        else if(d.type == 'veryhigh'){return "Above 200 km";}
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
$("svg g.raphael-group-3-hot rect").click(function(){
       alert('clicked');
});
$( "g.raphael-group-3-hot g.raphael-group-78-col-hot rect" ).click(function() {
         alert( "Handler for .click() called." );
       });
function combinationCharts2Data(msChartType,multiSeriesChartProperties,analysisReportName,multiSeriesData1,multiSeriesData2,xaxisName){
       FusionCharts.ready(function () {
           var revenueChart = new FusionCharts({
              type: 'mscombidy2d',
               renderAt: multiSeriesChartProperties.renderAt,
               width: multiSeriesChartProperties.width,
               height: multiSeriesChartProperties.height,
               dataFormat: multiSeriesChartProperties.dataFormat,
               dataSource:{
                     "chart": {
                             "caption": analysisReportName,
                             "bgcolor": "#e6f2ff",
                             "plotgradientcolor": "",
                             "showalternatehgridcolor": "0",
                             "showplotborder": "0",
                             "divlinecolor": "#e6f2ff",
                             "showvalues": "0",
                             "showcanvasborder": "0",
                             "xAxisname": xaxisName,
                             "pyaxisname": "Kms Covered",
                             "syaxisname": "Time Taken(mins)",
                             "slantlabels": "1",
                             "canvasborderalpha": "0",
                             "legendshadow": "0",
                             "legendborderalpha": "0",
                             "showborder": "0",
                             "theme": "fint",
                             "formatNumberScale": "0"
                         },
                         "categories": [
                       {
                           "category": multiSeriesData1
                       }
                                       ],            
                         "dataset": [
                             {
                                 "seriesname":multiSeriesData1[0].seriesName,
                                 "parentyaxis": "P",
                                 "renderas":msChartType,
                                 "data": multiSeriesData1
                             },
                             {
                                 "parentyaxis": "S",
                                 "seriesname":multiSeriesData2[0].seriesName,
                                 "renderas": "line",
                                 "data":  multiSeriesData2
                             }       
                         ]
               },
           "events": {
        	   "dataplotClick": function(evt, args) {
                   var str=args.link;
               	var arr = str.split(","); 
               	var district = $("#districtNameVal").text();
               	var ambNo =  arr[0];
               	var ambNumber = ambNo.slice(21, 30);
               	var kms =  arr[1];
               	var mintsValue =  arr[2];
               	var mints = mintsValue.substr(0, mintsValue.length-1);
               	$(".loader").fadeIn();
   						 $.ajax({type:"POST",
               			url:'kilometersCoveredAmbDataValues.do',
               			'data':  { 
               				district:district,ambNumber:ambNumber,kms:kms,mints:mints
               			},
               			success: function (result) {
               				var jsonData = JSON.parse(result);
               				displaykilometersCoveredAmbData(jsonData.kilometersCoveredAmbData);
               				document.getElementById('VehicalNoVal').innerHTML = jsonData.ambNo;
               				},
               	      	error: function (xhr, status, error) {
               	            alert("Internal Error Occured-Please Contact System Administrator");
               		    }
               		});	
   						$(".loader").fadeOut();
               }
   	    }
   		}).render();    
   	});
   }
function getIftandNonIftValues(buttonClick,district){
	
	if(district == null){
       var district = $("#districtNameVal").text();
	}
	else{
		document.getElementById('districtNameVal').innerHTML = district;
	}
	$(".loader").fadeIn();
       $.ajax({type:"POST",
              url:'getIftandNonIftValues.do',
              'data':  { 
                     buttonClick:buttonClick,district:district
              },
              success: function (result) {
                     var jsonData = JSON.parse(result);                     
                     var kmCoveredFirstSeriesData=jsonData.kmCoveredFirstSeriesData;                     
                     var kmCoveredSecondSeriesData=jsonData.kmCoveredSecondSeriesData;
                     var kilometersCoveredAmbData=jsonData.kilometersCoveredAmbData;  
                     var normalChartTopRightProperties={"renderAt": 'iftCombinationCharts', "width": '600',"height": '300',"dataFormat": 'json'};
                     if(buttonClick=="ift"){
                           combinationCharts2Data("column2d",normalChartTopRightProperties,"Kms covered by Ambulance - IFT",kmCoveredFirstSeriesData,kmCoveredSecondSeriesData,"Ambulance Number");
                     }
                     if(buttonClick=="nonIft"){
                           combinationCharts2Data("column2d",normalChartTopRightProperties,"Kms covered by Ambulance - NON IFT",kmCoveredFirstSeriesData,kmCoveredSecondSeriesData,"Ambulance Number");
                     }
                     displaykilometersCoveredAmbData(kilometersCoveredAmbData);
                     $(".loader").fadeOut();
            },
            error: function (xhr, status, error) {
            	alert("Internal Error Occured-Please Contact System Administrator");
            	$(".loader").fadeOut();
           }
       });  
       
}      

function displaykilometersCoveredAmbData(kilometersCoveredAmbData){
       var $select=$('#indTable1 tbody');
       $select.find('tr').remove(); 
       $('#indTable1  div.pager').remove(); 
         for(i=0;i<kilometersCoveredAmbData.length;i++){
                var ambBaseLocTablerow;
                if(kilometersCoveredAmbData[i].flag==='Y'){
                    ambBaseLocTablerow = '<tr style="font: normal 10px thahoma;"><td style=" border: 1px solid black;background-color:#ff9999;"> '+kilometersCoveredAmbData[i].sourceLocation+' </td><td style=" border: 1px solid black;background-color:#ff9999;">'+kilometersCoveredAmbData[i].hospitalName+'</td><td style=" border: 1px solid black;background-color:#ff9999;">'+kilometersCoveredAmbData[i].iftNiftText+'</td><td style=" border: 1px solid black;background-color:#ff9999;"> '+kilometersCoveredAmbData[i].emgType+'</td><td style=" border: 1px solid black;background-color:#ff9999;"> '+kilometersCoveredAmbData[i].emgSubType+'</td></tr>'  ;  
  			   }else{
  			       ambBaseLocTablerow = '<tr style="font: normal 10px thahoma;"><td style=" border: 1px solid black;"> '+kilometersCoveredAmbData[i].sourceLocation+' </td><td style=" border: 1px solid black;"> '+kilometersCoveredAmbData[i].hospitalName+'</td><td style=" border: 1px solid black;">'+kilometersCoveredAmbData[i].iftNiftText+'</td><td style=" border: 1px solid black;">'+kilometersCoveredAmbData[i].emgType+'</td><td style=" border: 1px solid black;"> '+kilometersCoveredAmbData[i].emgSubType+'</td></tr>'  ;
  			   }
                       $("#indTable1 tbody").append(ambBaseLocTablerow);
              }
         
}

</script>
</body>
</html>
