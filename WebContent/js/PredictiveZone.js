function heatMapPredictive(heatMapProperties,colours,heatMapData){
	var dataArray = heatMapData;
	var yAxisValues=[];
	for (var i=0;i<dataArray.length;i++){
		yAxisValues.push(dataArray[i].district);
	}
		
	if(heatMapData.length > 30){
		heatMapProperties.showLables = 60;
		heatMapProperties.gapx = 1;
		heatMapProperties.gapy = 1;
	}
	var length;
	length=heatMapData.length;
	if(length < 6){
		length=8;
	}
	var renderAt=heatMapProperties.renderAt;
	var margin = {top:heatMapProperties.top,bottom:heatMapProperties.bottom,left:heatMapProperties.left,right:heatMapProperties.right},
	           width = heatMapProperties.width - margin.left - margin.right,
	           height = heatMapProperties.height - margin.top - margin.bottom,
	           gridSize = Math.floor(width / length),
	           legendElementWidth = gridSize*2,
	           buckets = heatMapProperties.buckets,
	           colors =colours /* ["#259012","#96de0d","#dec60d","#de650d","#de0d0d"] */;
	 /*xAxisValues = ["DEFGHIJKLMN"],*/
	 /*yAxisValues = ["1a", "2a", "3a", "4a", "5a", "6a", "7a", "8a", "9a", "10a","11a", "12a", "13a", "14a", "15a", "16a", "17a", "18a", "19a", "20a","21a", "22a", "23a", "24a", "25a", "26a", "27a", "28a", "29a", "30a"];*/
	
	 var dataHandler = function(error, data) {
		 console.log("data=", data);
	 var colorScale = d3.scale.quantile()
	       .domain([0, buckets - 1, d3.max(data, function (d) { return d.value; })])
	       .range(colors);

	 var svg = d3.select(renderAt).append("svg")
	   .attr("width", width + margin.left + margin.right)
	   .attr("height", height + margin.top + margin.bottom)
	   .append("g")
	   .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	 if(renderAt === '#cluster')
		 {
		 var xAxisValues= $.unique(heatMapData.map(function (d) {
			    return d.xAxis.toString()})).sort();
		 heatMapProperties.showLables = 130;
		 heatMapProperties.gapx = 1;
		 heatMapProperties.gapy = 1.3;
			
		 var xAxisLabels = svg.selectAll(".xAxisLabel")
	     .data(xAxisValues)
	     .enter().append("text")
		 .text(function (d) { return d; })
		 .attr("x", 0)
		 .attr("y", function (d, i) { return i * gridSize * heatMapProperties.gapy; })
		 .style("text-anchor", "end")
		 .style("font-size","12")
		 .attr("class", "x axis")
		 .attr("transform", "translate(-6," + gridSize / 1.5 + ")");
		 }
	 var yAxisLabels = svg.selectAll(".yAxisLabel")
	   .data(yAxisValues)
	   .enter().append("text")
	   .text(function(d) { return d; })
	   .attr("transform", function(d, i) { 
		   		return "translate(" + ( i * gridSize) + ","+heatMapProperties.showLables+")"
		   		+ "translate(" + gridSize *2 /heatMapProperties.showlabelPos + ", 20)rotate(-90)";
	   			})
	   /* .attr("transform", "translate(" + gridSize / 2 + ", -6)") */
	   .style("text-anchor", "end")
	   .style("font-size","12")
	   .attr("class", function(d, i) { return ((i >= 8 && i <= 16) ? 
	   "timeLabel mono axis axis-worktime" : 
	   "timeLabel mono axis"); 
				});
	  var heatMap = svg.selectAll(".yAxis")
	   .data(data)
	   .enter().append("rect")
	   .attr("x", function(d) { return (d.yAxis - 1) * gridSize * heatMapProperties.gapx; })
	   .attr("y", function(d) { return (d.xAxis - 1) * gridSize * heatMapProperties.gapy; })
	   .attr("rx", heatMapProperties.rx)
	   .attr("ry", heatMapProperties.ry)
	   .attr("class", "yAxis bordered")
	   .attr("width", gridSize * heatMapProperties.rectWidth)
	   .attr("height", gridSize * heatMapProperties.rectHeight)
	   .style("fill", colors[0]);		
	   
	   heatMap.transition().duration(3000)
	       .style("fill", function(d) { return colorScale(d.value); });
	   heatMap.append("title").text(function(d) { return d.value; });
	   }
	   dataHandler(null, dataArray);
	}
function zingChart(DOBDistrictData,DOBDiseaseData,DOBValueData){
	
	zingchart.THEME='classic';
	var myConfig = 
	        {
	          "globals":{
	            "font-family": "arial",
	            "bold":1
	          }, 
	            "type": "piano",
	            "background-color": "white",
	            "plotarea": {
	            	"margin-left": "150px",
	                "margin": "20% 20% 15% 10%",
	                "background-color": "#FBFBFB"
	            },
	           /*  "align": "left",
	            "title": {
	                "text": "WEB ANALYTICS",
	                "font-size": "30px",
	                "font-color": "#6699CC",
	                "background-color": "none",
	                "margin-top": "25px",
	                "text-align": "left",
	                "x": "70px",
	                "font-weight":"normal"
	            }, */
	            "scale-x": {
	                "values": DOBDistrictData,
	                "line-color": "white",
	                "tick": {
	                    "line-color": "white"
	                } ,/*
	                "label": {
	                    "text": "2015",
	                    "font-color": "#6699CC",
	                    "font-size": "18px"
	                }, */
	                "item": {
	                    "font-color": "#6699CC"
	                },
	                "guide": {
	                    "visible": false
	                }
	            },
	            "scale-y": {
	                "values": DOBDiseaseData,
	                "line-color": "white",
	                "tick": {
	                    "line-color": "white"
	                },
	                "item": {
	                    "font-color": "#6699CC",
	                    "tick": {
	                        "line-color": "white"
	                    }
	                }
	            }, 
	            "plot": {
	                "aspect": "size",
	                "border-radius": "0px"
	            },
	            "series": [
	                {
	                    "values": DOBValueData,
	                    "text": "Visitors123",
	                    "thousands-separator": ",",
	                    "background-color": "#ff4e00"
	                }
	            ],
	            "tooltip": {
	                "shadow": false,
	                "border-radius": "10px"
	            }
	        };

	zingchart.render({ 
		id : 'zingTopRight', 
		data : myConfig, 
		height: 200, 
		width: 650
	});
}
function verticalHeatMap(heatMapProperties,colours,heatMapData){
	var dataArray = heatMapData;
	var yAxisValues=[];
	for (var i=0;i<heatMapData.length;i++){
		yAxisValues.push(heatMapData[i].district);
	}
	 var xAxisValues= $.unique(heatMapData.map(function (d) {
		    return d.indicator.toString()})).sort();
	if(heatMapData.length < 25){
		heatMapProperties.top=40;
		heatMapProperties.width=800;
		heatMapProperties.height=400;
		heatMapProperties.rectWidth = 1;
		heatMapProperties.rectHeight = 1;
		//heatMapProperties.gapy = 2;
		heatMapProperties.gapy = 1;
		heatMapProperties.showLables = 220;
	}
	if(heatMapData.length > 40 && heatMapData.length < 70){
		heatMapProperties.top=50;
		heatMapProperties.width=900;
		heatMapProperties.height=400;
		heatMapProperties.rectWidth = 1;
		heatMapProperties.rectHeight = 1;
		//heatMapProperties.gapy = 2;
		heatMapProperties.gapy = 1.5;
		heatMapProperties.showLables = 180;
	}
	if(heatMapData.length > 65){
		heatMapProperties.top=50;
		heatMapProperties.width=900;
		heatMapProperties.height=400;
		heatMapProperties.rectWidth = 1;
		heatMapProperties.rectHeight = 1;
		//heatMapProperties.gapy = 2;
		heatMapProperties.gapy = 2;
		heatMapProperties.showLables = 180;
	}
	var renderAt=heatMapProperties.renderAt;
	var margin = {top:heatMapProperties.top,bottom:heatMapProperties.bottom,left:heatMapProperties.left,right:heatMapProperties.right},
	           width = heatMapProperties.width - margin.left - margin.right,
	           height = heatMapProperties.height - margin.top - margin.bottom,
	           gridSize = Math.floor(width / heatMapData.length),
	           legendElementWidth = gridSize*2,
	           buckets = heatMapProperties.buckets,
	           colors =colours;

	 var dataHandler = function(error, data) {
		 console.log("data=", data);
	 var colorScale = d3.scale.quantile()
	       .domain([0, buckets - 1, d3.max(data, function (d) { return d.value; })])
	       .range(colors);

	 var svg = d3.select(renderAt).append("svg")
	   .attr("width", width + margin.left + margin.right)
	   .attr("height", height + margin.top + margin.bottom)
	   .append("g")
	   .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
	 var xAxisLabels = svg.selectAll(".xAxisLabel")
	     .data(xAxisValues)
	     .enter().append("text")
		 .text(function (d) { return d; })
		 .attr("x", 0)
		 .attr("y", function (d, i) { return i * gridSize * heatMapProperties.gapy; })
		 .style("text-anchor", "end")
		 .style("font-size","12")
		 .attr("class", "x axis")
		 .attr("transform", "translate(-6," + gridSize / 1.5 + ")");

	 var yAxisLabels = svg.selectAll(".yAxisLabel")
	   .data(yAxisValues)
	   .enter().append("text")
	   .text(function(d) { return d; })
	   .attr("transform", function(d, i) { 
		   		return "translate(" + ( i * gridSize) + ","+heatMapProperties.showLables+")"
		   		+ "translate(" + gridSize *2 /heatMapProperties.showlabelPos + ", 20)rotate(-90)";
	   			})
	   /*.attr("transform", "translate(" + gridSize / 2 + ", -6)")*/
	   .style("text-anchor", "end")
	   .style("font-size","12")
	   .attr("class", function(d, i) { return ((i >= 8 && i <= 16) ? 
	   "timeLabel mono axis axis-worktime" : 
	   "timeLabel mono axis"); 
				});
	  var heatMap = svg.selectAll(".yAxis")
	   .data(data)
	   .enter().append("rect")
	   .attr("x", function(d) { return (d.yAxis - 1) * gridSize * heatMapProperties.gapx; })
	   .attr("y", function(d) { return (d.xAxis - 1) * gridSize * heatMapProperties.gapy; })
	   .attr("rx", heatMapProperties.rx)
	   .attr("ry", heatMapProperties.ry)
	   .attr("class", "yAxis bordered")
	   .attr("width", gridSize * heatMapProperties.rectWidth)
	   .attr("height", gridSize * heatMapProperties.rectHeight)
	   .style("fill", colors[0]);		
	   
	   heatMap.transition().duration(3000)
	       .style("fill", function(d) { return colorScale(d.value); });
	   heatMap.append("title").text(function(d) { return d.value; });
	   }
	   dataHandler(null, dataArray);
	}