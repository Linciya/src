<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="gov.shdrc.util.UserInfo"%>
    <%@page import="gov.shdrc.util.ShdrcConstants"%>
    <%@page import="java.util.List"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
String userTier=UserInfo.getUserTier();
List<String> userRoleList=UserInfo.getUserRoleList();

/* if(!(userRoleList.contains("DMS")
		||userRoleList.contains("CMCHIS")
		||userRoleList.contains("ESI")
		||userRoleList.contains("RNTCP")
		||userRoleList.contains("SBCS")
		||userRoleList.contains("NLEP")
		||userRoleList.contains("DIM")
		||userRoleList.contains("DFS")
		||userRoleList.contains("DFW")
		||userRoleList.contains("DPH")
		||userRoleList.contains("MRB")
		||userRoleList.contains("TANSACS")
		||userRoleList.contains("TNMSC")
		||userRoleList.contains("NRHM")
		||userRoleList.contains("COC")
		||userRoleList.contains("SHTO")
		||userRoleList.contains("DME"))){
	userTier="T4";
} */
String userName=UserInfo.getLoggedInUserName();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/flipMenu.css">
<title>Insert title here</title>
<link rel="stylesheet" href="css/tabsmenu.css">
<script src="jquery/jquery-1.11.1.min.js"></script>
<script src="jquery/ui/1.11.4/jquery-ui.js"></script>
<script src="js/sdgs.js"></script>
<script src="pivot/js/d3.v3.min.js"></script>
<script type="text/javascript" src="js/fusioncharts.js"></script>
<script type="text/javascript" src="js/fusioncharts.theme.fint.js"></script>
<style>
.shdrc_mainBody{
width:100%;
height:auto;
margin-top: -4px;
}
.flipDiv{
width:60%;
min-height:430px;
height:100%;
/* background: #A6ACAF; */
background:	#e6f7ff;
border-style: solid;
border-width:thin;
border-color: green;
float: left;
} 
.rightSideDiv{
width:40%;
height:100%;
min-height:430px;
margin-left:17.3cm;
margin-top:-432px;
border: thin;
float: right;
}
#menuMainDiv{
width:40%;
margin-left:0px;
margin-top:-1px;
}
 .ui-tabs .ui-tabs-nav {
    margin-top: -2px;    
    border:thin;
    margin-left:2px;
}
.ui-tabs .ui-tabs-nav .ui-tabs-anchor {
    float: left;
    text-decoration: none;
    margin-top:1px;
}
.dashboardDiv{
width:auto;
height:202px;
background: #e6f7ff;
border-style: ridge;/* border-width:thin; */
border-color: green;
margin-right:-2px;
}

.linkText{
	font:12px arial;
	color:#08C;
	
} 
</style>
<style>
#testGrid tr:nth-child(even){
	color:black;
	background-color: #ffffff;
	text-align: center;
}

#testGrid tr:nth-child(odd){
	color:black;
	background-color: #ffffff;
	text-align: center;
}
#testGrid{
width:100%;
}
#testGrid thead tr td{
	font-family:Tahoma;
	font-size:10px;
	background: #408000; 
	color:white;
}
#tabs-1,#tabs-2,#tabs-3{
border-style: solid;
    border-right: thin double green;
    background:#e6f7ff;
    margin-top:1px;
    margin-right:-3px;
    height:123px;
    width:auto;
}
</style>
</head>
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
</script>
<body style="width:100%;height:1500px;min-height: 1500px;" onload="onLoad();">
<div id="shdrc_mainBody" class="shdrc_mainBody" style="width:100%;border:thin;">
<div id="flipDiv" class="flipDiv">
<div style="background: #0B6990;width:auto"><span style="margin-left:250px;margin-top:155px;font-size:12px;color:white;font-family:font|initial|

inherit;">Health Directorates - Home
</span></div>
<DMS>
  <%if((userRoleList.contains(ShdrcConstants.Role.DMS) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
	    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DMS</p>
	    <div class="a" style="text-align: center"><a href="dmsDashboardZone.do?directorateId=1" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;"><center>Directorate of Medical and 
	    Rural Health Services</a></div>
   <%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DMS</p>
   <%} %>
 </DMS><br><br>
 <DPH>
 	<%if((userRoleList.contains(ShdrcConstants.Role.DPH) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DPH</p>
		    <div class="a"><a href="dphDashboardZone.do?directorateId=2" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Directorate of Public 
     		 Health and Preventive Medicine</a></div>
     <%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DPH</p>
   <%} %>	 
 </DPH>
 <DME>
 <%if((userRoleList.contains(ShdrcConstants.Role.DME) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DME</p>
		    <div class="a"><a href="dmeDashboardZone.do?directorateId=8" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Directorate of Medical 
		
		Education</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DME</p>
   <%} %>	
 </DME>
 <TNMSC>
 	<%if((userRoleList.contains(ShdrcConstants.Role.TNMSC) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">TNMSC</p>
		    <div class="a"><a href="tnmscDashboardZone.do?directorateId=3" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Tamil Nadu Medical Services 
		
		Corporation</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">TNMSC</p>
   <%} %>	
 	</TNMSC>
 
 <TANSACS>
 	<%if((userRoleList.contains(ShdrcConstants.Role.TANSACS) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">TANSACS</p>
		    <div class="a"><a href="tansacsDashboardZone.do?directorateId=4" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;"> Tamil Nadu State AIDS Control 
		
		society</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">TANSACS</p>
   <%} %>	
 </TANSACS>
 
 <NRHM>
 <%if((userRoleList.contains(ShdrcConstants.Role.NRHM) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">NRHM</p>
		    <div class="a"><a href="nrhmDashboardZone.do?directorateId=5" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">National Rural Health
		    Mission</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">NRHM</p>
   <%} %>		     
 </NRHM>
 
 <RNTCP>
 <%if((userRoleList.contains(ShdrcConstants.Role.RNTCP) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		   	 <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">RNTCP</p>
		    <div class="a"><a href="rntcpDashboardZone.do?directorateId=6" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Revised National Tuberculosis Control 
			Programme - Unit</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">RNTCP</p>
   <%} %>		  		
 </RNTCP>
 
 <MA>
  <%if((userRoleList.contains(ShdrcConstants.Role.MA) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">MA</p>
		    <div class="a"><a href="maDashboardZone.do?directorateId=7" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Municipal Administration - Health 
			Wing</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">MA</p>
   <%} %>		
 </MA>
 <DFW>
 <%if((userRoleList.contains(ShdrcConstants.Role.DFW) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DFW</p>
		    <div class="a"><a href="dfwDashboardZone.do?directorateId=10" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Directorate of Family
		welfare</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DFW</p>
   <%} %>	
 </DFW>
 
 <SBCS>
 <%if((userRoleList.contains(ShdrcConstants.Role.SBCS) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">SBCS</p>
		    <div class="a"><a href="sbcsDashboardZone.do?directorateId=13" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">State Blindness Control 
		
		Society</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">SBCS</p>
   <%} %>		
 </SBCS>
 <DCA>
 <%if((userRoleList.contains(ShdrcConstants.Role.DCA) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DCA</p>
		    <div class="a"><a href="dcaDashboardZone.do?directorateId=14" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Drug Control Authority</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DCA</p>
   <%} %>		    
 </DCA>
 <DFS>
 	 <%if((userRoleList.contains(ShdrcConstants.Role.DFS) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DFS</p>
		    <div class="a"><a href="dfsDashboardZone.do?directorateId=16" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Directorate of Food Safety</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DFS</p>
   <%} %>	    
 </DFS>
 <CMCHIS>
  <%if((userRoleList.contains(ShdrcConstants.Role.CMCHIS) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">CMCHIS</p>
		    <div class="a"><a href="cmchisDashboardZone.do?directorateId=17" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">CM's Comprehensive Health Insurance Scheme 
		
		- Unit</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">CMCHIS</p>
   <%} %>
 </CMCHIS>
 <SHTD>
 	 <%if((userRoleList.contains(ShdrcConstants.Role.SHTO) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
			    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">SHTD</p>
			    <div class="a"><a href="shtdDashboardZone.do?directorateId=11" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">State Health Transport 
			
			Department</a></div>
		<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">SHTD</p>
   <%} %>	
 </SHTD>
 <NLEP>
  <%if((userRoleList.contains(ShdrcConstants.Role.NLEP) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">NLEP</p>
		    <div class="a"><a href="nlepDashboardZone.do?directorateId=19" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">National Leprosy Eradication 
		
		Programme</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">NLEP</p>
   <%} %>	
 </NLEP>
 <MRB>
  <%if((userRoleList.contains(ShdrcConstants.Role.MRB) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">MRB</p>
		    <div class="a"><a href="mrbDashboardZone.do?directorateId=15" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Medical Recruitment Board</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">MRB</p>
   <%} %>	    
 </MRB>
 <ESI>
 <%if((userRoleList.contains(ShdrcConstants.Role.ESI) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
	    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">ESI</p>
	    <div class="a"><a href="esiDashboardZone.do?directorateId=21" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Employee State Insurance</a></div>
<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">ESI</p>
   <%} %>	    
 </ESI>
 <COC>
 <%if((userRoleList.contains(ShdrcConstants.Role.COC) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">COC</p>
		    <div class="a"><a href="cocDashboardZone.do?directorateId=12" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Corporation of Chennai - Health 
		
		Wing</a></div>
<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">COC</p>
   <%} %>		
 </COC>
 <DIM>
 <%if((userRoleList.contains(ShdrcConstants.Role.DIM) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">DIM</p>
		    <div class="a"><a href="dimDashboardZone.do?directorateId=18" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Department of Indian 
		
		Medicine</a></div>
	<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">DIM</p>
   <%} %>		
 </DIM>
 <TNDRMGR>
 <%if((userRoleList.contains(ShdrcConstants.Role.DRMGR) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">TNDRMGR</p>
		    <div class="a"><a href="drmgrDashboardZone.do?directorateId=9" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">TNDRMGR Medical University, 
		
		Chennai</a></div>
<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">TNDRMGR</p>
   <%} %>		
 </TNDRMGR>
 <NCD>
 <%if((userRoleList.contains(ShdrcConstants.Role.NCD) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
	    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">NCD</p>
	    <div class="a"><a href="ncdReportZone.do?directorateId=23" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Non Communicable Diseases</a></div>
<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">NCD</p>
   <%} %>		    
 </NCD>  
<CS>
<%if("tncs".equalsIgnoreCase(userName) || "hmis_mo".equalsIgnoreCase(userName)){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">CS</p>
		    <div class="a"><a href="dphDashboardZone.do?directorateId=2" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Chief Secretary Indicators </a></div>
<%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">CS</p>
   <%} %>			    
 </CS> 
 <HS>
 	<%if("tnhs".equalsIgnoreCase(userName) || "tncs".equalsIgnoreCase(userName) || "hmis_mo".equalsIgnoreCase(userName)){ %>
	    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">HS</p>
	    <div class="a"><a href="<%=request.getContextPath()%>/hsHomePage.do" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Health Secretary Indicators</a></div>
	 <%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">HS</p>
   <%} %>   
 </HS> 
 <PS>
 <%if((userRoleList.contains(ShdrcConstants.Role.PVTSEC) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
		    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">PS</p>
		    <div class="a"><a href="privateSectorDataEntry.do?directorateId=24" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">Private Sector Indicators</a></div>
 <%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">PS</p>
   <%} %>			    
 </PS>
<SDGS>
	<%-- <%if("tnhs".equalsIgnoreCase(userName) || "tncs".equalsIgnoreCase(userName) || "hmis_mo".equalsIgnoreCase(userName)){ %> --%>
	 <%if((userRoleList.contains(ShdrcConstants.Role.AMB) 
		  && !ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)) 
		  || (userRoleList.contains(ShdrcConstants.Role.ALLDIRECTORATE))){ %>
	    <p style="text-shadow: none;color:yellow;font-family: Tahoma;font-size:12px;">108 Services</p>
	    <div class="a"><a href="108HomePage.do" style="text-decoration:none;text-shadow: none;color:white;font-family:Tahoma;font-style:normal;text-align:center;font-size:10px;">108 Services</a></div>
	 <%}else{ %>
   		<p style="text-shadow: none;color:white;font-family: Tahoma;font-size:12px;">108 Services</p>
   <%} %>    
</SDGS>
</div>
<div id="rightSideDiv" class="rightSideDiv">
<div style="background: #0B6990;width:auto;margin-right:-2px;"><span style="margin-left:120px;margin-top:-10px;font-size:12px;font-family:font|initial|

inherit;color:white;">Sustainable Developmental Goals - Dashboard
</span></div>
<div id="dashboardDiv" class="dashboardDiv">
<div style="height:15px;margin-top: 5px;margin-left: 5px;"><label style="font-size: 11px;font-family: Tahoma;">* Showing trend history for the past 12 months</label></div>
<table id="testGrid" border="1" style="border-collapse:collapse;border-color:#ccc; border-float:center; margin: auto;margin-top: 8px;">
				<thead>
				<tr align="center">
				<td>Goal</td>
				<td>Level</td>
				<td>Signal</td>
				<td>Trending(past 12 months)</td>
				<td>Current State</td>
				<td>Target</td>
				<td>Actual</td>
				<!-- <td>Projected Value</td> -->
				</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
</div>
<div style="background: #0B6990;width:auto;margin-right:-1px;"><span style="margin-left:120px;margin-top:-10px;font-size:12px;font-family:font|initial|

inherit;color:white;">Health Directorates - Alerts
</span></div>
<div id="tabsDiv" class="tabsDiv">
<div id="tabs" style="width:auto;height:28px;background:#87CEFA;border: none;padding-left:2px;">
  <ul>
    <li><a href="#tabs-1" style="font-family:font|initial|inherit;font-size:12px;color:blue" onclick="startMarqueeForNotify();">Notifications</a></li>
     <li><a href="#tabs-2" style="font-family: font|initial|inherit;font-size:12px;color:blue" onclick="startMarqueeForNews();">News</a>
  </ul>
  <div id="tabs-1">
   <marquee id="notifyMarquee" direction="up" onmouseover="stop();" onmouseout="start();"scrollAmount="2"  style="height:120px;text-align:left;">  
   <c:forEach var="notifyCations" items="${notificationList}">
    <p class="linkText">
   <c:out value="${notifyCations}"/></p>
   </c:forEach></marquee>  
  </div>
  <div id="tabs-2">
  <marquee id="newsMarquee" direction="up" onmouseover="stop();" onmouseout="start();" scrollAmount="2" style="height:120px;font-family:Tahoma;font-style:normal;text-align:left;font-size:15px;"><c:forEach var="alertList" items="${alertsList}">
   <a href='<%=request.getContextPath()%>/News.do?messageId=<c:out value="${alertList.id}"/>'><c:out value="${alertList.name}"/></a><p>  
   </c:forEach></marquee>
  </div>
</div>
</div>
</div>
</div>
</body>
<script>
function onLoad(){
	var distMaternalDeathData = <%= request.getAttribute("distMaternalDeathData") %>;
	var maternalDeathMonVal = <%= request.getAttribute("maternalDeathMonVal") %>;
	var maternalDeathThreshold = <%=request.getAttribute("maternalDeathThreshold") %>;
	bodyOnLoad(distMaternalDeathData,maternalDeathMonVal,maternalDeathThreshold);
}
function startMarqueeForNews(){
	document.getElementById("newsMarquee").start();
}
function startMarqueeForNotify(){	
	document.getElementById("notifyMarquee").start();
}
</script>
</html>