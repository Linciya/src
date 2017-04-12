function validateCharacterField(indicatorName,indicatorValue) {
	
	if(indicatorValue!="" && !isValidCharacter(indicatorValue)){
			alert("Please enter valid character in '"+indicatorName+"' field");
			return false;
	}
	if(indicatorValue!="" && (indicatorName=='Whether HR for CPMU recruited(Yes/No)'
		|| indicatorName=='Whether New UPHCs started (meanwhile the completion of new UPHC civilworks)(Yes/No)'
			|| indicatorName=='Whether Planning and mapping is done for UPHC & ANM service Area and Copy Submitted to SHS (Yes/No)'
				|| indicatorName=='Whether the new building for UPHC be constructed at the same site (Yes/No)'
					|| indicatorName=='Whether the sample declared as good quality ( Yes / No )'
						|| indicatorName=='Whether the site for new UPHC identified (Yes/No)'
							|| indicatorName=='Whether ULB selected under NUHM (Yes or No)'
								|| indicatorName=='CHS Formed (Yes / No)'
									|| indicatorName=='Functional in condition (Yes/No)'
										|| indicatorName=='Genset avilable for water supply (Yes/No)'
											|| indicatorName=='TV scrolls done ( Yes or No )'
												|| indicatorName=='Whether computers and accessories purchased for UPHCs (Yes/No)'
													|| indicatorName=='Whether Drugs purchased for UPHCs (Yes/No)'
														|| indicatorName=='whether Funds received for Office expenses & outreach camps (Yes/No)'
															|| indicatorName=='Whether Gambusia / Guppy Fish introduced in the ULB ( Yes / No )'
																|| indicatorName=='whether Untied funds received by all UPHC from CHS (Yes/No)'
																	|| indicatorName=='Whether Urban Malaria Scheme (UMS) available (Yes/No)'
																		|| indicatorName=='Whether Urban Malaria Scheme (UMS) available (Yes/No)')){
		
		var upperCaseIndicatorValue = indicatorValue.toUpperCase();
		if(!(upperCaseIndicatorValue=='YES' 
			|| upperCaseIndicatorValue=='NO')){
			alert("Please enter 'Yes or No ' in '"+indicatorName+"' field");
			return false;
		}
		
	}
	 return true;
}

function validateNumericField(indicatorName,indicatorValue) {
	
	if(!isNumeric(indicatorValue)){
   		alert("Please Enter Numeric value in '"+indicatorName+"' field");
   		return false;
	}/*else{
			if(!isValidDecimal(indicatorValue)){
				alert("Please enter upto three decimal in '"+indicatorName+"' field");
				return false;
	   }
	}*/
	 return true;
}

function validateDecimalField(indicatorName,indicatorValue) {
	if(!isValidDecimal(indicatorValue)){
		alert("Please enter upto three decimal in '"+indicatorName+"' field");
		return false;
	}
	 return true;
}