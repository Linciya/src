function pie(data,indName){
	FusionCharts.ready(function () {
	    var revenueChart = new FusionCharts({
	        type: 'pie2d',
	        renderAt: 'pieChart',
	        width: '490',
	        height: '340',
	        dataFormat: 'json',
	        dataSource: {
	            "chart": {
	                "caption": indName,
	                "subCaption":"Bottom 10 Indicator Values",
	                "numberPrefix": "",
	                /*"showPercentValues": "1",*/
	                "showPercentInTooltip": "0",
	                "decimals": "2",
	                "enableSmartLabels": "1",
	                "use3DLighting": "1",
	                //Theme
	                "canvasBgColor": "#d0ffb3",
	                "bgColor": "#d0ffb3",
	                "theme": "fint",
	                "formatNumberScale": "0"
	            },
	            "data": data
	        }
	    }).render();
	    
	});
}