<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="bootstrap">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Training Material</title>
  <!-- We need web context for requirejs and css -->
  <script type="text/javascript" src="webcontext.js?context=mantle&cssOnly=true"></script>
  <script language='JavaScript' type='text/javascript' src='http://admin.brightcove.com/js/BrightcoveExperiences.js'></script>
<script type="text/javascript">
	
	var contextpath = '<%=request.getContextPath()%>';
	function backToHomePage(){
		 document.location.href = contextpath+'/shdrcHome.do'/* '/mantle/home/index.jsp' */;
	}
	
	function downloadDocument(){
		 document.location.href = contextpath+'/mantle/home/TrainingMaterialContent.pdf';
	}
	
	/**
	* This method invokes the print dialog
	*/
	function callPrint(){
		var printHTML = document.getElementById('print');		
		printHTML.innerHTML='';
		window.print();
	}
     </script>
</head>
<body>
  <!-- <div style="background-color: #D8E2EE;"><button type="button" class="btn btn-primary" value="Back" onclick="backToHomePage();"/>Back</button></div> -->
  <div>
	  <button type="button" class="btn btn-large" value="Back" onclick="backToHomePage();"/>Back</button>
	  <!-- <button type="button" class="btn btn-large" value="Download" onclick="downloadDocument();"/>Download</button> -->
  </div>
	<div id="content">
	<iframe src="Documentation/TrainingMaterialContent.pdf" style="frameborder=0;width:1500px;height:650px"></iframe>
	</div>
</body>
</html>