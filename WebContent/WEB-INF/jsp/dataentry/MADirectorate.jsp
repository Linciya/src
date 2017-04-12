<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.Util"%>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.UserInfo"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>MA Directorate</title>
		<%
		String userTier=UserInfo.getUserTier();
		%>
		<script src="jquery/jquery-1.8.min.js"></script>
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- Loading Handsontable (full distribution that includes all dependencies apart from jQuery) -->
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css">
		<!--Loading demo dependencies. They are used here only to enhance the examples on this page-->
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css">
		<script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>
		<script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script>
		<link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
		
		<!-- Dropdown Design and Validation -->
		<script src="js/script.js"></script>
		<script src="js/MAValidator.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />
		<script type="text/javascript">
			function onLoad(){
				<%
			 		List<CommonStringList> regionList =  (List<CommonStringList>)request.getAttribute("regionList"); 
			  		String region=null;
			  		if(Util.isNotNull(regionList) && regionList.size()>0){
			      		CommonStringList commonString = regionList.get(0);
			      		region=commonString.getName();
		      		}
			  	%>
			  	var regionName='<%=region%>';
			  	var corporationIndex = regionName.indexOf("Corporation");
				if(corporationIndex!=-1){
					document.getElementById('corpMunicipalityName').style.display = "none";
					document.getElementById('lblMunicipality').style.display = "none";
					document.getElementById('lblInstitution').style.display = "none";	
					document.getElementById('institutionName').style.display = "none";
					document.getElementById("lblMunicipalityLabel").style.display = "none";
				}else{
					document.getElementById('lblCorporationInstitution').style.display = "none";	
					document.getElementById('corporationInstitutionName').style.display = "none";
					document.getElementById("gridMunicipalityLabel").textContent=document.getElementById("selectedMunicipalityName").value;
				}
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
				document.getElementById("gridRegionLabel").textContent=document.getElementById("selectedRegionName").value;
			    document.getElementById("gridInstitutionLabel").textContent=document.getElementById("selectedInstitutionName").value;
			   	document.getElementById("gridFrequencyLabel").textContent='Daily';
			}
		</script>	
	</head>
	<body onload="onLoad();">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<input id="encodedJsonArray"  type="hidden" name="encodedJsonArray" value="<%= request.getAttribute("encodedJsonArray") %>"/>
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
		<input id="directorateServletList"  type="hidden" name="directorateServletList" value="<%= request.getAttribute("directorateServletList") %>"/>
		<input id="districtId"  type="hidden" name="encodedJsonArray" value="<%= request.getAttribute("districtId") %>"/>
		<input id="submitType"  type="hidden" name="submitType"/>
		<input id="regionChange"  type="hidden" name="regionChange"/>
		<input id="indicatorNames"  type="hidden" name="indicatorNames" value="<%= request.getAttribute("indicatorNames") %>"/>
		<input id="corporationNames"  type="hidden" name="corporationNames" value="<%= request.getAttribute("corporationNames") %>"/>
		<input id="municipalityNames"  type="hidden" name="municipalityNames" value="<%= request.getAttribute("municipalityNames") %>"/>
		<input id="corporationId"  type="hidden" name="corporationId" value="<%= request.getAttribute("corporationId") %>"/>
		<input id="municipalityId"  type="hidden" name="municipalityId" value="<%= request.getAttribute("municipalityId") %>"/>
		<input id="isDataExists"  type="hidden" name="isDataExists" value="<%= request.getAttribute("isDataExists") %>"/>
		<input id="selectedDistrictName"  type="hidden"  value="<%= request.getAttribute("districtName") %>"/>
		<input id="selectedRegionName"  type="hidden" value="<%= request.getAttribute("regionName") %>"/>
		<input id="selectedInstitutionName"  type="hidden" value="<%= request.getAttribute("selectedInstitutionName") %>"/>
		<input id="selectedMunicipalityName"  type="hidden" value="<%= request.getAttribute("municipalityName") %>"/>
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
				<td align="right" class="required" width="220px;">
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
					 <option value='5'>Yearly</option>
				</select>
				</td>
			</tr>
			<tr>
			<td align="right" class="required" width="220px;">	
					<b>Region/Corporation:</b>&nbsp;&nbsp;
				</td>
				<td width="170px;">	
					<select id="regionName" class="dropDown" name="regionName" onchange="changeRegion();">
						 <c:forEach var="region" items="${regionList}">
						     <option value='<c:out value="${region.id}"/>'>${region.name} </option>
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
				<td  width="220px;" align="right">
					<b><label id="lblMunicipality" class="required">Municipality:</label></b>
					<b><label id="lblCorporationInstitution" class="required">Institution:</label></b>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td  width="170px;">
					<select id="corpMunicipalityName" class="dropDown" name="corpMunicipalityName" onchange="changeCorpAndMunicipality();">
						 <c:forEach var="corpMunicipality" items="${corporationAndMunicipalityList}">
						     <option value='<c:out value="${corpMunicipality.id}"/>'>${corpMunicipality.name} </option>
						 </c:forEach>
					</select>
					<select id="corporationInstitutionName" name="institutionName" class="dropDown">
						 <c:forEach var="institution" items="${institutionList}">
						     <option value='<c:out value="${institution.id}"/>'>${institution.name} </option>
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
			<td  align="right" width="220px;">	 
					<b><label id="lblInstitution" class="required">Institution:</label></b>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td width="170px;">	
					<select id="institutionName" name="institutionName" class="dropDown">
						 <c:forEach var="institution" items="${institutionList}">
						     <option value='<c:out value="${institution.id}"/>'>${institution.name} </option>
						 </c:forEach>
					</select>
				</td>
			<td  align="right" width="170px;">	
					<b>Year:</b>
				</td>
				<td width="170px;" colspan="2">	
					<select name="year" id="year"  class="dropDown" size="1" onchange="validateMonthAndYear();">
						<option value="">--Select--</option>
					     <c:forEach var="year" items="${yearList}">
						     <option value='<c:out value="${year}"/>'>${year} </option>
						 </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td  align="right" width="220px;">	 
					
				</td>
				<td width="170px;">	
				</td>
				<td  width="170px;">
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
				<td width="170px;">
					<button type="button" class="btn btn-primary" onclick="doSearch('<%=categoryName%>','0','search');">Search</button>
				</td>
				<td width="800px;"></td>
			</tr>
			<tr>
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
				<td class="directoratenameheader" width="1310px;">
					<label style="padding-left: 320px;font-size: 14px;">Municipal Administration - Health Wing</label><br>
					<label>Classification</label>
				</td>
			</tr>	
			<tr> 
				<td valign="top" class="serachcriteriasummary" width="220px;" colspan="1">
				<b>Search Criteria</b><br><br>
				<b>Directorate</b> - <label id="gridDirectorateLabel">MA</label> <br><br>
				<b>Reg/Corp.</b> - <label id="gridRegionLabel"></label><br><br>
				<b><label id="lblMunicipalityLabel">Municipality -</label></b>  <label id="gridMunicipalityLabel"></label><br><br>
				<b>Institution</b> - <label id="gridInstitutionLabel"></label><br><br>
				<b>Frequency</b> - <label id="gridFrequencyLabel"></label><br><br>
				</td>
				<td width="1310px;" class="categorytab">
					<div id="tabs">
					  <ul class="nav nav-pills" id="myTab">
					  <% 
					  if(categoryList!=null){
						  	boolean isActive=true;
						  	int tabId=0;
						  	for(CommonStringList category : categoryList){%>
						  			<li id="tabId<%=tabId%>" role="presentation" style="height:10px;" ><a id="generalCategoryLinkId<%=tabId%>" style="pointer-events:none; font-weight: bold;" href="#" onclick="doSearch('<%= category.getName()%>','<%=tabId%>','tabChange');"><%= category.getName()%></a></li>
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
				<td align="center" width="1310px;">		
					<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();">Submit</button>&nbsp;
					<button id="cancel" type="button" class="btn btn-primary" value="Cancel" onclick="doCancel('<%=request.getContextPath()%>','/maDataEntry.do');">Reset Form</button>&nbsp;
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
			    	var submitButtonValue=document.getElementById("submit").disabled;
			    	if(!submitButtonValue){
				    	var formFlag = confirm("Do you want to move to next classification and If you click on 'OK' button,Current indicators data will be lost");
				    	if(!formFlag){
				    		return; 
				    	}
			    	}
			    }
				var searchDate = document.getElementById('date').value;
				var e5 = document.getElementById('timePeriod');
				var frequency = e5.options[e5.selectedIndex].text;
				var e6 = document.getElementById('week');
				var week = e6.options[e6.selectedIndex].text;
				var e7 = document.getElementById('quarter');
				var quarter = e7.options[e7.selectedIndex].text;
				var e9 = document.getElementById('regionName');
				var regionName = e9.options[e9.selectedIndex].text;
				var regionOrCorporationId = e9.options[e9.selectedIndex].value;
				var e10 = document.getElementById('institutionName');
				var e11 = document.getElementById('corporationInstitutionName');
				
				var corporationIndex = regionName.indexOf("Corporation");
				var institutionId="";
				var municipalityName="";
				var corporationId="";
				var InstitutionName="";
				
				if(corporationIndex!=-1){
					institutionId=e11.options[e11.selectedIndex].value;
					corporationId=-99;
					InstitutionName=e11.options[e11.selectedIndex].text;
					document.getElementById("lblMunicipalityLabel").style.display = "none";
					municipalityId =-99;
				}else{
					document.getElementById("lblMunicipalityLabel").style.display = "inline";
					institutionId=e10.options[e10.selectedIndex].value;
					InstitutionName=e10.options[e10.selectedIndex].text;
					var e2 = document.getElementById("corpMunicipalityName");
					municipalityId = e2.options[e2.selectedIndex].value;
					municipalityName =  e2.options[e2.selectedIndex].text;
				}
				
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
				}else if(frequency=='Yearly'){
					if(year==""){
						alert("Please Select Year");
						return false;
					}
					if(!validateYear())
						return false;
					week="";
					quarter="";
					month="";					
				}
				 		
				$.ajax({type:"POST",
				url:'ma'+action+'.do',
				'data':  { 
					searchDate: searchDate,month: month,year: year,regionOrCorporationId:regionOrCorporationId,municipalityId:municipalityId,
					classificationName:classificationName,frequency:frequency,week:week,quarter:quarter,regionName:regionName,institutionId:institutionId
				    },
				    success: function (output) {
				    	var data = JSON.parse(output);
				    	var gridData = data.maDirectorateRecords;
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
						   	document.getElementById("gridRegionLabel").textContent=regionName;
						   	document.getElementById("gridMunicipalityLabel").textContent=municipalityName;
						   	document.getElementById("gridInstitutionLabel").textContent=InstitutionName;
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
			   
				var e2 = document.getElementById("corpMunicipalityName");
				var municipalityId;
				if(e2!=null && e2!='undefined'&& e2.options.length>0){
					municipalityId = e2.options[e2.selectedIndex].value;
					//var municipalityName =  e2.options[e2.selectedIndex].text;
		    	}
				var searchDate = document.getElementById('date').value;
				var e5 = document.getElementById('timePeriod');
				var frequency = e5.options[e5.selectedIndex].text;
				var e6 = document.getElementById('week');
				var week = e6.options[e6.selectedIndex].text;
				var e7 = document.getElementById('quarter');
				var quarter = e7.options[e7.selectedIndex].text;
				var e9 = document.getElementById('regionName');
				var regionName = e9.options[e9.selectedIndex].text;
				var regionOrCorporationId = e9.options[e9.selectedIndex].value;
				var e10 = document.getElementById('institutionName');
				var e11 = document.getElementById('corporationInstitutionName');
				
				var month = document.getElementById('month').value;
				var year = document.getElementById('year').value;
				var csrfToken=document.getElementById('CSRF_TOKEN').value;
				
				var corporationIndex = regionName.indexOf("Corporation");
				var institutionId;
				if(corporationIndex!=-1){
					institutionId=e11.options[e11.selectedIndex].value;
					municipalityId=-99;
				}else{
					institutionId=e10.options[e10.selectedIndex].value;
				}
		
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
				}else if(frequency=='Yearly'){
					if(year==""){
						alert("Please Select Year");
						return false;
					}
					if(!validateYear())
						return false;
					week="";
					quarter="";
					month="";					
				}
				 
				var isDataExists = document.getElementById('isDataExists').value;
				   if(isDataExists=='true'){
					   alert("Indicator value can not be modified.Please contact system administrator");
					   return false;
				   }
				var submitType=document.getElementById('submitType').value;
				var emptyIndValueCount=0;
				   
			   formFlag=true;
			   var incicatorValueFlag=false;
			   var handsOnTableData=handsontable.getData();
			   for(i=1;i<handsOnTableData.length;i++){
				   	if(handsOnTableData[i]!=null && handsOnTableData[i].indicatorvalue!=null){
				   		var ischaracter = handsOnTableData[i].ischaracter;
				   		var indicatorName=handsOnTableData[i].indicatorname1;
				   		var indicatorValue=handsOnTableData[i].indicatorvalue;
		
				   		if(typeof ischaracter != 'undefined' && ischaracter=='N'){
				   			if(isDecimalIndicator(indicatorName)){
				   				formFlag=validateDecimalField(indicatorName,indicatorValue);
				   			}else{	
				   				formFlag=validateNumericField(indicatorName,indicatorValue);
				   			}	
				   			if(!formFlag)
				   				return; 
				   		 }else if(typeof ischaracter != 'undefined' && ischaracter=='Y'){
		        			if(isDateField(indicatorName)){
		        					 formFlag=isValidDate(indicatorValue);
		        					 if(!formFlag)
		        						 return;
		        			     }else {
		        			    	 formFlag=validateCharacterField(indicatorName,indicatorValue);
		     		   			if(!formFlag)
		    		   				return;
		     		   			} 
				   		}
		        		
				   		if(indicatorValue!="")
				   			incicatorValueFlag=true;
				   	}
				   	if(i>1 && handsOnTableData[i]!=null && handsOnTableData[i].indicatorname1!=null){
				   		if(handsOnTableData[i].indicatorvalue==null)
				   			emptyIndValueCount++;
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
				   if(emptyIndValueCount==0)
				  	formFlag = confirm("Do you really want to save?");
				   else 
					 formFlag = confirm("You did not enter indicator values for  '"+emptyIndValueCount+"'  fields and Do you really want to save?");
				  if(formFlag){
					  document.getElementById('submit').disabled=true;
							   $.ajax({type:"POST",
									url: 'ma'+submitType+'.do',
									'data':  { 
										handsOnTableData: JSON.stringify(handsOnTableData),searchDate: searchDate,month: month,year: year,
										regionOrCorporationId:regionOrCorporationId,municipalityId:municipalityId,frequency:frequency,week:week,quarter:quarter,regionName:regionName,
										institutionId:institutionId,CSRF_TOKEN:csrfToken
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
		   
			function indicatorValidation(indicatorName,indicatorValue){
				if(indicatorName=='Grand Total no.of Sanitation certificates issued'){
					if(!(indicatorValue==0 || indicatorValue==1)){
						alert("Please enter indicator value as 0 or 1 for "+indicatorName);
						return false;
					}
				}
				return true;
			}   
			
		 	function clearMessage(){
		 		$("#errorMessage").text("");
		  	  	$("#successMessage").text("");
			}
		 	
		 	function disableFields(){
		 		document.getElementById("regionName").disabled=true;
		 		document.getElementById("directorateName").disabled=true;
		 		document.getElementById("corpMunicipalityName").disabled=true;
		 		document.getElementById("institutionName").disabled=true;
		 		document.getElementById("timePeriod").disabled=true;
		 		document.getElementById("date").disabled=true;
		 		$( "#date" ).datepicker('disable');
		 		document.getElementById("week").disabled=true;
		 		document.getElementById("quarter").disabled=true;
		 		document.getElementById("month").disabled=true;
		 		document.getElementById("year").disabled=true;
			}
		 	
		 	function enabledFields(){
		 		document.getElementById("regionName").disabled=false;
		 		document.getElementById("directorateName").disabled=false;
		 		document.getElementById("corpMunicipalityName").disabled=false;
		 		document.getElementById("institutionName").disabled=false;
		 		document.getElementById("timePeriod").disabled=false;
		 		document.getElementById("date").disabled=false;
		 		document.getElementById("week").disabled=false;
		 		document.getElementById("quarter").disabled=false;
		 		$( "#date" ).datepicker('enable');
		 		document.getElementById("month").disabled=true;
		 		document.getElementById("year").disabled=true;
			}
			 	
			function changeRegion(){
				var e1 = document.getElementById("regionName");
				var regionName = e1.options[e1.selectedIndex].text;
				var regionOrCorporationId = e1.options[e1.selectedIndex].value;
				
				var corporationIndex = regionName.indexOf("Corporation");
				if(corporationIndex!=-1){
					document.getElementById("timePeriod").value=1;
					enableFields();
					document.getElementById('corpMunicipalityName').style.display = "none";
					document.getElementById('lblMunicipality').style.display = "none";
					document.getElementById('lblInstitution').style.display = "none";	
					document.getElementById('institutionName').style.display = "none";
					document.getElementById('lblCorporationInstitution').style.display = "inline";	
					document.getElementById('corporationInstitutionName').style.display = "inline";
				}	
				else{
					document.getElementById('corpMunicipalityName').style.display = "inline";
					document.getElementById('lblMunicipality').style.display = "inline";
						document.getElementById('lblInstitution').style.display = "inline";	
						document.getElementById('institutionName').style.display = "inline";
						document.getElementById('lblCorporationInstitution').style.display = "none";	
						document.getElementById('corporationInstitutionName').style.display = "none";
				}
		        			
		        if(corporationIndex==-1){
					$.ajax({type:"POST",
						url: 'maregionChange.do',
						'data':  { 
							regionOrCorporationId:regionOrCorporationId,isCorporation:'N'
						    },
						    success: function (result) {
						    	var jsonData = JSON.parse(result);
						    	var $select = $('#corpMunicipalityName');                           
					               $select.find('option').remove();                          
					               $.each(jsonData, function(idx, obj) { 
					                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
					                    });						        	
						      },
						      error: function (xhr, status, error) {
					                alert("Internal Error Occured-Please Contact System Administrator");
							    }});
				}else{
					$.ajax({type:"POST",
						url: 'maregionChange.do',
						'data':  { 
							regionOrCorporationId:regionOrCorporationId,isCorporation:'Y'
						    },
						    success: function (result) {
						    	var jsonData = JSON.parse(result);
						    	var $select = $('#corporationInstitutionName');                           
					               $select.find('option').remove();                          
					               $.each(jsonData, function(idx, obj) { 
					                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
					                    });						        	
						      },
						      error: function (xhr, status, error) {
					                alert("Internal Error Occured-Please Contact System Administrator");
							    }});
				}				
		  	}
			
			function changeCorpAndMunicipality(){
				var e1 = document.getElementById("corpMunicipalityName");
				var corpMunicipalityId = e1.options[e1.selectedIndex].value;
				$.ajax({type:"POST",
					url:'macorpChange.do',
					'data':  { 
						corpMunicipalityId:corpMunicipalityId
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
		
		</script>
		<script src="js/commonHandsontable.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>