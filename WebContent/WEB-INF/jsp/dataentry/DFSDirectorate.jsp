
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.UserInfo"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
<title>DFS Directorate</title>
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
  <link rel="stylesheet" type="text/css" href="css/style.css"/>	  
</head>

<body onload="onLoad();">
<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
<input id="encodedJsonArray"  type="hidden" name="encodedJsonArray" value="<%= request.getAttribute("encodedJsonArray") %>"/>
<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
<input id="selectedDistrictName"  type="hidden"  value="<%= request.getAttribute("districtName") %>"/>
<input id="selectedInstitutionName"  type="hidden" value=""/>
<input id="directorateServletList"  type="hidden" name="directorateServletList" value="<%= request.getAttribute("directorateServletList") %>"/>
<input id="submitType"  type="hidden" name="submitType"/>
<input id="isDataExists"  type="hidden" name="isDataExists" value="<%= request.getAttribute("isDataExists") %>"/>
<input id="userAccessLevel" type="hidden" name="userAccessLevel" value="<%= request.getAttribute("userAccessLevel") %>"/>
<input id="currentHours"  type="hidden" name="currentHours" value="<%= request.getAttribute("currentHours") %>"/>
<input id="currentDate"  type="hidden" name="currentDate" value="<%= request.getAttribute("currentDate") %>"/>
<input id="isDataGridReadOnly"  type="hidden" name="isDataGridReadOnly"/>
<table border="0">
	  <% 
			String categoryName="";
			List<CommonStringList> categoryList = null;
			if(request.getAttribute("classificationList")!=null){
				  	categoryList = (List<CommonStringList>)request.getAttribute("classificationList");
					if(categoryList!=null && categoryList.size()>0){
						categoryName = categoryList.get(0).getName();
					}
			}
			String userAccessLevel=(String)request.getAttribute("userAccessLevel");
			if(userAccessLevel!=null && userAccessLevel.equalsIgnoreCase("District")){
		%>
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
	<td align="right" class="required" width="170px;">	
			<b>District:</b>&nbsp;&nbsp;
		</td>
		<td width="170px;">	
			<select id="districtName" name="districtName" class="dropDown">
				 <c:forEach var="district" items="${districts}">
				     <option value='<c:out value="${district.id}"/>'>${district.name} </option>
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
		<td  align="right" width="170px;" >		
			<b>Frequency:</b>&nbsp;&nbsp;
		</td>
		<td  width="170px;">	
		<select name="timePeriod" id="timePeriod" size="1" class="dropDown" onchange="enableFields();">
		     <c:forEach var="freuency" items="${freuencyList}">
			     <option value='<c:out value="${freuency.id}"/>'>${freuency.name} </option>
			 </c:forEach>
		</select>
		</td>
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
	<% } else if(userAccessLevel!=null && userAccessLevel.equalsIgnoreCase("Lab")){ %>
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
						<b>Food Analysis Lab:</b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="labName" name="labName" class="dropDown" onchange="changeLab();">
							<option value="">--Select--</option>
							<c:forEach var="lab" items="${labList}">
						    	<option value='<c:out value="${lab.id}"/>'>${lab.name} </option>
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
					<td align="right" class="required" width="170px;">	
						<b>District:</b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="district" name="district" class="dropDown" onchange="changeDistrict();">
							<option value="">--Select--</option>
							<c:forEach var="district" items="${districtsList}">
						    	<option value='<c:out value="${district.id}"/>'>${district.name} </option>
							</c:forEach>
						</select>
					</td>
					<td  align="right" width="170px;">
						<b><label id="lblMonth">Month:</label><label id="lblQuarter">Quarter:</label></b>
						&nbsp;
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
					<td  align="right" class="required" width="200px;">	 
						<b>Area Type:</b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="institutionType" name="institutionType" class="dropDown" onchange="changeInstitutionType();">
							<option value="">--Select--</option>
							 <c:forEach var="institutionType" items="${institutionTypeList}">
							     <option value='<c:out value="${institutionType.name}"/>'>${institutionType.name} </option>
							 </c:forEach>
						</select> 
					</td>
					<td  align="right" width="170px;">	
						<b>Year:</b>
						&nbsp;
					</td>
					<td colspan="3" width="170px;">	
						<select name="year" id="year"  class="dropDown" size="1" onchange="validateMonthAndYear();">
							<option value="">--Select--</option>
						     <c:forEach var="year" items="${yearList}">
							     <option value='<c:out value="${year}"/>'>${year} </option>
							 </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td  align="right" class="required" width="200px;">	 
						<b>Area:</b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="institutionSpeciality" name="institutionSpeciality" class="dropDown" onchange="changeInstitutionSpeciality();">
							<option value="">--Select--</option>
							 <c:forEach var="institutionSpeciality" items="${institutionSpecialityList}">
							     <option value='<c:out value="${institutionSpeciality.name}"/>'>${institutionSpeciality.name} </option>
							 </c:forEach>
						</select> 
					</td>
					<td colspan=3 width="170px;"></td>
				</tr>
				<tr>
					<td align="right" class="required" width="170px;">
						<b>Area Code:</b>
						&nbsp;
					</td>
					<td colspan="3" width="170px;">
						<select id="areaCode" name="areaCode" class="dropDown">
						<option value="">--Select--</option>
						<c:forEach var="area" items="${areaCodeList}">
						     <option value='<c:out value="${area.id}"/>'>${area.name} </option>
						</c:forEach>
						</select>
					</td>
					<td width="940px;">
						<button type="button" class="btn btn-primary" onclick="doSearch('<%=categoryName%>','0','search');">Search</button>
					</td>
				</tr>
				<% }else{ %>
				<tr>
					<td colspan="6" class="appheader">
						<b>SHDRC DATA Entry - Web Form</b>
					</td>
				</tr>
				<tr>
					<td align="right" class="required" width="170px;">
						<b>Directorate:</b>&nbsp;&nbsp;
					</td>
					<td colspan=4 width="170px;">
						<select id="directorateName" name="directorateName" class="dropDown" onchange="changeDirectorate('<%=request.getContextPath()%>');">
						<c:forEach var="directorate" items="${directorateList}">
						     <option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="required" align="right" width="170px;" >		
						<b>Level:</b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select name="level" id="level" size="1" class="dropDown" onchange="changeLevel();">
						     <option value='<c:out value="district"/>'>District</option>
						     <option value='<c:out value="lab"/>'>Lab</option>
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
					<td align="right" width="170px;">	
						<label id="lblDistrict" class="required"><b>District:</b></label><label id="lblLab" class="required"><b>Food Analysis Lab:</b></label>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="districtName" name="districtName" class="dropDown">
							<c:forEach var="district" items="${districts}">
								<option value='<c:out value="${district.id}"/>'>${district.name} </option>
							</c:forEach>
						</select>

						<select id="labName" name="labName" class="dropDown" onchange="changeLab();">
							<option value="">--Select--</option>
							<c:forEach var="lab" items="${labList}">
						    	<option value='<c:out value="${lab.id}"/>'>${lab.name} </option>
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
					<td align="right" width="170px;">	
						<b><label id="lblDist" class="required" >District:</label> </b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="district" name="district" class="dropDown" onchange="changeDistrict();">
							<option value="">--Select--</option>
							<c:forEach var="district" items="${districtsList}">
						    	<option value='<c:out value="${district.id}"/>'>${district.name} </option>
							</c:forEach>
						</select>
					</td>
					<td  align="right" width="170px;">
						<b><label id="lblMonth">Month:</label><label id="lblQuarter">Quarter:</label></b>
						&nbsp;
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
					<td  align="right" width="200px;">	 
						<b><label id="lblAreaType" class="required" >Area Type:</label></b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="institutionType" name="institutionType" class="dropDown" onchange="changeInstitutionType();">
							<option value="">--Select--</option>
							 <c:forEach var="institutionType" items="${institutionTypeList}">
							     <option value='<c:out value="${institutionType.name}"/>'>${institutionType.name} </option>
							 </c:forEach>
						</select> 
					</td>
					<td  align="right" width="170px;">	
						<b>Year:</b>
						&nbsp;
					</td>
					<td colspan="3" width="170px;">	
						<select name="year" id="year"  class="dropDown" size="1" onchange="validateMonthAndYear();">
							<option value="">--Select--</option>
						     <c:forEach var="year" items="${yearList}">
							     <option value='<c:out value="${year}"/>'>${year} </option>
							 </c:forEach>
						</select>
					</td>					
				</tr>
				<tr>
					<td  align="right" width="200px;">	 
						<b><label id="lblArea" class="required" >Area:</label></b>&nbsp;&nbsp;
					</td>
					<td width="170px;">	
						<select id="institutionSpeciality" name="institutionSpeciality" class="dropDown" onchange="changeInstitutionSpeciality();">
							<option value="">--Select--</option>
							 <c:forEach var="institutionSpeciality" items="${institutionSpecialityList}">
							     <option value='<c:out value="${institutionSpeciality.name}"/>'>${institutionSpeciality.name} </option>
							 </c:forEach>
						</select> 
					</td>
					<td  colspan=3 width="170px;">
					</td>
				</tr>
				<tr>
					<td align="right" width="170px;">
							<b><label id="lblAreaCode" class="required">Area Code:</label></b>
							&nbsp;
						</td>
						<td width="170px;">
							<select id="areaCode" name="areaCode" class="dropDown">
								<option value="">--Select--</option>
								<c:forEach var="area" items="${areaCodeList}">
							    	<option value='<c:out value="${area.id}"/>'>${area.name} </option>
								</c:forEach>
							</select>
						</td>
						<td width="170px;">
					<td width="170px;">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary" onclick="doSearch('<%=categoryName%>','0','search');">Search</button>
					</td>
					<td width="770px;"></td>
				</tr>				
				<% } %>				
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
			<label style="padding-left: 320px;font-size: 14px;">Directorate of Food Safety</label><br>
			<label>Classification</label>
		</td>
	</tr>
	<tr> 
	    <%
			if(userAccessLevel!=null && userAccessLevel.equalsIgnoreCase("District")){
		%>
			<td valign="top" class="serachcriteriasummary" width="220px;" colspan="1">
			&nbsp;&nbsp;<b>Search Criteria</b><br><br>&nbsp;
			<b>Directorate</b> - <label id="gridDirectorateLabel">DFS</label> <br><br>&nbsp;
			<b>Frequency</b> - <label id="gridFrequencyLabel"></label><br><br>&nbsp;
			<b>District</b> - <label id="gridDistrictLabel"></label><br><br>			
			</td>
	   <%
			} else if(userAccessLevel!=null && userAccessLevel.equalsIgnoreCase("Lab")){
		%>	
			<td valign="top" class="serachcriteriasummary" width="220px;" colspan="1">
			&nbsp;&nbsp;<b>Search Criteria</b><br><br>&nbsp;
			<b>Directorate</b> - <label id="gridDirectorateLabel">DFS</label> <br><br>&nbsp;
			<b>Frequency</b> - <label id="gridFrequencyLabel"></label><br><br>&nbsp;
			<b>Laboratory</b> - <label id="gridLabLabel"></label><br><br>&nbsp;
			<b>District</b> - <label id="gridDistLabel"></label><br><br>&nbsp;
			<b>Area</b> - <label id="gridAreaLabel"></label><br><br>&nbsp;			
			</td>
		<% } else { %>
			<td valign="top" class="serachcriteriasummary" width="220px;" colspan="1">
			&nbsp;&nbsp;<label id="districtSearch"><b>Search Criteria</b><br><br>&nbsp;
			<b>Directorate</b> - <label id="gridDirectorateLabel">DFS</label><br><br>&nbsp;
			<b>Frequency</b> - <label id="gridFrequencyLabel"></label><br><br>&nbsp;
			<b><label id="lblDistrictSearch">District - </label><label id="lblLabSearch">Lab - </label></b><label id="gridDistrictLabel"></label><br><br>&nbsp;
			<b><label id="lblDistSearch"> District - </label></b><label id="gridDistLabel"></label><br><br>&nbsp;
			<b><label id="lblAreaSearch">Area - </label></b><label id="gridAreaLabel"></label><br><br>&nbsp;
			</td>
		<% } %>
		<td width="1260px;" class="categorytab">
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
		<td align="center" width="1260px;">		
			<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();">Submit</button>&nbsp;
			<button id="cancel" type="button" class="btn btn-primary" value="Cancel" onclick="doCancel('<%=request.getContextPath()%>','/dfsDataEntry.do');">Reset Form</button>&nbsp;
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
		   var districtId;
		   var districtName="";
		   var labId;
		   var labName="";
		   var labDistrictId;
		   var labDistrictName="";
		   var areaType;
		   var area;
		   var institutionId;
		   var areaCode="";
		   var classificationName;
		  
		   var userAccessLevel=document.getElementById('userAccessLevel').value;
		   if(userAccessLevel!='District' && userAccessLevel!='Lab'){
			   var a1=document.getElementById('level');
			   var level=a1.options[a1.selectedIndex].value;
		   }
		   if(userAccessLevel=='District' || level=='district'){
			   var e1 = document.getElementById('districtName');
			   if (e1 != 'undefined') {
					districtId = e1.options[e1.selectedIndex].value;
					districtName= e1.options[e1.selectedIndex].text;
			   }
		   }
		   if(userAccessLevel=='Lab' || level=='lab'){
			   var lab = document.getElementById('labName');
			   if (lab != 'undefined') {
				labId = lab.options[lab.selectedIndex].value;
				labName= lab.options[lab.selectedIndex].text;
			   }
			   var e2 = document.getElementById('district');
			   if (e2 != 'undefined') {
			   		labDistrictId = e2.options[e2.selectedIndex].value;
				    labDistrictName = e2.options[e2.selectedIndex].text;
				}
				var e3 = document.getElementById('institutionType');
					areaType = e3.options[e3.selectedIndex].text;
				var e4 = document.getElementById('institutionSpeciality');
					area = e4.options[e4.selectedIndex].text;
				var e8 = document.getElementById('areaCode');
				if (e8 != 'undefined') {
					institutionId = e8.options[e8.selectedIndex].value;
					areaCode= e8.options[e8.selectedIndex].text;
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
			
			if(userAccessLevel=='Lab' || level=='lab'){
				if(labId==""){
					alert("Please choose the Food Analysis Laboratory");
					document.getElementById("labName").focus();
					return false;
				}
				if(labDistrictId==""){
					alert("Please choose the District");
					document.getElementById("district").focus();
					return false;
				}
				if(areaType=='--Select--'){
					alert("Please choose the Area type");
					document.getElementById("institutionType").focus();
					return false;
				}
				if(area=='--Select--'){
					alert("Please choose the Area");
					document.getElementById("institutionSpeciality").focus();
					return false;
				}
				if(institutionId==""){
					alert("Please choose the Area Code");
					document.getElementById("areaCode").focus();
					return false;
				}
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
			}
			
			$.ajax({type:"POST",
			url: 'dfs'+action+'.do',
			'data':  { 
				searchDate: searchDate,month: month,year: year,
				districtId:districtId,classificationName:classificationName,frequency:frequency,week:week,
				quarter:quarter,labId:labId,labDistrictId:labDistrictId,areaType:areaType,area:area,institutionId:institutionId,labName:labName
			    },
			    success: function (output) {
			    	var data = JSON.parse(output);
			    	var gridData = data.dfsDirectorateRecords;
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
					   	document.getElementById("gridFrequencyLabel").textContent=frequency;
					   	if(userAccessLevel=='District'){
							document.getElementById("gridDistrictLabel").textContent=districtName;
						}
						if(userAccessLevel=='Lab'){
							document.getElementById("gridLabLabel").textContent=labName;
							document.getElementById("gridDistLabel").textContent=labDistrictName;
							document.getElementById("gridAreaLabel").textContent=area;
						}
						else{
						   	if(level=='district'){
							   	document.getElementById('lblDistrictSearch').style.display = "inline";
								document.getElementById('lblLabSearch').style.display = "none";
								document.getElementById("gridDistrictLabel").textContent=districtName;
								document.getElementById('lblDistSearch').style.display = "none";
								document.getElementById('lblAreaSearch').style.display = "none";
						   	}
						   	if(level=='lab'){
						   		document.getElementById('lblDistrictSearch').style.display = "none";
								document.getElementById('lblLabSearch').style.display = "inline";
								document.getElementById("gridDistrictLabel").textContent=labName;
								document.getElementById('lblDistSearch').style.display = "inline";
								document.getElementById("gridDistLabel").textContent=labDistrictName;
								document.getElementById('lblAreaSearch').style.display = "inline";
								document.getElementById("gridAreaLabel").textContent=area;
						   	}
				  	}
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
		   var districtId;
		   var districtName="";
		   var labId;
		   var labName="";
		   var labDistrictId;
		   var labDistrictName="";
		   var areaType;
		   var area;
		   var institutionId;
		   var areaCode="";
		   var classificationName;
		  
		   var userAccessLevel=document.getElementById('userAccessLevel').value;
		   if(userAccessLevel!="District" && userAccessLevel!='Lab'){
			   var a1=document.getElementById('level');
			   var level=a1.options[a1.selectedIndex].value;
		   }
		   if(userAccessLevel=='District' || level=='district'){
			   var e1 = document.getElementById('districtName');
			   if (e1 != 'undefined') {
					districtId = e1.options[e1.selectedIndex].value;
					districtName= e1.options[e1.selectedIndex].text;
			   }	
		   }
		   if(userAccessLevel=='Lab' || level=='lab'){
			   var lab = document.getElementById('labName');
			   if (lab != 'undefined') {
				labId = lab.options[lab.selectedIndex].value;
				labName= lab.options[lab.selectedIndex].text;
			   }
			   var e2 = document.getElementById('district');
			   if (e2 != 'undefined') {
			   		labDistrictId = e2.options[e2.selectedIndex].value;
				    labDistrictName = e2.options[e2.selectedIndex].text;
				}
				var e3 = document.getElementById('institutionType');
					areaType = e3.options[e3.selectedIndex].text;
				var e4 = document.getElementById('institutionSpeciality');
					area = e4.options[e4.selectedIndex].text;
				var e8 = document.getElementById('areaCode');
				if (e8 != 'undefined') {
					institutionId = e8.options[e8.selectedIndex].value;
					areaCode= e8.options[e8.selectedIndex].text;
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
			
			if(userAccessLevel=='Lab' || level=='lab'){
				if(labId==""){
					alert("Please choose the Food Analysis Laboratory");
					document.getElementById("labName").focus();
					return false;
				}
				if(labDistrictId==""){
					alert("Please choose the District");
					document.getElementById("district").focus();
					return false;
				}
				if(areaType=='--Select--'){
					alert("Please choose the Area type");
					document.getElementById("institutionType").focus();
					return false;
				}
				if(area=='--Select--'){
					alert("Please choose the Area");
					document.getElementById("institutionSpeciality").focus();
					return false;
				}
				if(institutionId==""){
					alert("Please choose the Area Code");
					document.getElementById("areaCode").focus();
					return false;
				}
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
						url: 'dfs'+submitType+'.do',
						'data':  { 
							handsOnTableData: JSON.stringify(handsOnTableData),searchDate: searchDate,month: month,year: year,districtId:districtId,
							institutionId:institutionId,classificationName:classificationName,frequency:frequency,week:week,quarter:quarter,CSRF_TOKEN:csrfToken,
							labId:labId,labDistrictId:labDistrictId,areaType:areaType,area:area,institutionId:institutionId,labName:labName
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
 		var userAccessLevel=document.getElementById('userAccessLevel').value;
		   if(userAccessLevel!="District" && userAccessLevel!='Lab'){
			   var a1=document.getElementById('level');
			   var level=a1.options[a1.selectedIndex].value;
		   }
 		document.getElementById("directorateName").disabled=true;
 		if(userAccessLevel=='District' || level=='district'){
 			document.getElementById("districtName").disabled=true;
 		}
 		else{
 			document.getElementById("labName").disabled=true;
 			document.getElementById("district").disabled=true;
 			document.getElementById("institutionType").disabled=true;
 			document.getElementById("institutionSpeciality").disabled=true;
 			document.getElementById("areaCode").disabled=true;
 		}
 		document.getElementById("timePeriod").disabled=true;
 		document.getElementById("date").disabled=true;
 		$( "#date" ).datepicker('disable');
 		document.getElementById("week").disabled=true;
 		document.getElementById("quarter").disabled=true;
 		document.getElementById("month").disabled=true;
 		document.getElementById("year").disabled=true; 		
	}
 	
 	function enabledFields(){
 		var userAccessLevel=document.getElementById('userAccessLevel').value;
		   if(userAccessLevel!="District" && userAccessLevel!='Lab'){
			   var a1=document.getElementById('level');
			   var level=a1.options[a1.selectedIndex].value;
		   }
 		document.getElementById("directorateName").disabled=false;
 		if(userAccessLevel=='District' || level=='district'){
 			document.getElementById("districtName").disabled=false;
 		}
 		else{
 			document.getElementById("labName").disabled=false;
 			document.getElementById("district").disabled=false;
 			document.getElementById("institutionType").disabled=false;
 			document.getElementById("institutionSpeciality").disabled=false;
 			document.getElementById("areaCode").disabled=false;
 		}
 		document.getElementById("timePeriod").disabled=false;
 		document.getElementById("date").disabled=false;
 		document.getElementById("week").disabled=false;
 		document.getElementById("quarter").disabled=false;
 		$( "#date" ).datepicker('enable');
 		document.getElementById("month").disabled=true;
 		document.getElementById("year").disabled=true;
	}
  	
  	function changeLab(){
		var e1 = document.getElementById("labName");
		var labId = e1.options[e1.selectedIndex].value;
		$.ajax({type: "POST",
			url:'dfslabChange.do',
			'data':  { 
				labId:labId
			    },
			    success: function (result) {
			    	var jsonData = JSON.parse(result);
			    	var $select = $('#district');                           
		               $select.find('option').remove();   
		               $('<option>').val("").text("--Select--").appendTo($select);
		               $.each(jsonData, function(idx, obj) { 
		                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
		                    });					        	
			      },
			      error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				    }});			
  	} 
 	
 	 function changeDistrict(){
		var e1 = document.getElementById("labName");
		var labId = e1.options[e1.selectedIndex].value;
		var e2 = document.getElementById("district");
		var districtId = e2.options[e2.selectedIndex].value;
		$.ajax({type:"POST",
			url:'dfsdistrictChange.do',
			'data':  { 
				labId:labId,districtId:districtId
			    },
			    success: function (result) {
			    	var jsonData = JSON.parse(result);
			    	var $select = $('#institutionType');                           
		               $select.find('option').remove();   
		               $('<option>').val("").text("--Select--").appendTo($select);
		               $.each(jsonData, function(idx, obj) { 
		                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
		                    });			        	
			      },
			      error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				    }});	
  	} 
  	
 	 function changeInstitutionType(){
			var e1 = document.getElementById("labName");
			var labId = e1.options[e1.selectedIndex].value;
			var e2 = document.getElementById("district");
			var districtId = e2.options[e2.selectedIndex].value;
			var e3 = document.getElementById("institutionType");
			var areaType = e3.options[e3.selectedIndex].text;
			$.ajax({type:"POST",
				url: 'dfsinstitutionTypeChange.do',
				'data':  { 
					labId:labId,districtId:districtId,areaType:areaType
				    },
				    success: function (result) {
				    	var jsonData = JSON.parse(result);
				    	var $select = $('#institutionSpeciality');                           
			               $select.find('option').remove();    
			               $('<option>').val("").text("--Select--").appendTo($select);
			               $.each(jsonData, function(idx, obj) { 
			                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
			                    });				        	
				      },
				      error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					    }});			
	  	} 
 	 
 	function changeInstitutionSpeciality(){
		var form = $('#dfsDirectorateForm');
		var e1 = document.getElementById("labName");
		var labId = e1.options[e1.selectedIndex].value;
		var e2 = document.getElementById("district");
		var districtId = e2.options[e2.selectedIndex].value;
		var e3 = document.getElementById("institutionType");
		var areaType = e3.options[e3.selectedIndex].text;
		var e4 = document.getElementById("institutionSpeciality");
		var area = e4.options[e4.selectedIndex].text;
		$.ajax({type:"POST",
			url:'dfsinstitutionSpecialityChange.do',
			'data': { 
				labId:labId,districtId:districtId,areaType:areaType,area:area
			    },
			    success: function (result) {
			    	var jsonData = JSON.parse(result);
			    	var $select = $('#areaCode');                           
		               $select.find('option').remove(); 
		               $('<option>').val("").text("--Select--").appendTo($select);
		               $.each(jsonData, function(idx, obj) { 
		                   $('<option>').val(obj.id).text(obj.name).appendTo($select);      
		                    });			        	
			      },
			      error: function (xhr, status, error) {
		                alert("Internal Error Occured-Please Contact System Administrator");
				    }});		
  	} 
 	 
  	function changeLevel(){
		var e1 = document.getElementById("level");
		var level = e1.options[e1.selectedIndex].value;
		if(level=='district'){
			document.getElementById('labName').value = "";
			document.getElementById('areaCode').value = "";
			document.getElementById('district').value = "";
			document.getElementById('institutionType').value = "";
			document.getElementById('institutionSpeciality').value= "";
			document.getElementById('areaCode').disabled = true;
			document.getElementById('district').disabled = true;
			document.getElementById('institutionType').disabled = true;
			document.getElementById('institutionSpeciality').disabled= true;
			document.getElementById('lblDistrict').style.display = "inline";
			document.getElementById('districtName').style.display = "inline";
			document.getElementById('lblLab').style.display = "none";
			document.getElementById('labName').style.display = "none";
		}
		else if(level=='lab'){
			document.getElementById('districtName').value = "";
			document.getElementById('lblDistrict').style.display = "none";
			document.getElementById('districtName').style.display = "none";
			document.getElementById('lblLab').style.display = "inline";
			document.getElementById('labName').style.display = "inline";
			document.getElementById('areaCode').disabled = false;
			document.getElementById('district').disabled = false;
			document.getElementById('institutionType').disabled = false;
			document.getElementById('institutionSpeciality').disabled= false;
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
		var userAccessLevel=document.getElementById('userAccessLevel').value;
  		getCalender();
		document.getElementById('month').disabled=true;
		document.getElementById('year').disabled=true;
		document.getElementById('week').style.display = "none";
		document.getElementById('lblWeek').style.display = "none";
		document.getElementById('quarter').style.display = "none";
		document.getElementById('lblQuarter').style.display = "none";
		document.getElementById('submit').disabled=true;
		document.getElementById('cancel').disabled=true;
		document.getElementById("gridFrequencyLabel").textContent='Daily';
		if(userAccessLevel=='District'){
			document.getElementById("gridDistrictLabel").textContent=document.getElementById("selectedDistrictName").value;
		}
		if(userAccessLevel=='Lab'){
			document.getElementById("gridLabLabel").textContent="All";
			document.getElementById("gridDistLabel").textContent="All";
			document.getElementById("gridAreaLabel").textContent="All";
		}
		else{
		   	document.getElementById('lblLab').style.display = "none";
			document.getElementById('labName').style.display = "none";
			document.getElementById('areaCode').disabled = true;
			document.getElementById('district').disabled = true;
			document.getElementById('institutionType').disabled = true;
			document.getElementById('institutionSpeciality').disabled= true;
		   	document.getElementById('lblDistrictSearch').style.display = "inline";
			document.getElementById('lblLabSearch').style.display = "none";
			document.getElementById("gridDistrictLabel").textContent=document.getElementById("selectedDistrictName").value;
			document.getElementById('lblDistSearch').style.display = "none";
			document.getElementById('lblAreaSearch').style.display = "none";
  	}		
  }
	</script>
<script src="js/commonHandsontable.js"></script>
<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css"></link>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>