<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="gov.shdrc.util.UserInfo"%>
    <%@page import="gov.shdrc.util.ShdrcConstants"%>
    <%@page import="java.util.List"%>
    <%@ page import="org.json.JSONArray" %>
	<%@ page import="org.json.JSONException" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="label_login_console"/></title>
<%
String userTier=UserInfo.getUserTier();
List<String> userRoleList=UserInfo.getUserRoleList();
JSONArray jsonUserRole=new JSONArray(userRoleList);
%>
<link rel="stylesheet" type="text/css" href="css/dropdown.css">
<style>
.subMenu{/* color:#A52A2A; */
width:100%;
background: #87CEFA;
height:32px;
}
.dropDownMenu li.parent:HOVER{
    color: yellow;	
}
.logoutButton:HOVER{
color:red;
font-weight:bold;
cursor: pointer;
}
.logoutButton{
color:yellow;
}
</style>
<script type="text/javascript">
var contextpath = '<%=request.getContextPath()%>';
//var ldapRoleArr = <%= new JSONArray(userRoleList)%>;
var userRoleArr = <%= jsonUserRole %>;
function doDataEntry()
{
	for(i=0;i<userRoleArr.length;i++){
		var role=userRoleArr[i];
		var directorateServlet=getDirectorateServlet(role);
		if(directorateServlet!=""){
			document.location.href = contextpath+directorateServlet;
			return;
		}

	}
}

function getDirectorateServlet(role){
	 var directorateServlet='';
       switch (role) {
       	case "<%= ShdrcConstants.Role.DMS %>" : directorateServlet= "/dmsDataEntry.do";
           		break;
       	case "<%= ShdrcConstants.Role.DPH %>":  directorateServlet= "/dphDataEntry.do";
        		break;
       	case "<%= ShdrcConstants.Role.TNMSC %>": directorateServlet= "/tnmscDataEntry.do";
           		break;
       	case "<%= ShdrcConstants.Role.TANSACS %>": directorateServlet="/tansacsDataEntry.do";
           		break;
       	case "<%= ShdrcConstants.Role. NRHM %>":  directorateServlet= "/nrhmDataEntry.do";
                  break;
       	case "<%= ShdrcConstants.Role.RNTCP %>": directorateServlet= "/rntcpDataEntry.do";
                   break;
        case "<%= ShdrcConstants.Role.MA %>":  directorateServlet= "/maDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DME %>":  directorateServlet= "/dmeDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DRMGR %>":  directorateServlet= "/drmgrDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DFW %>":  directorateServlet= "/dfwDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.SHTO %>":  directorateServlet= "/shtdDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.COC %>":  directorateServlet= "/cocDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.SBCS %>":  directorateServlet= "/sbcsDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DCA %>":  directorateServlet= "/dcaDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.MRB %>":  directorateServlet= "/mrbDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DFS %>":  directorateServlet= "/dfsDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.CMCHIS %>":  directorateServlet= "/cmchisDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.DIM %>":  directorateServlet= "/dimDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.NLEP %>":  directorateServlet= "/nlepDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.SBHI %>":  directorateServlet= "/sbhiDataEntry.do";
                    	break;
		case "<%= ShdrcConstants.Role.ESI %>":  directorateServlet= "/esiDataEntry.do";
                    	break;			
		case "<%= ShdrcConstants.Role.ALLDIRECTORATE %>":  directorateServlet= "/dmsDataEntry.do";
                    	break;
       }
	 return directorateServlet;
   }

</script>
</head>
<body style="width:100%;" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div id="mainDIV">
<img alt="" src="images/shdrc top2.png" style="margin-top:-12px; width:100%; height:60%;" width="100%" height="45%">
<div id="subMenu" class="subMenu">
<ul class="dropDownMenu">
<li class="parent"><a id="refClass" href="" style="margin-left:-40px;width:150px;text-align:center;color:black">User Menu</a>
  <ul class="children">
  <%
		if(ShdrcConstants.UserTier.TIER3.equalsIgnoreCase(userTier) 
				|| ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)
				||(userRoleList.contains("AllDirectorate") )){%>
      <li><a href="#" onclick="doDataEntry();" >Data Entry Forms</a></li>
      <li><a href="#" onclick="location.href='uploadExcel.do';">Upload Data Files</a></li>
   <%} %>   
      <!-- <li><a href="#" >Brows Files</a></li> -->
      <li><a href="#" onclick="location.href='changePassword.do';" >Change Password</a></li>
    <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  
      <li><a href="#" onclick="location.href='messageAlert.do';">Notification/News</a></li>
     <%} %>
     <%
		if((userRoleList.contains("AllDirectorate") )){%>
     <li><a href="userManagement.do" >Add User</a></li>
   <%} %>      
      <li><a href="#" onclick="location.href='modifyUser.do';">Modify User</a></li>
      <!-- <li><a href="#" >Manage Data Source</a></li> -->
    <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  
       <li><a href="#" onclick="location.href='IMRPredictiveZone.do';">Predictive Zone</a></li> 
       <li><a href="shdrcPredictionSlider.do" >On Demand Prediction</a></li>   
      <li><a href="#" >Service&nbsp;Maintenance</a></li>
    <%} %>  
      <li><a href="#" onclick="location.href='statistics.do';">Data Statistics</a></li>  
      <li><a href="#" onclick="location.href='documentation.do';">Documentation</a></li>
      <% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %> 
       <li><a href="#" onclick="location.href='userAudit.do?directorateId=10';">User Login Audit</a></li>  
    <%} %>
    </ul>
  </li> 
  </ul>
  <div id="userInfo" class="userInfo"><% if(!ShdrcConstants.UserTier.TIER4.equalsIgnoreCase(userTier)){ %>  <label style="font-weight:none;font: normal 18px thahoma;font-size:15px;margin-left:200px;margin-top:7px;" onclick="location.href='shdrcHome.do';" >Home Page</label><%} %>  <label style="font-weight:none;font: normal 18px thahoma;font-size:15px;margin-left:800px;margin-top:7px;">Logged User: <%=UserInfo.getLoggedInUserName() %></label>
 <label id="logoutButton" class="logoutButton" onclick="location.href='userSessionInvalidate.do';" class="btn btn-default btn-sm" style="font: normal 18px thahoma;height:100px;margin-left:50px;">
            Logout</label></div>
</div>
</div>
</body>
<script type="text/javascript">
window.history.forward();
function noBack() { window.history.forward(); }
</script>
</html>