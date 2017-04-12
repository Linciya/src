<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.UserInfo"%>
           
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
<title>DCA Directorate</title>
<%
String userTier=UserInfo.getUserTier();
%>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--
  Loading Handsontable (full distribution that includes all dependencies apart from jQuery)
  -->
  <script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
  <script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css">

  <!--
  Loading demo dependencies. They are used here only to enhance the examples on this page
  -->
  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css">
  <script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>
  <script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script>
  <link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">
  <link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
  
  <script src="js/script.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css"  />	  
</head>

<body onload="onLoad();">

	<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
	<input id="encodedJsonArray"  type="hidden" name="encodedJsonArray" value="<%= request.getAttribute("encodedJsonArray") %>"/>
	<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
	<input id="selectedHudName"  type="hidden"  value="<%= request.getAttribute("hudName") %>"/>
	<input id="selectedBlockName"  type="hidden"  value="<%= request.getAttribute("blockName") %>"/>
	<input id="selectedInstitutionName"  type="hidden" value="<%= request.getAttribute("institutionName") %>"/>
	<input id="directorateServletList"  type="hidden" name="directorateServletList" value="<%= request.getAttribute("directorateServletList") %>"/>
	<input id="submitType"  type="hidden" name="submitType"/>
	<input id="isDataExists"  type="hidden" name="isDataExists" value="<%= request.getAttribute("isDataExists") %>"/>
	<input id="currentHours"  type="hidden" name="currentHours" value="<%= request.getAttribute("currentHours") %>"/>
	<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>
	<input id="isDataGridReadOnly"  type="hidden" name="isDataGridReadOnly"/>
	<table border="0">
		<tr>
			<td colspan="6" class="appheader">
			<b>SHDRC DATA Entry - Web Form</b>
			</td>
		</tr>
		<tr>
			<td align="right" class="required" width="170px;">
				<b>Directorate:</b>&nbsp;&nbsp;
			</td>
			<td width="170px;">
				<select id="directorateName" name="directorateName" class="dropDown" onchange="changeDirectorate('<%=request.getContextPath()%>');">
					 <c:forEach var="directorate" items="${directorateList}">
					     <option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
					 </c:forEach>
				</select>
			</td>
			<td  align="right" width="170px;" >		
				<b>Frequency:</b>&nbsp;&nbsp;
			</td>
			<td  colspan="3" width="170px;">	
			<select name="timePeriod" id="timePeriod" size="1" class="dropDown" onchange="enableFields();">
			     <c:forEach var="freuency" items="${freuencyList}">
				     <option value='<c:out value="${freuency.id}"/>'>${freuency.name} </option>
				 </c:forEach>
			</select>
			</td>
		</tr>
		<tr>
		    <td align="right" class="required" width="170px;">	
				<b>Zone:</b>&nbsp;&nbsp;
			</td>
			<td width="170px;">	
				<select id="hudName" name="hudName" class="dropDown" onchange="changeHUD();enableLabel();" >
					 <c:forEach var="hud" items="${huds}">
					     <option value='<c:out value="${hud.id}"/>'>${hud.name} </option>
					 </c:forEach>
				</select>
			</td>
			<td  align="right" width="170px;">	
				<b><label id="lblDate">Date:</label><label id="lblWeek">Week:</label></b>
				&nbsp;
			</td>
			<td  colspan="3" width="170px;">		
				<input type="text" class="inputText" id="date" name="searchDate" readonly="true" onchange="compareDate();">
				<select name="week" id="week" size="1" class="dropDown" >
			     <c:forEach var="week" items="${weeksList}">
				     <option value='<c:out value="${week.id}"/>'>${week.name} </option>
				 </c:forEach>
				</select>
				&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td  align="right" width="170px;">	 
				<label id="lblInstitution" class="required"><b>Institution:</b></label><label id="lblBlock" class="required"><b>Range:</b></label>&nbsp;&nbsp;
			</td>
			<td width="170px;">	
				<select id="institutionName" name="institutionName" class="dropDown">
					 <c:forEach var="institution" items="${institutionList}">
					     <option value='<c:out value="${institution.id}"/>'>${institution.name} </option>
					 </c:forEach>
				</select>
				
				<select id="blockName" name="blockName" class="dropDown">
					 <c:forEach var="block" items="${blockList}">
					     <option value='<c:out value="${block.id}"/>'>${block.name} </option>
					 </c:forEach>
				</select>
			</td>
			<td  align="right" width="170px;">
				<b><label id="lblMonth">Month:</label><label id="lblQuarter">Quarter:</label></b>
			</td>
			<td  colspan="3" width="170px;">	
				<select name="month" id="month" class="dropDown" size="1">
					<option value="">--Select--</option>
				    <c:forEach var="month" items="${monthsList}">
				     	<option value='<c:out value="${month.name}"/>'>${month.name} </option>
				 	</c:forEach>
				</select>
				
				<select name="quarter" id="quarter" size="1" class="dropDown" >
			     <c:forEach var="quarter" items="${quarterList}">
				     <option value='<c:out value="${quarter.id}"/>'>${quarter.name} </option>
				 </c:forEach>
				</select>
			</td>
		</tr>
		<tr>
		<td colspan="2" width="170px;"></td>
		<td  align="right" width="170px;">	
				<b>Year:</b>
			</td>
			<td width="170px;">	
				<select name="year" id="year"  class="dropDown" size="1" onchange="validateMonthAndYear();">
					<option value="">--Select--</option>
				     <c:forEach var="year" items="${yearList}">
					     <option value='<c:out value="${year}"/>'>${year} </option>
					 </c:forEach>
				</select>
			</td>
			<%
				String categoryName="";
				List<CommonStringList> categoryList = null;
				if(request.getAttribute("classificationList")!=null){
					  	categoryList = (List<CommonStringList>)request.getAttribute("classificationList");
						if(categoryList!=null && categoryList.size()>0){
							categoryName = categoryList.get(0).getName();
						}
				}		
			%>
			<td width="800px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary" onclick="doSearch('<%=categoryName%>','0','search');">Search</button>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<div id="successMessage" style="color:green"></div><div id="errorMessage" style="color:red"></div>
			</td>	
		</tr>
	</table>
	<table border="0">
		<tr>
			<td width="220px;" class="serachcriteriasummary">
			</td>
			<td class="directoratenameheader" width="1260px;">
				<label style="padding-left: 320px;font-size: 14px;">Drug Control Authority</label><br>
				<label>Classification</label>
			</td>
		</tr>	
		<tr> 
			<td valign="top" class="serachcriteriasummary" width="220px;" colspan="1">
			<b>Search Criteria</b><br><br>
			<b>Directorate</b> - <label id="gridDirectorateLabel">DCA</label> <br><br>
			<b>Zone</b> - <label id="gridHudLabel"></label><br><br>
			<b><label id="blockLabel">Range</label></b><label id="blockHyphen"> - </label><label id="gridBlockLabel"></label>
			<b><label id="institutionLabel">Institution</label></b><label id="institutionHyphen"> - </label><label id="gridInstitutionLabel"></label><br><br> 
		 	<b>Frequency</b> - <label id="gridFrequencyLabel"></label><br><br>
			</td>
			<td width="1260px;" class="categorytab">
				<div id="tabs">
				  <ul class="nav nav-pills" id="myTab">
				  <% 
				  if(categoryList!=null){
					  	boolean isActive=true;
					  	int tabId=0;
					  	for(CommonStringList category : categoryList){%>
					  			<li id="tabId<%=tabId%>" role="presentation" style="height:10px;" ><a id="generalCategoryLinkId<%=tabId%>" style="pointer-events:none;font-weight: bold;" href="#" onclick="doSearch('<%= category.getName()%>','<%=tabId%>','tabChange');"><%= category.getName()%></a></li>
					  		<%tabId++;
					  		
					  	}
				  }
				  %>
				</ul>
				</div>
				<div id="dataGrid" class="scroll" style="padding-top:10px;"></div>
			</td>
		</tr>
		<tr>
			<td class="serachcriteriasummary"  width="220px;"></td>
			<td align="center" width="1260px;">		
				<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();">Submit</button>&nbsp;
				<button id="cancel" type="button" class="btn btn-primary" value="Cancel" onclick="doCancel('<%=request.getContextPath()%>','/dcaDataEntry.do');">Reset Form</button>&nbsp;
				<%if(!"T4".equalsIgnoreCase(userTier)){ %>
				<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');">Close</button>&nbsp;&nbsp;
				<%} %>
			</td>
		</tr>		
	</table>
	
	<script>
	
		 function doSearch(classificationName,tabId,action){
			   clearMessage();
			   if(action=='tabChange'){
			    	classificationName = document.getElementById("generalCategoryLinkId"+tabId).textContent;
			    }
			   var hudId;
			   var hudName="";
			   var institutionId;
			   var institutionName="";
			   var blockId;
			   var blockName="";
			   var classificationName;
			   var e1 = document.getElementById("hudName");
			   if (e1 != 'undefined') {
				   hudId = e1.options[e1.selectedIndex].value;
				   hudName= e1.options[e1.selectedIndex].text;
			   }	
			   if(hudName=='NA'){
				   var e2 = document.getElementById("institutionName");
				   if (e2 != 'undefined') {
					   institutionId = e2.options[e2.selectedIndex].value;
					   institutionName = e2.options[e2.selectedIndex].text;
				   }
			   }
			   else{
				   var e3 = document.getElementById("blockName");
				   if (e3 != 'undefined') {
					   blockId = e3.options[e3.selectedIndex].value;
					   blockName= e3.options[e3.selectedIndex].text;
				   }
			   }
				var searchDate = document.getElementById('date').value;
				var e5 = document.getElementById('timePeriod');
				var frequency = e5.options[e5.selectedIndex].text;
				var e6 = document.getElementById('week');
				var week = e6.options[e6.selectedIndex].text;
				var e7 = document.getElementById('quarter');
				var quarter = e7.options[e7.selectedIndex].text;
				var month = document.getElementById('month').value;
				var year = document.getElementById('year').value;
				
				if(frequency=='Daily'){
					if(searchDate==""){
						alert("Please Select Date");
						return false;
					}
					week="";
					quarter="";
				}else if(frequency=='Weekly'){
					if(week =="" && month=="" && year==""){
						alert("Please Select Week,Month,Year");
						return false;
					}
					if(week !="" && month=="" && year==""){
						alert("Please Select Month & Year");
						return false;
					}
					if(week =="" && month!="" && year==""){
						alert("Please Select Week & Year");
						return false;
					}
					if(week =="" && month=="" && year!=""){
						alert("Please Select Week & Month");
						return false;
					}
					if(week !="" && month=="" && year!=""){
						alert("Please Select Month");
						return false;
					}
					if(week !="" && month!="" && year==""){
						alert("Please Select Year");
						return false;
					}
					if(!validateMonthAndYear())
						return false;
					quarter="";
				}else if (frequency=='Monthly'){
					if(month=="" && year==""){
						alert("Please Select Month & Year");
						return false;
					}
					if(month!="" && year==""){
						alert("Please Select Year");
						return false;
					}
					if(month=="" && year!=""){
						alert("Please Select Month");
						return false;
					}
					if(!validateMonthAndYear())
						return false;
					week="";
					quarter="";
				}else if (frequency=='Quarterly'){
					if(quarter=="" && year==""){
						alert("Please Select Quarter & Year");
						return false;
					}
					if(quarter!="" && year==""){
						alert("Please Select Year");
						return false;
					}
					if(quarter=="" && year!=""){
						alert("Please Select Quarter");
						return false;
					}
					week="";
					month="";
				}
							
				$.ajax({type:"POST",
				url: 'dca'+action+'.do',
				'data':  { 
					searchDate: searchDate,month: month,year: year,
					hudId:hudId,blockId:blockId,institutionId:institutionId,classificationName:classificationName,
					frequency:frequency,week:week,quarter:quarter,hudName:hudName,blockName:blockName
				    },
				    success: function (output) {
				    	var data = JSON.parse(output);
				    	var gridData = data.dcaDirectorateRecords;
				    	var isFrequencySelectionValid = data.isFrequencySelectionValid;
				    	var genearlCategoryList="";
				    	if(data.genearlCategoryList!="")
				    		genearlCategoryList = JSON.parse(data.genearlCategoryList);
				    	
				    	var myTabLength=document.getElementById('myTab').children.length;
				    	if(isFrequencySelectionValid){
				    		if(action=='search'){
						    	for (var i = 0; i < myTabLength; i++) {
						    		var category=genearlCategoryList[i];
						    		if(category!=null || category=='undefined'){
						    			document.getElementById("generalCategoryLinkId"+i).textContent=category.name;
						    			document.getElementById("generalCategoryLinkId"+i).style.pointerEvents = "";
						    			
						    		}else{
						    			document.getElementById("generalCategoryLinkId"+i).style.display = "none";
						    		}
						    	}
				    		}
					    	disableFields();
						   	document.getElementById('cancel').disabled=false;
						   document.getElementById("gridHudLabel").textContent=hudName;
						   	if(hudName=='NA'){
						   	document.getElementById("blockLabel").style.display="none";
						   	document.getElementById("gridBlockLabel").style.display="none";
							document.getElementById("blockHyphen").style.display = "none";	
						   	document.getElementById("institutionLabel").style.display="inline";
						   	document.getElementById("gridInstitutionLabel").style.display="inline";
							document.getElementById("institutionHyphen").style.display = "inline";	
						   	document.getElementById("gridInstitutionLabel").textContent=institutionName;
						   	}else{
						   		document.getElementById("blockLabel").style.display="inline";
							   	document.getElementById("gridBlockLabel").style.display="inline";
								document.getElementById("blockHyphen").style.display = "inline";	
							   	document.getElementById("institutionLabel").style.display="none";
							   	document.getElementById("gridInstitutionLabel").style.display="none";
								document.getElementById("institutionHyphen").style.display = "none";	
						   		document.getElementById("gridBlockLabel").textContent=blockName;
						   	}
						   	document.getElementById("gridFrequencyLabel").textContent=frequency; 
						   	 if (gridData!='null' && gridData.length > 0) {
							   	    handsontable.loadData(gridData);
							  }
						   	 //Selected tab as active
								$('#myTab li:eq('+tabId+') a').tab('show'); 
				    	}else{
				    		alert("There is no indicator name for "+frequency+" frequency");
				    		return false;
				    	}	 
				    	if(!checkCOFTime()){
							document.getElementById('isDataGridReadOnly').value=true;
							document.getElementById('submit').disabled=true;
						}else{
							document.getElementById('isDataGridReadOnly').value=false;
							document.getElementById('submit').disabled=false;
						}
				      },
				      error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					    }});				
			}
				
		   function doSubmit(){
			   clearMessage();
			   var hudId="";		
			   var blockId="";
			   var institutionId="";
			   var classificationName="";
			   var blockName="";
			   var e1 = document.getElementById("hudName");
			   if (e1 != 'undefined') {
				   hudId = e1.options[e1.selectedIndex].value;
				   hudName= e1.options[e1.selectedIndex].text;
			   }	
			   if(hudName=='NA'){
				   var e2 = document.getElementById("institutionName");
				   if (e2 != 'undefined') {
					   institutionId = e2.options[e2.selectedIndex].value;
				   }
			   }
			   else{
				   var e3 = document.getElementById("blockName");
				   if (e3 != 'undefined') {
					   blockId = e3.options[e3.selectedIndex].value;
					   blockName= e3.options[e3.selectedIndex].text;
				   }
			   }
				var searchDate = document.getElementById('date').value;
				var e5 = document.getElementById('timePeriod');
				var frequency = e5.options[e5.selectedIndex].text;
				var e6 = document.getElementById('week');
				var week = e6.options[e6.selectedIndex].text;
				var e7 = document.getElementById('quarter');
				var quarter = e7.options[e7.selectedIndex].text;
				var month = document.getElementById('month').value;
				var year = document.getElementById('year').value;
				var csrfToken=document.getElementById('CSRF_TOKEN').value;
				
				var isDataExists = document.getElementById('isDataExists').value;
				   if(isDataExists=='true'){
					   alert("Indicator value can not be modified.Please contact system administrator");
					   return false;
				   }
				var submitType=document.getElementById('submitType').value;
				if(frequency=='Daily'){
					if(searchDate==""){
						alert("Please Select Date");
						return false;
					}
					week="";
					quarter="";
				}else if(frequency=='Weekly'){
					if(week =="" && month=="" && year==""){
						alert("Please Select Week,Month,Year");
						return false;
					}
					if(week !="" && month=="" && year==""){
						alert("Please Select Month & Year");
						return false;
					}
					if(week =="" && month!="" && year==""){
						alert("Please Select Week & Year");
						return false;
					}
					if(week =="" && month=="" && year!=""){
						alert("Please Select Week & Month");
						return false;
					}
					if(week !="" && month=="" && year!=""){
						alert("Please Select Month");
						return false;
					}
					if(week !="" && month!="" && year==""){
						alert("Please Select Year");
						return false;
					}
					if(!validateMonthAndYear())
						return false;
					quarter="";
				}else if (frequency=='Monthly'){
					if(month=="" && year==""){
						alert("Please Select Month & Year");
						return false;
					}
					if(month!="" && year==""){
						alert("Please Select Year");
						return false;
					}
					if(month=="" && year!=""){
						alert("Please Select Month");
						return false;
					}
					if(!validateMonthAndYear())
						return false;
					week="";
					quarter="";
				}else if (frequency=='Quarterly'){
					if(quarter=="" && year==""){
						alert("Please Select Quarter & Year");
						return false;
					}
					if(quarter!="" && year==""){
						alert("Please Select Year");
						return false;
					}
					if(quarter=="" && year!=""){
						alert("Please Select Quarter");
						return false;
					}
					week="";
					month="";
				}
			   formFlag=true;
			   var incicatorValueFlag=false;
			   var handsOnTableData=handsontable.getData();
			   for(i=1;i<handsOnTableData.length;i++){
				   	if(handsOnTableData[i]!=null && handsOnTableData[i].indicatorvalue!=null){
				   		var ischaracter = handsOnTableData[i].ischaracter;
				   		var indicatorName=handsOnTableData[i].indicatorname1;
				   		var indicatorValue=handsOnTableData[i].indicatorvalue;
				   		if(typeof ischaracter != 'undefined' && ischaracter=='N'){
					   		if(!isNumeric(indicatorValue)){
						   		alert("Please Enter Numeric value in '"+indicatorName+"' field");
						   		formFlag=false;
						   		return false;
					   		}
				   		}else if(typeof ischaracter != 'undefined' && ischaracter=='Y'){
				   			if(indicatorValue!="" && !isValidCharacter(indicatorValue)){
				   				alert("Please enter valid character in '"+indicatorName+"' field");
				   				return false;
				   			}
				   		}	
				   		incicatorValueFlag=true;
				   	}
					if(handsontable.isEmptyRow(i)){
						handsOnTableData[i]=null;
					}
				}
			   if(!incicatorValueFlag){
				   alert("Please enter atleast one indicator value");
				   return false;
			   }
			   if(formFlag){
			   		formFlag = confirm("Do you really want to save?");
				   if(formFlag){
					   document.getElementById('submit').disabled=true;
					   $.ajax({type:"POST",
							url: 'dca'+submitType+'.do',
							'data':  { 
								handsOnTableData: JSON.stringify(handsOnTableData),searchDate: searchDate,month: month,year: year,
								hudId:hudId,blockId:blockId,institutionId:institutionId,classificationName:classificationName,frequency:frequency,week:week,
								quarter:quarter,CSRF_TOKEN:csrfToken,hudName:hudName,blockName:blockName
							    },
							    success: function (result) {
							    	alert(result);						    
							      },
							      error: function (xhr, status, error) {
						                alert("Internal Error Occured-Please Contact System Administrator");
								    }});
				   }
			   }  
				return false;
		   }
		   
	 	function clearMessage(){
	 		$("#errorMessage").text("");
	  	  	$("#successMessage").text("");
		   }
	 	
	 	function disableFields(){
	 		document.getElementById("directorateName").disabled=true;
	 		document.getElementById("hudName").disabled=true;
	 		document.getElementById("institutionName").disabled=true;
	 		document.getElementById("blockName").disabled=true;
	 		document.getElementById("timePeriod").disabled=true;
	 		document.getElementById("date").disabled=true;
	 		$( "#date" ).datepicker('disable');
	 		document.getElementById("week").disabled=true;
	 		document.getElementById("quarter").disabled=true;
	 		document.getElementById("month").disabled=true;
	 		document.getElementById("year").disabled=true;	 		
		}
	 	
	 	function enabledFields(){
	 		document.getElementById("directorateName").disabled=false;
	 		document.getElementById("districtName").disabled=false;
	 		document.getElementById("institutionName").disabled=false;
	 		document.getElementById("blockName").disabled=false;
	 		document.getElementById("timePeriod").disabled=false;
	 		document.getElementById("date").disabled=false;
	 		document.getElementById("week").disabled=false;
	 		document.getElementById("quarter").disabled=false;
	 		$( "#date" ).datepicker('enable');
	 		document.getElementById("month").disabled=true;
	 		document.getElementById("year").disabled=true;
		}
	 	
	 	function changeHUD(){
			var e1 = document.getElementById("hudName");
			var hudId = e1.options[e1.selectedIndex].value;
			var hudName = e1.options[e1.selectedIndex].text;
			$.ajax({type:"POST",
				url: 'dcahudChange.do',
				'data':  { 
					hudName:hudName,hudId:hudId
				    },
				    success: function (result) {
				    	var jsonData = JSON.parse(result);
				    	if(hudName=='NA'){
					    	var $select = $('#institutionName');
				    	}else{
				    		var $select = $('#blockName'); 
				    	}
				    		$select.find('option').remove();                          
			               $.each(jsonData, function(idx, obj) { 
			                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
			                    });				        	
				      },
				      error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					    }});			
	  	}
	 	
		function enableLabel(){
			var e1 = document.getElementById("hudName");
			if (e1 != 'undefined') {
				hudId = e1.options[e1.selectedIndex].value;
				hudName= e1.options[e1.selectedIndex].text;
			}	
			if(hudName=='NA'){
				document.getElementById('lblBlock').style.display = "none";
				document.getElementById('blockName').style.display = "none";
				document.getElementById('lblInstitution').style.display = "inline";
				document.getElementById('institutionName').style.display = "inline";	
			}
			else{
				document.getElementById('lblInstitution').style.display = "none";
				document.getElementById('institutionName').style.display = "none";
				document.getElementById('lblBlock').style.display = "inline";
				document.getElementById('blockName').style.display = "inline";	
			}
		}
		
		function onLoad(){
			var directorate = document.getElementById('directorateName');
			var directorateId = document.getElementById('directorateId').value;
	  		for (var i = 0; i < directorate.length; i++) {
	  		    if (directorate.options[i].value == directorateId) {
	  		    	directorate.selectedIndex = i;
	  		        break;
	  		    }
	  		}
	  		getCalender();
			document.getElementById('month').disabled=true;
			document.getElementById('year').disabled=true;
			document.getElementById('week').style.display = "none";
			document.getElementById('lblWeek').style.display = "none";
			document.getElementById('quarter').style.display = "none";
			document.getElementById('lblQuarter').style.display = "none";
			document.getElementById('submit').disabled=true;
			document.getElementById('cancel').disabled=true;
		  	document.getElementById("gridHudLabel").textContent=document.getElementById("selectedHudName").value;
		  	document.getElementById("gridBlockLabel").textContent=document.getElementById("selectedBlockName").value;
		   	document.getElementById("gridInstitutionLabel").style.display = "none";	
		   	document.getElementById("institutionLabel").style.display = "none";	
		 	document.getElementById("institutionHyphen").style.display = "none";	
		   	document.getElementById("gridFrequencyLabel").textContent='Daily';
			enableLabel();
			
		}
		
			   
		</script>
	<script src="js/commonHandsontable.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
	<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
	<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>