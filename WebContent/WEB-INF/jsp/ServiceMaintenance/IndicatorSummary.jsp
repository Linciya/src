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
		<title>Summary</title>
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
 </style>	
	</head>
		
	<body onload="onLoad();">
	<jsp:include page="MenuLinks.jsp"/>	
		<form name="summaryForm" method="POST" action="indicatorMasterServlet" id="summaryForm">
	    <div id="home" class="tab-pane fade in active" style="height: 1210px;padding-top: 40px;padding-left: 40px;padding-right: 240px;">
			<input id="directorateId"  type="hidden" name="directorateId" value="<%= request.getAttribute("directorateId") %>"/>
			<input id="indicatorId"  type="hidden" name="indicatorId" value="<%= request.getAttribute("indicatorId") %>"/>
			<input id="indicatorName"  type="hidden" name="indicatorName" value="<%= request.getAttribute("indicatorName") %>"/>
			<input id="formulaEncodedJsonArray"  type="hidden" name="formulaEncodedJsonArray" value="<%= request.getAttribute("formulaEncodedJsonArray") %>"/>
			<input id="thresholdEncodedJsonArray"  type="hidden" name="thresholdEncodedJsonArray" value="<%= request.getAttribute("thresholdEncodedJsonArray") %>"/>
			<input id="directorateName"  type="hidden" name="directorateName" value="<%= request.getAttribute("directorateName") %>"/>
			<input id="submitType"  type="hidden" name="submitType"/>
			<div class="container" style="width:115%;height:1200px;border: solid 3px #007297;border-radius: 15px;">
			<table>
				<tr >
					<td width="900px;" style="background:#FFFFCC;">
						<h2>SUMMARY OF INDICATOR</h2> 
					</td>
					<td width="900px;" align="right" style="background:#FFFFCC;padding-right: 70px;padding-top: 10px;">
						<button id="gridButton" type="button" class="style-grid-btn" title="Show Indicator details grid" onclick="showGrid();">Indicator Grid</button>
					</td>
				</tr>
			</table>
			<ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297;background:#BDEDFF;">
				<li ><a data-toggle="tab" href="#home">Indicator Basic Details  <img src="images/indic.jpg" width="35" height="35"/></a></li>
				<li><a data-toggle="tab" href="#menu1">Dashboard Threshold  <img src="images/performance-indicator.jpg" width="35" height="35"/></a></li>
				<li><a data-toggle="tab" href="#menu2">Indicator Calculation  <img src="images/calculator.png" width="35" height="35"/></a></li>
				<li><a data-toggle="tab" href="#menu3">General Details  <img src="images/general.jpg" width="35" height="35"/></a></li>
				<li class="active"><a data-toggle="tab" style="font-weight:bold;" href="#menu4">Indicator Summary <img src="images/summary.gif" width="35" height="35"/></a></li>
			</ul>
				
			 <div class="tab-content">
			  	<div id="home" class="tab-pane fade in active" style="height: 610px;background:#E9FFDB;padding-top: 8px;padding-left: 8px;"> 
			<table>	
				<tr>
					<td width=1350px; height=30px; colspan="2" align="center" style="background:#C6E2FF;padding-left: 100px;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Directorate : <%= request.getAttribute("directorateName") %></font>
	      				</label>
	      			</td>
				</tr>
				<tr>
					<td width=1350px; height=30px; colspan="2" align="center" style="background:#C6E2FF;padding-left: 100px;">
			        	<label style="font:16px arial;font-weight:bold;">
		       				<font color="black">Indicator Name : <%= request.getAttribute("indicatorName") %></font>
	      				</label>
	      			</td>	      			
				</tr>
				<tr>
					<td colspan="2" style="width:70px;padding-top: 20px;padding-left: 50px;background:#E9FFDB;"><b>INDICATOR DETAILS</b>
					
					</td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator Classification</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="classification"><%=request.getAttribute("Classification")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator Category</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="category"><%=request.getAttribute("Category")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator SubCategory</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="subCategory"><%=request.getAttribute("SubCategory")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator SubSubCategory</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="subSubCategory"><%=request.getAttribute("SubSubCategory")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Mode of Source</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="sourceMode"><%=request.getAttribute("ModeOfSource")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator Fact Map</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="factMap"><%=request.getAttribute("FactMap")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator Frequency</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="frequency"><%=request.getAttribute("Frequency")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator Calculation</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="calculation"><%=request.getAttribute("Calculation")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">Indicator Hierarchy</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="hierarchy"><%=request.getAttribute("Hierarchy")%></label></td>
				</tr>
			<!-- 	<tr><td style="width: 100px;padding-left: 10px;background:#F08080;"></td></tr> -->
				<tr>
					<td colspan="2" style="width:70px;padding-top: 20px;padding-left: 50px;background:#E9FFDB;"><b>GENERAL DETAILS</b></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">General Category</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="genCategory"><%=request.getAttribute("GenCategory")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">General Type</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="genType"><%=request.getAttribute("GenType")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">General Name</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="genName"><%=request.getAttribute("GenName")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">General SubCategory</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="genSubCategory"><%=request.getAttribute("GenSubCategory")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">General SubSubCategory</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="genSubSubCategory"><%=request.getAttribute("GenSubSubCategory")%></label></td>
				</tr>
				<tr>
					<td style="width: 70px;border-right: blue 1px solid;padding-top: 10px;padding-left: 100px;background:#E9FFDB;">General Classification</td>
					<td style="width: 300px;padding-left: 10px;background:#E9FFDB;"><label id="genClassification"><%=request.getAttribute("GenClassification")%></label></td>
				</tr>
				<% if (request.getAttribute("Calculation")!=null && "Calculation".equals(request.getAttribute("Calculation"))){ %>			
					<tr>
						<td colspan="2" style="width:70px;padding-top: 10px;padding-left: 50px;background:#E9FFDB;"><b>FORMULA DETAILS</b></td>
					</tr>	
					<!-- <tr>
						<td>
						<div id="formulaGrid" style="padding-left: 200px; padding-bottom: 50px;background:#E9FFDB;background:#E9FFDB;"></div>
						</td>
					</tr> -->
						<tr>
							<td align="center" style="background:#E9FFDB;">
								<label id="formulalabel"><%= request.getAttribute("indicatorName")%>  =</label>&nbsp;&nbsp;
							</td>
							<td style="border-bottom: 1px solid #000;background:#E9FFDB;" >
								<label id="numerator"></label>
							</td>
						</tr>
						<tr>
							<td style="background:#E9FFDB;"></td>
							<td style="height: 23px;background:#E9FFDB;">
								<label id="denominator"></label>
							</td>
						</tr>	
						<% } %>	
					<% if (request.getAttribute("FactMap")!=null && "Dashboard".equals(request.getAttribute("FactMap"))){ %>			
						<tr>
							<td colspan="2" style="width:70px;padding-top: 20px;padding-left: 50px;background:#E9FFDB;"><b>DASHBOARD THRESHOLD DETAILS</b></td>
						</tr>
						<tr > 
							<td align="left" colspan="2" width="870px;" style="padding-top: 10px;padding-left: 60px;background:#E9FFDB;">
								<div id="thresholdGrid" style="width: 550px;height: 128px;overflow: auto;background:#E9FFDB;"></div>
							</td>
						</tr>
					<% } %>	
					<tr>
						<td style="background:  #E9FFDB;" width=200px;></td>
						<td width=400px; style="padding-top:20px; padding-bottom:10px; padding-left: 80px;background:  #E9FFDB;">&nbsp;&nbsp;&nbsp;
							<button id="edit" type="button" class="style-btn" style="background: #007297;color: white" title="Edit Indicator details" onclick="doEdit();">Edit</button>&nbsp;
							<button id="close" type="button" class="style-btn" style="background: #007297;color: white" title="Close add Indicator page" onclick="doClose();">Close</button>&nbsp;&nbsp;
						</td>
					</tr>	
							
				</table>
				</div>
				</div>
				</div>
				</div>
				</form>
				<script>
			var form = $('#summaryForm');
			var handsontable = (function () {
				  var $container = $("#thresholdGrid");
				  var data=[];
				  var thresholdEncodedJsonArray = document.getElementById("thresholdEncodedJsonArray").value;
				  if(thresholdEncodedJsonArray!='null'){
					  var jsonString =decodeURIComponent($("#thresholdEncodedJsonArray").val());
					  if (jsonString!='null' && jsonString.length > 0) {
					    data = JSON.parse(jsonString);
					  }
				  }else{
					  var jsonString =decodeURIComponent($("#encodedJsonArray").val());
					  if (jsonString!='null' && jsonString.length > 0) {
					    data = JSON.parse(jsonString);
					  }
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
					colWidths: [150,150,150,150],
					width: 600,
				    height: 150,
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
					    	if (col === 1) {
				        		this.readOnly= true;					  		
				            }
					    	if (col === 2) {
				        		this.readOnly= true;
				            }
					    	if (col === 3) {
				        		this.readOnly= true;
				            }
					    }    			      
				  });
				  var handsontable = $container.data('handsontable'); 
				  return handsontable;
				  })();
			
			function onLoad(){
				var num="";
				var den="";
				var numerator="";
				var denominator="";
				/* document.getElementById('formulalabel').style.display = "inline"; */
				 var formulaJsonString =decodeURIComponent($("#formulaEncodedJsonArray").val());
						  if (formulaJsonString!='null' && formulaJsonString.length > 0) {
						    data = JSON.parse(formulaJsonString);
						  }
				   for(i=0;i<data.length;i++){
					   	if(data[i]!=null){
					   		var indicator = data[i].indicator;
					   		var type = data[i].type;
					   		var arithmetic=data[i].arithmetic;
					   		var constants=data[i].constants;
					   		var arithmeticOperator= arithmetic.substring(arithmetic.length - 2,(arithmetic.length - 1));
					   		/* if(type=='Numerator'){
					   			num=num+indicator+arithmeticOperator;
					   		}if(type=='Denominator'){
					   			den=den+indicator+arithmeticOperator;
					   		} */
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
					   	/* 	var formula=numerator+"/"+denominator; */
					   	 document.getElementById("numerator").textContent = numerator;
					   	document.getElementById("denominator").textContent = denominator;							   		
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
				window.location.assign("\IndicatorMasterMaintenance.do?directorateId="+directorateId);
			}
			
			function doEdit(){
				var directorateId=document.getElementById("directorateId").value;
				var indicatorId=document.getElementById("indicatorId").value;
				var url = webUrl+"/"+"IndicatorMasterChange.do";						
				var submitType="change";
				var prevSubmitType="add";
				window.location.assign(url+
						'?submitType='+submitType+
						'&indicatorId='+indicatorId+
						'&directorateId='+directorateId+
						'&prevSubmitType='+prevSubmitType);
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