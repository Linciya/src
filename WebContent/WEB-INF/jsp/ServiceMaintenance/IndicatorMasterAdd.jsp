
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>Add Indicator</title>
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
		<link rel="stylesheet" href="ServiceMaintenance/menulinks/bootstrap.min.css">
		  <link rel="stylesheet" href="ServiceMaintenance/menulinks/menulinks.css">
		  <script src="ServiceMaintenance/menulinks/jquery.min.js"></script>
		  <script src="ServiceMaintenance/menulinks/bootstrap.min.js"></script>
		  <!--   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
		  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
		  <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		  
		<link rel="stylesheet" type="text/css" href="css/style.css"  />	
		<style type="text/css">
		h2{
		  font: normal normal normal 20px/1 Helvetica, arial, sans-serif;
		  font-weight:bold;
		  border-bottom: 2px solid #000;
		  background:#008000;
		  color:#fff;
		
		  display:inline-block;
		  padding:3px 15px;
		  margin-left:14px;
		}
		h2:after{ /* the line under H2 */
		  left:70px;
		  display:block;
		  position:absolute;
		  width:30%;
		  height:3px;
		  margin-top:8px;
		  content: " ";
		  background:#000;
		}
		
		.arrow-right {
			width: 0; 
			height: 0; 
			border-top: 60px solid transparent;
			border-bottom: 60px solid transparent;
			
			border-left: 60px solid green;
		}
		
 </style>
	</head>
	
	<body onload="onLoad();">
		<jsp:include page="MenuLinks.jsp"/>	
		<form name="addIndicator" method="POST" action="IndicatorMasterAddOnSubmit.do" id="addIndicator" class="form-inline">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<input id="indicatorId"  type="hidden" name="indicatorId" value="<%= request.getAttribute("indicatorId") %>"/>
		<input id="submitType"  type="hidden" name="submitType"/>
		<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
		<input id="prevSubmitType"  type="hidden" name="prevSubmitType" value="<%= request.getAttribute("prevSubmitType") %>"/>
		<div id="home" class="tab-pane fade in active" style="height: 850px;padding-top: 30px;">
		<div class="container" style="width:95%;border: solid 3px #007297;border-radius: 15px;">
		<table>
			<tr >
				<td style="background:#FFFFCC;">
					<h2>ADD INDICATOR</h2> <img src="images/pen.png" width="35" height="40"/>
				</td>
				<td width="980px;" align="right" style="background:#FFFFCC;padding-right: 70px;padding-top: 10px;">
					<button id="gridButton" type="button" class="style-grid-btn" title="Show Indicator details grid" onclick="showGrid();">Indicator Grid</button>
				</td>
			</tr>
		</table>
		<ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297;background:#BDEDFF;">
			<li class="active"><a data-toggle="tab" style="font-weight:bold;" href="#home">Indicator Basic Details  <img src="images/indic.jpg" width="35" height="35"/></a></li>
			<li><a data-toggle="tab" style="font-weight:bold;" href="#menu1">Dashboard Threshold  <img src="images/performance-indicator.jpg" width="35" height="35"/></a></li>
			<li><a data-toggle="tab" style="font-weight:bold;" href="#menu2">Indicator Calculation  <img src="images/calculator.png" width="35" height="35"/></a></li>
			<li><a data-toggle="tab" style="font-weight:bold;" href="#menu3">General Details  <img src="images/general.jpg" width="35" height="35"/></a></li>
			<li><a data-toggle="tab" style="font-weight:bold;" href="#menu4">Indicator Summary <img src="images/summary.gif" width="35" height="35"/></a></li>
		</ul>
				
		<div class="tab-content">
		<div id="home" class="tab-pane fade in active" style="height: 640px;background:  #E9FFDB;padding-top: 8px;padding-left: 8px;">
		<table border="0">
			<tr>
				<td align="left" class="required rowstyle" width="430px;" >
					<b>Directorate</b>&nbsp;&nbsp;
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<select id="directorateName" name="directorateName" class="dropDown" title="Select the Directorate Name" onchange="changeDirectorate();">
						<option value="">--Select--</option>
						<c:forEach var="directorate" items="${directorateList}">
						<option value='<c:out value="${directorate.id}"/>'>${directorate.name} </option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
			        <b>Indicator Classification</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<select id="classification" name="classification" class="dropDown" title="Select the Classification of Indicator to be added (Eg:Input)" >
						 <option value="">--Select--</option>
						 <option value="Input">Input</option>
						 <option value="Process">Process</option>
						 <option value="Output">Output</option>
						 <option value="Outcome">Outcome</option>
						 <%-- <c:forEach var="classification" items="${classificationList}">
						     <option value='<c:out value="${classification.name}"/>'>${classification.name} </option>
						 </c:forEach> --%>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator Category</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<select id="category" name="category" class="dropDown" title="Select the Category of Indicator to be added (Eg:HR)" onchange="changeCategory();">
						 <option value="">--Select--</option>
						 <option value=others>Others</option>
						 <c:forEach var="category" items="${categoryList}">
						 <option value='<c:out value="${category.name}"/>'>${category.name} </option>
						 </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Other Category</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="text" id="otherCategory" name="otherCategory" size="16" title="Enter the new Category of Indicator that is not available in the above dropdown" />
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator Name</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="text" id="indicatorName" name="indicatorName" size="16" title="Enter the name of Indicator to be added (Eg:Total number of Posts sanctioned (Cadre-wise))" />
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator SubCategory</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="text" id="subCategory" name="subCategory" size="16" title="Enter the SubCategory of Indicator (Eg:HR)" />
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator SubSubCategory</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="text" id="subSubCategory" name="subSubCategory" size="16" title="Enter the SubSubCategory of Indicator (Eg:Posts)" />
				</td>
			</tr>
			<tr>
				<!-- <td align="left" class="required rowstyle" width="210px;">
		        	<b>Data Entry</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="radio" name="dataEntry" title="Indicator required in Data Entry" checked="checked" value="Y"/>Yes
				    <input type="radio" name="dataEntry" title="Indicator not required in Data Entry" value="N"/>No
				</td> -->
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Mode of Source</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<select id="modeSource" name="modeSource" class="dropDown" title="Select the Mode of Source for the Indicator (Eg:Data Entry/MIS)" onchange="changeMode();">
						 <option value="">--Select--</option>
						 <option value="Data Entry">Data Entry</option>
						 <option value="MIS">MIS</option>
						 <option value="Other File System">Other File System</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Other File System Name</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="text" id="otherfileSystem" name="otherfileSystem" size="16" title="Enter the name of the file system which is the mode of source for the Indicator" />
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator Fact Map</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="radio" name="factMap" title="Select the type of Indicator-Normal" checked="checked" value="N"/>Normal
				    <input type="radio" name="factMap" title="Select the type of Indicator-Dashboard" value="D"/>Dashboard
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator Frequency</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<select id="frequency" name="frequency" class="dropDown" title="Select the Frequency of Indicator (Eg:Quarterly)" >
						 <option value="">--Select--</option>
						 <option value="D">Daily</option>
						 <option value="W">Weekly</option>
						 <option value="M">Monthly</option>
						 <option value="Q">Quarterly</option>
						 <option value="Y">Yearly</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator Calculation</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<input type="radio" name="calculation" title="Select the calculative type of Indicator-Normal" checked="checked" value="N"/>Normal
				    <input type="radio" name="calculation" title="Select the calculative type of Indicator-Involves Calculation" value="C"/>Calculation
				</td>
			</tr>
			<tr>
				<td align="left" class="required rowstyle" width="210px;">
		        	<b>Indicator Hierarchy</b>
				</td>
				<td style="width: 350px;padding-left: 100px;padding-top:15px;background:  #E9FFDB;">
					<select id="hierarchy" name="hierarchy" class="dropDown" title="Select the Hierarchy of Indicator(Eg:State-State level Posts sanctioned; District-District level Posts sanctioned)" >
						<option value="">--Select--</option>
						 <c:forEach var="indHierarchy" items="${indHierarchyList}">
						     <option value='<c:out value="${indHierarchy.name}"/>'>${indHierarchy.name} </option>
						 </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="background:  #E9FFDB;" width=400px;></td>
				<td width=400px; style="padding-top:20px; padding-bottom:10px; padding-left: 80px;background:  #E9FFDB;">&nbsp;&nbsp;&nbsp;
					<button id="submitButton" type="button" class="style-btn" style="background: #007297;color: white"  style="background: #007297;color: white"  title="Proceed to next page" onclick="doSubmit();">Next</button>&nbsp;
					<button id="close" type="button" class="style-btn" style="background: #007297;color: white" style="background: #007297;color: white" title="Close add Indicator page" onclick="doClose();">Close</button>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</div>
	</form>
		
	<script>
		var form = $('#addIndicator');
		
		
		function doSubmit(){
			document.getElementById("submitType").value='add';			
			var classification="";
			var category="";
			var otherCategory="";
			var indicatorName="";
			var frequency="";
			var hierarchy="";	
			var directorateId="";
			var directorateName="";
			var e1 = document.getElementById("directorateName");
			if (e1 != 'undefined') {
				directorateId = e1.options[e1.selectedIndex].value;
				directorateName= e1.options[e1.selectedIndex].text;
			   }
			document.getElementById('directorateId').value=directorateId;
	    	
			var e2 = document.getElementById("classification");
			if (e2 != 'undefined') {
				classification= e2.options[e2.selectedIndex].value;
			   }
			var e3 = document.getElementById("category");
			if (e3 != 'undefined') {
				category= e3.options[e3.selectedIndex].text;
			   }
			var otherCategory = document.getElementById("otherCategory").value;
			indicatorName = document.getElementById("indicatorName").value;
			var e4 = document.getElementById("frequency");
			if (e4 != 'undefined') {
				frequency= e4.options[e4.selectedIndex].value;
			   }
			var subCategory = document.getElementById("subCategory").value;
			var subSubCategory = document.getElementById("subSubCategory").value;
			/* var level = document.getElementById("level").value; */
			/* var dataEntryForm = document.getElementsByName("dataEntry");
			for (var i = 0; i < dataEntryForm.length; i++) {       
		        if (dataEntryForm[i].checked) {
		        	dataEntry=dataEntryForm[i].value;
		            break;
		        }
		    } */	
		    var mode = document.getElementById("modeSource");
			if (mode != 'undefined') {
				modeSource= mode.options[mode.selectedIndex].value;
			   }
			if(modeSource=='Other File System'){
			var otherfileSystem = document.getElementById("otherfileSystem").value;
			}
			var fact = document.getElementsByName("factMap");
			for (var i = 0; i < fact.length; i++) {       
		        if (fact[i].checked) {
		        	factMap=fact[i].value;
		            break;
		        }
		    }
			var calc = document.getElementsByName("calculation");
			for (var i = 0; i < calc.length; i++) {       
		        if (calc[i].checked) {
		        	calculation=calc[i].value;
		            break;
		        }
		    }
			var e5 = document.getElementById("hierarchy");
			if (e5 != 'undefined') {
				hierarchy= e5.options[e5.selectedIndex].text;
			   }
			
			formFlag=true;
			
			 if(directorateId==""){
				alert("Please select the Name of the Directorate");
				document.getElementById('directorateName').focus();
				return false;
			}
			if(classification == ""){
				alert('Please select the Classification of the Indicator');
				document.getElementById('classification').focus();
				return false;
			}
			if(category == ""){
				alert('Please select the Category of the Indicator');
				document.getElementById('category').focus();
				return false;
			}
			else if(category=='others'){
				if(otherCategory == ""){
					alert('Please Enter the Category of the Indicator');
					document.getElementById('otherCategory').focus();
					return false;
				}
			}
			if(indicatorName == ""){
				alert('Please Enter the name of the Indicator you want to add');
				document.getElementById('indicatorName').focus();
				return false;
			}	
			if(subCategory == ""){
				alert('Please Enter the SubCategory of the Indicator you want to add');
				document.getElementById('subCategory').focus();
				return false;
			}	
			if(subSubCategory == ""){
				alert('Please Enter the SubSubCategory of the Indicator you want to add');
				document.getElementById('subSubCategory').focus();
				return false;
			}
			/* if(level == ""){
				alert('Please Enter the Level of the Indicator you want to add');
				document.getElementById('level').focus();
				return false;
			} */
			if(frequency == ""){
				alert('Please select the Frequency of the Indicator you want to add');
				document.getElementById('frequency').focus();
				return false;
			}	
			if(hierarchy == ""){
				alert('Please select the Hierarchy of the Indicator you want to add');
				document.getElementById('hierarchy').focus();
				return false;
			} 	
			
			if(formFlag){
				formFlag = confirm("Do you really want to add the Indicator?");
				   if(formFlag){
					   $("#addIndicator").submit();
					 /*   function disableForm(); */
					 /*   document.getElementById('submitButton').disabled=true; */
					   /* document.getElementById("addIndicator").submit(); */ 
					

						/* $.ajax({type: form.attr('method'),
							url: form.attr('action'),
							'data':  { 
								submitType:'add',directorateId:directorateId,classification:classification,category:category,
								otherCategory:otherCategory,indicatorName:indicatorName,subCategory:subCategory,subSubCategory:subSubCategory,
								level:level,factMap:factMap,frequency:frequency,calculation:calculation,hierarchy:hierarchy
							    },
							    success: function (result) {
							    		alert(result);
							    		if(factMap=='D'){
							    			window.location.assign("ServiceMaintenance/IndicatorMasterDashBoard.jsp");
							    		}
							    		else{
							    			 window.close(webUrl);
							    		}
							    		
							    	},
							      error: function () {
							    	  $("#errorMessage").text("Save Error");
							      }}); */
			      }
		    }
			return false;
		}
		
		 function changeDirectorate(){
			 document.getElementById("submitType").value='directorateChange';
			 var e1 = document.getElementById("directorateName");
				var directorateId = e1.options[e1.selectedIndex].value;
			 	document.getElementById('classification').value = "";
				document.getElementById('category').value = "";
				document.getElementById('frequency').value = "";
				document.getElementById('hierarchy').value = "";
				document.getElementById('indicatorName').value = "";
				document.getElementById('otherCategory').value = "";
				document.getElementById('subCategory').value = "";
				document.getElementById('subSubCategory').value = "";
				/* document.getElementById('level').value = ""; */
				factMap=document.getElementsByName('factMap'); 
				factMap[0].checked=true;
				calculation=document.getElementsByName('calculation'); 
				calculation[0].checked=true; 
							   
			$.ajax({type: "POST",
				url:'IndicatorMasterDirectChange.do',
				'data': form.serialize(), 
				      
				      success: function (result) {
					    	 var jsonData = JSON.parse(result);
					    	 
					    	 var indHierarchy = JSON.parse(jsonData.jsonIndHierarchyList);
						    	var $select = $('#hierarchy');
						    	$select.find('option').remove();
					               $('<option>').val("").text("--Select--").appendTo($select);
					               $.each(indHierarchy, function(idx, obj) { 
					                   $('<option>').val(obj.name).text(obj.name).appendTo($select); 
					               }); 
					             
					               var categoryList = JSON.parse(jsonData.jsonCategoryList);						    	
						    		var $sel = $('#category');
						    	     $sel.find('option').remove();
						    	     $('<option>').val("").text("--Select--").appendTo($sel);	
						    	     $('<option>').val("others").text("OTHERS").appendTo($sel);
					               	 $.each(categoryList, function(idx, obj) { 
					                   $('<option>').val(obj.name).text(obj.name).appendTo($sel); 
					                    });
						      }, 
				      error: function () {
				    	  $errorMessage.text("Onchange Error");
				      }}); 
			} 
	  	
		
		function onLoad(){
			document.getElementById('otherCategory').disabled=true;
			document.getElementById('otherfileSystem').disabled=true;
		}
		
		function changeCategory(){
			var e1 = document.getElementById('category');
			var category = e1.options[e1.selectedIndex].value;
			if(category=='others')
				document.getElementById('otherCategory').disabled=false;
			else
				document.getElementById('otherCategory').disabled=true;
				
		}
		
		function changeMode(){
			var mode = document.getElementById("modeSource");			
			var modeSource= mode.options[mode.selectedIndex].value;
			   
			if(modeSource=='Other File System')
				document.getElementById('otherfileSystem').disabled=false;
			else
				document.getElementById('otherfileSystem').disabled=true;
				
		}
		
		function doClose(){
			formFlag=true;
			var directorateId=document.getElementById('directorateId').value;
			formFlag=confirm("Do you really want to close");
			if(formFlag){
			window.location.assign("\IndicatorMasterMaintenance.do?directorateId="+directorateId);
			}
			return false;
		}
		
		function showGrid(){
			var directorateId=document.getElementById('directorateId').value;
			window.location.assign("\IndicatorMasterMaintenance.do?directorateId="+directorateId);
		}
		
		<% String requestURL=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		int urlIndex = requestURL.lastIndexOf(contextPath);
		String hostName=requestURL.substring(0,urlIndex);
		String webUrl =hostName+contextPath;
		%>
		var webUrl='<%=webUrl%>';
		</script>
	</body>
</html>