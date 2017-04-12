
<%@page import="gov.shdrc.util.DFWEmployeeForm"%>
<%@page import="gov.shdrc.util.Promotion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.Demographic"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>DFW Change Employee Form</title>
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!--Loading Handsontable (full distribution that includes all dependencies apart from jQuery) -->
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css">
		<!--Loading demo dependencies. They are used here only to enhance the examples on this page-->
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css">
		<script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>
		
		<script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script>
		<link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
		
		<link rel="stylesheet" href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css">
		  
		<script src="js/script.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />
		<style type="text/css">
		input:read-only {
        	background-color: #F5F5F5;
        }

		</style>
		<script type="text/javascript">
			function OnLoad(){
				var frequency='<%= request.getAttribute("frequency") %>';
				$( ".datepicker" ).datepicker({
				dateFormat: 'dd-mm-yy',	
				showOn: "both",
				buttonImageOnly: true,
				buttonImage: "images/cal_icon.gif",
				changeMonth: true,
				changeYear: true,
				yearRange: "-70:+0"
				
				});
				document.getElementById('ugMajor').readOnly=true;
				document.getElementById('pgMajor').readOnly=true;
				document.getElementById('others').readOnly=true;
				<%
					DFWEmployeeForm employeeDetails =null;
					DFWEmployeeForm qualificationDetails =null;
					Promotion promotionDetails = null;
					if(request.getAttribute("employeeDetails")!=null)
						employeeDetails =(DFWEmployeeForm)request.getAttribute("employeeDetails");	
					if(request.getAttribute("qualificationDetails")!=null)
						qualificationDetails =(DFWEmployeeForm)request.getAttribute("qualificationDetails");
					if(request.getAttribute("promotionDetails")!=null)
						promotionDetails =(Promotion)request.getAttribute("promotionDetails");
				%>
				var designation = document.getElementById('designation');
				var selectedDesignation='<%= employeeDetails.getDesignation()%>';
				for (var i = 0; i < designation.length; i++) {
				    if (designation.options[i].value == selectedDesignation) {
				    	designation.selectedIndex = i;
				        break;  
				    }
				}
				 var groupCategory = document.getElementById('groupCategory');
				 var selectedGroupCategory='<%= employeeDetails.getGroupCategory()%>';
				 for (var i = 0; i < groupCategory.length; i++) {
				 	if (groupCategory.options[i].value == selectedGroupCategory) {
				 		groupCategory.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var recruitedBy = document.getElementById('recruitedBy');
				 var selectedRecruitedBy='<%= employeeDetails.getRecruitedBy()%>';
				 for (var i = 0; i < recruitedBy.length; i++) {
				 	if (recruitedBy.options[i].value == selectedRecruitedBy) {
				 		recruitedBy.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var community = document.getElementById('community');
				 var selectedCommunity='<%= employeeDetails.getCommunity()%>';
				 for (var i = 0; i < community.length; i++) {
				 	if (community.options[i].value == selectedCommunity) {
				 		community.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var firstAppointmentPost = document.getElementById('firstAppointmentPost');
				 var selectedFirstAppointmentPost='<%= employeeDetails.getFirstAppointmentPost()%>';
				 for (var i = 0; i < firstAppointmentPost.length; i++) {
				 	if (firstAppointmentPost.options[i].value == selectedFirstAppointmentPost) {
				 		firstAppointmentPost.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var incrementDueMonth = document.getElementById('incrementDueMonth');
				 var selectedIncrementDueMonth='<%= employeeDetails.getIncrementDueMonth()%>';
				 for (var i = 0; i < incrementDueMonth.length; i++) {
				 	if (incrementDueMonth.options[i].value == selectedIncrementDueMonth) {
				 		incrementDueMonth.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var physicalStatus = document.getElementById('physicalStatus');
				 var selectedPhysicalStatus='<%= employeeDetails.getPhysicalStatus()%>';
				 for (var i = 0; i < physicalStatus.length; i++) {
				 	if (physicalStatus.options[i].value == selectedPhysicalStatus) {
				 		physicalStatus.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var punishments = document.getElementById('punishments');
				 var selectedPunishments='<%= employeeDetails.getPunishments()%>';
				 for (var i = 0; i < punishments.length; i++) {
				 	if (punishments.options[i].value == selectedPunishments) {
				 		punishments.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var retirementType = document.getElementById('retirementType');
				 var selectedRetirementType='<%= employeeDetails.getRetirementType()%>';
				 for (var i = 0; i < retirementType.length; i++) {
				 	if (retirementType.options[i].value == selectedRetirementType) {
				 		retirementType.selectedIndex = i;
			   	        break;
				 	}
				 }
				 
				 var maritalStatus = document.getElementById('maritalStatus');
				 var selectedMaritalStatus='<%= employeeDetails.getMaritalStatus()%>';
				 for (var i = 0; i < maritalStatus.length; i++) {
				 	if (maritalStatus.options[i].value == selectedMaritalStatus) {
				 		maritalStatus.selectedIndex = i;
			   	        break;
				 	}
				 }
				 var nomineeDetails = document.getElementById('nomineeDetails');
				 var selectedNomineeDetails='<%= employeeDetails.getNomineeDetails()%>';
				 for (var i = 0; i < nomineeDetails.length; i++) {
				 	if (nomineeDetails.options[i].value == selectedNomineeDetails) {
				 		nomineeDetails.selectedIndex = i;
			   	        break;
				 	}
				 }	
				 var qualification = document.getElementById('qualification');
				 var selectedQualification='<%= qualificationDetails.getQualification()%>';
				 for (var i = 0; i < qualification.length; i++) {
				 	if (qualification.options[i].value == selectedQualification) {
				 		qualification.selectedIndex = i;
			   	        break;
				 	}
				 }
				 
				 <%if(promotionDetails!=null){%>
				 
					 var promotionType = document.getElementById('promotionType');
					 var selectedPromotionType='<%= promotionDetails.getPromotionType()%>';
					 for (var i = 0; i < promotionType.length; i++) {
					 	if (promotionType.options[i].value == selectedPromotionType) {
					 		promotionType.selectedIndex = i;
				   	        break;
					 	}
					 }
					 var promotion1 = document.getElementById('promotion1');
					 var selectedPromotion='<%= promotionDetails.getPromotion()%>';
					 for (var i = 0; i < promotion1.length; i++) {
					 	if (promotion1.options[i].value == selectedPromotion) {
					 		promotion1.selectedIndex = i;
				   	        break;
					 	}
					 }				 
				<%}%>					 
				document.dfwEmployeeForm.gender.value='<%= employeeDetails.getGender()%>';			
			}
			
			function closeWindow(){
		    	window.close();
			}
			  
			function doSubmit(){
				var form = $('#dfwEmployeeForm');
				districtId = document.getElementById("districtId").value;
				institutionId = document.getElementById("institutionId").value;
				var validateFlag=validation();
				if(validateFlag){
					var validationFlag=validate();
					if(validationFlag){
						var qualifyFlag=validateQualification();
						if(qualifyFlag){
							var promotionFlag=validatePromotion();
							if(promotionFlag){
								var leaveFlag=validateLeave();
								if(leaveFlag){
									var formFlag=true;
									if(formFlag){
										document.getElementById('submit').disabled=true;
										$.ajax({
											url:'dfwChangeEmployee.do',
											type: "POST",	
											'data':  form.serialize(),
											success: function (result) {
												alert(result);
											},
											error: function (xhr, status, error) {
								                alert("Internal Error Occured-Please Contact System Administrator");
										    }});
									}
								}
							}
						}		
					}
				}
			}
			  
		  	function validation(){
				var e1 = document.getElementById('designation');
				var designation = e1.options[e1.selectedIndex].value;
				var payBand = document.getElementById('payBand').value; 
				var e2 = document.getElementById('groupCategory');
				var groupCategory = e2.options[e2.selectedIndex].value;
				var dutyPay = document.getElementById('dutyPay').value; 
				var e3 = document.getElementById('recruitedBy');
				var recruitedBy = e3.options[e3.selectedIndex].value;
				var gradePay = document.getElementById('gradePay').value; 
				var e4 = document.getElementById('community');
				var community = e4.options[e4.selectedIndex].value;
				var dobDate = document.getElementById('dobDate').value; 
				var e5 = document.getElementById('qualification');
				var qualification = e5.options[e5.selectedIndex].value;
				var e6 = document.getElementById('firstAppointmentPost');
				var firstAppointmentPost = e6.options[e6.selectedIndex].value;
				var firstAppointmentDOJ = document.getElementById('firstAppointmentDOJ').value; 
				var e7 = document.getElementById('incrementDueMonth');
				var incrementDueMonth = e7.options[e7.selectedIndex].value;
				var e8 = document.getElementById('physicalStatus');
				var physicalStatus = e8.options[e8.selectedIndex].value;
				var e9 = document.getElementById('punishments');
				var punishments = e9.options[e9.selectedIndex].value;
				var e10 = document.getElementById('nomineeDetails');
				var nomineeDetails = e10.options[e10.selectedIndex].value;
				var workingLocation = document.getElementById('workingLocation').value;
				var e11 = document.getElementById('maritalStatus');
				var maritalStatus = e11.options[e11.selectedIndex].value;
			
				if(designation == ""){
					alert('Please choose the designation of the Employee');
					document.getElementById('designation').focus();
					return false;
				}
				if(payBand == ""){
					alert('Please enter the payband of the Employee');
					document.getElementById('payBand').focus();
					return false;
				}
				if(groupCategory == ""){
					alert('Please choose the groupcategory of the Employee');
					document.getElementById('groupCategory').focus();
					return false;
				}
				if(dutyPay == ""){
					alert('Please enter the dutypay of the Employee');
					document.getElementById('dutyPay').focus();
					return false;
				}
				if(recruitedBy == ""){
					alert('Please choose the Recruiter of the Employee');
					document.getElementById('recruitedBy').focus();
					return false;
				}
				if(gradePay == ""){
					alert('Please enter the gradepay of the Employee');
					document.getElementById('gradePay').focus();
					return false;
				}
				if(community == ""){
					alert('Please choose the Community of the Employee');
					document.getElementById('community').focus();
					return false;
				}
				if(dobDate == ""){
					alert('Please enter Date of birth of the Employee');
					document.getElementById('dobDate').focus();
					return false;
				}
				if(qualification == ""){
					alert('Please enter the qualification of the Employee');
					document.getElementById('qualification').focus();
					return false;
				}
				if(firstAppointmentPost == ""){
					alert('Please choose first appointed post of the Employee');
					document.getElementById('firstAppointmentPost').focus();
					return false;
				}
				if(firstAppointmentDOJ == ""){
					alert('Please enter first appointment date of joining of the Employee');
					document.getElementById('firstAppointmentDOJ').focus();
					return false;
				}
				if(incrementDueMonth == ""){
					alert('Please choose Increment Due Month of the Employee');
					document.getElementById('incrementDueMonth').focus();
					return false;
				}
				if(physicalStatus == ""){
					alert('Please enter the physical status of the Employee');
					document.getElementById('physicalStatus').focus();
					return false;
				}
				 if(punishments == ""){
					alert('Please enter the punishments of the Employee');
					document.getElementById('punishments').focus();
					return false;
				}
				 if(nomineeDetails == ""){
					alert('Please choose whether the Employee has submitted Nominee details or not');
					document.getElementById('nomineeDetails').focus();
					return false;
				}
				 if(workingLocation == ""){
						alert('Please enter the Working Location of the Employee');
						document.getElementById('workingLocation').focus();
						return false;
					}
				 if(maritalStatus == ""){
						alert('Please enter the Marital Status of the Employee');
						document.getElementById('maritalStatus').focus();
						return false;
					}
				return true;
			}		
				
			function validate(){
				var firstAppointmentDOJ = document.getElementById('firstAppointmentDOJ').value;
				var dateOfRegularisation = document.getElementById('dateOfRegularisation').value; 
				dateFirst = firstAppointmentDOJ.split('-');
				dateSecond = dateOfRegularisation.split('-');
				var firstAppointDOJ = new Date(dateFirst[2], dateFirst[1], dateFirst[0]); //Year, Month, Date
				var dateOfRegularise = new Date(dateSecond[2], dateSecond[1], dateSecond[0]); 	
				var dateOfProbationDecleration = document.getElementById('dateOfProbationDecleration').value; 
				dateThird = dateOfProbationDecleration.split('-');
				var dateOfProbation = new Date(dateThird[2], dateThird[1], dateThird[0]);
				var dateOfRetirement = document.getElementById('dateOfRetirement').value; 
				dateFourth = dateOfRetirement.split('-');
				var dateOfRetire = new Date(dateFourth[2], dateFourth[1], dateFourth[0]);
				var slsDueDate = document.getElementById('slsDueDate').value; 
				dateFifth = slsDueDate.split('-');
				var slsDate = new Date(dateFifth[2], dateFifth[1], dateFifth[0]);	
				var dobDate = document.getElementById('dobDate').value;
				dateSixth = dobDate.split('-');
				var dateOfBirth = new Date(dateSixth[2], dateSixth[1], dateSixth[0]);
				
				if(dateOfRegularise<=firstAppointDOJ)
				{
					alert('Date of Regularisation should be greater than Date of Joining');
					document.getElementById('dateOfRegularisation').focus();
					return false;
				}
				if(dateOfProbation<=dateOfRegularise)
				{
					alert('Date of Probation Declaration should be greater than Date of Regularisation');
					document.getElementById('dateOfProbationDecleration').focus();
					return false;
				}
				if(dateOfRetire<=dateOfProbation)
				{
					alert('Date of Retirement should be greater than Date of Probation Declaration');
					document.getElementById('dateOfRetirement').focus();
					return false;
				}
				if(slsDate<=firstAppointDOJ)
				{
					alert('SLS Due Date should be greater than Date of Joining');
					document.getElementById('slsDueDate').focus();
					return false;
				}
				if(firstAppointDOJ<=dateOfBirth)
				{
					alert('First Appointment Date of Joining should be greater than Date of Birth');
					document.getElementById('firstAppointmentDOJ').focus();
					return false;
				}
				return true;	
			}
			
			function validateQualification(){
				var qualify = document.getElementById('qualification');
				var qualification = qualify.options[qualify.selectedIndex].value;
				var ugMajor = document.getElementById('ugMajor').value;
				var pgMajor = document.getElementById('pgMajor').value;
				var others = document.getElementById('others').value;
				if(qualification=='UG Deg'){
					if( ugMajor == ""){
						alert('Please enter UG Degree of the Employee');
						document.getElementById('ugMajor').focus();
						return false;
					}
				}
				if(qualification=='PG Deg'){
					if( ugMajor == ""){
						alert('Please enter UG Degree of the Employee');
						document.getElementById('ugMajor').focus();
						return false;
					}
					else if (pgMajor == ""){
						alert('Please enter PG Degree of the Employee');
						document.getElementById('pgMajor').focus();
						return false;
					}
				}
				if(qualification=='Diploma'||qualification=='Others'){
					if( others == ""){
						alert('Please specify the course name');
						document.getElementById('others').focus();
						return false;
					}
				}
				return true;
			} 
			
			function changeQualification(){
				var qualify = document.getElementById('qualification');
				var qualification = qualify.options[qualify.selectedIndex].value;
				if(qualification=='SSLC'|| qualification=='HSC'){
					document.getElementById('ugMajor').readOnly=true;
					document.getElementById('pgMajor').readOnly=true;
					document.getElementById('others').readOnly=true;
				}
				if(qualification=='UG Deg'){
					document.getElementById('ugMajor').readOnly=false;
					document.getElementById('pgMajor').readOnly=true;
					document.getElementById('others').readOnly=true;
				}
				if(qualification=='PG Deg'){
					document.getElementById('ugMajor').readOnly=false;
					document.getElementById('pgMajor').readOnly=false;
					document.getElementById('others').readOnly=true;
				}
				if(qualification=='Diploma'||qualification=='Others'){
					document.getElementById('ugMajor').readOnly=true;
					document.getElementById('pgMajor').readOnly=true;
					document.getElementById('others').readOnly=false;
				}
			}
			
			function validateLeave(){
				var firstAppointmentDOJ = document.getElementById('firstAppointmentDOJ').value;
				dateFirst = firstAppointmentDOJ.split('-');
				var firstAppointDOJ = new Date(dateFirst[2], dateFirst[1], dateFirst[0]); 			
				var ELTakenFrom = document.getElementById('ELTakenFrom').value;
				dateSecond = ELTakenFrom.split('-');
				var ELfrom = new Date(dateSecond[2], dateSecond[1], dateSecond[0]); 			
				var ELTakenTo = document.getElementById('ELTakenTo').value;
				dateThird = ELTakenTo.split('-');
				var ELto = new Date(dateThird[2], dateThird[1], dateThird[0]); 			
				var MLTakenFrom = document.getElementById('MLTakenFrom').value;
				dateFourth = MLTakenFrom.split('-');
				var MLfrom = new Date(dateFourth[2], dateFourth[1], dateFourth[0]); 			
				var MLTakenTo = document.getElementById('MLTakenTo').value;
				dateFifth = MLTakenTo.split('-');
				var MLto = new Date(dateFifth[2], dateFifth[1], dateFifth[0]); 			
				var UELTakenFrom = document.getElementById('UELTakenFrom').value;
				dateSixth = UELTakenFrom.split('-');
				var UELfrom = new Date(dateSixth[2], dateSixth[1], dateSixth[0]); 			
				var UELTakenTo = document.getElementById('UELTakenTo').value;
				dateSeventh = UELTakenTo.split('-');
				var UELto = new Date(dateSeventh[2], dateSeventh[1], dateSeventh[0]); 
				var balanceEL = document.getElementById('balanceEL').value;
				var balanceML = document.getElementById('balanceML').value;
				var balanceUEL = document.getElementById('balanceUEL').value;
				
				if(ELfrom<=firstAppointDOJ)
				{
					alert('EL taken from should be greater than Date of Joining');
					document.getElementById('ELTakenFrom').focus();
					return false;
				}
				if(MLfrom<=firstAppointDOJ)
				{
					alert('ML taken from should be greater than Date of Joining');
					document.getElementById('MLTakenFrom').focus();
					return false;
				}
				if(UELfrom<=firstAppointDOJ)
				{
					alert('UEL taken from should be greater than Date of Joining');
					document.getElementById('UELTakenFrom').focus();
					return false;
				}
				if(ELto<ELfrom)
				{
					alert('EL taken to should be greater than EL taken from');
					document.getElementById('ELTakenTo').focus();
					return false;
				}
				if(MLto<MLfrom)
				{
					alert('ML taken to should be greater than ML taken from');
					document.getElementById('MLTakenTo').focus();
					return false;
				}
				if(UELto<UELfrom)
				{
					alert('UEL taken to should be greater than UEL taken from');
					document.getElementById('UELTakenTo').focus();
					return false;
				}
				if(balanceEL>240)
				{
				alert('Balance EL should be less than 240 days');
				document.getElementById('balanceEL').focus();
				return false;
				}
				if(balanceML>180)
				{
				alert('Balance ML should be less than 180 days');
				document.getElementById('balanceML').focus();
				return false;
				}
				if(balanceUEL>540)
				{
				alert('Balance UEL should be less than 540 days');
				document.getElementById('balanceUEL').focus();
				return false;
				}
					return true;
				}
			
			function validatePromotion(){
				 var selectedPromotionType='<%= promotionDetails.getPromotionType()%>';
				 if(selectedPromotionType!='null'){
					 var promotionType = document.getElementById('promotionType');
					 var promoteType = promotionType.options[promotionType.selectedIndex].value;
					 var previousPromotionType = selectedPromotionType.substring(selectedPromotionType.length-1,selectedPromotionType.length);
					 var currentPromotionType = promoteType.substring(promoteType.length-1,promoteType.length);
					 var promotion1 = document.getElementById('promotion1');
					 var previousPromotion='<%= promotionDetails.getPromotion()%>';
					 var currentPromotion = promotion1.options[promotion1.selectedIndex].value;
					 var promotion1DOJ = document.getElementById('promotion1DOJ').value;
					 dateFirst = promotion1DOJ.split('-');
					 var currentPromotionDOJ = new Date(dateFirst[2], dateFirst[1], dateFirst[0]);
					 var selectedPromotionDOJ='<%= promotionDetails.getPromotionDOJ()%>';
					 dateSecond = selectedPromotionDOJ.split('-');
					 var previousPromotionDOJ = new Date(dateSecond[2], dateSecond[1], dateSecond[0]);
						 
					 if(currentPromotionType<previousPromotionType){
						 alert('Promotion chosen should be greater than the previous');
						 document.getElementById('promotionType').focus();
						 return false;
					 }else if(currentPromotionType==(+previousPromotionType+1)){
						 if(promotion1==""){
							 alert('Please choose the post obtained after promotion');
							 document.getElementById('promotion1').focus();
							 return false;
						 }
						 else if(currentPromotion == previousPromotion){
							 alert('Please choose different post obtained after promotion');
							 document.getElementById('promotion1').focus();
							 return false;
							 }
					 	 else {
							if(promotion1DOJ==""){
								alert('Enter Date of joining of the promotion obtained');
								document.getElementById('promotion1DOJ').focus();
								return false;
							}
							else if(currentPromotionDOJ<=previousPromotionDOJ){
									alert('Current Promotion Date of joining should be greater than previous promotion Date of joining');
									document.getElementById('promotion1DOJ').focus();
									return false;
							}
						}
					 }else{
						 alert('Please choose the next immediate Promotion Type');
						 document.getElementById('promotionType').focus();
						 return false;
					 }
					 
				 }	 
				return true;
			}
			
			function setELTakenDays(){
				var elTakenFrom = document.getElementById('ELTakenFrom').value;
				var elTakenTo = document.getElementById('ELTakenTo').value;
				var elTakenDays=getDaysBetweenTwoDates(elTakenFrom,elTakenTo);
				document.getElementById('ELTakenDays').value=elTakenDays;
		 	}

			function setMLTakenDays(){
				var mlTakenFrom = document.getElementById('MLTakenFrom').value;
				var mlTakenTo = document.getElementById('MLTakenTo').value;
				var mlTakenDays=getDaysBetweenTwoDates(mlTakenFrom,mlTakenTo);
				document.getElementById('MLTakenDays').value=mlTakenDays;
		 	}
			function setUELTakenDays(){
				var uelTakenFrom = document.getElementById('UELTakenFrom').value;
				var uelTakenTo = document.getElementById('UELTakenTo').value;
				var uelTakenDays=getDaysBetweenTwoDates(uelTakenFrom,uelTakenTo);
				document.getElementById('UELTakenDays').value=uelTakenDays;
		 	}
			
			function isValidDateSelection(selectedDate) {
				
			    var date = selectedDate.value.substring(0, 2);
			    var month = selectedDate.value.substring(3, 5);
			    var year = selectedDate.value.substring(6, 10);
			 
			    var dateToCompare = new Date(year, month - 1, date);
			    var currentDate = document.getElementById('currentDate').value;
				var currentDay = currentDate.substring(0, 2);
				var currentMonth = currentDate.substring(3, 5);
				var currentYear = currentDate.substring(6, 10);
			    var currentDate = new Date(currentYear,currentMonth-1,currentDay);
			 
			    if (dateToCompare > currentDate) {
			    	selectedDate.value="";
			        alert("The selected date should be less than or equal to Current Date ");
			        return false;
			    }
			    return true;
			}
		
		  </script>	 	
	</head>
	
	<body onload="OnLoad();">
		<form name="dfwEmployeeForm" id="dfwEmployeeForm">
		<div>
			<div class="container" style="width:70%;border: solid 3px #007297;overflow:auto">
			<input id="employeeId"  type="hidden" name="employeeId" value="${employeeDetails.employeeId}"/>
			<input id="submitType"  type="hidden" name="submitType"/>
			<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
			<input id="institutionId"  type="hidden" name="institutionId" value="<%= request.getAttribute("institutionId") %>"/>
			<input id="currentHours"  type="hidden" name="currentHours" value="<%= request.getAttribute("currentHours") %>"/>
			<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>
			  <h2>Employee Form</h2>
			  <ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297">
			    <li class="active"><a data-toggle="tab" href="#home">Basic Details</a></li>
			   <!--  <li><a data-toggle="tab" href="#menu1">Education</a></li>
			    <li><a data-toggle="tab" href="#menu2">Promotion</a></li> -->
			    <li><a data-toggle="tab" href="#menu3">Leave</a></li>
			  </ul>
			
			  <div class="tab-content">
			    <div id="home" class="tab-pane fade in active" style="height: 520px;background:  #F0F6FF;padding-top: 8px;padding-left: 8px;">
			      <table border="0">
						<tr>
							<td style="width:300px" class="required" ><b>Employee Name</b></td>
							<td style="width:250px"><input type="text" id="employeeName" name="employeeName" class="inputText" readonly="true" value="${employeeDetails.employeeName}"/></td>
							<td style="width:300px" class="required"><b>GPF/CPS No</b></td>
							<td style="width:250px"><input type="text" id="gpfOrCpsNo" name="gpfOrCpsNo" class="inputText" readonly="true" value="${employeeDetails.gpfOrCpsNo}"/></td>
						</tr>
						<tr>
							<td class="required"><b>Gender</b></td>
							<td>
								<input type="radio" name="gender" value="M" readonly="true"/>Male
					            <input type="radio" name="gender" value="F" readonly="true" />Female
					            <input type="radio" name="gender" value="TG" readonly="true" />TG
					         </td>
							<td class="required"><b>Designation</b></td>
							<td>
								<select name="designation" id="designation" size="1" class="dropDown">
									 <option value="">--Select--</option>
								     <c:forEach var="designation" items="${postList}">
									     <option value='<c:out value="${designation.name}"/>'>${designation.name} </option>
									 </c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="required"><b>Pay band</b></td>
							<td><input type="text" id="payBand" name="payBand" class="inputText" value="${employeeDetails.payBand}"/></td>
							<td class="required"><b>Group/Category</b></td>
							<td>
								<select id="groupCategory" name="groupCategory" class="dropDown">
									<option value="">--Select--</option>
								    <option value="A">A</option>
								    <option value="B">B</option>
								    <option value="C">C</option>
								    <option value="D">D</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td class="required"><b>Duty Pay</b></td>
							<td><input type="text" id="dutyPay" name="dutyPay" class="inputText" value="${employeeDetails.dutyPay}"/></td>
							<td class="required"><b>Recruited by</b></td>
							<td>
								<select id="recruitedBy" name="recruitedBy" class="dropDown">
									<option value="">--Select--</option>
								    <option value="TNPSC">TNPSC</option>
								    <option value="MRB">MRB</option>
								    <option value="Compassionate Grounds">Compassionate Grounds</option>
								    <option value="Employment Office">Employment Office</option>
								    <option value="Others">Others</option>
								</select>
							</td>	
						</tr>
						<tr>	
							<td class="required"><b>Grade pay</b></td>
							<td><input type="text" id="gradePay" name="gradePay" class="inputText" value="${employeeDetails.gradePay}"/></td>
							<td class="required"><b>Community</b></td>
							<td>
								<select id="community" name="community" class="dropDown">
									<option value="">--Select--</option>
								    <option value="SC/ST">SC/ST</option>
								    <option value="MBC">MBC</option>
								    <option value="DNC">DNC</option>
								    <option value="BC muslim">BC muslim</option>
								    <option value="BC Others">BC Others</option>
								    <option value="OC">OC</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td class="required"><b>Date of Birth</b></td>
							<td ><input type="text" id="dobDate" name="dobDate" readonly="true" class="inputText" value="${employeeDetails.dobDate}" onchange="isValidDateSelection(this);"></td>
							<td class="required"><b>Working Location</b></td>
							<td><input type="text" id="workingLocation"  name="workingLocation" value="${employeeDetails.workingLocation}" title="Enter Current" class="inputText"/></td>
						</tr>
						<tr>
							<td class="required"><b>Qualification</b></td>
							<td>
								<select id="qualification" name="qualification" class="dropDown" onchange="changeQualification();">
									<option value="">--Select--</option>
								    <option value="SSLC">SSLC</option>
								    <option value="HSC">HSC</option>
								    <option value="UG Deg">UG Deg</option>
								    <option value="PG Deg">PG Deg</option>
								    <option value="Diploma">Diploma</option>
								    <option value="Others">Others</option>
								</select>
							</td>	
							<td><b>Specify: Diploma/Others</b></td>
							<td><input type="text" id="others" name="others" class="inputText" value="${qualificationDetails.others}"/></td>
						</tr>
						<tr>
							<td><b>UG Major</b></td>
							<td><input type="text" id="ugMajor" name="ugMajor" readonly='true' class="inputText" value="${qualificationDetails.ugMajor}"></td>	
							<td><b>PG Major</b></td>
							<td><input type="text" id="pgMajor" name="pgMajor" class="inputText" value="${qualificationDetails.pgMajor}"></td>
						</tr>
						<tr>	
							<td class="required"><b>First Appointment Post</b></td>
							<td><select name="firstAppointmentPost" id="firstAppointmentPost" size="1" class="dropDown">
									<option value="">--Select--</option>
								     <c:forEach var="firstAppointmentPost" items="${postList}">
									     <option value='<c:out value="${firstAppointmentPost.name}"/>'>${firstAppointmentPost.name} </option>
									 </c:forEach>
								</select></td>
							<td class="required"><b>First Appointment DOJ</b></td>
							<td><input type="text" id="firstAppointmentDOJ" name="firstAppointmentDOJ" readonly="true" class="inputText" value="${employeeDetails.firstAppointmentDOJ}" onchange="isValidDateSelection(this);">
							</td>
						</tr>
						<tr>	
							<td><b>Date of Regularisation</b></td>
							<td><input type="text" id="dateOfRegularisation" name="dateOfRegularisation" readonly="true" class="datepicker inputText" value="${employeeDetails.dateOfRegularisation}" onchange="isValidDateSelection(this);"></td>
							<td><b>Date of Probation Decleration</b></td>
							<td><input type="text" id="dateOfProbationDecleration" name="dateOfProbationDecleration" readonly="true" class="datepicker inputText" value="${employeeDetails.dateOfProbationDecleration}" onchange="isValidDateSelection(this);">
							</td>
						</tr>
						<tr>	
							<td><b>Date of Retirement</b></td>
							<td><input type="text" id="dateOfRetirement" name="dateOfRetirement" readonly="true" class="datepicker inputText" value="${employeeDetails.dateOfRetirement}"></td>
							<td class="required"><b>Increment Due Month</b></td>
							<td><select name="incrementDueMonth" id="incrementDueMonth" size="1" class="dropDown">
									<option value="">--Select--</option>
								    <option value="1st January">1st January</option>
								    <option value="1st April">1st April</option>
								    <option value="1st July">1st July</option>
								    <option value="1st October">1st October</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td><b>SLS Due Date</b></td>
							<td><input type="text" id="slsDueDate" name="slsDueDate" readonly="true" class="datepicker inputText" value="${employeeDetails.slsDueDate}" onchange="isValidDateSelection(this);"></td>
							<td class="required"><b>Differently abled</b></td>
							<td><select name="physicalStatus" id="physicalStatus" size="1" class="dropDown">
									<option value="">--Select--</option>
									<option value="None">None</option>
								    <option value="Hearing">Hearing</option>
								    <option value="Vision">Vision</option>
								    <option value="Ortho">Ortho</option>
								    <option value="Other">Other</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td style="width:250px"><b>Promotion Type</b></td>
							<td style="width:200px" colspan="3"><select name="promotionType" id="promotionType" size="1" class="dropDown">
									<option value="">--Select--</option>
									<option value="Promotion1">Promotion1</option>
									<option value="Promotion2">Promotion2</option>
									<option value="Promotion3">Promotion3</option>
									<option value="Promotion4">Promotion4</option>
									<option value="Promotion5">Promotion5</option>
								</select></td>
						</tr>
				      	<tr>	
							<td style="width:250px"><b>Recent Promotion</b></td>
							<td style="width:200px" colspan="3"><select name="promotion1" id="promotion1" size="1" class="dropDown">
									<option value="">--Select--</option>
								     <c:forEach var="post" items="${postList}">
									     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
									 </c:forEach>
								</select></td>
						</tr>
						<tr>	
							<td style="width:250px"><b>Recent Promotion - DOJ</b></td>
							<td style="width:200px" colspan="3"><input type="text" id="promotion1DOJ" name="promotion1DOJ" readonly="readonly" class="datepicker inputText" value="${promotionDetails.promotionDOJ}" onchange="isValidDateSelection(this);"/>
							</td>
						</tr>
						<tr>	
							<td class="required"><b>Punishments</b></td>
							<td><select name="punishments" id="punishments" size="1" class="dropDown">
									<option value="">--Select--</option>
								    <option value="Censure">Censure</option>
								    <option value="Stoppage of inc. with cumulative">Stoppage of inc. with cumulative</option>
								    <option value="Stoppage of inc.without cumulative">Stoppage of inc.without cumulative</option>
								    <option value="Suspention">Suspention</option>
								    <option value="Termination/Removal/Dismissed">Termination/Removal/Dismissed</option>
								    <option value="None">None</option>
								</select></td>
							<!-- <td></td>
							<td>
							</td> -->
							<td style="width:250px"> 
								<b>Retirement Type</b>
							</td>
					 		<td style="width: 300px;padding-left: 10px;">
		  						<select id="retirementType" name="retirementType" class="dropDown">
		  							<option value="">--Select--</option>
									<option value="Super Annuation">Super Annuation</option>
						 			<option value="Voluntary Retirement Service">Voluntary Retirement Service</option>
								</select>
		  					</td>
						</tr>
						<tr>	
							<td class="required"><b>Whether nominee details submitted or not</b></td>
							<td ><select name="nomineeDetails" id="nomineeDetails" size="1" class="dropDown">
									<option value="">--Select--</option>
								    <option value="Y">Yes</option>
								    <option value="N">No</option>
								</select>
							</td>
							<td style="width:250px"> 
								<b>Marital Status</b>
							</td>
					 		<td style="width: 300px;padding-left: 10px;">
		  						<select id="maritalStatus" name="maritalStatus" class="dropDown">
		  							<option value="">--Select--</option>
		  							<option value="Unmarried">Unmarried</option>
									<option value="Married">Married</option>
						 			<option value="Widow">Widow</option>
								</select>
		  					</td>
						</tr>
					</table>	
			    </div>
			    <div id="menu1" class="tab-pane fade" style="height: 380px;background:  #F0F6FF">
				    <table border="0">
				    	<tr>
							<td >Qualification</td>
							<td colspan="3">
								<select name="qualification" class="dropDown">
									<option value="">--Select--</option>
								    <option value="SSLC">SSLC</option>
								    <option value="HSC">HSC</option>
								    <option value="UG Deg">UG Deg</option>
								    <option value="PG Deg">PG Deg</option>
								    <option value="Diploma">Diploma</option>
								    <option value="Others">Others</option>
								</select>
							</td>	
						</tr>
						<tr>
							<td style="width:250px">UG Major</td>
							<td style="width:200px"><input type="text" id="ugMajor" name="ugMajor" class="inputText"></td>	
							<td style="width:250px">PG Major</td>
							<td style="width:200px"><input type="text" id="pgMajor" name="pgMajor" class="inputText"></td>
						</tr>
				    </table>
			    </div>
			    <div id="menu2" class="tab-pane fade" style="height: 380px;background:  #F0F6FF">
			      <table border="0" >
			      	<tr>	
						<td style="width:250px">Promotion Type</td>
						<td style="width:200px"><select name="promotionType" id="promotionType" size="1" class="dropDown">
								<option value="">--Select--</option>
								<option value="">Promotion</option>
								<option value="">Promotion2</option>
								<option value="">Promotion3</option>
								<option value="">Promotion4</option>
								<option value="">Promotion5</option>
							</select></td>
					</tr>
			      	<tr>	
						<td style="width:250px">Promotion I</td>
						<td style="width:200px"><select name="promotion1" id="promotion1" size="1" class="dropDown">
								<option value="">--Select--</option>
							     <c:forEach var="post" items="${postList}">
								     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
								 </c:forEach>
							</select></td>
					</tr>
					<tr>	
						<td style="width:250px">Promotion - DOJ</td>
						<td style="width:200px"><input type="text" id="promotion1DOJ" name="promotion1DOJ" readonly="true" class="datepicker inputText">
						</td>
					</tr>
			      </table>
			    </div>
			    <div id="menu3" class="tab-pane fade" style="height: 380px;background:  #F0F6FF ;padding-top: 20px;padding-left: 8px;">
			      <table>
			      	<tr>	
						<td style="width:250px;height: 50px;"><b>Recent E.L taken - From</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="ELTakenFrom" name="ELTakenFrom" readonly="true" class="datepicker inputText" value="${leaveDetails.ELTakenFrom}" onchange="isValidDateSelection(this);"></td>
						<td style="width:250px;height: 50px;"><b>Recent E.L taken - To</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="ELTakenTo" name="ELTakenTo" readonly="true" class="datepicker inputText" value="${leaveDetails.ELTakenTo}" onchange="setELTakenDays();isValidDateSelection(this);">
						</td>
					</tr>
					<tr><td style="width:250px;height: 50px;"><b>Recent E.L taken - Days</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="ELTakenDays" name="ELTakenDays" readonly="true" class="inputText" value="${leaveDetails.ELTakenDays}"></td>	
						<td style="width:250px;height: 50px;"><b>Bal E.L as in SR</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="balanceEL" name="balanceEL" class="inputText" value="${leaveDetails.balanceEL}"></td>
					</tr>
					<tr>	
						<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) taken From</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="MLTakenFrom" name="MLTakenFrom" readonly="true" class="datepicker inputText" value="${leaveDetails.MLTakenFrom}" onchange="isValidDateSelection(this);"></td>
						<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) taken -To</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="MLTakenTo" name="MLTakenTo" readonly="true" class="datepicker inputText" value="${leaveDetails.MLTakenTo}" onchange="setMLTakenDays();isValidDateSelection(this);">
						</td>
					</tr>
					<tr>
						<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) - Days</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="MLTakenDays" name="MLTakenDays" readonly="true" class="inputText" value="${leaveDetails.MLTakenDays}"></td>	
						<td style="width:250px;height: 50px;"><b>Bal M.L (UEL) as in SR</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="balanceML" name="balanceML" class="inputText" value="${leaveDetails.balanceML}"></td>
					</tr>
					<tr>	
						<td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken From</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="UELTakenFrom" name="UELTakenFrom" readonly="true" class="datepicker inputText" value="${leaveDetails.UELTakenFrom}" onchange="isValidDateSelection(this);"></td>
						<td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken - To</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="UELTakenTo" name="UELTakenTo" readonly="true" class="datepicker inputText" value="${leaveDetails.UELTakenTo}" onchange="setUELTakenDays();isValidDateSelection(this);">
						</td>
					</tr>
					<tr><td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken - Days</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="UELTakenDays" name="UELTakenDays" readonly="true" class="inputText" value="${leaveDetails.UELTakenDays}"></td>	
						<td style="width:250px;height: 50px;"><b>Bal U.E.L as in SR</b></td>
						<td style="width:200px;height: 50px;"><input type="text" id="balanceUEL" name="balanceUEL" class="inputText" value="${leaveDetails.balanceUEL}"></td>
					</tr>
			      </table>
			    </div>
			     </div>
			      </div>
			    <table border="0">
				  	<tr>
						<td align="center" colspan="5" style="width:1100px;padding-bottom: 10px;">		
							<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();">Submit</button>&nbsp;
							<button id="close" type="button" class="btn btn-primary" value="Close" onclick="closeWindow();">Close</button>&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			 
			</div>
		</form>
	
	<script>
	</script>	
	<script src="js/commonHandsontable.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>