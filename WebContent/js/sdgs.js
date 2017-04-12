function changeInd(contextPath){
	 var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value;
	/*var selectedMonth=document.getElementById("month");
	var monthName=selectedMonth.options[selectedMonth.selectedIndex].value; */
	if(indName=='NCD Indicators'){
		/* document.mmrform.method='GET';
		document.mmrform.action='/TreeMapServlet';
		document.mmrform.submit(); */
		document.location.href=contextPath+'/TreeMapServlet';
	}else{
		/*document.getElementById("submitType").value='indChange';
		document.sdgsForm.submit(); */
		document.location.href=contextPath+'/FusionServlet?indicators='+indName;
	}		

}
function changeMonth(){
	var selectedInd=document.getElementById("indicators");
	var indName=selectedInd.options[selectedInd.selectedIndex].value;
	var selectedMonth=document.getElementById("month");
	var monthName=selectedMonth.options[selectedMonth.selectedIndex].value;
	$.ajax({
		type: form.attr('method'),
		url:form.attr('action'),
		'data':{
			monthName:monthName,submitType: 'monthChange',monthName:monthName,indName:indName
		},
		 success: function(result){
			 	var data = JSON.parse(result);
			 	var chartColumnHeader=data.chartColumnHeader;
				var chart1Header=chartColumnHeader[0];
				var chartRange=data.chartRange;
				//hetaMap
				var heatMapHeader=chartColumnHeader[1];
				var heatMapSubCaption="By High Incidence";
				var heatMapYAxisName="Last 3 Months";
				var heatMapXAxisName="Features";
				var heatMapData=data.heatMapChildList;
				var mngood=chartRange[0];
				var mxgood=chartRange[1];
				var mnavg=chartRange[2];
				var mxavg=chartRange[3];
				var mnpoor=chartRange[4];
				var mxpoor=chartRange[5];
				var captionAlignment="centre";
				//barChart
				var barChartHeader=chartColumnHeader[5];
				var barChartSubCaption="Current Month";
				var barChartData=data.nca;
				//pareto2dChart
				var pareto2dChartData = data.risk;
				var pareto2dChartSubcaption = " For the current Month";
				var pareto2dChartHeader=chartColumnHeader[3];
				//MultiSeriesChart
				var multiSeriesChartSubcaption="For the month";
				var multiSeriesChartYAxisName="Delivery Count";
				var multiSeriesChartXAxisName="Month";
				var multiSeriesChartHeader=chartColumnHeader[4];
				var multiSeriesChartdel1 = data.del1;
				var multiSeriesChartdel2 = data.del2;
				var multiSeriesChartdel3 = data.del3;
				//horizontalBarChart
				var horizontalBarChartData = data.anm;
				var horizontalBarChartHeader=chartColumnHeader[5];
				var horizontalBarChartSubCaption="For the Current Month";
				var horizontalBarChartYAxisname="Indicator Name";
				//doughnut2dChart
				var doughnut2dChartData = data.array;
				var doughnut2dChartHeader=chartColumnHeader[2];
				var doughnut2dChartSubCaption="For Current Month";
				//multiAxisLineChart
				var multiAxisLineChartHeader=chartColumnHeader[6];
				var multiAxisLineChartXAxisname="Month";
				var multiAxisLineGT=data.axisLineGT;
				var multiAxisLineLT=data.axisLineLT;
				
		    	heatMap(heatMapProperties,heatMapSubCaption,heatMapXAxisName,heatMapYAxisName,heatMapData,heatMapHeader,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor);
		    	barChart(barChartProperties,barChartSubCaption,barChartData,barChartHeader);
		    	pareto2dChart(pareto2dChartProperties,pareto2dChartSubcaption,pareto2dChartData,pareto2dChartHeader);
		    	multiSeriesChart(multiSeriesChartProperties,multiSeriesChartSubcaption,multiSeriesChartXAxisName,multiSeriesChartYAxisName,multiSeriesChartdel1,multiSeriesChartdel2,multiSeriesChartdel3,multiSeriesChartHeader);
		    	horizontalBarChart(horizontalBarChartProperties,horizontalBarChartSubCaption,horizontalBarChartYAxisname,horizontalBarChartData,horizontalBarChartHeader);
		    	doughnut2dChart(doughnut2dChartProperties,doughnut2dChartSubCaption,doughnut2dChartData,doughnut2dChartHeader);
		    	multiAxisLineChart(multiAxisLineChartProperties,multiAxisLineChartXAxisname,multiAxisLineGT,multiAxisLineLT,multiAxisLineChartHeader);
		 },
		error: function () {
	    	  $errorMessage.text("Onchange Error");
	    }});
}
//js for sdgs dashboard
function bodyOnLoad(distMaternalDeathData,maternalDeathMonVal,maternalDeathThreshold){

	var  distValueHTML = ''; 					
	
	for(i=0;i<distMaternalDeathData.length;i++){
		var maternalDeathThresholdValue = maternalDeathThreshold[i];
		 var circlrColor=getCirclrColor(distMaternalDeathData[i].value,maternalDeathThresholdValue);
		 var tdId='trendLines'+i;
		 var gaugeTdId='gauge'+i;
		 var projectedValue=distMaternalDeathData[i].projectedValue;
		 if(typeof(projectedValue)=='undefined'){
			 projectedValue="";
		 }
		 var indicator = distMaternalDeathData[i].indicator;
		 if(indicator=="MMR"){
			 indicator="maternal mortality rate"
			var hrefPage = "sdgs.do?indicators="+indicator+"";
		 }
		 if(indicator=="IMR"){
			 indicator="infant mortality rate"
			var hrefPage = "sdgs.do?indicators="+indicator+"";
		 }
		 if((indicator=="CD")){
			var hrefPage = "showOnLoadTreeMapData.do";
		 }	
		 if((indicator=="NCD")){
				var hrefPage = "showOnLoadNCDData.do";
			 }	
		 distValueHTML ='<tr><td  align="center" style="font-family:Tahoma;font-size:8px;"><a href="'+hrefPage+'">'+distMaternalDeathData[i].indicator+'</a></td><td align="center" style="font-family:Tahoma;font-size:8px;"> '+distMaternalDeathData[i].district+'</td><td><svg height="30" width="30"><circle cx="15" cy="15" r="5" stroke="black" stroke-width="0" fill="'+circlrColor+'";/></svg></td>'
		 +'<td id="'+tdId+'"></td><td id="'+gaugeTdId+'"></td><td align="center" style="font-family:Tahoma;font-size:8px;">'+maternalDeathThreshold[i].greenValue+'</td><td align="center" style="font-family:Tahoma;font-size:8px;">'+distMaternalDeathData[i].value+'</td></tr>';/* <td align="center" style="font-size:13px;">'+projectedValue+'</td> */
		 $('#testGrid tbody').append(distValueHTML);
		 var trendchat='#'+tdId;
		 getTrendChart(trendchat,maternalDeathMonVal[i+1].monthList,maternalDeathThresholdValue);  
		 getAngularGauge(gaugeTdId,distMaternalDeathData[i].value,maternalDeathThresholdValue);
	}
	
}

function getCirclrColor(d,maternalDeathThreshold){
	 var returnColor;
	 if (d <=maternalDeathThreshold.greenValue) { returnColor = "green";} 
	else if(d>maternalDeathThreshold.greenValue && d<=maternalDeathThreshold.amberValue) { returnColor = "#FFBF00";}
	else if(d>maternalDeathThreshold.redValue) { returnColor = "red";}
	return returnColor;
}			
			
function getTrendChart(tdId,monthData,maternalDeathThreshold){
	var dataset = monthData; /* [ 5.000, 10.000, 13.000, 19.000, 14.000 ]; */
	var tdId1=tdId;
	//Width and height
	var w = 80;
	var h = 20;
	
	//Create SVG element
	var svg = d3.select(tdId1)
	            .append("svg")
	            .attr("width", w)
	            .attr("height", h); 
	
	var recBars = svg.selectAll("rect")
	   .data(dataset)
	   .enter()
	   .append("rect")
	   .attr("x",function(d, i) {
		    return i * 6;  //Bar width of 10 plus 1 for padding
	   })
	   .attr("y",10)/*  function(d) {
		    return h - d;  //Height minus data value
	   })  */
	   .attr("width", 5)
	   .attr("height",10) /* function(d) {
		    return d * 4;  //Just the data value
	   })  */
	   .attr("fill", function(d) {
			 if (d <=maternalDeathThreshold.greenValue) {return "green";} 
			else if(d>maternalDeathThreshold.greenValue && d<=maternalDeathThreshold.amberValue) { return "#FFBF00";}
			else if(d>maternalDeathThreshold.redValue) { return "red";}
		});
}

function getAngularGauge(gaugeTdId,gaugeData,maternalDeathThreshold){
	 FusionCharts.ready(function(){
		    var dashboardGauge = new FusionCharts({
		    type: 'hlineargauge',
		    renderAt: gaugeTdId,
		    width: '100',
		    height: '20',
		    dataFormat: 'json',
		    dataSource: {
		        "chart": {
		           /*   "caption": "Customer Satisfaction Score",
		            "subcaption": "Last week",*/
		               "lowerLimit": "0",
		                "upperLimit": "10",
		                "showValue": "0",
		                "showLabel": "0",
		                "showScale": "0",
		                "theme": "fint",
		                "origw": "90",
		                "origh": "50"
		        },
		        "colorRange": {
		            "color": [{
		                "minValue":"0",
		                "maxValue": maternalDeathThreshold.greenValue, 
		                "code": "#6baa01"
		            }, {
		                "minValue": maternalDeathThreshold.greenValue,
		                "maxValue":maternalDeathThreshold.amberValue, 
		                "code": "#f8bd19"
		            }, {
		                 "minValue":maternalDeathThreshold.redValue,
		                "maxValue":(maternalDeathThreshold.redValue)*2,
		                "code": "#e44a00"
		            }]
		        },
		        "pointers": {
		            "pointer": [{
		            	"bgColor": "#333333",
		                "bgAlpha": "80",
		                "radius": "6",
		                "sides": "3",
		                "value": gaugeData/* ,
	                        "basewidth": "3",
	                        "topwidth": "1" */
		            }]
		        }
		    }
		});
		    dashboardGauge.render();
		});
}
