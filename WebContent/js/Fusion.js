function heatMap(heatMapProperties,subCaption,xAxisName,yAxisName,data,caption,captionAlignment,mngood,mxgood,mnavg,mxavg,mnpoor,mxpoor){
	FusionCharts.ready(function () {
	    var heatMapChart = new FusionCharts({
	        type: heatMapProperties.type,
	        renderAt: heatMapProperties.renderAt,
	        width: heatMapProperties.width,
	        height: heatMapProperties.height,
	        dataFormat: heatMapProperties.dataFormat,
	        dataSource:  {
	            "chart": {
	                "theme": heatMapProperties.theme,
	                "caption": caption,
	                "captionAlignment": captionAlignment,
	                "captionHorizontalPadding": "70",
	                "subCaption": subCaption,
	                "xAxisName":xAxisName,
	                "yAxisName":yAxisName,
	                "showPlotBorder": heatMapProperties.showPlotBorder
	            },
	            
	            "dataset": [
	                {
	                    "data": data,
	                }
	            ],
	            "colorRange": {
	                "gradient": heatMapProperties.gradient,
	                "minValue": mngood,
	                "code": heatMapProperties.colorRangeCode,
	                "startLabel": heatMapProperties.startLabel,
	                "endLabel": heatMapProperties.endLabel,
	                "color": [
	                    {
	                        "code":heatMapProperties.colorRangeColorCode1,
	                        "minValue": mngood,
	                        "maxValue": mxgood,
	                        "label": heatMapProperties.colorLabel1
	                    },
	                    {
	                        "code": heatMapProperties.colorRangeColorCode2,
	                        "minValue": mnavg,
	                        "maxValue": mxavg,
	                        "label": heatMapProperties.colorLabel2
	                    },
	                    {
	                        "code": heatMapProperties.colorRangeColorCode3,
	                        "minValue": mnpoor,
	                        "maxValue": mxpoor,
	                        "label": heatMapProperties.colorLabel3
	                    }
	                ]
	            }
	        }
	    })
	    .render();
	});
}

function barChart(barChartProperties,subCaption,data,caption){
	FusionCharts.ready(function () {
	    var barChart = new FusionCharts({
	        type: barChartProperties.type,
	        renderAt: barChartProperties.renderAt,
	        width: barChartProperties.width,
	        height: barChartProperties.height,
	        dataFormat: barChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	                "caption": caption,
	                "subCaption": subCaption,
	                "showPercentValues": barChartProperties.showPercentValues,
	                "showPercentInTooltip": barChartProperties.showPercentInTooltip,
	                "enableSmartLabels": barChartProperties.enableSmartLabels,
	                "decimals": barChartProperties.decimals,
	                "skipOverlapLabels": barChartProperties.skipOverlapLabels,
	                "theme": barChartProperties.theme
	            },
	            "categories": [
	       	                {
	       	                    "category": data
	       	                }
	       	            ],           
	            "dataset": [
	                {
	                    "seriesname": barChartProperties.seriesname,
	                    "showValues": barChartProperties.showValues,
	                    "data": data
	                }, 

	            ]
	        }
	    })
	    .render();
	});
}

function pareto2dChart(pareto2dChartProperties,subcaption,data,caption){
	FusionCharts.ready(function () {
	    var pareto2dChart = new FusionCharts({
	        type: pareto2dChartProperties.type,
	        renderAt: pareto2dChartProperties.renderAt,
	        width: pareto2dChartProperties.width,
	        height: pareto2dChartProperties.height,
	        dataFormat: pareto2dChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	                "caption": caption,
	                "subcaption": subcaption,
	                    "paletteColors": pareto2dChartProperties.paletteColors,
	                    "bgAlpha": pareto2dChartProperties.bgAlpha,
	                    "showBorder": pareto2dChartProperties.showBorder,
	                    "decimals": pareto2dChartProperties.decimals,
	                    "borderAlpha": pareto2dChartProperties.borderAlpha,
	                    "labelDistance": pareto2dChartProperties.labelDistance,
	                    "is2D": pareto2dChartProperties.is2D
	            },
	                "data": data
	        }
	    })
	    .render();
	});
}


function multiSeriesChart(multiSeriesChartProperties,subCaption,xAxisname,yAxisName,indlist,indlist1,indlist2,caption){
	FusionCharts.ready(function () {
	    var multiSeriesChart = new FusionCharts({
	        type: multiSeriesChartProperties.type,
	        renderAt: multiSeriesChartProperties.renderAt,
	        width: multiSeriesChartProperties.width,
	        height: multiSeriesChartProperties.height,
	        dataFormat: multiSeriesChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	            	"caption": caption,
	                "subCaption": subCaption,
	                "xAxisname": xAxisname,
	                "yAxisName": yAxisName,
	                "showBorder": multiSeriesChartProperties.showBorder,
	                "showValues": multiSeriesChartProperties.showValues,
	                "paletteColors": multiSeriesChartProperties.paletteColors,
	                "bgColor": multiSeriesChartProperties.bgColor,
	                "showCanvasBorder": multiSeriesChartProperties.showCanvasBorder,
	                "canvasBgColor": multiSeriesChartProperties.canvasBgColor,
	                "captionFontSize": multiSeriesChartProperties.captionFontSize,
	                "subcaptionFontSize": multiSeriesChartProperties.subcaptionFontSize,
	                "subcaptionFontBold": multiSeriesChartProperties.subcaptionFontBold,
	                "divlineColor": multiSeriesChartProperties.divlineColor,
	                "divLineIsDashed": multiSeriesChartProperties.divLineIsDashed,
	                "divLineDashLen": multiSeriesChartProperties.divLineDashLen,
	                "divLineGapLen": multiSeriesChartProperties.divLineGapLen,
	                "showAlternateHGridColor": multiSeriesChartProperties.showAlternateHGridColor,
	                "usePlotGradientColor": multiSeriesChartProperties.usePlotGradientColor,
	                "toolTipColor": multiSeriesChartProperties.toolTipColor,
	                "toolTipBorderThickness": multiSeriesChartProperties.toolTipBorderThickness,
	                "toolTipBgColor": multiSeriesChartProperties.toolTipBgColor,
	                "toolTipBgAlpha": multiSeriesChartProperties.toolTipBgAlpha,
	                "toolTipBorderRadius": multiSeriesChartProperties.toolTipBorderRadius,
	                "toolTipPadding": multiSeriesChartProperties.toolTipPadding,
	                "legendBgColor": multiSeriesChartProperties.legendBgColor,
	                "legendBorderAlpha": multiSeriesChartProperties.legendBorderAlpha,
	                "legendShadow": multiSeriesChartProperties.legendShadow,
	                "legendItemFontSize": multiSeriesChartProperties.legendItemFontSize,
	                "legendItemFontColor": multiSeriesChartProperties.legendItemFontColor
	            },
	            "categories": [
	                           {
	                               "category": indlist
	                           }
	                       ],
	                       "dataset": [
	                           {
	                               "seriesName": multiSeriesChartProperties.seriesName1,
	                               "showValues": multiSeriesChartProperties.showValues,
	                               "data": indlist
	                           },
	                           {
	                               "seriesName": multiSeriesChartProperties.seriesName2,
	                               "renderAs": multiSeriesChartProperties.renderAs1,
	                               "data": indlist1
	                           },
	                           {
	                               "seriesName": multiSeriesChartProperties.seriesName3,
	                               "renderAs": multiSeriesChartProperties.renderAs2,
	                               "data": indlist2
	                           }
	                       ]
	                   }
	               }).render();
	           });
}

function horizontalBarChart(horizontalBarChartProperties,subCaption,yAxisname,data,caption){
	FusionCharts.ready(function () {
	    var horizontalBarChart = new FusionCharts({
	        type: horizontalBarChartProperties.type,
	        renderAt: horizontalBarChartProperties.renderAt,
	        width: horizontalBarChartProperties.width,
	        height: horizontalBarChartProperties.height,
	        dataFormat: horizontalBarChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	                "caption": caption,
	                "subCaption": subCaption,
	                "yAxisname": yAxisname,
	                "paletteColors": horizontalBarChartProperties.paletteColors,
	                "bgColor": horizontalBarChartProperties.bgColor, 
	                "showBorder": horizontalBarChartProperties.showBorder,
	                "legendBorderAlpha": horizontalBarChartProperties.legendBorderAlpha,
	                "legendBgAlpha": horizontalBarChartProperties.legendBgAlpha,
	                "legendShadow": horizontalBarChartProperties.legendShadow,
	                "placevaluesInside": horizontalBarChartProperties.placevaluesInside,
	                "valueFontColor": horizontalBarChartProperties.valueFontColor,                
	                "alignCaptionWithCanvas": horizontalBarChartProperties.alignCaptionWithCanvas,
	                "showHoverEffect":horizontalBarChartProperties.showHoverEffect,
	                "captionFontSize": horizontalBarChartProperties.captionFontSize,
	                "subcaptionFontSize": horizontalBarChartProperties.subcaptionFontSize,
	                "subcaptionFontBold": horizontalBarChartProperties.subcaptionFontBold,
	                "divlineColor": horizontalBarChartProperties.divlineColor,
	                "divLineIsDashed": horizontalBarChartProperties.divLineIsDashed,
	                "divLineDashLen": horizontalBarChartProperties.divLineDashLen,
	                "divLineGapLen": horizontalBarChartProperties.divLineGapLen,
	                "showAlternateHGridColor": horizontalBarChartProperties.showAlternateHGridColor,
	                "toolTipColor": horizontalBarChartProperties.toolTipColor,
	                "toolTipBorderThickness": horizontalBarChartProperties.toolTipBorderThickness,
	                "toolTipBgColor": horizontalBarChartProperties.toolTipBgColor,
	                "toolTipBgAlpha": horizontalBarChartProperties.toolTipBgAlpha,
	                "toolTipBorderRadius": horizontalBarChartProperties.toolTipBorderRadius,
	                "toolTipPadding": horizontalBarChartProperties.toolTipPadding
	            },            
	            "categories": [
	       	                {
	       	                    "category": data
	       	                }
	       	            ],           
	            "dataset": [
	                {
	                    "seriesname": horizontalBarChartProperties.seriesname,
	                    "showValues": horizontalBarChartProperties.showValues,
	                    "data": data
	                }, 

	            ]
	        }
	    })
	    .render();
	});
}

function doughnut2dChart(doughnut2dChartProperties,subCaption,data,caption){
	FusionCharts.ready(function () {
	    var doughnut2dChart = new FusionCharts({
	        type: doughnut2dChartProperties.type,
	        renderAt: doughnut2dChartProperties.renderAt,
	        width: doughnut2dChartProperties.width,
	        height: doughnut2dChartProperties.height,
	        dataFormat: doughnut2dChartProperties.dataFormat,
	        dataSource: {
	        	"chart": {
	                "caption": caption,
	                "subCaption": subCaption,
	                "paletteColors": doughnut2dChartProperties.paletteColors,
	                "bgColor": doughnut2dChartProperties.bgColor,
	                "showBorder": doughnut2dChartProperties.showBorder,
	                "use3DLighting": doughnut2dChartProperties.use3DLighting,
	                "showShadow": doughnut2dChartProperties.showShadow,
	                "enableSmartLabels": doughnut2dChartProperties.enableSmartLabels,
	                "startingAngle": doughnut2dChartProperties.startingAngle,
	                "showLabels": doughnut2dChartProperties.showLabels,
	                "showPercentValues": doughnut2dChartProperties.showPercentValues,
	                "showLegend": doughnut2dChartProperties.showLegend,
	                "legendShadow": doughnut2dChartProperties.legendShadow,
	                "legendBorderAlpha": doughnut2dChartProperties.legendBorderAlpha,
	                "centerLabelBold": doughnut2dChartProperties.centerLabelBold,
	                "showTooltip": doughnut2dChartProperties.showTooltip,
	                "decimals": doughnut2dChartProperties.decimals,
	                "captionFontSize": doughnut2dChartProperties.captionFontSize,
	                "subcaptionFontSize": doughnut2dChartProperties.subcaptionFontSize,
	                "subcaptionFontBold": doughnut2dChartProperties.subcaptionFontBold
	            },          
	            "categories": [
	       	                {
	       	                    "category": data
	       	                }
	       	            ],           
	            "dataset": [
	                {
	                    "seriesname": doughnut2dChartProperties.seriesname,
	                    "showValues": doughnut2dChartProperties.showValues,
	                    "data": data
	                }, 

	            ]
	        }
	    })
	    .render();
	});
}

function multiAxisLineChart(multiAxisLineChartProperties,xaxisname,axisLineGT,axisLineLT,caption){
		FusionCharts.ready(function() {
		    var multiAxisLineChart = new FusionCharts({
		        type: multiAxisLineChartProperties.type,
		        renderAt: multiAxisLineChartProperties.renderAt,
		        width: multiAxisLineChartProperties.width,
		        height: multiAxisLineChartProperties.height,
		        dataFormat:multiAxisLineChartProperties.dataFormat,
		        id: multiAxisLineChartProperties.id,
		        dataSource: {
		            "chart": {
		                "caption": caption,
		                "xaxisname": xaxisname,
		                "theme": multiAxisLineChartProperties.theme
		            },
		            "categories": [
		            {
		                "category": axisLineGT
		            }
		            ],
		            "axis": [
		            {
		                "title": caption,
		                "titlepos": multiAxisLineChartProperties.titlepos,
		                "tickwidth": multiAxisLineChartProperties.tickwidth,
		                "divlineisdashed": multiAxisLineChartProperties.divlineisdashed,
		                "dataset": [
		                {
		                    "seriesname": multiAxisLineChartProperties.seriesnameGT,
		                    "data": axisLineGT
		                }
		                ]
		            },
		            {
		                "title": caption,
		                "titlepos": multiAxisLineChartProperties.titlepos,
		                "numdivlines": multiAxisLineChartProperties.numdivlines,
		                "tickwidth": multiAxisLineChartProperties.tickwidth,
		                "divlineisdashed": multiAxisLineChartProperties.divlineisdashed,
		                "dataset": [
		                {
		                    "seriesname": multiAxisLineChartProperties.seriesnameLT,
		                    "data": axisLineLT
		                }
		                ]
		            }
		            ]
		        }

		    })
		.render();
		});
}

function StaticChart(chartType,normalChartProperties,chartName,data,yAxisname,xAxisname)
{
	FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: chartType,
        renderAt: normalChartProperties.renderAt,
        width: normalChartProperties.width,
        height: normalChartProperties.height,
        dataFormat: normalChartProperties.dataFormat,
        dataSource: {
            "chart": {
                "caption": chartName,
                "yAxisname": yAxisname,
                "xAxisname":xAxisname,
                "startingAngle": normalChartProperties.startingAngle,
                "showPercentValues": normalChartProperties.showPercentValues,
                "showPercentInTooltip": normalChartProperties.showPercentInTooltip,
                "enableSmartLabels": normalChartProperties.enableSmartLabels,
                "enableMultiSlicing": normalChartProperties.enableMultiSlicing,
                "decimals": normalChartProperties.decimals,
                "showLegend": normalChartProperties.showLegend,
                "theme": normalChartProperties.theme,
                "formatNumberScale": "0"     
            },
            "data": data
            }
    }).render();    
});
}

function StaticMSChart(msChartType,multiSeriesChartProperties,analysisReportName4,multiSeriesData1,multiSeriesData2,xaxisName){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: msChartType,
	        renderAt: multiSeriesChartProperties.renderAt,
	        width: multiSeriesChartProperties.width,
	        height: multiSeriesChartProperties.height,
	        dataFormat: multiSeriesChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	                "caption": analysisReportName4,
	                "yAxisname": "Indicator Value",
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
	            /* "trendlines": [
	                {
	                    "line": [
	                        {
	                            "startvalue": "15000",
	                            "color": "#0075c2",
	                            "valueOnRight": "1",
	                            "displayvalue": "Avg. for{br}Food"
	                        },
	                        {
	                            "startvalue": "22000",
	                            "color": "#1aaf5d",
	                            "valueOnRight": "1",
	                            "displayvalue": "Avg. for{br}Non-food"
	                        }
	                    ]
	                }
	            ] */
	        }
	    }).render();    
	});
}

function StaticMS3DataChart(msChartType,multiSeriesChartProperties,analysisReportName,multiSeriesData1,multiSeriesData2,multiSeriesData3,xaxisName){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: msChartType,
	        renderAt: multiSeriesChartProperties.renderAt,
	        width: multiSeriesChartProperties.width,
	        height: multiSeriesChartProperties.height,
	        dataFormat: multiSeriesChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	                "caption": analysisReportName,
	                "yAxisname": "Indicator Value",
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
	                },
	                {
	                    "seriesname": multiSeriesData3[0].seriesName,
	                    "data": multiSeriesData3
	                }
	            ],
	            /* "trendlines": [
	                {
	                    "line": [
	                        {
	                            "startvalue": "15000",
	                            "color": "#0075c2",
	                            "valueOnRight": "1",
	                            "displayvalue": "Avg. for{br}Food"
	                        },
	                        {
	                            "startvalue": "22000",
	                            "color": "#1aaf5d",
	                            "valueOnRight": "1",
	                            "displayvalue": "Avg. for{br}Non-food"
	                        }
	                    ]
	                }
	            ] */
	        }
	    }).render();    
	});
}

function combinationCharts(msChartType,multiSeriesChartProperties,analysisReportName,multiSeriesData1,multiSeriesData2,multiSeriesData3,xaxisName){
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
			        "bgcolor": "FFFFFF",
			        "plotgradientcolor": "",
			        "showalternatehgridcolor": "0",
			        "showplotborder": "0",
			        "divlinecolor": "#999999",
			        "showvalues": "0",
			        "showcanvasborder": "0",
			        "xAxisname": xaxisName,
			        "pyaxisname": "Indicator Value",
			        "syaxisname": "Indicator Value",
			        /*"numberprefix": "$",
			        "labeldisplay": "STAGGER",*/
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
			        },
			        {
			            "parentyaxis": "S",
			            "seriesname":multiSeriesData3[0].seriesName,
			            "renderas": "line",
			            "data":  multiSeriesData3
			        }
			    ]
	        }
		}).render();    
	});
}

function StaticMS4DataChart(msChartType,multiSeriesChartProperties,analysisReportName,multiSeriesData1,multiSeriesData2,multiSeriesData3,multiSeriesData4,xaxisName){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: msChartType,
	        renderAt: multiSeriesChartProperties.renderAt,
	        width: multiSeriesChartProperties.width,
	        height: multiSeriesChartProperties.height,
	        dataFormat: multiSeriesChartProperties.dataFormat,
	        dataSource: {
	            "chart": {
	                "caption": analysisReportName,
	                "yAxisname": "Indicator Value",
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
	                },
	                {
	                    "seriesname": multiSeriesData3[0].seriesName,
	                    "data": multiSeriesData3
	                },
	                {
	                    "seriesname": multiSeriesData4[0].seriesName,
	                    "data": multiSeriesData4
	                }
	            ],
	        }
	    }).render();    
	});
}

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
			        "bgcolor": "FFFFFF",
			        "plotgradientcolor": "",
			        "showalternatehgridcolor": "0",
			        "showplotborder": "0",
			        "divlinecolor": "#999999",
			        "showvalues": "0",
			        "showcanvasborder": "0",
			        "xAxisname": xaxisName,
			        "pyaxisname": "Indicator Value",
			        "syaxisname": "Indicator Value",
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
	        }
		}).render();    
	});
}