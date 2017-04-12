
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
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
		  
		<script src="js/script.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />	
		<style type="text/css">
		</style>
	<script type="text/javascript">
	function bdyOnLoad(){	
		document.getElementById('lblInst').style.display = "none";
		document.getElementById('lblInstitution').style.display = "none";
		document.getElementById('lblPromotedAs').style.display = "none";
		document.getElementById('lblPromotion').style.display = "none";
	}
	</script>	
</head>

<body onload="bdyOnLoad();">
	
	<input id="submitType"  type="hidden" name="submitType"/>
	<input id="districtId"  type="hidden" name="districtId" value="<%= request.getAttribute("districtId") %>"/>
	<input id="institutionId"  type="hidden" name="institutionId" value="<%= request.getAttribute("institutionId") %>"/>
	<input id="employeeId"  type="hidden" name="employeeId" value="<%= request.getAttribute("employeeId") %>"/>
	<div style="width:500px; border: solid 3px #007297">
	   	  <h2 align="center">Employee Transfer Form</h2>
	  	<div id="home" class="tab-pane fade in active" style="height: 260px;background:  #F0F6FF;padding-top: 8px;padding-left: 8px;">
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
				<td style="width: 170px;border-right: blue 1px solid;" class="required">
		        	<b>Transfer Type:</b>
				</td>
				<td style="width: 300px;padding-left: 10px;">
					<input type="radio" name="transferType" checked="checked" value="T" onchange="changeTransferType();"/>Transfer
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
					<td style="width: 170px;border-right: blue 1px solid;" class="required">
			        	<b>Transfer To:</b>
					</td>
					<td style="width: 300px;padding-left: 10px;">
						<input type="radio" name="transferPlace" checked="checked" value="district" onchange="changeTransferLevel();"/>District
					   <!--  <input type="radio" name="transferPlace" value="institution" onchange="changeTransferLevel();"/>Institution -->
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
			
			 <table border="0">
				  	<tr>
						<td align="center" colspan="5" style="width:470px;padding-bottom: 10px;">		
							<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();">Submit</button>&nbsp;
							<button id="close" type="button" class="btn btn-primary" value="Close" onclick="closeWindow();">Close</button>&nbsp;&nbsp;
						</td>
					</tr>
			 </table>
	 </div>		
	
	<script>
	
	function doSubmit(){
		var selectedDistrict='<%=request.getParameter("districtId")%>';	
		var districtElement = document.getElementById("districtName");
		var institutionElement = document.getElementById("institutionName");
		var PromotionElement = document.getElementById("PromotionName");
		var gpfOrCpsNo= document.getElementById("gpfOrCpsNo").textContent;
		var employeeId= document.getElementById("employeeId").value;
	
		var districtName="";
		var districtId="";
		var institutionName="";
		var institutionId="";

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
		}
		 if(selectedDistrict==districtId){
			 alert("Please select the transfer district");
		 }else{
			 var formFlag = confirm("Do you really want to transfer to "+districtName+" ?");
			   if(formFlag){
				   document.getElementById('submit').disabled=true;
				   $.ajax({type: "POST",
						url: 'dfwTransferEmployee.do',
						'data':  { 
							districtId:districtId,institutionId:institutionId,employeeId:employeeId,gpfOrCpsNo:gpfOrCpsNo,transferType:transferType,
							PromotionName:PromotionName
						    },
						    success: function (result) {
						    	alert(result);						    	
						      },
						      error: function () {
						    	  $("#errorMessage").text("Save Error");
						      }});
			   }			 
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
			document.getElementById('PromotionName').value= "";
			
		}else if(transferType=="P"){
			document.getElementById('lblPromotedAs').style.display = "inline";
			document.getElementById('lblPromotion').style.display = "inline";
		}
	}
	
	function changeDistrict(){
		var e1 = document.getElementById("districtName");
		var districtId = e1.options[e1.selectedIndex].value;
		$.ajax({type:"POST",
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
	
	function closeWindow(){
		window.close();
	}
	</script>
		<script src="js/commonHandsontable.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		</body>
</html>