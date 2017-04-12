function projectedBar(data,indName,projectedValueSubCaption){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: 'mscolumn3dlinedy',
	        renderAt: 'multiseriesChart',
	        width: '700',
	        height: '300',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": indName,
	                "subCaption": "Projected values for "+projectedValueSubCaption,
	                "xAxisname": "xAxis",
	                "pYAxisName": "IndValue",
	                "sYAxisName": "IndValue",
	                "numberPrefix": "",
	                "sNumberSuffix": "",
	                "sYAxisMaxValue": "25",
	                "paletteColors": "#0075c2,#1aaf5d,#f2c500",
	                "bgColor": "#E9FFDB",                
	                "showBorder": "0",
	                "showCanvasBorder": "0",
	                "usePlotGradientColor": "0",
	                "plotBorderAlpha": "10",
	                "legendBorderAlpha": "0",
	                "legendBgAlpha": "0",
	                "legendShadow": "0",
	                "showHoverEffect":"1",
	                "valueFontColor": "#ffffff",
	                "rotateValues": "1",
	                "placeValuesInside": "1",
	                "divlineColor": "#999999",
	                "divLineIsDashed": "1",
	                "divLineDashLen": "1",
	                "divLineGapLen": "1",
	                "canvasBgColor": "#E9FFDB",
	                "captionFontSize": "14",
	                "subcaptionFontSize": "14",
	                "subcaptionFontBold": "0",
	                "formatNumberScale": "0"
	            },
	            "categories": [
	                {
	                    "category": data
	                }
	            ],
	            "dataset": [
	                {
	                    "seriesname": "Total value",
	                    "color": "AFD8F8",
	                    "data": data
	                },
	         
	                {
	                    "seriesname": "cumulative value",
	                    "renderAs": "line",
	                    "parentYAxis": "S",
	                    "showValues": "0",
	                    "color": "8BBA00",
	                    "data": data
	                }
	            ]
	        }
	    })
	    .render();
	});
}


function predictiveProjectedBar(data,indName,projectedValueSubCaption,properties){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: 'mscolumn3dlinedy',
	        renderAt: properties.renderAt,
	        width: properties.width,
	        height: properties.height,
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": indName,
	                "subCaption": "Projected values for "+projectedValueSubCaption,
	                "xAxisname": properties.xaxis,
	                "pYAxisName": "IndValue",
	                "sYAxisName": "IndValue",
	                "numberPrefix": "",
	                "sNumberSuffix": "",
	                "sYAxisMaxValue": "25",
	                "paletteColors": "#0075c2,#1aaf5d,#f2c500",
	                "bgColor": "#E9FFDB",                
	                "showBorder": "0",
	                "showCanvasBorder": "0",
	                "usePlotGradientColor": "0",
	                "plotBorderAlpha": "10",
	                "legendBorderAlpha": "0",
	                "legendBgAlpha": "0",
	                "legendShadow": "0",
	                "showHoverEffect":"1",
	                "valueFontColor": "#333333",
	                "rotateValues": "1",
	                "placeValuesInside": "1",
	                "divlineColor": "#999999",
	                "divLineIsDashed": "1",
	                "divLineDashLen": "1",
	                "divLineGapLen": "1",
	                "canvasBgColor": "#E9FFDB",
	                "captionFontSize": "14",
	                "subcaptionFontSize": "14",
	                "subcaptionFontBold": "0",
	                "formatNumberScale": "0"
	            },
	            "categories": [
	                {
	                    "category": data
	                }
	            ],
	            "dataset": [
	                {
	                    "seriesname": "Total value",
	                    "color": "AFD8F8",
	                    "data": data
	                },
	         
	                {
	                    "seriesname": "cumulative value",
	                    "renderAs": "line",
	                    "parentYAxis": "S",
	                    "showValues": "0",
	                    "color": "8BBA00",
	                    "data": data
	                }
	            ]
	        }
	    })
	    .render();
	});
}