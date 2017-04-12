
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
		<title>DFW Employee Form</title>
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!--Loading Handsontable (full distribution that includes all dependencies apart from jQuery)-->
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
		</style>
		<script type="text/javascript">
		
			function OnLoad(){
				var frequency='<%= request.getAttribute("frequency") %>';
				$( ".datepicker" ).datepicker({
			    	dateFormat: 'dd-mm-yy',	
					//defaultDate: new Date(),
					showOn: "both",
					buttonImageOnly: true,
					buttonImage: "images/cal_icon.gif",
					//buttonText: 'Open calendar'
					changeMonth: true,
					changeYear: true,
					yearRange: "-70:+0"
				});
				document.getElementById('ugMajor').disabled=true;
				document.getElementById('pgMajor').disabled=true;
				document.getElementById('others').disabled=true;
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
											url: 'dfwAddEmployee.do',
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
				var employeeName = document.getElementById('employeeName').value; 
				var gpfOrCpsNo = document.getElementById('gpfOrCpsNo').value; 
				var gender = document.getElementsByName("gender");
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
			
				if(employeeName == ""){
					alert('Please enter the Name of the Employee');
					document.getElementById('employeeName').focus();
					return false;
				}
				if(gpfOrCpsNo == ""){
					alert('Please enter GPF/CPS Number');
					document.getElementById('gpfOrCpsNo').focus();
					return false;
				}
				if ( ( gender[0].checked == false ) && ( gender[1].checked == false ) && ( gender[2].checked == false ) ) {
					alert ( "Please choose Gender of the Employee" ); 
					document.getElementsByName('gender').focus();
					return false;
				}
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
				if(workingLocation == ""){
					alert('Please enter the Working Location of the Employee');
					document.getElementById('workingLocation').focus();
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
					document.getElementById('ugMajor').disabled=true;
					document.getElementById('pgMajor').disabled=true;
					document.getElementById('others').disabled=true;
				}
				if(qualification=='UG Deg'){
					document.getElementById('ugMajor').disabled=false;
					document.getElementById('pgMajor').disabled=true;
					document.getElementById('others').disabled=true;
				}
				if(qualification=='PG Deg'){
					document.getElementById('ugMajor').disabled=false;
					document.getElementById('pgMajor').disabled=false;
					document.getElementById('others').disabled=true;
				}
				if(qualification=='Diploma'||qualification=='Others'){
					document.getElementById('ugMajor').disabled=true;
					document.getElementById('pgMajor').disabled=true;
					document.getElementById('others').disabled=false;
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
				var firstAppointmentDOJ = document.getElementById('firstAppointmentDOJ').value;
				dateFirst = firstAppointmentDOJ.split('-');
				var firstAppointDOJ = new Date(dateFirst[2], dateFirst[1], dateFirst[0]);
				var e1 = document.getElementById('promotion1');
				var promotion1 = e1.options[e1.selectedIndex].value;
				var promotion1DOJ = document.getElementById('promotion1DOJ').value;
				dateSecond = promotion1DOJ.split('-');
				var promote1DOJ = new Date(dateSecond[2], dateSecond[1], dateSecond[0]);
				var e2 = document.getElementById('promotion2');
				var promotion2 = e2.options[e2.selectedIndex].value;
				var promotion2DOJ = document.getElementById('promotion2DOJ').value;
				dateThird = promotion2DOJ.split('-');
				var promote2DOJ = new Date(dateThird[2], dateThird[1], dateThird[0]);
				var e3 = document.getElementById('promotion3');
				var promotion3 = e3.options[e3.selectedIndex].value;
				var promotion3DOJ = document.getElementById('promotion3DOJ').value;
				dateFourth = promotion3DOJ.split('-');
				var promote3DOJ = new Date(dateFourth[2], dateFourth[1], dateFourth[0]);
				var e4 = document.getElementById('promotion4');
				var promotion4 = e4.options[e4.selectedIndex].value;
				var promotion4DOJ = document.getElementById('promotion4DOJ').value;
				dateFifth = promotion4DOJ.split('-');
				var promote4DOJ = new Date(dateFifth[2], dateFifth[1], dateFifth[0]);
				var e5 = document.getElementById('promotion5');
				var promotion5 = e5.options[e5.selectedIndex].value;
				var promotion5DOJ = document.getElementById('promotion5DOJ').value;
				dateSixth = promotion5DOJ.split('-');
				var promote5DOJ = new Date(dateSixth[2], dateSixth[1], dateSixth[0]);
				
				if(promotion1!=""){
					if(promotion1DOJ==""){
						alert('Enter Promotion 1 Date of Joining');
						document.getElementById('promotion1DOJ').focus();
						return false;
					}
					else if(promote1DOJ<=firstAppointDOJ){
							alert('Promotion 1 Date of Joining should be greater than Date of Joining');
							document.getElementById('promotion1DOJ').focus();
							return false;
					}
				}
				if(promotion2!=""){
					if(promotion1==""){
						alert('Enter post obtained in promotion 1');
						document.getElementById('promotion1').focus();
						return false;
					}
					if(promotion2DOJ==""){
						alert('Enter Promotion 2 Date of Joining');
						document.getElementById('promotion2DOJ').focus();
						return false;
					}
					else if(promote2DOJ<=promote1DOJ){
						alert('Promotion 2 Date of Joining should be greater than Promotion 1 Date of Joining');
						document.getElementById('promotion2DOJ').focus();
						return false;
					}
				}
				if(promotion3!=""){
					if(promotion1==""){
						alert('Enter post obtained in promotion 1');
						document.getElementById('promotion1').focus();
						return false;
					}
					else if(promotion2==""){
						alert('Enter post obtained in promotion 2');
						document.getElementById('promotion2').focus();
						return false;
					}
					if(promotion3DOJ==""){
						alert('Enter Promotion 3 Date of Joining');
						document.getElementById('promotion3DOJ').focus();
						return false;
						}				
					else if(promote3DOJ<=promote2DOJ){
						alert('Promotion 3 Date of Joining should be greater than Promotion 2 Date of Joining');
						document.getElementById('promotion3DOJ').focus();
						return false;
					}
				}
				if(promotion4!=""){
					if(promotion1==""){
						alert('Enter post obtained in promotion 1');
						document.getElementById('promotion1').focus();
						return false;
					}
					else if(promotion2==""){
						alert('Enter post obtained in promotion 2');
						document.getElementById('promotion2').focus();
						return false;
					}
					else if(promotion3==""){
						alert('Enter post obtained in promotion 3');
						document.getElementById('promotion3').focus();
						return false;
					}
					if(promotion4DOJ==""){
						alert('Enter Promotion 4 Date of Joining');
						document.getElementById('promotion4DOJ').focus();
						return false;
						}
					else if(promote4DOJ<=promote3DOJ){
						alert('Promotion 4 Date of Joining should be greater than Promotion 3 Date of Joining');
						document.getElementById('promotion4DOJ').focus();
						return false;
					}
				}
				if(promotion5!=""){
					if(promotion1==""){
						alert('Enter post obtained in promotion 1');
						document.getElementById('promotion1').focus();
						return false;
					}
					else if(promotion2==""){
						alert('Enter post obtained in promotion 2');
						document.getElementById('promotion2').focus();
						return false;
					}
					else if(promotion3==""){
						alert('Enter post obtained in promotion 3');
						document.getElementById('promotion3').focus();
						return false;
					}
					else if(promotion4==""){
						alert('Enter post obtained in promotion 4');
						document.getElementById('promotion4').focus();
						return false;
					}
					if(promotion5DOJ==""){
						alert('Enter Promotion 5 Date of Joining');
						document.getElementById('promotion5DOJ').focus();
						return false;
						}
					else if(promote5DOJ<=promote4DOJ){
						alert('Promotion 5 Date of Joining should be greater than Promotion 4 Date of Joining');
						document.getElementById('promotion5DOJ').focus();
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
		<form name="dfwEmployeeForm" id="dfwEmployeeForm" class="form-inline">
			<input id="submitType"  type="hidden" name="submitType"/>
			<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
			<input id="institutionId"  type="hidden" name="institutionId" value="<%= request.getAttribute("institutionId") %>"/>
			<input id="currentHours"  type="hidden" name="currentHours" value="<%= request.getAttribute("currentHours") %>"/>
			<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>
			<div>
			<div class="container" style="width:70%;border: solid 3px #007297;overflow:auto">
			
			   	  <h2>Employee Form</h2>  	
			  <ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297">
			    <li class="active"><a data-toggle="tab" href="#home">Basic Details</a></li>
			    <li><a data-toggle="tab" href="#menu3">Leave</a></li>
			  </ul>
			  <div class="tab-content">
			  	<div id="home" class="tab-pane fade in active" style="height: 590px;background:  #F0F6FF;padding-top: 8px;padding-left: 8px;">
					<table border="0">
						<tr>
							<td style="width: 250px;" class="required"><b>Employee Name</b></td>
							<td style="width: 200px;"><input  type="text" id="employeeName" name="employeeName" class="inputText"/></td>
							<td style="width: 250px;" class="required"><b>GPF/CPS No</b></td>
							<td style="width: 200px;"><input type="text" id="gpfOrCpsNo" name="gpfOrCpsNo" class="inputText"/></td>
						</tr>
						<tr>
							<td class="required"><b>Gender</b></td>
							<td>
								<input type="radio" name="gender" value="M" />Male
					            <input type="radio" name="gender" value="F" />Female
					            <input type="radio" name="gender" value="TG" />TG
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
							<td><input type="text" id="payBand" name="payBand" class="inputText"/></td>
							<td class="required"><b>Group/Category</b></td>
							<td>
								<select name="groupCategory" id="groupCategory" size="1" class="dropDown">
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
							<td><input type="text" id="dutyPay" name="dutyPay" class="inputText"/></td>
							<td class="required"><b>Recruited by</b></td>
							<td>
								<select name="recruitedBy" id="recruitedBy" size="1" class="dropDown">
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
							<td><input type="text" id="gradePay" name="gradePay" class="inputText"/></td>
							<td class="required"><b>Community</b></td>
							<td>
								<select name="community" id="community" size="1" class="dropDown">
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
							<td><input type="text" id="dobDate" name="dobDate" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
							<td class="required"><b>Working Location</b></td>
							<td><input type="text" id="workingLocation" name="workingLocation" title="Enter Current" class="inputText"/></td>
						</tr>
						<tr>
							<td class="required"><b>Qualification</b></td>
							
								<td><select name="qualification" id="qualification" size="1" class="dropDown" onchange="changeQualification();">
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
							<td><input type="text" id="others" name="others" class="inputText"/></td>
						</tr>
						<tr>
							<td><b>UG Major</b></td>
							<td><input type="text" id="ugMajor" name="ugMajor" class="inputText"></td>	
							<td><b>PG Major</b></td>
							<td><input type="text" id="pgMajor" name="pgMajor" class="inputText"></td>
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
							<td><input type="text" id="firstAppointmentDOJ" name="firstAppointmentDOJ" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);">
							</td>
						</tr>
						<tr>	
							<td><b>Date of Regularisation</b></td>
							<td><input type="text" id="dateOfRegularisation" name="dateOfRegularisation" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
							<td><b>Date of Probation Decleration</b></td>
							<td><input type="text" id="dateOfProbationDecleration" name="dateOfProbationDecleration" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);">
							</td>
						</tr>
						<tr>	
							<td><b>Date of Retirement</b></td>
							<td><input type="text" id="dateOfRetirement" name="dateOfRetirement" readonly="true" class="datepicker inputText"></td>
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
							<td><input type="text" id="slsDueDate" name="slsDueDate" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
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
							<td style="width:250px"><b>Promotion1</b></td>
							<td style="width:200px"><select name="promotion1" id="promotion1" size="1" class="dropDown">
								<option value="">--Select--</option>
							     <c:forEach var="post" items="${postList}">
								     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
								 </c:forEach>
								</select>
							</td>
							<td style="width:250px"><b>Promotion1 - DOJ</b></td>
							<td style="width:200px" colspan="3"><input type="text" id="promotion1DOJ" name="promotion1DOJ" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
						</tr>
				      	<tr>	
							<td style="width:250px"><b>Promotion2</b></td>
							<td style="width:200px"><select name="promotion2" id="promotion2" size="1" class="dropDown">
								<option value="">--Select--</option>
							     <c:forEach var="post" items="${postList}">
								     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
								 </c:forEach>
								</select>
							</td>
							<td style="width:250px"><b>Promotion2 - DOJ</b></td>
							<td style="width:200px" colspan="3"><input type="text" id="promotion2DOJ" name="promotion2DOJ" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
						</tr>
						<tr>	
							<td style="width:250px"><b>Promotion3</b></td>
							<td style="width:200px"><select name="promotion3" id="promotion3" size="1" class="dropDown">
								<option value="">--Select--</option>
							     <c:forEach var="post" items="${postList}">
								     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
								 </c:forEach>
								</select>
							</td>
							<td style="width:250px"><b>Promotion3 - DOJ</b></td>
							<td style="width:200px" colspan="3"><input type="text" id="promotion3DOJ" name="promotion3DOJ" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
						</tr>
						<tr>	
							<td style="width:250px"><b>Promotion4</b></td>
							<td style="width:200px"><select name="promotion4" id="promotion4" size="1" class="dropDown">
								<option value="">--Select--</option>
							     <c:forEach var="post" items="${postList}">
								     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
								 </c:forEach>
								</select>
							</td>
							<td style="width:250px"><b>Promotion4 - DOJ</b></td>
							<td style="width:200px" colspan="3"><input type="text" id="promotion4DOJ" name="promotion4DOJ" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
						</tr>
						<tr>	
							<td style="width:250px"><b>Promotion5</b></td>
							<td style="width:200px"><select name="promotion5" id="promotion5" size="1" class="dropDown">
								<option value="">--Select--</option>
							     <c:forEach var="post" items="${postList}">
								     <option value='<c:out value="${post.name}"/>'>${post.name} </option>
								 </c:forEach>
								</select>
							</td>
							<td style="width:250px"><b>Promotion5 - DOJ</b></td>
							<td style="width:200px" colspan="3"><input type="text" id="promotion5DOJ" name="promotion5DOJ" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
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
							<td style="width:250px" class="required"> 
								<b>Marital Status</b>
							</td>
					 		<td style="width: 300px;">
		  						<select id="maritalStatus" name="maritalStatus" class="dropDown">
		  							<option value="">--Select--</option>
		  							<option value="Unmarried">Unmarried</option>
									<option value="Married">Married</option>
						 			<option value="Widow">Widow</option>
								</select>
		  					</td>
						</tr>
						<tr>	
							<td class="required"><b>Whether nominee details submitted or not</b></td>
							<td colspan="3"><select name="nomineeDetails" id="nomineeDetails" size="1" class="dropDown">
									<option value="">--Select--</option>
								    <option value="Y">Yes</option>
								    <option value="N">No</option>
								</select></td>
						</tr>
					</table>
					</div>
						
					<div id="menu3" class="tab-pane fade" style="height: 380px;background:  #F0F6FF ;padding-top: 20px;padding-left: 8px;">
				      <table>
				      	<tr>	
							<td style="width:250px;height: 50px;"><b>Recent E.L taken - From</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="ELTakenFrom" name="ELTakenFrom" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
							<td style="width:250px;height: 50px;"><b>Recent E.L taken - To</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="ELTakenTo" name="ELTakenTo" readonly="true" class="datepicker inputText" onchange="setELTakenDays();isValidDateSelection(this);">
							</td>
						</tr>
						<tr><td style="width:250px;height: 50px;"><b>Recent E.L taken - Days</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="ELTakenDays" name="ELTakenDays" readonly="true" class="inputText"></td>	
							<td style="width:250px;height: 50px;"><b>Bal E.L as in SR</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="balanceEL" name="balanceEL" class="inputText"></td>
						</tr>
						<tr>	
							<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) taken From</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="MLTakenFrom" name="MLTakenFrom" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
							<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) taken -To</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="MLTakenTo" name="MLTakenTo" readonly="true" class="datepicker inputText" onchange="setMLTakenDays();isValidDateSelection(this);">
							</td>
						</tr>
						<tr>
							<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) - Days</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="MLTakenDays" name="MLTakenDays" readonly="true" class="inputText"></td>	
							<td style="width:250px;height: 50px;"><b>Bal M.L (UEL) as in SR</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="balanceML" name="balanceML" class="inputText"></td>
						</tr>
						<tr>	
							<td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken From</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="UELTakenFrom" name="UELTakenFrom" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);"></td>
							<td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken - To</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="UELTakenTo" name="UELTakenTo" readonly="true" class="datepicker inputText" onchange="setUELTakenDays();isValidDateSelection(this);">
							</td>
						</tr>
						<tr><td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken - Days</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="UELTakenDays" name="UELTakenDays" readonly="true" class="inputText"></td>	
							<td style="width:250px;height: 50px;"><b>Bal U.E.L as in SR</b></td>
							<td style="width:200px;height: 50px;"><input type="text" id="balanceUEL" name="balanceUEL" class="inputText"></td>
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
		<script src="js/commonHandsontable.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>