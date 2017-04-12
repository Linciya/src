function treeMapOnLoadCd(districtDataCd){
	$(function () {
	    $('#TreeMapOnLoadCd').highcharts({
	    	 plotOptions: {
	             series: {
	                 cursor: 'pointer',
	                 point: {
	                     events: {
	                         click: function () {
	                             showInstDataCd(this.name);
	                         }
	                     }
	                 },
	                 dataLabels: {
	                	 formatter: function () {
                             return this.point.name+' : '+'<br>'+this.point.value 
                         },
                         color: '#000000',
                         style: {
                        	 "color": "contrast", "fontSize": "10px", "fontWeight": "light", "textShadow": false
                         }
                     }
	             }
	         },
	        series: [{
	            type: 'treemap',
	            layoutAlgorithm: 'squarified',	            
	            data: districtDataCd,
	            dataLabels: {
	                enabled: true
	            }
	        }],
	        title: {
	            text: 'CD District Level Data'
	        }
	    });
	});
}
function treeMapOnLoadNcd(districtDataNcd){
	$(function () {
	    $('#TreeMapOnLoadNcd').highcharts({
	    	 plotOptions: {
	             series: {
	                 cursor: 'pointer',
	                 point: {
	                     events: {
	                         click: function () {
	                             showInstDataNcd(this.name);
	                         }
	                     }
	                 },
	                 dataLabels: {
	                	 formatter: function () {
                             return this.point.name+' : '+'<br>'+this.point.value 
                         },
                         color: '#000000',
                         style: {
                        	 "color": "contrast", "fontSize": "10px", "fontWeight": "light", "textShadow": false
                         }
                     }
	             }
	         },
	        series: [{
	            type: 'treemap',
	            layoutAlgorithm: 'squarified',	            
	            data: districtDataNcd,
	            dataLabels: {
	                enabled: true
	            }
	        }],
	        title: {
	            text: 'NCD District Level Data',
	            
	        }
	    });
	});
}
function treeMapOnClickCd(data,distName){
	$(function () {
	    $('#TreeMapOnClickCd').highcharts({
/*	    	plotOptions: {
	             series: {

	                 dataLabels: {
	                	 formatter: function () {
                            return this.point.name+' : '+'<br>'+this.point.value 
                        },
                        color: '#000000',
                        style: {
                       	 "color": "contrast", "fontSize": "10px", "fontWeight": "light", "textShadow": false
                        }
                    }
	             }
	         },*/
	        series: [{
	            type: "treemap",
	            layoutAlgorithm: 'stripes',
	            allowDrillToNode: true,
	            animationLimit: 1000,
	            dataLabels: {
	                enabled: false
	            },
	            levelIsConstant: false,           
	            levels: [{
	                level: 1,
	                layoutAlgorithm: 'squarified',
	                dataLabels: {
	                    enabled: true,
	                }
	            }],
	            data: data
	        }],
	        title: {
	            text: 'CD Institution Level Data for '+distName
	        }
	    });
	});
}
function treeMapOnClickNcd(data,distName){
	$(function () {
	    $('#TreeMapOnClickNcd').highcharts({
/*	    	plotOptions: {
	             series: {

	                 dataLabels: {
	                	 formatter: function () {
                           return this.point.name+' : '+'<br>'+this.point.value 
                       },
                       color: '#000000',
                       style: {
                      	 "color": "contrast", "fontSize": "10px", "fontWeight": "light", "textShadow": false
                       }
                   }
	             }
	         },*/
	        series: [{
	            type: "treemap",
	            layoutAlgorithm: 'stripes',
	            allowDrillToNode: true,
	            animationLimit: 1000,
	            dataLabels: {
	                enabled: false
	            },
	            levelIsConstant: false,           
	            levels: [{
	                level: 1,
	                layoutAlgorithm: 'squarified',
	                dataLabels: {
	                    enabled: true,
	                }
	            }],
	            data: data
	        }],
	        title: {
	            text: 'NCD Institution Level Data for '+distName
	        }
	    });
	});
}