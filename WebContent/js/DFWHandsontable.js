var handsontable = (function () {
		  var $container = $("#dataGrid");
		  var $parent = $container.parent();
		  var $successMessage = $("#successMessage");
		  var $errorMessage = $("#errorMessage");
		  var isDataGridReadOnly;
		 
		  
		  var data=[];
		  var jsonString =decodeURIComponent($("#encodedJsonArray").val());
		  if (jsonString!='null' && jsonString.length > 0) {
		    data = JSON.parse(jsonString);
		  }
			var skyBlueRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				  $(td).css({
				    background: '#4997D0',
				    fontWeight: 'bold',
				    fontSize: 14,
				    color:'white'
				  });
				};
			var yellowRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				  $(td).css({
				    background: 'yellow',
				    fontWeight: 'bold',
				    fontSize: 12,
				    color:'black'
				  });
			}
			
			var subCategoryRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
					$(td).css({
					    background: 'skyblue',
					    fontWeight: 'bold',
					    fontSize: 12,
					    color:'black'
					  });
			};
			
			var indicatorNameRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				if(value!=null){
					$(td).css({
						//Granny Smith Apple
					    background: '#A8E4A0',
					    fontSize: 14,
					    color:'black'
					  });
				}else{
					//Light Goldenrod Yellow
					$(td).css({
					    background: '#FAFAD2'
					  });
				}
				
			};
			var generalNameRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				if(value!=null){
					$(td).css({
					    background: '#CCCCFF', //Lavender Blue
					    fontSize: 14,
					    color:'black' 
					});
				}else{
					//Light Goldenrod Yellow
					$(td).css({
					    background: '#FAFAD2'
					  });
				}
				
		
			};
			var generalTypeRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				if(value!=null){
					$(td).css({
					    background: '#F8DE7E', //Misty Rose
					    fontSize: 14,
					    color:'black'
					  });
				}else{
					//Light Goldenrod Yellow
					$(td).css({
					    background: '#FAFAD2'
					  });
				}
				
			};
			
			var indicatorValueRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				if(value!=null){
					cellProperties.readOnly = true;
				}
				
			};
				
			var gridCells = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				  $(td).css({
				    fontSize: 13,
				    fontWeight: 'bold',
				    fontStyle:'arial',
				    color:'black'
				  });
				};
				
				function firstRowRenderer(instance, td, row, col, prop, value, cellProperties) {
					  Handsontable.renderers.TextRenderer.apply(this, arguments);
					  td.style.fontWeight = 'bold';
					  td.style.color = 'green';
					  td.style.background = '#CEC';
					}
				
				indicatorNumericValidator = function (value, callback) {
					  setTimeout(function(){
					   /* if (/.+@.+/.test(value)) {
					      callback(true);
					    }
					    else {
					      callback(false);
					    }*/
						    if(isNumeric(value) && isValidDecimal(value)){
						    	callback(true);
					   		}else{
					   			callback(false);
					   		}
					  }, 1000);
					};
					
					indicatorCharValidator = function (value, callback) {
						  setTimeout(function(){
							    if(isValidCharacter(value)){
							    	callback(true);
						   		}else{
						   			callback(false);
						   		}
						  }, 1000);
						};
				  dateValidator = function (value, callback) {
					  setTimeout(function(){
						    if(isValidDate(value)){
						    	callback(true);
					   		}else{
					   			callback(false);
					   		}
					  }, 1000);
					};
						
					  /*var dateValidator = function (instance, td, row, col, prop, value, cellProperties) {
						    //what renderer do I run here?
						    Handsontable.DateCell.renderer.apply(this, arguments);
						    $(td).css({
						      background: 'yellow'
						    });
						    //cellProperties.type='date';
						    cellProperties.dateFormat='MM/DD/YYYY';
						    cellProperties.dateFormat=true;
						    cellProperties.defaultDate='01/01/1900';
						    //this.type='date';
        					//this.dateFormat='MM/DD/YYYY';
        					//this.correctFormat=true;
        					//this.defaultDate='01/01/1900';
						    
						  };*/
					
					monthAndYearValidator = function (value, callback) {
						  setTimeout(function(){
							    if(isValidMonthAndYear(value)){
							    	callback(true);
						   		}else{
						   			callback(false);
						   		}
						  }, 1000);
						};
						
				var actionRenderer = function (instance, td, row, col, prop, value, cellProperties) {
					 Handsontable.renderers.TextRenderer.apply(this, arguments);
					 $(td).css({
						    fontSize: 14,
						    color:'black' 
						});
					var data=instance.getData()[row];
					var isdemographic = data.isdemographic;
					var issucategorylabel=data.issucategorylabel;
					if(isdemographic!=null && isdemographic=='Y' && !issucategorylabel){
						  var $button = $('<button>');
						  //$button.html('<button  type="button" class="btn-default" onclick="openwindow('+row+');">Click</button>');
						  $button.html('<a href="#" sytle="width:150px;" onclick="openwindow('+row+');">Click</a>');
						  $(td).empty().append($button); //empty is needed because you are rendering to an existing cell
						  cellProperties.readOnly = true;
					}
				};				
				
		    $container.handsontable({
		    data:data,
			minSpareRows: 1,
			colWidths: [600, 200,200,200],
			//colHeaders: true,
			//rowHeaders: true,
			width: 1220,
		    height: 428,
			//contextMenu: true,
			minRows: 18	,
			minCols: 10,
			currentRowClassName: 'currentRow',
	 		/* fixedRowsTop: 10,
			fixedColumnsLeft: 13, */
			manualColumnResize: true,
	  		manualRowResize: true,
	  		stretchH: 'none',
	  	
	  		columns: [
	  		        {data: "indicatorname" },
	  		        {data: "generaltype" },
	  		        {data: "generalname" },
	  		      // {data: "indicatorvalue",renderer: actionRenderer,className: "htRight"},
	  		      {data: "indicatorvalue",className: "htRight"},
	  		        
	  		      ],
	  		    
	  		    cells: function (row, col, prop) {
		        	
		        	if (col === 0) {
		        		this.readOnly= true;
		        		var issucategorylabel = this.instance.getData()[row].issucategorylabel;
			  		    if(issucategorylabel){
			  		    	this.renderer =subCategoryRenderer;
			  		    }else{
			  		    	this.renderer =indicatorNameRenderer;
			  		    }
		            }
		        	if (col === 1) {
		        		this.readOnly= true;
		        		this.renderer =generalTypeRenderer;
		               }
		        	if (col === 2) {
		        		this.readOnly= true;
		        		this.renderer =generalNameRenderer;
		               }
		        	if (col === 3) {
			        		this.renderer =actionRenderer;
			        		var insData = this.instance.getData()[row];
			        		var indicatorName = insData.indicatorname1;
			        		var generalType = insData.generaltype1;
			        		var generalName = insData.generalname1;
			        		var indicatorValue = insData.indicatorvalue;
			        		var issucategorylabel =insData.issucategorylabel;
			        		var etlProcessStatus =insData.etlprocessstatus;
			        		var ischaracter=insData.ischaracter;
			        		isDataGridReadOnly = document.getElementById('isDataGridReadOnly').value;
			        		
			        		if(indicatorName==null 
			        				|| (typeof etlProcessStatus != 'undefined' && etlProcessStatus=='Y') 
			        				||(typeof issucategorylabel != 'undefined' && issucategorylabel)){
			        			this.readOnly= true;
			        		}
			        		
			        		/*ETL etlProcessStatus - 'A' - Added new record ,M-Modification,C-Completed*/
			        		if(indicatorName!=null){
				        		if(typeof etlProcessStatus == 'undefined'){
				        			document.getElementById('submitType').value='save';
				        		    document.getElementById('isDataExists').value='false';
				        		}else if(typeof etlProcessStatus != 'undefined' && (etlProcessStatus=='C' || etlProcessStatus=='A' || etlProcessStatus=='M' )){
				        			document.getElementById('submitType').value='update';
				        			document.getElementById('isDataExists').value='false';
				        		}/*else if(typeof etlProcessStatus != 'undefined' && etlProcessStatus=='Y'){
				        			document.getElementById('isDataExists').value=true;
				        		}*/
			        		}
			        		
			        		if(typeof ischaracter != 'undefined' && ischaracter=='Y'){
			        			if(isDateField(indicatorName)){
			        				if(getDateFormat(indicatorName)=='DD-MM-YYYY'){
			        					 this.validator=dateValidator;
			        			     }else if(getDateFormat(indicatorName)=='MM-YYYY'){
			        			    	 this.validator=monthAndYearValidator;
			        			     }
			        			}else{
			        				this.validator=indicatorCharValidator;
			        			}
			        		}else{
			        			this.validator=indicatorNumericValidator;
			        		} 
			        		//To disable the Indicator value field of Indicators containing 1st April for all months except April
			        		if(indicatorName!=null){
			        			var enableFlag=isIndContainsApril(indicatorName);
			        			if(enableFlag){
			        				this.readOnly= true;
			        			}
			        		}
			        		//For Indicator Level Validations
			        		/*if(indicatorName!=null){
			        			var validationFlag=validateIndicatorLevel(indicatorName,generalType,generalName,indicatorValue);
			        			if(!validationFlag){
					   				return;
					   			}
			        		}*/
			        		
			        		//To Disable indicator value field after cutoff time 
			        		if(isDataGridReadOnly=='true'){
			        			this.readOnly= true;
			        		}
			        		
			        		this.allowInvalid=true;
			        		
		               }
		        	if (row === 0) {
		                this.renderer = skyBlueRenderer;
		                this.className = "htCenter";
		                this.readOnly= true;
		             }
		        	/* var hands=this.instance.getData()[0][0];
		        	alert("hands"+hands);
		        	if (this.instance.getData()[row][col] === 'sucategorylabel') {
		        		 this.renderer = yellowRenderer;
		        	} */
		        	  /*if (col === 0) {
		                   this.readOnly= true;
		                   this.renderer = yellowRenderer;
		                }
		        	   if (col === 1) {
		                   this.renderer = gridCells;
		                }
		               if (row === 0 && col === 0) {
		                 this.renderer = skyBlueRenderer;
		                 this.className = "htMiddle htCenter";
		                 this.readOnly= true;
		               }
		               if (row === 0) {
		                  this.renderer = skyBlueRenderer;
		                  this.className = "htCenter";
		                  this.readOnly= true;
		               }
		                */
	  		    }			   
	        
		  });
		  var handsontable = $container.data('handsontable'); 
		  return handsontable;
		  })();


/* var tanscaDemographicTable = (function () {
	 var $container = $("#tansacsDemographicGrid"); 
	  var $parent = $container.parent();
	  
	  var data=['Gender','SC','ST','BC','MBC'];
	  var jsonString =decodeURIComponent($("#encodedJsonArray").val());
	  if (jsonString!='null' && jsonString.length > 0) {
	    data = JSON.parse(jsonString);
	  }
		var generalNameRenderer = function (instance, td, row, col, prop, value, cellProperties) {
			Handsontable.renderers.TextRenderer.apply(this, arguments);
			if(value!=null){
				$(td).css({
				    background: '#CCCCFF' //Lavender Blue
				  });
			}else{
				//Light Goldenrod Yellow
				$(td).css({
				    background: '#FAFAD2'
				  });
			}
			
		};
		var generalTypeRenderer = function (instance, td, row, col, prop, value, cellProperties) {
			Handsontable.renderers.TextRenderer.apply(this, arguments);
			if(value!=null){
				$(td).css({
				    background: '#F8DE7E' //Misty Rose
				  });
			}else{
				//Light Goldenrod Yellow
				$(td).css({
				    background: '#FAFAD2'
				  });
			}
			
		};
		
		var indicatorValueRenderer = function (instance, td, row, col, prop, value, cellProperties) {
			Handsontable.renderers.TextRenderer.apply(this, arguments);
			if(value!=null){
				cellProperties.readOnly = true;
			}
			
		};
			
		function firstRowRenderer(instance, td, row, col, prop, value, cellProperties) {
			  Handsontable.renderers.TextRenderer.apply(this, arguments);
			  td.style.fontWeight = 'bold';
			  td.style.color = 'green';
			  td.style.background = '#CEC';
			}	
			
	    $container.handsontable({
	    data:data,
		minSpareRows: 1,
		colWidths: [600, 200,200,200],
		width: 1220,
	    height: 428,
		contextMenu: true,
		minRows: 18	,
		minCols: 10,
		manualColumnResize: true,
		manualRowResize: true,
		stretchH: 'none',
		columns: [
		        {data: "agegroup" },
		        {data: "SC",className: "htRight"},
		        {data: "ST",className: "htRight"},
		        {data: "BC",className: "htRight"},
		        {data: "MBC",className: "htRight"},
		        
		      ],
	            
		    cells: function (row, col, prop) {
	        	
	        	if (col === 0) {
	        		
	            }
	        	if (row === 0) {
	             }
		    }			   
      
	  });
	  var tanscaDemographicTable = $container.data('handsontable'); 
	  return tanscaDemographicTable;
	  })();*/

/*function tanscaDemographicTable(){*/
	/*var tanscaDemographicTable = (function () {
var
data = [
  ['Age Group', 'Social', '', '', ''],
  ['', 'SC', 'ST', 'BC', 'MBC'],
  ['0-10Yrs', '', '', '', ''],
  ['10-20Yrs', '', '', '', ''],
  ['20-30Yrs', '', '', '', ''],
  ['30-40Yrs', '', '', '', '']
];
var ageGroupRenderer = function (instance, td, row, col, prop, value, cellProperties) {
	Handsontable.renderers.TextRenderer.apply(this, arguments);
	  $(td).css({
	    background: '#4997D0',
	    fontWeight: 'bold',
	    fontSize: 14,
	    color:'white'
	  });
	};
	
	var ageGroupValueRenderer =  function (instance, td, row, col, prop, value, cellProperties) {
		Handsontable.renderers.TextRenderer.apply(this, arguments);
		  $(td).css({
			  background: '#FAFAD2', //Lavander Yellow
		   // fontWeight: 'bold',
		    //fontSize: 14,
		    //color:'white'
		  });
		};
	
	var socialHeaderRenderer = function (instance, td, row, col, prop, value, cellProperties) {
		Handsontable.renderers.TextRenderer.apply(this, arguments);
		  $(td).css({
		    background: '#4997D0',
		    fontWeight: 'bold',
		    fontSize: 14,
		    color:'white'
		  });
		};
	var socialRenderer = function (instance, td, row, col, prop, value, cellProperties) {
		Handsontable.renderers.TextRenderer.apply(this, arguments);
		  $(td).css({
		    background: '#CCCCFF', //Lavender Blue
		    fontWeight: 'bold',
		    fontSize: 14,
		    color:'white'
		  });
		};
		
		

var $tansacscontainer = $("#tansacsDemographicGrid"); 
$tansacscontainer.handsontable({
	data:data,
	minSpareRows: 1,
	colWidths: [600, 150,150,150,150],
	width: 1220,
	height: 428,
	contextMenu: true,
	minRows: 18	,
	minCols: 5,
	fixedRowsTop: 10,
	fixedColumnsLeft: 13,
	manualColumnResize: true,
	manualRowResize: true,
	stretchH: 'none',
	mergeCells: [
	              {row: 0, col: 1, rowspan: 1, colspan: 4},
	              {row: 0, col: 0, rowspan: 1, colspan: 0}
	            ],
	columns: [
	        {data: "agegroup" ,className: "htRight"},
	        {data: "sc" ,className: "htRight"},
	        {data: "st" ,className: "htRight"},
	        {data: "bc",className: "htRight"},
	        {data: "mbc",className: "htRight"},
	        
	      ],

cells: function (row, col, prop) {
	
	if (row === 0 && col === 1) {
		this.readOnly= true;
		this.renderer =socialHeaderRenderer;
		 this.className = "htCenter";
       }
	if (row === 1 && col === 1) {
		this.readOnly= true;
		this.renderer =socialRenderer;
		 this.className = "htCenter";
       }
	if (row === 1 && col === 2) {
		this.readOnly= true;
		this.renderer =socialRenderer;
		 this.className = "htCenter";
       }
	if (row === 1 && col === 3) {
		this.readOnly= true;
		this.renderer =socialRenderer;
		 this.className = "htCenter";
       }
	if (row === 1 && col === 4) {
		this.readOnly= true;
		this.renderer =socialRenderer;
		 this.className = "htCenter";
       }
	if (col === 0) {
		this.readOnly= true;
		 this.className = "htRight";
		 this.renderer =ageGroupValueRenderer;
       }
	if (row === 0 && col === 0) {
		this.readOnly= true;
		this.renderer =ageGroupRenderer;
		 this.className = "htCenter";
    }
	
  }	
});
var tanscaDemographicTable = $tansacscontainer.data('handsontable'); 
return tanscaDemographicTable;
})();*/

//}