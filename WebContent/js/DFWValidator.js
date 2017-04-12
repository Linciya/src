function isIndContainsApril(indicatorName){	
	var aprilValue=indicatorName.indexOf("1st April");
	if(aprilValue!=-1){
		var month=document.getElementById('month').value;
		if(month!=3){// Month 3 denotes April
			return true;
		}
	}
	return false;
}

function validateIndicatorLevel(indicatorName,generalType,generalName,indicatorValue){
	var classificationName=document.getElementById("classification").value;
	   if(classificationName=='Equipment'){
	   		if(indicatorName=='Equipment Supplied'){
	   				indValue1 = +indicatorValue;
	   			}
	   		if(indicatorName == 'Equipment in Working Condition' || indicatorName == 'Equipment Repairable' || indicatorName == 'Equipment to be Condemned'){
	   				if(indValue2 == ""){
	   					 indValue2 = +indicatorValue;
	   				}
	   				else{
	   					indValue2 = +indValue2 + +indicatorValue;	
	   				}
	   			}
	   		if(indicatorName == 'Equipment under Warranty' || indicatorName == 'Equipment under AMC' || indicatorName == 'Equipment in Working Condition' 
	   					|| indicatorName == 'Equipment under Repair within 3 Months' || indicatorName == 'Equipment under Repair for More than 3 Months' 
	   					|| indicatorName == 'Equipment Repairable' || indicatorName == 'Equipment to be Condemned'){
	   				indValue3 = +indicatorValue;	   				
	   			}
	   			if(indValue1!="" && indValue3!=""){
	   				if(+indValue3 > +indValue1){
	   					alert(" '"+indicatorName+"' should be less than 'Equipment Supplied'");
	   					return false;
	   				}
	   			}
	   	}else if(classificationName=='Vehicles'){
	   		if(indicatorName=='Total Number of Family Welfare Vehicles Supplied'){
				indValue1 = +indicatorValue;
			}
	   		if(indicatorName == 'Total Number of Family Welfare Vehicles On-Road' || indicatorName == 'Total Number of Family Welfare Vehicles Off-Road (more than 1 Month)' 
	   				|| indicatorName == 'Total Number of Family Welfare Vehicles Off-Road (more than 3 Month)' || indicatorName == 'Total Number of Family Welfare Vehicles Condemned'){
				if(indValue2 == ""){
					 indValue2 = +indicatorValue;
				}
				else{
					indValue2 = +indValue2 + +indicatorValue;	
				}
			}
	   		
	   	}else if(classificationName=='Drugs Supply'){
	   		if(indicatorName=='Budget Allotted (Pass-Book)'){
				indValue1 = +indicatorValue;
			}
	   		if(indicatorName == 'Cost of Drugs Lifted as per Pass-Book' || indicatorName == 'Amount Surrendered / Transferred'){
				if(indValue2 == ""){
					 indValue2 = +indicatorValue;
				}
				else{
					indValue2 = +indValue2 + +indicatorValue;	
				}
			}
	   	}else if(classificationName=='Grants'){
	   		if(indicatorName=='Institutions functioning under Grant' && generalType=='Local Body' && generalName=='Count'){
				grantLocCountValue = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under Grant' && generalType=='Local Body' && generalName=='Amount sanctioned for last year'){
				grantLocLastYrValue = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under Grant' && generalType=='Local Body' && generalName=='Amount sanctioned for current year'){
				grantLocCurrentYrValue = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under Grant' && generalType=='Voluntary Organizations' && generalName=='Count'){
				grantVolCountValue = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under Grant' && generalType=='Voluntary Organizations' && generalName=='Amount sanctioned for last year'){
				grantVolLastYrValue = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under Grant' && generalType=='Voluntary Organizations' && generalName=='Amount sanctioned for current year'){
				grantVolCurrentYrValue = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 100% Grant' && generalType=='Local Body' && generalName=='Count'){
				grantLocCountValue100 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 100% Grant' && generalType=='Local Body' && generalName=='Amount sanctioned for last year'){
				grantLocLastYrValue100 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 100% Grant' && generalType=='Local Body' && generalName=='Amount sanctioned for current year'){
				grantLocCurrentYrValue100 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 100% Grant' && generalType=='Voluntary Organizations' && generalName=='Count'){
				grantVolCountValue100 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 100% Grant' && generalType=='Voluntary Organizations' && generalName=='Amount sanctioned for last year'){
				grantVolLastYrValue100 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 100% Grant' && generalType=='Voluntary Organizations' && generalName=='Amount sanctioned for current year'){
				grantVolCurrentYrValue100 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 2/3 Grant' && generalType=='Local Body' && generalName=='Count'){
				grantLocCountValue2by3 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 2/3 Grant' && generalType=='Local Body' && generalName=='Amount sanctioned for last year'){
				grantLocLastYrValue2by3 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 2/3 Grant' && generalType=='Local Body' && generalName=='Amount sanctioned for current year'){
				grantLocCurrentYrValue2by3 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 2/3 Grant' && generalType=='Voluntary Organizations' && generalName=='Count'){
				grantVolCountValue2by3 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 2/3 Grant' && generalType=='Voluntary Organizations' && generalName=='Amount sanctioned for last year'){
				grantVolLastYrValue2by3 = +indicatorValue;
			}
	   		if(indicatorName=='Institutions functioning under 2/3 Grant' && generalType=='Voluntary Organizations' && generalName=='Amount sanctioned for current year'){
				grantVolCurrentYrValue2by3 = +indicatorValue;
			}
	   		if(grantLocCountValue!="" && grantLocCountValue100!=""){
   				if(+grantLocCountValue100 > +grantLocCountValue){
   					alert("'Institutions functioning under 100% Grant-Local Body-Count' should be less than 'Institutions functioning under Grant-Local Body-Count'");
   					return false;
   				}
   			}
	   		if(grantLocLastYrValue!="" && grantLocLastYrValue100!=""){
   				if(+grantLocLastYrValue100 > +grantLocLastYrValue){
   					alert("'Institutions functioning under 100% Grant-Local Body-Amount sanctioned for last year' should be less than 'Institutions functioning under Grant-Local Body-Amount sanctioned for last year'");
   					return false;
   				}
   			}
	   		if(grantLocCurrentYrValue!="" && grantLocCurrentYrValue100!=""){
   				if(+grantLocCurrentYrValue100 > +grantLocCurrentYrValue){
   					alert("'Institutions functioning under 100% Grant-Local Body-Amount sanctioned for current year' should be less than 'Institutions functioning under Grant-Local Body-Amount sanctioned for current year'");
   					return false;
   				}
   			}
	   		if(grantVolCountValue!="" && grantVolCountValue100!=""){
   				if(+grantVolCountValue100 > +grantVolCountValue){
   					alert("'Institutions functioning under 100% Grant-Voluntary Organizations-Count' should be less than 'Institutions functioning under Grant-Voluntary Organizations-Count'");
   					return false;
   				}
   			}
	   		if(grantVolLastYrValue!="" && grantVolLastYrValue100!=""){
   				if(+grantVolLastYrValue100 > +grantVolLastYrValue){
   					alert("'Institutions functioning under 100% Grant-Voluntary Organizations-Amount sanctioned for last year' should be less than 'Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for last year'");
   					return false;
   				}
   			}
	   		if(grantVolCurrentYrValue!="" && grantVolCurrentYrValue100!=""){
   				if(+grantVolCurrentYrValue100 > +grantVolCurrentYrValue){
   					alert("'Institutions functioning under 100% Grant-Voluntary Organizations-Amount sanctioned for current year' should be less than 'Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for current year'");
   					return false;
   				}
   			}
	   		if(grantLocCountValue!="" && grantLocCountValue2by3!=""){
   				if(+grantLocCountValue2by3 > +grantLocCountValue){
   					alert("'Institutions functioning under 2/3 Grant-Local Body-Count' should be less than 'Institutions functioning under Grant-Local Body-Count'");
   					return false;
   				}
   			}
	   		if(grantLocLastYrValue!="" && grantLocLastYrValue2by3!=""){
   				if(+grantLocLastYrValue2by3 > +grantLocLastYrValue){
   					alert("'Institutions functioning under 2/3 Grant-Local Body-Amount sanctioned for last year' should be less than 'Institutions functioning under Grant-Local Body-Amount sanctioned for last year'");
   					return false;
   				}
   			}
	   		if(grantLocCurrentYrValue!="" && grantLocCurrentYrValue2by3!=""){
   				if(+grantLocCurrentYrValue2by3 > +grantLocCurrentYrValue){
   					alert("'Institutions functioning under 2/3 Grant-Local Body-Amount sanctioned for current year' should be less than 'Institutions functioning under Grant-Local Body-Amount sanctioned for current year'");
   					return false;
   				}
   			}
	   		if(grantVolCountValue!="" && grantVolCountValue2by3!=""){
   				if(+grantVolCountValue2by3 > +grantVolCountValue){
   					alert("'Institutions functioning under 2/3 Grant-Voluntary Organizations-Count' should be less than 'Institutions functioning under Grant-Voluntary Organizations-Count'");
   					return false;
   				}
   			}
	   		if(grantVolLastYrValue!="" && grantVolLastYrValue2by3!=""){
   				if(+grantVolLastYrValue2by3 > +grantVolLastYrValue){
   					alert("'Institutions functioning under 2/3 Grant-Voluntary Organizations-Amount sanctioned for last year' should be less than 'Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for last year'");
   					return false;
   				}
   			}
	   		if(grantVolCurrentYrValue!="" && grantVolCurrentYrValue2by3!=""){
   				if(+grantVolCurrentYrValue2by3 > +grantVolCurrentYrValue){
   					alert("'Institutions functioning under 2/3 Grant-Voluntary Organizations-Amount sanctioned for current year' should be less than 'Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for current year'");
   					return false;
   				}
   			}	   		
	   		
	   	}else if(classificationName=='Finance'){
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Male sterilisation' && generalName=='Compensation'){
					allotedMaleCompValue = +indicatorValue;
			}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Male sterilisation' && generalName=='Doctor Fees'){
				allotedMaleDocFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Male sterilisation' && generalName=='Para medical Fees'){
				allotedMaleMedFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Male sterilisation' && generalName=='Motivator Fees'){
				allotedMaleMotiFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Female sterilisation' && generalName=='Compensation'){
				allotedFemaleCompValue = +indicatorValue;
			}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Female sterilisation' && generalName=='Doctor Fees'){
				allotedFemaleDocFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Female sterilisation' && generalName=='Para medical Fees'){
				allotedFemaleMedFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Allotted' && generalType=='Female sterilisation' && generalName=='Motivator Fees'){
				allotedFemaleMotiFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Male sterilisation' && generalName=='Compensation'){
	   			spentMaleCompValue = +indicatorValue;	
			}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Male sterilisation' && generalName=='Doctor Fees'){
	   			spentMaleDocFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Male sterilisation' && generalName=='Para medical Fees'){
	   			spentMaleMedFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Male sterilisation' && generalName=='Motivator Fees'){
	   			spentMaleMotiFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Female sterilisation' && generalName=='Compensation'){
	   			spentFemaleCompValue = +indicatorValue;
			}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Female sterilisation' && generalName=='Doctor Fees'){
	   			spentFemaleDocFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Female sterilisation' && generalName=='Para medical Fees'){
	   			spentFemaleMedFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Spent' && generalType=='Female sterilisation' && generalName=='Motivator Fees'){
	   			spentFemaleMotiFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Male sterilisation' && generalName=='Compensation'){
	   			surrenderedMaleCompValue = +indicatorValue;	
			}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Male sterilisation' && generalName=='Doctor Fees'){
	   			surrenderedMaleDocFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Male sterilisation' && generalName=='Para medical Fees'){
	   			surrenderedMaleMedFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Male sterilisation' && generalName=='Motivator Fees'){
	   			surrenderedMaleMotiFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Female sterilisation' && generalName=='Compensation'){
	   			surrenderedFemaleCompValue = +indicatorValue;
			}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Female sterilisation' && generalName=='Doctor Fees'){
	   			surrenderedFemaleDocFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Female sterilisation' && generalName=='Para medical Fees'){
	   			surrenderedFemaleMedFeeValue = +indicatorValue;
	   		}
	   		if(indicatorName=='Component Wise (Non-Salary) Budget Surrendered / Transferred' && generalType=='Female sterilisation' && generalName=='Motivator Fees'){
	   			surrenderedFemaleMotiFeeValue = +indicatorValue;
	   		}
	   	}
	   
	   /* else if(classificationName=='Accredited Private Hospital'){
	   		if(indicatorName=='Total No. of accredited Pvt. Hosptitals at end of the month'){
				indValue1 = +indicatorValue;
			}
	   		if(indicatorName == 'No. of  aaccredited Pvt. Hospitals at beginning of the Month' || indicatorName == 'No. Pvt. Hospitals applied for accredtion for the current month'){
				if(indValue2 == ""){
					 indValue2 = +indicatorValue;
				}
				else{
					indValue2 = +indValue2 + +indicatorValue;	
				}
			}
	   	} */
			return true;
}

function alertOnValidation(classificationName,indValue1,indValue2,grantLocCountValue,grantLocLastYrValue,
		   grantLocCurrentYrValue,grantVolCountValue,grantVolLastYrValue,grantVolCurrentYrValue,grantLocCountValue100,
		   grantLocLastYrValue100,grantLocCurrentYrValue100,grantVolCountValue100,grantVolLastYrValue100,grantVolCurrentYrValue100,
		   grantLocCountValue2by3,grantLocLastYrValue2by3,grantLocCurrentYrValue2by3,grantVolCountValue2by3,grantVolLastYrValue2by3,grantVolCurrentYrValue2by3){
	   if(classificationName=='Equipment'){
		  //Equipment Supplied = Equipment in Working Condition + Equipment Repairable + Equipment to be Condemned
		   if(indValue1!=indValue2){
				alert("'Equipment Supplied' should be equal to the total of 'Equipment in Working Condition', 'Equipment Repairable' and 'Equipment to be Condemned'");
				return false;
		   }
	   }else if(classificationName=='Vehicles'){
		   //Total Number of Family Welfare Vehicles Supplied = Total Number of Family Welfare Vehicles On-Road + Total Number of Family Welfare Vehicles Off-Road (more than 1 Month) + Total Number of Family Welfare Vehicles Off-Road (more than 3 Month) + Total Number of Family Welfare Vehicles Condemned
		   if(indValue1!=indValue2){
				alert("'Total Number of Family Welfare Vehicles Supplied' should be equal to the total of 'Total Number of Family Welfare Vehicles On-Road', 'Total Number of Family Welfare Vehicles Off-Road (more than 1 Month)', 'Total Number of Family Welfare Vehicles Off-Road (more than 3 Month)' and 'Total Number of Family Welfare Vehicles Condemned'");
				return false;
		   }
	   }else if(classificationName=='Drugs Supply'){
		   //Budget Allotted (Pass-Book) = Cost of Drugs Lifted as per Pass-Book + Amount Surrendered / Transferred
		   if(indValue1!=indValue2){
				alert("'Budget Allotted (Pass-Book)' should be equal to the total of 'Cost of Drugs Lifted as per Pass-Book' and 'Amount Surrendered / Transferred'");
				return false;
		   }
	   }else if(classificationName=='Grants'){
		   //Institutions functioning under Grant-Local Body-Count = Institutions functioning under 100% Grant-Local Body-Count + Institutions functioning under 2/3 Grant-Local Body-Count
		   if(grantLocCountValue!=(+grantLocCountValue100 + +grantLocCountValue2by3)){
				alert("'Institutions functioning under Grant-Local Body-Count' should be equal to the total of 'Institutions functioning under 100% Grant-Local Body-Count' and 'Institutions functioning under 2/3 Grant-Local Body-Count'");
				return false;
		   }
		   //Institutions functioning under Grant-Local Body-Amount sanctioned for last year = Institutions functioning under 100% Grant-Local Body-Amount sanctioned for last year + Institutions functioning under 2/3 Grant-Local Body-Amount sanctioned for last year
		   if(grantLocLastYrValue!=(+grantLocLastYrValue100 + +grantLocLastYrValue2by3)){
				alert("'Institutions functioning under Grant-Local Body-Amount sanctioned for last year' should be equal to the total of 'Institutions functioning under 100% Grant-Local Body-Amount sanctioned for last year' and 'Institutions functioning under 2/3 Grant-Local Body-Amount sanctioned for last year'");
				return false;
		   }
		   //Institutions functioning under Grant-Local Body-Amount sanctioned for current year = Institutions functioning under 100% Grant-Local Body-Amount sanctioned for current year + Institutions functioning under 2/3 Grant-Local Body-Amount sanctioned for current year
		   if(grantLocCurrentYrValue!=(+grantLocCurrentYrValue100 + +grantLocCurrentYrValue2by3)){
				alert("'Institutions functioning under Grant-Local Body-Amount sanctioned for current year' should be equal to the total of 'Institutions functioning under 100% Grant-Local Body-Amount sanctioned for current year' and 'Institutions functioning under 2/3 Grant-Local Body-Amount sanctioned for current year'");
				return false;
		   }
		   //Institutions functioning under Grant-Voluntary Organizations-Count = Institutions functioning under 100% Grant-Voluntary Organizations-Count + Institutions functioning under 2/3 Grant-Voluntary Organizations-Count
		   if(grantVolCountValue!=(+grantVolCountValue100 + +grantVolCountValue2by3)){
				alert("'Institutions functioning under Grant-Voluntary Organizations-Count' should be equal to the total of 'Institutions functioning under 100% Grant-Voluntary Organizations-Count' and 'Institutions functioning under 2/3 Grant-Voluntary Organizations-Count'");
				return false;
		   }
		   //Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for last year = Institutions functioning under 100% Grant-Voluntary Organizations-Amount sanctioned for last year + Institutions functioning under 2/3 Grant-Voluntary Organizations-Amount sanctioned for last year
		   if(grantVolLastYrValue!=(+grantVolLastYrValue100 + +grantVolLastYrValue2by3)){
				alert("'Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for last year' should be equal to the total of 'Institutions functioning under 100% Grant-Voluntary Organizations-Amount sanctioned for last year' and 'Institutions functioning under 2/3 Grant-Voluntary Organizations-Amount sanctioned for last year'");
				return false;
		   }
		   //Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for current year = Institutions functioning under 100% Grant-Voluntary Organizations-Amount sanctioned for current year + Institutions functioning under 2/3 Grant-Voluntary Organizations-Amount sanctioned for current year
		   if(grantVolCurrentYrValue!=(+grantVolCurrentYrValue100 + +grantVolCurrentYrValue2by3)){
				alert("'Institutions functioning under Grant-Voluntary Organizations-Amount sanctioned for current year' should be equal to the total of 'Institutions functioning under 100% Grant-Voluntary Organizations-Amount sanctioned for current year' and 'Institutions functioning under 2/3 Grant-Voluntary Organizations-Amount sanctioned for current year'");
				return false;
		   }
	   }else if(classificationName=='Finance'){
		   //Component Wise (Non-Salary) Budget Allotted-Male sterilization-Compensation = Component Wise (Non-Salary) Budget Spent-Male sterilization-Compensation + Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Compensation
		   if(allotedMaleCompValue!=(+spentMaleCompValue + +surrenderedMaleCompValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Male sterilization-Compensation' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Male sterilization-Compensation' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Compensation'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Male sterilization-Doctor Fees = Component Wise (Non-Salary) Budget Spent-Male sterilization-Doctor Fees + Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Doctor Fees
		   if(allotedMaleDocFeeValue!=(+spentMaleDocFeeValue + +surrenderedMaleDocFeeValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Male sterilization-Doctor Fees' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Male sterilization-Doctor Fees' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Doctor Fees'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Male sterilization-Para medical Fees = Component Wise (Non-Salary) Budget Spent-Male sterilization-Para medical Fees + Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Para medical Fees
		   if(allotedMaleMedFeeValue!=(+spentMaleMedFeeValue + +surrenderedMaleMedFeeValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Male sterilization-Para medical Fees' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Male sterilization-Para medical Fees' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Para medical Fees'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Male sterilization-Motivator Fees = Component Wise (Non-Salary) Budget Spent-Male sterilization-Motivator Fees + Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Motivator Fees
		   if(allotedMaleMotiFeeValue!=(+spentMaleMotiFeeValue + +surrenderedMaleMotiFeeValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Male sterilization-Motivator Fees' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Male sterilization-Motivator Fees' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Male sterilization-Motivator Fees'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Female sterilization-Compensation = Component Wise (Non-Salary) Budget Spent-Female sterilization-Compensation + Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Compensation
		   if(allotedFemaleCompValue!=(+spentFemaleCompValue + +surrenderedFemaleCompValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Female sterilization-Compensation' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Female sterilization-Compensation' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Compensation'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Female sterilization-Doctor Fees = Component Wise (Non-Salary) Budget Spent-Female sterilization-Doctor Fees + Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Doctor Fees
		   if(allotedFemaleDocFeeValue!=(+spentFemaleDocFeeValue + +surrenderedFemaleDocFeeValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Female sterilization-Doctor Fees' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Female sterilization-Doctor Fees' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Doctor Fees'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Female sterilization-Para medical Fees = Component Wise (Non-Salary) Budget Spent-Female sterilization-Para medical Fees + Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Para medical Fees
		   if(allotedFemaleMedFeeValue!=(+spentFemaleMedFeeValue + +surrenderedFemaleMedFeeValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Female sterilization-Para medical Fees' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Female sterilization-Para medical Fees' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Para medical Fees'");
				return false;
		   }
		   //Component Wise (Non-Salary) Budget Allotted-Female sterilization-Motivator Fees = Component Wise (Non-Salary) Budget Spent-Female sterilization-Motivator Fees + Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Motivator Fees
		   if(allotedFemaleMotiFeeValue!=(+spentFemaleMotiFeeValue + +surrenderedFemaleMotiFeeValue)){
				alert("'Component Wise (Non-Salary) Budget Allotted-Female sterilization-Motivator Fees' should be equal to the total of 'Component Wise (Non-Salary) Budget Spent-Female sterilization-Motivator Fees' and 'Component Wise (Non-Salary) Budget Surrendered / Transferred-Female sterilization-Motivator Fees'");
				return false;
		   }
	   }
	   /*else if(classificationName=='Accredited Private Hospital'){
		   if(indValue2 > indValue1){
				alert("'Total No. of accredited Pvt. Hosptitals at end of the month' should be greater or equal to the total of 'No. of  aaccredited Pvt. Hospitals at beginning of the Month' and 'No. Pvt. Hospitals applied for accredtion for the current month'");
				return false;
		   }
	   }*/
	   return true;
}