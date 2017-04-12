
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
		<title>Calculation</title>
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
		  <!-- <link rel="stylesheet" href="ServiceMaintenance/menulinks/bootstrap.min.css">
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
		  left:90px;
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
		
	<body onload="onLoad();">
		<jsp:include page="MenuLinks.jsp"/>	
		<form name="calculationForm" method="POST" action="IndicatorMasterCalculationChangeOnSubmit.do" id="calculationForm">
		<input id="CSRF_TOKEN"  type="hidden" name="CSRF_TOKEN" value="<%= request.getAttribute("CSRF_TOKEN") %>"/>
	    <div id="home" class="tab-pane fade in active" style="height: 800px;padding-top: 40px;padding-left: 40px;">
			<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
			<input id="indicatorId"  type="hidden" name="indicatorId" value="<%= request.getAttribute("indicatorId") %>"/>
			<input id="indicatorName"  type="hidden" name="indicatorName" value="<%= request.getAttribute("indicatorName") %>"/>
			<input id="prevServlet"  type="hidden" name="prevServlet" value="<%= request.getAttribute("prevServlet") %>"/>
			<input id="prevSubmitType"  type="hidden" name="prevSubmitType" value="<%= request.getAttribute("prevSubmitType") %>"/>
			<input id="encodedJsonArray"  type="hidden" name="encodedJsonArray" value="<%= request.getAttribute("encodedJsonArray") %>"/>
			<input id="formulaEncodedJsonArray"  type="hidden" name="formulaEncodedJsonArray" value="<%= request.getAttribute("formulaEncodedJsonArray") %>"/>
			<input id="calculationTableData"  type="hidden" name="calculationTableData" />
			<input id="submitType"  type="hidden" name="submitType"/>
			<div class="container" style="width:95%;border: solid 3px #007297;border-radius: 15px;">
			<table>
				<tr >
					<td style="background:#FFFFCC;">
						<h2>FORMULA DETAILS</h2> <img src="images/calc.png" width="40" height="40"/>  	
					</td>
					<td width="870px;" align="right" style="background:#FFFFCC;padding-right: 70px;padding-top: 10px;">
						<button id="gridButton" type="button" class="style-grid-btn" title="Show Indicator details grid" onclick="showGrid();">Indicator Grid</button>
					</td>
				</tr>
			</table>
		 	<ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297;background: #BDEDFF">
				    <li ><a data-toggle="tab" href="#home">Indicator Basic Details <img src="images/indic.jpg" width="35" height="35"/></a></li>
				     <li ><a data-toggle="tab" href="#menu1">Dashboard Threshold  <img src="images/performance-indicator.jpg" width="35" height="35"/></a></li>
				    <li class="active"><a data-toggle="tab" href="#menu2">Indicator Calculation <img src="images/calculator.png" width="35" height="35"/></a></li>
				    <li><a data-toggle="tab" href="#menu3">General Details <img src="images/general.jpg" width="35" height="35"/></a></li>
				    <li><a data-toggle="tab" style="font-weight:bold;" href="#menu4">Indicator Summary <img src="images/summary.gif" width="35" height="35"/></a></li>
			  </ul>
			  <div class="tab-content">
			  	<div id="home" class="tab-pane fade in active" style="height: 590px;background:#E9FFDB;padding-top: 8px;padding-left: 8px;">
			<table border="0">	
				<!-- <tr>
					<td width=200px; height=40px; colspan="2" align="center" style="background:linear-gradient(to bottom, #007297 49%,#005e7c 100%);">
			        	<label style="font:22px arial;font-weight:bold;">
		       				<font color="white">Indicator Calculation</font>
	      				</label>
     			    </td>	 
				</tr> -->
				<tr>
					<td width=1150px; height=30px; colspan="2" align="center" style="background:#C6E2FF;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Directorate : <%= request.getAttribute("directorateName") %></font>
	      				</label>
	      			</td>
				</tr>
				<tr>
					<td width=1150px; height=30px; colspan="2" align="center" style="background:#C6E2FF;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Indicator Name : <%= request.getAttribute("indicatorName") %></font>
	      				</label>
	      			</td>
	      			
				</tr>
				<tr align="center"> 
					<td width="870px;" style="padding-top: 30px;background:#E9FFDB;">
						<div id="calculationGrid" style="width: 850px;height: 228px;overflow: auto;background:#E9FFDB;"></div>
					</td>
				</tr>
				<tr><td>
					<div id="formulaGrid" style="padding-left: 200px; padding-bottom: 50px;background:#E9FFDB;">
						<table>
							<tr>
								<td align="center">
									<label id="formulalabel"><%= request.getAttribute("indicatorName") %>   =</label>&nbsp;&nbsp;
								</td>
								<td style="border-bottom: 1px solid #000;" >
									<label id="numerator"></label>
								</td>
							</tr>
							<tr>
								<td>
									<!-- <label id="formulalabel">Formula    =</label>&nbsp;&nbsp; -->
								</td>
								<!-- <td style="background-color: black;">
									<label id="formuladivider"></label>
								</td>  -->
								<td style="height: 23px;">
									<label id="denominator"></label>
								</td>
								
							</tr>
							<!-- <tr>
								 <td></td> 
								<td style="height: 23px;">
									<label id="denominator"></label>
								</td>
							</tr> -->
						</table>
					</div></td>
				</tr>
				<tr>
					<td style="background:#E9FFDB;" align="center" width="800px;">		
						<button id="displayFormula" type="button" style="background-color:#9F000F;border: 2px solid;border-radius: 10px;font-family: arial;font-weight: bold;font-size: 12pt;width: 170px;height: 40px;" onclick="showFormula();">Display Formula</button>&nbsp;
						<button id="next" type="button" class="style-btn" style="background: #007297;color: white" title="Proceed to next page" onclick="doSubmit();">Next</button>&nbsp;
						<button id="back" type="button" class="style-btn" style="background: #007297;color: white" title="Go back to previous page" onclick="goBack();">Back</button>&nbsp;
						<button id="close" type="button" class="style-btn" style="background: #007297;color: white" value="Close" title="Close change Indicator page" onclick="doClose();">Close</button>&nbsp;&nbsp;
					</td>
				</tr>		
			</table>
			</div>
			</div>
			</div>
			</div>			
		</form>
		
		<script>
			var form = $('#calculationForm');
					var handsontable = (function () {
						  var $container = $("#calculationGrid");
						  var data=[];
						  var indicatorValue="";
						  var jsonString =decodeURIComponent($("#encodedJsonArray").val());
						  if (jsonString!='null' && jsonString.length > 0) {
							  indicatorValue = JSON.parse(jsonString);
						  }
						  var formulaJsonString =decodeURIComponent($("#formulaEncodedJsonArray").val());
						  if (formulaJsonString!='null' && formulaJsonString.length > 0) {
						    data = JSON.parse(formulaJsonString);
						  }
		
						    $container.handsontable({
						    data:data,
						    minSpareRows: 1,
							colWidths: [200,120,120,120,120,120],
							width: 800,
						    height: 230,
							minRows: 2,
							minCols: 5,
							currentRowClassName: 'currentRow',
							currentColClassName: 'currentCol',
							manualColumnResize: true,
							manualRowResize: true,
							stretchH: 'none',
							colHeaders: ['Indicators', 'Type', 'Arithmetic', 'Aggregate','Logical','Constants'],
							columns: [
							        {data: "indicator",type: "autocomplete",source: indicatorValue, strict: true, allowInvalid: false},
							        {data: "type" ,type: "dropdown",source: ["Numerator", "Denominator"]},
							        {data: "arithmetic" ,type: "dropdown",source: ["Add (+)", "Subtract (-)","Multiply (*)","Divide (/)"]},
							        {data: "aggregate",type: "dropdown",source: ["Average","Count","Sum","Distinct"]},
							        {data: "logical",type: "dropdown",source: ["AND"]}, 
							        {data: "constants",className: "htRight"},
							      ],
							    cells: function (row, col, prop) {
							        	
							      }     
						  });
						  var handsontable = $container.data('handsontable'); 
						  return handsontable;
						  })();
					
					function goBack() {
						var prevServlet=document.getElementById("prevServlet").value;
						var directorateId=document.getElementById("directorateId").value;
						var indicatorId=document.getElementById("indicatorId").value;
						var indicatorName=document.getElementById("indicatorName").value;
						var url = webUrl+"/"+prevServlet;						
						var submitType="change";
						var prevSubmitType="change";
						window.location.assign(url+
								'?submitType='+submitType+
								'&indicatorId='+indicatorId+
								'&indicatorName='+indicatorName+
								'&directorateId='+directorateId+
								'&prevSubmitType='+prevSubmitType);
					}
					
					function showFormula(){
						var num="";
						var den="";
						var numerator="";
						var denominator="";
						document.getElementById('formulalabel').style.display = "inline";
						 var calculationTableData=handsontable.getData();
						   for(i=0;i<calculationTableData.length-1;i++){
							   	if(calculationTableData[i]!=null){
							   		var indicator = calculationTableData[i].indicator;
							   		var type = calculationTableData[i].type;
							   		var arithmetic=calculationTableData[i].arithmetic;
							   		var constants=calculationTableData[i].constants;
							   		var arithmeticOperator= arithmetic[arithmetic.length - 2];
							   		if(type=='Numerator'){
							   			if(constants!=undefined){
							   				num=num+indicator+arithmeticOperator+constants+arithmeticOperator;
							   			}
							   			else{
								   			num=num+indicator+arithmeticOperator;
								   			}
							   		}else if(type=='Denominator'){
							   			if(constants!=undefined){							   		
							   				den=den+indicator+arithmeticOperator+constants+arithmeticOperator;
							   			}
							   			else{
							   				den=den+indicator+arithmeticOperator;
								   			}
							   			}
							   	}
						   }
						  			numerator=num.substring(0,(num.length - 1));
						  			denominator=den.substring(0,(den.length - 1));
							   		var formula=numerator+"/"+denominator;
							   	 document.getElementById("numerator").textContent = numerator;
							   	document.getElementById("denominator").textContent = denominator;							   		
					}
					
					function doSubmit(){
						document.getElementById("submitType").value="change";
						formFlag=true;
					 	 var calculationTableData=handsontable.getData();
						 var indicatorNameFlag=false;
						   for(i=0;i<calculationTableData.length;i++){
							   	if(calculationTableData[i]!=null){
							   		var indicator = calculationTableData[i].indicator;
							   		var type = calculationTableData[i].type;
							   		var arithmetic=calculationTableData[i].arithmetic;
							   		var constants=calculationTableData[i].constants;
							   		
							   		if(typeof indicator != 'undefined' || indicator == ""){									   		
								   		if(typeof type == 'undefined'){
									   		alert("Please select Type in '"+indicator+"' field");
									   		return false;
								   		}
								   		if(typeof arithmetic == 'undefined' || arithmetic == ""){
									   		alert("Please select arithmetic value in '"+indicator+"' field");
									   		return false;
								   		}
								   		if(constants!=null){
									   		if(!isNumeric(constants)){
								   				alert("Please Enter Numeric value in Constants field");
								   				return false;
								   			}
								   		}
								   	 indicatorNameFlag=true;
							   		}							   	 
							   	}							  
						   }
						   if(!indicatorNameFlag){
							   alert("Please select atleast one Indicator Name");
							   return false;
						   }
							   	 if(formFlag){
								   		formFlag = confirm("Do you really want to save?");
									   if(formFlag){
										 /*  document.getElementById('next').disabled=true; */
										  var calculationGridData =JSON.stringify(calculationTableData);
										  document.getElementById('calculationTableData').value=calculationGridData;
									      document.calculationForm.submit();
									   } 
								   }
							   	return false;
							   	}	
					
					function onLoad(){
						document.getElementById('formulalabel').style.display = "none";
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