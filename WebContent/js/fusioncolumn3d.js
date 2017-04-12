function bar(data,indName,subCaption){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: 'column3d',
	        renderAt: 'barChart',
	        width: '500',
	        height: '340',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": indName,
	                "subCaption": subCaption,
	                "xAxisName": "xAxis",
	                "yAxisName": "IndValue",
	                "paletteColors": "#32CD32",
	                "valueFontColor": "#ffffff",
	                "baseFont": "Helvetica Neue,Arial",
	                "captionFontSize": "14",
	                "subcaptionFontSize": "14",
	                "subcaptionFontBold": "0",
	                "placeValuesInside": "1",
	                "rotateValues": "1",
	                "showShadow": "0",
	                "divlineColor": "#999999",               
	                "divLineIsDashed": "1",
	                "divlineThickness": "1",
	                "divLineDashLen": "1",
	                "divLineGapLen": "0",
	                "canvasBgColor": "#E9FFDB",
	                "decimals": "2",
	                "bgColor": "#E9FFDB",
	                "theme":"fint",
	                "formatNumberScale": "0",
	            },

	            "data": data
	        }
	    });
	    revenueChart.render();
	});
}