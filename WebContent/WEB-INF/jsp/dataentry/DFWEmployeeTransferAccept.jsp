
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.Demographic"%>
<%@page import="gov.shdrc.util.DFWEmployeeForm"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
	<title>DFW Employee Transfer Acceptance Form</title>
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
	</style>
	<script type="text/javascript">
	</script>	
</head>

<body onload="bdyOnLoad();">
<form name="dfwEmployeeTranferAcceptForm" id="dfwEmployeeTranferAcceptForm" class="form-inline">
	<input id="submitType"  type="hidden" name="submitType"/>
	<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
	<input id="institutionId"  type="hidden" name="institutionId" value="<%= request.getAttribute("institutionId") %>"/>
	<input id="employeeId"  type="hidden" name="employeeId" value="<%= request.getAttribute("employeeId") %>"/>
	<input id="previousTransferType"  type="hidden" name="previousTransferType"/>
	<input id="currentHours"  type="hidden" name="currentHours" value="<%= request.getAttribute("currentHours") %>"/>
	<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>
	<div>
	<div style="width:500px; border: solid 3px #007297;overflow:auto;">
	   	  <h2 align="center">Employee Transfer Acceptance Form</h2>
	  	<div id="home" class="tab-pane fade in active" style="height: 390px;background:  #F0F6FF;padding-top: 8px;padding-left: 8px;">
			<table border="0">
				<tr>
					<td style="width: 170px;border-right: blue 1px solid;" class="required"><b>Employee Name</b></td>
					<td style="width: 300px;padding-left: 10px;"><label id="employeeName"><%=request.getParameter("employeeName")%></label></td>
				</tr>
				<tr>	
					<td style="width: 170px;border-right: blue 1px solid;" class="required"><b>GPF/CPS No</b></td>
					<td style="width: 300px;padding-left: 10px;"><label id="gpfOrCpsNo"><%=request.getParameter("gpfOrCpsNo")%></label></td>
				</tr>
				<tr>
					<td style="width: 170px;border-right: blue 1px solid;"><b>Designation:</b></td>
					<td style="width: 300px;padding-left: 10px;">
						<label id="designation"><%=request.getParameter("designation")%></label>
					</td>
				</tr>
				<tr>	
					<td style="width: 170px;border-right: blue 1px solid;" class="required"><b>Working Location</b></td>
					<td style="width: 300px;padding-left: 10px;"><input type="text" id="workingLocation"  name="workingLocation" value="${transferEmployeeDetails.workingLocation}" title="Enter Current Location" class="inputText"/></td>
				</tr>
				<tr>	
					<td style="width: 170px;border-right: blue 1px solid;" class="required"><b>Pay band</b></td>
					<td style="width: 300px;padding-left: 10px;"><input type="text" id="payBand" name="payBand" class="inputText" value="${transferEmployeeDetails.payBand}"/></td>
				</tr>
				<tr>	
					<td style="width: 170px;border-right: blue 1px solid;" class="required"><b>Group/Category</b></td>
					<td style="width: 300px;padding-left: 10px;">
						<select id="groupCategory" name="groupCategory" class="dropDown">
								<option value="">--Select--</option>
							    <option value="A">A</option>
							    <option value="B">B</option>
							    <option value="C">C</option>
							    <option value="D">D</option>
						</select></td>
				</tr>
				<tr>	
					<td style="width: 170px;border-right: blue 1px solid;" class="required"><b>Grade pay</b></td>
					<td style="width: 300px;padding-left: 10px;"><input type="text" id="gradePay" name="gradePay" class="inputText" value="${transferEmployeeDetails.gradePay}"/></td>
				</tr>
				<tr>
				<td style="width: 170px;border-right: blue 1px solid;" class="required">
		        	<b>Transfer Type:</b>
				</td>
				<td style="width: 300px;padding-left: 10px;">
					<input type="radio" name="transferType" value="T" onchange="changeTransferType();"/>Transfer
				    <input type="radio" name="transferType" value="P" onchange="changeTransferType();"/>Transfer on Promotion
				</td>
				</tr>
				<tr>
					<td style="width: 170px;border-right: blue 1px solid;">
						<b><label id="lblPromotedAs">Promoted as</label></b>
					</td>
					 <td style="width: 300px;padding-left: 10px;">
					 	<label id="lblPromotion">
		  				<select id="PromotionName" name="PromotionName" class="dropDown">	
		  					<option value="">--Select--</option>	  				
							 <c:forEach var="Promotion" items="${postList}">
							     <option value='<c:out value="${Promotion.name}"/>'>${Promotion.name} </option>
							 </c:forEach>
						</select>
						</label>
		  			</td>
				</tr>
				<tr>
					<td style="width: 170px;border-right: blue 1px solid;"><b><label id="lblPromotionDOJ">Promotion Date of Joining</label></b></td>
					<td style="width: 300px;padding-left: 10px;">
						<label id="lblPromotionDate">
							<input type="text" id="promotionDate" name="promotionDate" readonly="true" class="datepicker inputText" onchange="isValidDateSelection(this);">
						</label>
					</td>
				</tr>
				<tr>
				<td style="width: 170px;border-right: blue 1px solid;" class="required">
		        	<b>Transfer To:</b>
				</td>
				<td style="width: 300px;padding-left: 10px;">
					<input type="radio" name="transferPlace" checked="checked" value="district" onchange="changeTransferLevel();"/>District
				    <!-- <input type="radio" name="transferPlace" value="institution" onchange="changeTransferLevel();"/>Institution -->
				</td>
				</tr>
				<tr>	
					<td style="width: 170px;border-right: blue 1px solid;"> 
						<b>District</b>
					</td>
					 <td style="width: 300px;padding-left: 10px;">
		  				<select id="districtName" name="districtName" class="dropDown" onchange="changeDistrict();">
							 <c:forEach var="district" items="${districts}">
							     <option value='<c:out value="${district.id}"/>'>${district.name} </option>
							 </c:forEach>
						</select>
		  			</td>
				</tr>
				<tr>
					<td style="width: 170px;border-right: blue 1px solid;">
						<b><label id="lblInst">Institution</label></b>
					</td>
					 <td style="width: 300px;padding-left: 10px;">
					 	<label id="lblInstitution">
		  				<select id="institutionName" name="institutionName" class="dropDown">		  				
							 <c:forEach var="institution" items="${institutions}">
							     <option value='<c:out value="${institution.id}"/>'>${institution.name} </option>
							 </c:forEach>
						</select>
						</label>
		  			</td>
				</tr>
			</table>
			</div>
			</div>
			 <table border="0">
				  	<tr>
						<td align="center" colspan="5" style="width:470px;padding-bottom: 10px;">		
							<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();">Submit</button>&nbsp;
							<button id="close" type="button" class="btn btn-primary" value="Close" onclick="closeWindow();">Close</button>&nbsp;&nbsp;
						</td>
					</tr>
			 </table>
	 </div>		
	</form>
	<script>

	function doSubmit(){
		var districtElement = document.getElementById("districtName");
		var institutionElement = document.getElementById("institutionName");
		var PromotionElement = document.getElementById("PromotionName");
		var gpfOrCpsNo= document.getElementById("gpfOrCpsNo").textContent;
		var employeeId= document.getElementById("employeeId").value;
		var promotionDate = document.getElementById('promotionDate').value; 
		var districtName="";
		var districtId="";
		var institutionName="";
		var institutionId="";
		
		var workingLocation = document.getElementById('workingLocation').value;
		var payBand = document.getElementById('payBand').value; 
		var groupCategoryElement = document.getElementById('groupCategory');
		var groupCategory = groupCategoryElement.options[groupCategoryElement.selectedIndex].value;
		var gradePay = document.getElementById('gradePay').value; 
		if(workingLocation == ""){
				alert('Please enter the Working Location of the Employee');
				document.getElementById('workingLocation').focus();
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
		if(gradePay == ""){
			alert('Please enter the gradepay of the Employee');
			document.getElementById('gradePay').focus();
			return false;
		}

		if (districtElement != 'undefined') {
				districtId = districtElement.options[districtElement.selectedIndex].value;
				districtName= districtElement.options[districtElement.selectedIndex].text;
		   }
		if (institutionElement != 'undefined') {
			institutionId = institutionElement.options[institutionElement.selectedIndex].value;
			institutionName= institutionElement.options[institutionElement.selectedIndex].text;
	   	}
		var transferReason = document.getElementsByName("transferType");
		for (var i = 0; i < transferReason.length; i++) {       
	        if (transferReason[i].checked) {
	        	transferType=transferReason[i].value;
	            break;
	        }
	    }
		if (PromotionElement != 'undefined') {
			PromotionName = PromotionElement.options[PromotionElement.selectedIndex].value;
	   	}
		if(transferType=='P'){
			if(PromotionName == ""){
				alert('Please enter Promoted designation of the Employee');
				document.getElementById('PromotionName').focus();
				return false;
			}
			if(promotionDate == ""){
				alert('Please enter Promotion Date of Joining of the Employee');
				document.getElementById('promotionDate').focus();
				return false;
			}
		}
		var previousTransferType=document.getElementById('previousTransferType').value;
		 
			 var formFlag = confirm("Do you really want to accept the Employee to "+districtName+" ?");
			   if(formFlag){
				   document.getElementById('submit').disabled=true;
				   $.ajax({type: "POST",
						url: 'dfwAcceptEmployeeTransfer.do',
						'data':  { 
							districtId:districtId,institutionId:institutionId,employeeId:employeeId,gpfOrCpsNo:gpfOrCpsNo,transferType:transferType,
							previousTransferType:previousTransferType,PromotionName:PromotionName,promotionDate:promotionDate,payBand:payBand,
							groupCategory:groupCategory,gradePay:gradePay,workingLocation:workingLocation
						    },
						    success: function (result) {
						    	alert(result);						    	
						      },
						      error: function (xhr, status, error) {
					                alert("Internal Error Occured-Please Contact System Administrator");
							    }});
			   }			 
			 }  
		
	function changeTransferLevel(){
		var transfer = document.getElementsByName("transferPlace");
		for (var i = 0; i < transfer.length; i++) {       
	        if (transfer[i].checked) {
	        	transferPlace=transfer[i].value;
	            break;
	        }
	    }
		if(transferPlace=="district"){
			document.getElementById('lblInst').style.display = "none";
			document.getElementById('lblInstitution').style.display = "none";
			document.getElementById('institutionName').value= -99;
			
		}else if(transferPlace=="institution"){
			document.getElementById('lblInst').style.display = "inline";
			document.getElementById('lblInstitution').style.display = "inline";
		}
	}
	
	function changeTransferType(){
		var transferReason = document.getElementsByName("transferType");
		for (var i = 0; i < transferReason.length; i++) {       
	        if (transferReason[i].checked) {
	        	transferType=transferReason[i].value;
	            break;
	        }
	    }
		if(transferType=="T"){
			document.getElementById('lblPromotedAs').style.display = "none";
			document.getElementById('lblPromotion').style.display = "none";
			document.getElementById('lblPromotionDOJ').style.display = "none";
			document.getElementById('lblPromotionDate').style.display = "none";
			document.getElementById('PromotionName').value= "";
			 document.getElementById('promotionDate').value= "";
			
		}else if(transferType=="P"){
			document.getElementById('lblPromotedAs').style.display = "inline";
			document.getElementById('lblPromotion').style.display = "inline";
			document.getElementById('lblPromotionDOJ').style.display = "inline";
			document.getElementById('lblPromotionDate').style.display = "inline";
		}
	}
	
	function bdyOnLoad(){
		 $( ".datepicker" ).datepicker({
		    	dateFormat: 'dd-mm-yy',	
				showOn: "both",
				buttonImageOnly: true,
				buttonImage: "images/cal_icon.gif",
				changeMonth: true,
				changeYear: true
			}); 
			<%
		DFWEmployeeForm transferEmployeeDetails =null;
		if(request.getAttribute("transferEmployeeDetails")!=null)
			transferEmployeeDetails =(DFWEmployeeForm)request.getAttribute("transferEmployeeDetails");	
		%>
		document.dfwEmployeeTranferAcceptForm.transferType.value='<%= transferEmployeeDetails.getTransferType()%>';
		document.getElementById('previousTransferType').value=document.dfwEmployeeTranferAcceptForm.transferType.value;
		
		if(document.dfwEmployeeTranferAcceptForm.transferType.value=="T"){
			document.getElementById('lblPromotedAs').style.display = "none";
			document.getElementById('lblPromotion').style.display = "none";
			document.getElementById('lblPromotionDOJ').style.display = "none";
			document.getElementById('lblPromotionDate').style.display = "none";		
		}else{
			document.getElementById('lblPromotedAs').style.display = "inline";
			document.getElementById('lblPromotion').style.display = "inline";
			document.getElementById('lblPromotionDOJ').style.display = "inline";
			document.getElementById('lblPromotionDate').style.display = "inline";		
			var PromotionName = document.getElementById('PromotionName');
			var selectedPromotionName='<%= transferEmployeeDetails.getPromotion1()%>';
			for (var i = 0; i < PromotionName.length; i++) {
			    if (PromotionName.options[i].value == selectedPromotionName) {
			    	PromotionName.selectedIndex = i;
			        break;  
			    }
			}
		}	
		
		var institutionId=document.getElementById('institutionId').value;
		if(institutionId==-99){
			document.dfwEmployeeTranferAcceptForm.transferPlace.value="district";
			document.getElementById('lblInst').style.display = "none";
			document.getElementById('lblInstitution').style.display = "none";
			
			var districtName = document.getElementById('districtName');
			var selectedDistrictName='<%= transferEmployeeDetails.getDistrictName()%>';
			for (var i = 0; i < districtName.length; i++) {
			    if (districtName.options[i].text == selectedDistrictName) {
			    	districtName.selectedIndex = i;
			        break;  
			    }
			}			
		}
		else{
			document.dfwEmployeeTranferAcceptForm.transferPlace.value="institution";
			document.getElementById('lblInst').style.display = "inline";
			document.getElementById('lblInstitution').style.display = "inline";
			
			var districtName = document.getElementById('districtName');
			var selectedDistrictName='<%= transferEmployeeDetails.getDistrictName()%>';
			for (var i = 0; i < districtName.length; i++) {
			    if (districtName.options[i].text == selectedDistrictName) {
			    	districtName.selectedIndex = i;
			        break;  
			    }
			}
			
			var institutionName = document.getElementById('institutionName');
			var selectedInstitutionName='<%= transferEmployeeDetails.getInstitutionName()%>';
			for (var i = 0; i < institutionName.length; i++) {
			    if (institutionName.options[i].text == selectedInstitutionName) {
			    	institutionName.selectedIndex = i;
			        break;  
			    }
			}
		}
		
		 var groupCategory = document.getElementById('groupCategory');
		 var selectedGroupCategory='<%= transferEmployeeDetails.getGroupCategory()%>';
		 for (var i = 0; i < groupCategory.length; i++) {
		 	if (groupCategory.options[i].value == selectedGroupCategory) {
		 		groupCategory.selectedIndex = i;
	   	        break;
		 	}
		 }	
	}
	
	function changeDistrict(){
		var e1 = document.getElementById("districtName");
		var districtId = e1.options[e1.selectedIndex].value;
		$.ajax({type: "POST",
			url: 'dfwTransferDistrictChange.do',
			'data':  { 
				districtId:districtId
			    },
			    success: function (result) {
			    	var jsonData = JSON.parse(result);
			    	var $select = $('#institutionName');                           
		               $select.find('option').remove();    
		               $.each(jsonData, function(idx, obj) { 
		                   $('<option>').val(obj.id).text(obj.name).appendTo($select);
		                    });			        	
			      },
			      error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				    }});	
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
	
	function closeWindow(){
		window.close();
	}
	</script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>