
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>Dashboard</title>
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
		  <link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
		  
		  <script src="js/script.js"></script>
		<!--   <link rel="stylesheet" href="ServiceMaintenance/menulinks/bootstrap.min.css">
		  <link rel="stylesheet" href="ServiceMaintenance/menulinks/menulinks.css">
		  <script src="ServiceMaintenance/menulinks/jquery.min.js"></script>
		  <script src="ServiceMaintenance/menulinks/bootstrap.min.js"></script> -->
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
		  left:55px;
		  display:block;
		  position:absolute;
		  width:30%;
		  height:3px;
		  margin-top:8px;
		  content: " ";
		  background:#000;
		} 
 </style>
	</head>
		
	<body>
	<jsp:include page="MenuLinks.jsp"/>	
		<form name="thresholdForm" method="POST" action="IndicatorMasterDashBoardAddOnSubmit.do" id="thresholdForm">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
		<div id="home" class="tab-pane fade in active" style="height: 800px;padding-top: 20px;">
				<!-- <div style="width:620px;border: solid 3px #007297"> -->
			<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
			<input id="indicatorId"  type="hidden" name="indicatorId" value="<%= request.getAttribute("indicatorId") %>"/>
			<input id="indicatorName"  type="hidden" name="indicatorName" value="<%= request.getAttribute("indicatorName") %>"/>
			<input id="calculation"  type="hidden" name="calculation" value="<%= request.getAttribute("calculation") %>"/>
			<input id="prevServlet"  type="hidden" name="prevServlet" value="<%= request.getAttribute("prevServlet") %>"/>
			<input id="submitType"  type="hidden" name="submitType"/>
			<input id="encodedJsonArray"  type="hidden" name="encodedJsonArray" value="<%= request.getAttribute("encodedJsonArray") %>"/>
			<input id="thresholdTableData"  type="hidden" name="thresholdTableData" />
			<div class="container" style="width:95%;border: solid 3px #007297;border-radius: 15px;">
			<table>
				<tr >
					<td style="background:#FFFFCC;">
						<h2>THRESHOLD DETAILS</h2> <img src="images/servIndDash.png" width="35" height="35"/>
					</td>
					<td width="870px;" align="right" style="background:#FFFFCC;padding-right: 70px;padding-top: 10px;">
						<button id="gridButton" type="button" class="style-grid-btn" title="Show Indicator details grid" onclick="showGrid();">Indicator Grid</button>
					</td>
				</tr>
			</table>
			<ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297;background: #BDEDFF">
				    <li ><a data-toggle="tab" href="#home">Indicator Basic Details <img src="images/indic.jpg" width="35" height="35"/></a></li>
				     <li class="active"><a data-toggle="tab" style="font-weight:bold;" href="#menu1">Dashboard Threshold <img src="images/performance-indicator.jpg" width="35" height="35"/></a></li>
				    <li><a data-toggle="tab" href="#menu2">Indicator Calculation <img src="images/calculator.png" width="35" height="35"/></a></li>
				    <li><a data-toggle="tab" href="#menu3">General Details <img src="images/general.jpg" width="35" height="35"/></a></li>
				    <li><a data-toggle="tab" href="#menu4">Indicator Summary <img src="images/summary.gif" width="35" height="35"/></a></li>
			  </ul>
			  <div class="tab-content">
			  	<div id="home" class="tab-pane fade in active" style="height: 640px;background:#E9FFDB;padding-top: 8px;padding-left: 8px;">
			
			<table border="0">	
				<tr>
					<td width=1180px; height=30px; colspan="2" align="center" style="background:#C6E2FF;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Directorate : <%= request.getAttribute("directorateName") %></font>
	      				</label>
	      			</td>
				</tr>
				<tr>
					<td width=1180px; height=30px; colspan="2" align="center" style="background:#C6E2FF;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Indicator Name : <%= request.getAttribute("indicatorName") %></font>
	      				</label>
	      			</td>
	      			
				</tr>
				<tr align="center" > 
					<td width="870px;" style="padding-top: 10px;background:#E9FFDB;">
						<div id="thresholdGrid" style="width: 850px;height: 228px;overflow: auto;background:#E9FFDB;"></div>
					</td>
				</tr>
				<tr>
					<td>
						<P align="center"><b><mark>Example of Threshold Value based on Threshold Type Selection</mark></b></P>
						 <dl>
						   <dt>Numeric - 14</dt>
						    <!--  <dd>14</dd> -->
						   <dt>Decimal - 167.402(Only upto 3 Decimal)</dt>
						    <!--  <dd>167.402(Only upto 3 Decimal)</dd> -->
						    <dt>Percentage - 98</dt>
						    <!--  <dd>98</dd> -->
						   <dt>Range - 90-95(Initial and Final value separated by hyphen)</dt>
						     <!-- <dd>90-95</dd> -->
						      <dt>Comparison - Previous Month/Previous Year(To compare with the value of)</dt>
						     <!-- <dd>Previous Month/Previous Year</dd> -->
						 </dl>  
					    
				    </td>
				</tr>
				<tr>
					<td style="background:#E9FFDB;"align="center" width="800px;">		
						<button id="next" type="button" class="style-btn" style="background: #007297;color: white" title="Proceed to next page" onclick="doSubmit();">Next</button>&nbsp;
						<button id="back" type="button" class="style-btn" style="background: #007297;color: white" title="Go back to previous page" onclick="goBack();">Back</button>&nbsp;
						<button id="close" type="button" class="style-btn" style="background: #007297;color: white" value="Close" title="Close add Indicator page" onclick="doClose();">Close</button>&nbsp;&nbsp;
					</td>
				</tr>		
			</table>
			</div>
			</div>
			</div>
			</div>
		</form>
		
		<script>
			var form = $('#thresholdForm');
					var handsontable = (function () {
						  var $container = $("#thresholdGrid");
						  var data=[];
						  var jsonString =decodeURIComponent($("#encodedJsonArray").val());
						  if (jsonString!='null' && jsonString.length > 0) {
						    data = JSON.parse(jsonString);
						  }
						  
							 var hierarchyRenderer = function (instance, td, row, col, prop, value, cellProperties) {
								Handsontable.renderers.TextRenderer.apply(this, arguments);
								  $(td).css({
								    background: '#C1FFC1',
								    fontSize: 12,
								    color:'black'
								  });
								};		
							
						    $container.handsontable({
						    data:data,
							colWidths: [200,200,200,200],
							width: 800,
						    height: 200, 
							minRows: 3,
							minCols: 4,
							currentRowClassName: 'currentRow',
							currentColClassName: 'currentCol',
							manualColumnResize: true,
							manualRowResize: true,
							stretchH: 'none',
							colHeaders: ['Hierarchy', 'Operator', 'Threshold Type', 'Threshold Value'],
							columns: [
							        {data: "hierarchy" },
							        {data: "operator" ,type: "dropdown",source: ["less than (<)", "greater than (>)","equal to (=)"]},
							        {data: "thresholdType" ,type: "dropdown",source: ["Numeric", "Decimal","Percentage","Range","Comparison"]},
							        {data: "thresholdValue",className: "htRight"},
							        
							      ],
						            
							    cells: function (row, col, prop) {
							    	if (col === 0) {
						        		this.readOnly= true;
							  		    this.renderer =hierarchyRenderer;
						            }
							    }    			      
						  });
						  var handsontable = $container.data('handsontable'); 
						  return handsontable;
						  })();
					
					function goBack() {
						var prevServlet=document.getElementById("prevServlet").value;
						var directorateId=document.getElementById("directorateId").value;
						var indicatorId=document.getElementById("indicatorId").value;
						var url = webUrl+"/"+prevServlet;						
						var submitType="change";
						var prevSubmitType="add";
						window.location.assign(url+
								'?submitType='+submitType+
								'&indicatorId='+indicatorId+
								'&directorateId='+directorateId+
								'&prevSubmitType='+prevSubmitType);
					}
		    
					function doSubmit(){
						document.getElementById("submitType").value="add";
						formFlag=true;
						var thresholdTableData=handsontable.getData();
						   for(i=0;i<thresholdTableData.length;i++){
							   	if(thresholdTableData[i]!=null){
							   		var hierarchy = thresholdTableData[i].hierarchy;
							   		var operator = thresholdTableData[i].operator;
							   		var thresholdType=thresholdTableData[i].thresholdType;
							   		var thresholdValue=thresholdTableData[i].thresholdValue;
							   		
							   		if(hierarchy!= null){
								   		if(typeof operator == 'undefined'){
										   		alert("Please select Operator in '"+hierarchy+"' field");
										   		return false;
									   		}
								   		if(typeof thresholdType == 'undefined'){
									   		alert("Please select Threshold Type in '"+hierarchy+"' field");
									   		return false;
								   		}
								   		if(typeof thresholdValue == 'undefined'){
									   		alert("Please enter Threshold Value in '"+hierarchy+"' field");
									   		return false;
								   		}
								   		else if(typeof thresholdValue != 'undefined' && (thresholdType=='Numeric' || thresholdType=='Percentage')){							   			
								   			if(!isNumeric(thresholdValue)){
								   				alert("Please Enter Numeric value in '"+hierarchy+"' field");
								   				return false;
								   			}
								   		}
								   		else if(typeof thresholdValue != 'undefined' && thresholdType=='Comparison'){	
								   			if(!isValidCharacter(thresholdValue)){
								   				alert("Please enter valid character in '"+hierarchy+"' field");
								   				return false;
								   			}
								   		}	
								   		else if(typeof thresholdValue != 'undefined' && thresholdType=='Decimal'){	
								   			if(!isValidDecimal(thresholdValue)){
								   				alert("Please enter upto 3 Decimal number in '"+hierarchy+"' field");
								   				return false;
								   			}
								   		}
								   		else if(typeof thresholdValue != 'undefined' && thresholdType=='Range'){	
								   			if(!isValidRange(thresholdValue)){
								   				alert("Please enter valid Range(XX-XX) in '"+hierarchy+"' field");
								   				return false;
								   			}
								   		}
								   	}
							   	}
						   }
							   	 if(formFlag){
								   		formFlag = confirm("Do you really want to save?");
									   if(formFlag){
										  document.getElementById('next').disabled=true;
										  var thresholdGridData =JSON.stringify(thresholdTableData);
										  document.getElementById('thresholdTableData').value=thresholdGridData;
									      document.thresholdForm.submit();
									   } 
								   }
							   	return false;
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

					<% String requestURL=request.getRequestURL().toString();
					String contextPath=request.getContextPath();
					int urlIndex = requestURL.lastIndexOf(contextPath);
					String hostName=requestURL.substring(0,urlIndex);
					String webUrl =hostName+contextPath;
					%>
				var webUrl='<%=webUrl%>';
					
		</script>	
		<script src="js/commonHandsontable.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
		<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>