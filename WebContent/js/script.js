function bodyOnLoad(){
		var directorate = document.getElementById('directorateName');
		var directorateId = document.getElementById('directorateId').value;
  		for (var i = 0; i < directorate.length; i++) {
  		    if (directorate.options[i].value == directorateId) {
  		    	directorate.selectedIndex = i;
  		        break;
  		    }
  		}
  		getCalender();
  		//$("#date").datepicker().datepicker("setDate", new Date()); 
		document.getElementById('month').disabled=true;
		document.getElementById('year').disabled=true;
		document.getElementById('week').style.display = "none";
		document.getElementById('lblWeek').style.display = "none";
		document.getElementById('quarter').style.display = "none";
		document.getElementById('lblQuarter').style.display = "none";
		document.getElementById('submit').disabled=true;
		document.getElementById('cancel').disabled=true;
	  	document.getElementById("gridDistrictLabel").textContent=document.getElementById("selectedDistrictName").value;
	   	document.getElementById("gridInstitutionLabel").textContent=document.getElementById("selectedInstitutionName").value;
	   	document.getElementById("gridFrequencyLabel").textContent='Daily';
	   	
	   	//document.getElementById('tansacsDemographicGrid').style.display = "none";
	}

/*$(function() {
	  $( "#date" ).datepicker({
			dateFormat: 'dd-mm-yy',	
			showOn: "both",
			buttonImageOnly: true,
			buttonImage: "images/cal_icon.gif",
			//buttonText: 'Open calendar'
			
			});
	  });*/
function resizeTo(){
	document.body.style.zoom='90%';
}
function getCalender(){
	 $( "#date" ).datepicker({
			dateFormat: 'dd-mm-yy',	
			//defaultDate: new Date(),
			showOn: "both",
			buttonImageOnly: true,
			buttonImage: "images/cal_icon.gif",
			//buttonText: 'Open calendar'
			
			});
	
}
 
 function enableFields(){
	 
		var timePeriod = document.getElementById('timePeriod').value;
		
		if(timePeriod==1){
			document.getElementById('month').disabled=true;
			document.getElementById('year').disabled=true;
			document.getElementById('date').disabled=false;
			document.getElementById('month').value="";
			document.getElementById('year').value="";
			document.getElementById('week').style.display = "none";
			document.getElementById('lblWeek').style.display = "none";
			document.getElementById('quarter').style.display = "none";
			document.getElementById('lblQuarter').style.display = "none";
			document.getElementById('date').style.display = "inline";
			document.getElementById('lblDate').style.display = "inline";
			document.getElementById('month').style.display = "inline";
			document.getElementById('lblMonth').style.display = "inline";
			 $( "#date" ).show();
			 getCalender();
			 $( "#date" ).datepicker('enable');
		}else if(timePeriod==2){
			document.getElementById('week').style.display = "inline";
			document.getElementById('lblWeek').style.display = "inline";
			document.getElementById('quarter').style.display = "none";
			document.getElementById('lblQuarter').style.display = "none";
			document.getElementById('date').style.display = "none";
			document.getElementById('lblDate').style.display = "none";
			document.getElementById('month').style.display = "inline";
			document.getElementById('lblMonth').style.display = "inline";
			document.getElementById('month').disabled=false;
			document.getElementById('year').disabled=false;
			document.getElementById('month').value="";
			document.getElementById('year').value="";
			$( "#date" ).datepicker( "destroy" );
			$( "#date" ).hide();
		}else if(timePeriod==3){
			document.getElementById('week').style.display = "none";
			document.getElementById('lblWeek').style.display = "none";
			document.getElementById('quarter').style.display = "none";
			document.getElementById('lblQuarter').style.display = "none";
			document.getElementById('date').style.display = "inline";
			document.getElementById('lblDate').style.display = "inline";
			document.getElementById('month').style.display = "inline";
			document.getElementById('lblMonth').style.display = "inline";
			document.getElementById('month').disabled=false;
			document.getElementById('year').disabled=false;
			document.getElementById('date').disabled=true;
			document.getElementById('date').value="";
			getCalender();
			$( "#date" ).datepicker('disable');
		}else if(timePeriod==4){
			document.getElementById('week').style.display = "none";
			document.getElementById('lblWeek').style.display = "none";
			document.getElementById('quarter').style.display = "inline";
			document.getElementById('lblQuarter').style.display = "inline";
			document.getElementById('date').style.display = "inline";
			document.getElementById('lblDate').style.display = "inline";
			document.getElementById('month').style.display = "none";
			document.getElementById('lblMonth').style.display = "none";
			document.getElementById('year').disabled=false;
			document.getElementById('date').disabled=true;
			document.getElementById('date').value="";
			getCalender();
			$( "#date" ).datepicker('disable');
		}else if(timePeriod==5){
			document.getElementById('week').style.display = "none";
			document.getElementById('lblWeek').style.display = "none";
			document.getElementById('quarter').style.display = "none";
			document.getElementById('lblQuarter').style.display = "none";
			document.getElementById('date').style.display = "inline";
			document.getElementById('lblDate').style.display = "inline";
			document.getElementById('month').style.display = "inline";
			document.getElementById('lblMonth').style.display = "inline";
			document.getElementById('month').disabled=true;
			document.getElementById('year').disabled=false;
			document.getElementById('date').disabled=true;
			document.getElementById('date').value="";
			document.getElementById('month').value="";
			getCalender();
			$( "#date" ).datepicker('disable');
		}
	}
	
	function compareDate() {
	    var dateEntered = document.getElementById("date").value;
	 
	    var date = dateEntered.substring(0, 2);
	    var month = dateEntered.substring(3, 5);
	    var year = dateEntered.substring(6, 10);
	 
	    var dateToCompare = new Date(year, month - 1, date);
	    
	    var currentDate =document.getElementById('currentDate').value;
		var currentDay = currentDate.substring(0, 2);
		var currentMonth = currentDate.substring(3, 5);
		var currentYear = currentDate.substring(6, 10);
	    
		jsCurrentDate = new Date(currentYear,currentMonth-1,currentDay);
	 
	    if (dateToCompare > jsCurrentDate) {
	    	document.getElementById("date").value="";
	        alert("The selected date should be less than or equal to Current Date ");
	        return false;
	    }
	    return true;
	}
	
	function validateMonthAndYear(){

		var selectedMonth = document.getElementById('month').value;
		var selectedYear = document.getElementById('year').value;
		
		var currentDate =document.getElementById('currentDate').value;
		//var currentDay = currentDate.substring(0, 2);
		var currentMonth = currentDate.substring(3, 5);
		var currentYear = currentDate.substring(6, 10);
		
		if(selectedYear>currentYear){
			alert("The selected year should be less than or equal to current year");
			document.getElementById('year').value="";
			return false;
		}

		var monthArr = new Array();
		monthArr['January']=1;
		monthArr['February']=2;
		monthArr['March']=3;
		monthArr['April']=4;
		monthArr['May']=5;
		monthArr['June']=6;
		monthArr['July']=7;
		monthArr['August']=8;
		monthArr['September']=9;
		monthArr['October']=10;
		monthArr['November']=11;
		monthArr['December']=12;

		month=monthArr[selectedMonth];

		if(selectedYear==currentYear && month>currentMonth){
			alert("The selected (month&year) should be less than or equal to current (month&year)");
			document.getElementById('month').value="";
			document.getElementById('year').value="";
			return false;
		}
		return true;
	}

	function validateYear(){
		var selectedYear = document.getElementById('year').value;
		
		var currentDate =document.getElementById('currentDate').value;
		var currentDay = currentDate.substring(0, 2);
		var currentMonth = currentDate.substring(3, 5);
		//var currentYear = currentDate.substring(6, 10);
		var year = currentDate.substring(6, 10);

		if(selectedYear>year){
			alert("The selected year should be less than or equal to current year");
			document.getElementById('year').value="";
			return false;
		}
		return true;
	}
	
	function changeDirectorate(contextPath){
  		var directorate = document.getElementById('directorateName').value;
		var directorateServletList =decodeURIComponent($("#directorateServletList").val());
		data = JSON.parse(directorateServletList);
		var directorateServlet=data[directorate];
  		document.location.href=contextPath+directorateServlet;
  	}
		
  	function doCancel(contextPath,actionServlet){
  		var cancelFlag = confirm("Do you really want to cancel?");
  		if(cancelFlag)
 			document.location.href=contextPath+actionServlet;
 	}
  	function doClose(contextPath){
 			document.location.href=contextPath+'/'+'shdrcHome.do';
 	}
  	function refresh(contextPath,actionServlet){
			document.location.href=contextPath+actionServlet;
	}
  	function isNumeric(sVal){
		//var sPattern = /^\d+$/;
		 //var sPattern = new RegExp("^\\d*\\.?\\d{0,}$");
  		var sPattern = new RegExp("^\\d*$");

		if(!sPattern.test(sVal)){
			return false;
		}
		
		if(sVal.length>9){
			return false;
		}
		
		return true;
	}
  	
  	function isValidCharacter(sVal){
		//var sPattern = /^\d+$/;
		//var sPattern =/^\\d*\\.?\\d{0,}$/;
		 var sPattern = new RegExp("([a-zA-Z]|[0-9])");

		if(sPattern.test(sVal)){
			return true;
		}
		
		return false;
	}
  	
  	function isValidDecimal(sVal){
  	    var decimalIndex = sVal.indexOf(".");
  	    if(decimalIndex!=-1){
	  	    var decimalDigit = sVal.substring(decimalIndex+1, sVal.lastIndex);
	  	    if(decimalDigit.length>3){
	  	    	return false;
	  	    }
  	    }   
		return true;
	}
  	
  	function isValidRange(sVal){
		 var sPattern = new RegExp('^[0-9]*-[0-9]*$');

		if(sPattern.test(sVal)){
			return true;
		}
		
		return false;
	}
  	
  	function isValidSplCharacter(sVal){
		 //var sPattern = new RegExp("[!@$#%&*]");
  		//https://nilangshah.wordpress.com/2007/06/26/password-validation-via-regular-expression/
  		//http://www.mkyong.com/regular-expressions/how-to-validate-password-with-regular-expression/
		 //var sPattern = new RegExp("^.*(?=.{6,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=*]).*$");
		 //var re = /^[ A-Za-z0-9_@./#&+-]*$/
  		var sPattern = new RegExp("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=*]).{6,15})");
		if(sPattern.test(sVal)){
			return true;
		}
		
		return false;
	}
  	
  	function doDemographicSearch(isDemographic){
 		var classificationId = document.getElementById("classificationId").value;
 		doSearch("",classificationId,'tabChange',isDemographic);
  	}
 	function openwindow(rowIndex){
 		 var handsOnTableData=handsontable.getData();
 		 var selectedRow=handsOnTableData[rowIndex];
 		
 		 var directorateId;
 		 var directorateName;
 		 var districtId;
 		 var districtName;
 		 var institutionId;
 		 var institutionName;
 		 var frequency;
 		 var searchDate;
 		 var week;
 		 var quarter;
 		 var month;
 		 var year;
 		 var indicatorName;
 		 var indicatorId;
 		 var generalId;
 		 var generalType;
 		 var generalName;
 		 var directorateElement;
 		 var districtElement;
 		 var institutionElement;
 		 var weekElement;
 		 var quarterElement;
 		 
 		directorateElement = document.getElementById("directorateName");
 		directorateId = directorateElement.options[directorateElement.selectedIndex].value;
 		directorateName = directorateElement.options[directorateElement.selectedIndex].text;
 		districtElement = document.getElementById("districtName");
 		districtId = districtElement.options[districtElement.selectedIndex].value;
 		districtName = districtElement.options[districtElement.selectedIndex].text;
 		institutionElement = document.getElementById("institutionName");
 		if (institutionElement!=null && institutionElement != 'undefined') {
	 		institutionId = institutionElement.options[institutionElement.selectedIndex].value;
	 		institutionName = institutionElement.options[institutionElement.selectedIndex].text;
 		}else{
 			institutionId = -99;
	 		institutionName = 'All';
 		}	
 		frequencyElement = document.getElementById("timePeriod");
 		frequency = frequencyElement.options[frequencyElement.selectedIndex].text;
 		searchDate = document.getElementById("date").value;
 		weekElement = document.getElementById("week");
 		week = weekElement.options[weekElement.selectedIndex].text;
 		month = document.getElementById("month").value;
 		quarterElement = document.getElementById("quarter");
 		quarter = quarterElement.options[quarterElement.selectedIndex].text;
 		year = document.getElementById('year').value;
 		indicatorName = selectedRow.indicatorname1;
		indicatorId = selectedRow.indicatorid;
		generalId = selectedRow.generalid;
		generalType = selectedRow.generaltype1;
		generalName = selectedRow.generalname1;
		
		if(typeof generalType == 'undefined')
			generalType='NA';
		if(typeof generalName == 'undefined')
			generalName='NA';
		
		var url = webUrl+
				'?dirId='+directorateId+
				'&dirName='+directorateName+
				'&distId='+districtId+
				'&distName='+districtName+
				'&insId='+institutionId+
				'&insName='+institutionName+
				'&freq='+frequency+
				'&date='+searchDate+
				'&week='+week+
				'&quarter='+quarter+
				'&month='+month+
				'&year='+year+
				'&indName='+indicatorName+
				'&indId='+indicatorId+
				'&genId='+generalId+
				'&genType='+generalType+
				'&genName='+generalName;
		
		//alert("url"+url);
		window.open(url, null,
		 		"height=670,width=795,status=yes,toolbar=no,menubar=no,location=no");
 		 
 		
 	}
 	
 	function isDateField(indicatorName){
		if(indicatorName=='Date of Sampling' 
			|| indicatorName == 'Date of receipt of report from the Lab' 
				|| indicatorName=='Date and Time of Visit'
					|| indicatorName=='If work is at Tender stage,Date of finalization of tender'
						|| indicatorName=='If work is not completed, Tentative Date of completion'
							||	indicatorName == 'Latest Month for which all RNTCP contractual staff have been paid remuneration' 
								|| indicatorName=='Date'
									|| indicatorName == 'Latest Month for which all RNTCP contractual staff have been paid vehicle maintenance / POL' 
										|| indicatorName=='Period upto which payments to NGO/PPs under signed schemes have been made' 
											|| indicatorName=='Period upto which payments to eligible Community DOT Providers have been made' 
												|| indicatorName=='Compiled PHC / Urban Stock - Expiry Date'
													|| indicatorName=='District / State Store Stock - Expiry Date'){
			return true;
		}
		return false;
	}
 	
 	function getDateFormat(indicatorName){
 		if(indicatorName=='Date of Sampling' 
 			|| indicatorName == 'Date of receipt of report from the Lab' 
 				|| indicatorName=='If work is at Tender stage,Date of finalization of tender'
					|| indicatorName=='If work is not completed, Tentative Date of completion'
		 				|| indicatorName=='Date and Time of Visit'
		 					|| indicatorName=='Date' 
		 						|| indicatorName=='Compiled PHC / Urban Stock - Expiry Date' 
		 							|| indicatorName=='District / State Store Stock - Expiry Date'){
			return 'DD-MM-YYYY';
		}
		if( indicatorName== 'Latest Month for which all RNTCP contractual staff have been paid remuneration' 
			|| indicatorName == 'Latest Month for which all RNTCP contractual staff have been paid vehicle maintenance / POL' 
			|| indicatorName=='Period upto which payments to NGO/PPs under signed schemes have been made' 
			|| indicatorName=='Period upto which payments to eligible Community DOT Providers have been made'){
			return 'MM-YYYY';
		}
		return "";
	}
 	function isValidDate(indicatorValue){
 		var sPattern = new RegExp("^\\d{0,2}\\-?\\d{0,2}\\-?\\d{0,4}$");///^\d{1,2}\/\d{1,2}\/\d{4}$/;
		if(sPattern.test(indicatorValue)){
			if(indicatorValue!=''){
				var date = indicatorValue.split("-");
				var day = date[0];
				var month = date[1];
				var year = date[2];
				if(!(day<=31 && day>0 && month>0 && month<=12 && year<9999 && year>0)){
					alert("Please Enter valid Date");
					return false;
				}	
				if(month==2 || month==4 || month==6 || month==9 || month==11){
					if(!(day<=30 && day>0)){
						alert("Please Enter valid Date");
						return false;	
					}
					if(month==2){
						var leapYear=year%4;
						if(leapYear==0){
							if(!(day<=29 && day>0)){
								alert("Please Enter valid Date");
								return false;	
							}
						}else if(!(day<=28 && day>0)){
							alert("Please Enter valid Date");
							return false;	
						}
					}
					
				}
				
				 var serverDate =document.getElementById('currentDate').value;
				var currentDay = serverDate.substring(0, 2);
				var currentMonth = serverDate.substring(3, 5);
				var currentYear = serverDate.substring(6, 10);
			    var currentDate = new Date(currentYear,currentMonth-1,currentDay);
				
				var selectedDate=new Date(year,month-1,day);
				var minDate=new Date(2010,01,01);
				
				if(currentDate.getTime()<selectedDate.getTime()){
					alert("The selected date should be less than or equal to Current Date ");
					return false;
				}
				if(minDate.getTime()>selectedDate.getTime()){
					alert("Please Enter valid Date");
					return false;
				}
			}
			return true;
		}else{
			alert("Please enter valid date format(DD-MM-YYYY)");
			return false;
		}
		return false;
 	}
 	function isValidMonthAndYear( indicatorValue){
 		var sPattern = new RegExp("^\\d{0,2}\\-?\\d{0,4}$");
 		if(!sPattern.test(indicatorValue)){
 			alert("Please enter valid date format(MM-YYYY)");
			return false;
 		}else{
 			if(indicatorValue!=''){
 				var date = indicatorValue.split("-");
				var month = date[0];
				var year = date[1];
				if(!(month>0 && month<=12)){
					alert("Please enter valid month");
					return false;
				}
				if(!(year>2010 && year<=9999)){
					alert("Please enter Year from 2010");
					return false;
				}

				var serverDate =document.getElementById('currentDate').value;
				var currentDay = serverDate.substring(0, 2);
				var currentMonth = serverDate.substring(3, 5);
				var currentYear = serverDate.substring(6, 10);
			    var currentDate = new Date(currentYear,currentMonth,currentDay);
			    
				var selectedDate=new Date(year,month,1);
				var minDate=new Date(2010,01,01);
				
				/*if ( indicatorName== 'Latest Month for which all RNTCP contractual staff have been paid remuneration' 
					|| indicatorName == 'Latest Month for which all RNTCP contractual staff have been paid vehicle maintenance / POL' 
				  || indicatorName==''){*/
				if(currentDate.getTime()<selectedDate.getTime()){
					alert("The selected (Month&Year) should be less than or equal to Current Date ");
					return false;
				}
				
				if(minDate.getTime()>selectedDate.getTime()){
					alert("Please enter Month and Year from January 2010");
					return false;
				}
 			}
 		}
		return true;
 	}
 	
 	function closeWindow(){
 		  window.close();
 	  }
 	
 	function isValidDateFormat(date){
 		var sPattern = new RegExp("^\\d{0,2}\\-?\\d{0,2}\\-?\\d{0,4}$");///^\d{1,2}\/\d{1,2}\/\d{4}$/;
 		if(!sPattern.test(indicatorValue)){
 			alert("Please enter valid date format(DD-MM-YYYY)");
			return false;
 		}
 	}
 	
 	function getDaysBetweenTwoDates(fromDate,toDate){
 		var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
 		fromDate = fromDate.split('-');
 		toDate =toDate.split('-');
        var firstDate = new Date(fromDate[2], fromDate[1], fromDate[0]);
        var secondDate = new Date(toDate[2], toDate[1], toDate[0]);
        var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)))+1;
        return diffDays;
 		
 	}
 	
 	function checkCOFTime(){
	   /*var directorateId = document.getElementById('directorateId').value;
	   var timePeriod = document.getElementById('timePeriod').value;
	   
	   if(timePeriod==1){//Daily
		   return checkCOFTDailyFreuency(directorateId);
	   }else if(timePeriod==2){//Weekly
		   return checkCOFTWeeklyFreuency(directorateId);
	   }else if(timePeriod==3){//Monthly
		   return checkCOFTMonthlyFreuency(directorateId);
		  
	   }else if(timePeriod==4){//Quarterly
		   return checkCOFTQuarterlyFreuency(directorateId);
	   }else if(timePeriod==5){//Yearly
		   return checkCOFTYearlyFreuency(directorateId);
		   
	   }*/
 		return true;
   } 
 	
 	function checkCOFTMonthlyFreuency(directorateId){
 		   //var selectedMonth = document.getElementById('month').value;
 		   //var selectedYear = document.getElementById('year').value;
 		   //document.getElementById('currentDate').value='10-11-2015';
 		   var currentHours = document.getElementById('currentHours').value;
 		   var currentDate = document.getElementById('currentDate').value;
 		   //currentDate ='10-12-2015';
 		   //currentHours = '16';
 		  
 		   var currentDay = currentDate.substring(0, 2);
 		   var currentMonth = currentDate.substring(3, 5);
 		   var currentYear = currentDate.substring(6, 10);

 		   
 		   //var cutOfStartDate=new Date(currentYear,currentMonth-1,1,0,0,0,0);
 		   var cutOfEndDate=getCOFMonthlyDate(directorateId,currentYear,currentMonth);
 		   var cutOfCurrentDate=new Date(currentYear,currentMonth-1,currentDay,currentHours,0,0,0);
 		   //var cutOfSelectedDate=new Date(selectedYear,selectedMonth,currentDay,currentHours,0,0,0);
 		   
 		   //var cutOfStartDateTime=cutOfStartDate.getTime();
 		   var cutOfEndDateTime=cutOfEndDate.getTime();
 		   var cutOfCurrentDateTime=cutOfCurrentDate.getTime();
 		   //var cutOfSelectedDateTime=cutOfSelectedDate.getTime();
 		   
 		   if(cutOfCurrentDateTime>cutOfEndDateTime){
			   alert(getCOFMonthlyAlertMessage(directorateId));
			   return false;
		   }
 		   return true;
		   
 	}
 	
 	function checkCOFTDailyFreuency(directorateId){
		var currentHours = document.getElementById('currentHours').value;
		var cutOfHour=getCOFDailyHour(directorateId);
		//currentHours = '17';
		if(currentHours>cutOfHour){
			alert(getCOFDailyAlertMessage(directorateId));
			   return false;
		}
		 return true;
	}
 	
 	function checkCOFTWeeklyFreuency(directorateId){
		   var currentHours = document.getElementById('currentHours').value;
		   var currentDate = document.getElementById('currentDate').value;
		   //currentDate ='18-12-2015';
		   //currentHours = '20';
		  
		   var currentDay = currentDate.substring(0, 2);
		   var currentMonth = currentDate.substring(3, 5);
		   var currentYear = currentDate.substring(6, 10);

		   
		   var cutOfEndDate=new Date(currentYear,currentMonth-1,10,16,0,0,0);
		   var cutOfCurrentDate=new Date(currentYear,currentMonth-1,currentDay,currentHours,0,0,0);
		   
		   
		   var cutOfCurrentDay= cutOfCurrentDate.getDay();
		   
		  
		   var cutOfEndDateTime=cutOfEndDate.getTime();
		   var cutOfCurrentDateTime=cutOfCurrentDate.getTime();
		   
		   if(cutOfCurrentDay==5 || cutOfCurrentDay==6 || cutOfCurrentDay==0 || cutOfCurrentDay==1){
				 if(cutOfCurrentDay==1 && currentHours>18){
					 alert(getCOFWeeklyAlertMessage(directorateId));
					   return false;
				   }
			}else{
				alert(getCOFWeeklyAlertMessage(directorateId));
				   return false;
			}
		   return true;
		   
	}
 	
 	function checkCOFTQuarterlyFreuency(directorateId){
 		var currentDate =document.getElementById('currentDate').value;
		var currentHours = document.getElementById('currentHours').value;
		//currentDate='10-02-2015';
		//currentHours = '16';
		
		var currentDay = currentDate.substring(0, 2);
		var currentMonth = currentDate.substring(3, 5);
		var currentYear = currentDate.substring(6, 10);
		
		 var cutOfEndDate=getCOFQuarterlyDate(directorateId,currentYear,currentMonth);
		 var cutOfCurrentDate=new Date(currentYear,currentMonth-1,currentDay,currentHours,0,0,0);
		   
		 var cutOfEndDateTime=cutOfEndDate.getTime();
		 var cutOfCurrentDateTime=cutOfCurrentDate.getTime();
		
		if(currentMonth==1 || currentMonth==4 ||currentMonth==7 ||currentMonth==10){
			 if(cutOfCurrentDateTime>cutOfEndDateTime){
				 alert(getCOFQuarterlyAlertMessage(directorateId));
				   return false;
			   }
		}else{
			alert(getCOFQuarterlyAlertMessage(directorateId));
			   return false;
		}
		 return true;
	}
 	
 	function checkCOFTYearlyFreuency(directorateId){
 		var currentDate =document.getElementById('currentDate').value;
		var currentHours = document.getElementById('currentHours').value;
		//currentDate='10-04-2015';
		//currentHours = '17';
		
		var currentDay = currentDate.substring(0, 2);
		var currentMonth = currentDate.substring(3, 5);
		var currentYear = currentDate.substring(6, 10);
		
		var cutOfEndDate=getCOFYearlyDate(directorateId,currentYear,currentMonth);
		var cutOfCurrentDate=new Date(currentYear,currentMonth-1,currentDay,currentHours,0,0,0);
		   
		var cutOfEndDateTime=cutOfEndDate.getTime();
		var cutOfCurrentDateTime=cutOfCurrentDate.getTime();
		
		if(currentMonth==4){
			 if(cutOfCurrentDateTime>cutOfEndDateTime){
				 alert(getCOFYearlyAlertMessage(directorateId));
				   return false;
			   }
		}else{
			alert(getCOFYearlyAlertMessage(directorateId));
			   return false;
		}
		 return true;
	}
 	
 	function getCOFDailyHour(directorateId){
 		var cutOfHour;
 		if(directorateId==7)
 			cutOfHour=18;
 		else
 			cutOfHour=16;
 		return cutOfHour;
 	}
 	
 	function getCOFMonthlyDate(directorateId,currentYear,currentMonth){
 		var cutOfDate;
 		if(directorateId==7)
 			cutOfDate=new Date(currentYear,currentMonth-1,10,18,0,0,0);
 		else
 			cutOfDate=new Date(currentYear,currentMonth-1,10,16,0,0,0);
 		return cutOfDate;
 	}
 	
 	function getCOFQuarterlyDate(directorateId,currentYear,currentMonth){
 		var cutOfDate;
 		if(directorateId==7)
 			cutOfDate=new Date(currentYear,currentMonth-1,10,18,0,0,0);
 		else
 			cutOfDate=new Date(currentYear,currentMonth-1,10,16,0,0,0);
 		return cutOfDate;
 	}
 	
 	function getCOFYearlyDate(directorateId,currentYear,currentMonth){
 		var cutOfDate;
 		if(directorateId==7)
 			cutOfDate=new Date(currentYear,currentMonth-1,10,18,0,0,0);
 		else
 			cutOfDate=new Date(currentYear,currentMonth-1,10,16,0,0,0);
 		return cutOfDate;
 	}
 	
 	function getCOFDailyAlertMessage(directorateId){
 		var msg;
 		if(directorateId==7)
 			msg="Daily data should be entered before 7 P.M.";
 		else
 			msg="Daily data should be entered before 5 P.M.";
 		return msg;
 	}
 	
 	function getCOFWeeklyAlertMessage(directorateId){
 		var msg;
 		//if(directorateId!=5)
 			//msg="Weekly data should be entered on Friday or Saturday (Till 5 P.M. on Saturday)";
 		//else
 			msg="Weekly data should be entered  from Friday to Monday (Till 5 P.M on Monday)";
 		return msg;
 	}
 	
 	function getCOFMonthlyAlertMessage(directorateId){
 		var msg;
 		if(directorateId==7)
 			msg="Monthly data should be entered from day 1 to 10 of every month (Till 7 P.M. of 10th)";
 		else
 			msg="Monthly data should be entered from day 1 to 10 of every month (Till 5 P.M. of 10th)";
 		return msg;
 	}
 	
 	function getCOFQuarterlyAlertMessage(directorateId){
 		var msg;
 		if(directorateId==7)
 			msg="Quarterly data should be entered from day 1 to 10 of (January,April,July,October) month(Till 7 P.M. of 10th)";
 		else
 			msg="Quarterly data should be entered from day 1 to 10 of (January,April,July,October) month(Till 5 P.M. of 10th)";
 		return msg;
 	}
 	
 	function getCOFYearlyAlertMessage(directorateId){
 		var msg;
 		if(directorateId==7)
 			msg="Yearly data should be entered from day 1 to 10 of April month(Till 7 P.M. of 10th)";
 		else
 			msg="Yearly data should be entered from day 1 to 10 of April month(Till 5 P.M. of 10th)";
 		return msg;
 	}
 	
 	function isDecimalIndicator(indicatorName){
 		if(indicatorName=='Expenditure incurred for Purchase of Tamiflu tablets ( in Rs )'
 			|| indicatorName=='Balance, if any (in Rs)'
 				|| indicatorName=='Cost incurred for purchase ( in Rs )'
 					|| indicatorName=='Expenditure incurred for desilting, if any ( in Rs )'
 						|| indicatorName=='Expenditure incurred for purchase ( in Rs )'
 							|| indicatorName=='Expenditure incurred for Purchase of Liquid Chlorine(in Rs)'
 								|| indicatorName=='Expenditure incurred for sampling (in Rs)'
 									|| indicatorName=='Expenditure incurred (in Rs)'
 										|| indicatorName=='Expenditure incurred on engagement of DBC / month ( in Rs )'
 											|| indicatorName=='Expenditure incurred on IEC ( in Rs )'
 												|| indicatorName=='Expenditure incurred on Mass Cleaning, if any ( in Rs )'
 													|| indicatorName=='Expenditure (in Rs)'
 														|| indicatorName=='Fine Amount collected for VBDC, if any ( in Rs )'
 															|| indicatorName=='Fund received(in Rs)'
 																|| indicatorName=='Other Expenditure, if any, mention ( in Rs )'
 																	|| indicatorName=='Total Expenditure incurred for all IEC Activities at Schools / Field ( in Rs )'
 																		|| indicatorName=='Total Expenditure on Chemicals ( in Rs )'
 																			|| indicatorName=='Total Expenditure on Equipments and Fuels ( in Rs )'
 																				|| indicatorName=='UC given (in Rs)'
 																					|| indicatorName=='Wage / DBC / day ( in Rs )'
 																						|| indicatorName=='Average Indices of ULB'){
 			return true;
 		}
 		return false;
 	}
 	
 	function ChangeDiseaseIndicator(indName,contextPath,method,action){
 		if(indName==='NCD Indicators'){
 			document.location.href=contextPath+'/showOnLoadNCDData.do';
 		}else if(indName==='CD Indicators'){
 			document.location.href=contextPath+'/showOnLoadTreeMapData.do';
 		}else{
 			document.getElementById("sdgsForm").method=method;
 			document.getElementById("sdgsForm").action=action;
 			document.getElementById("sdgsForm").submit();
 		}
 	}
 	
 	
	function printDiv(divName) {
	     var printContents = document.getElementById(divName).innerHTML;
	     var originalContents = document.body.innerHTML;
	     document.body.innerHTML = printContents;
	     window.print();
	     document.body.innerHTML = originalContents;
	}
	function predictivePrint(contextpath,divId){
		$('#'+divId).printThis({
			importCSS: true,
			formValues: true ,
			loadCSS: contextpath+'/css/multiple-select.css'
		});
	}
	
	function paginateTable(currentPage,noOfPages){
		  var row='<tr>';
		 	if(currentPage != 1){
		 		row+='<td><a onclick="paginate(this);">Previous</a></td>';
		 	}
		 	for(var i=1;i<=noOfPages;i++){
		 		if(currentPage == i){
		 			row+='<td><a style="background:#eee;color: #337ab7;cursor:auto;">'+i+'</a></td>';
		 		}else{
		 			row+='<td><a onclick="paginate(this);">'+i+'</a></td>';					
		 		}						 		
		 	}
		 	if(currentPage < noOfPages){
		 		row+='<td><a onclick="paginate(this);">Next</a></td>';
		 	}
		 	row+='</tr>';		
			$('#paginationTable').append(row);
	  }