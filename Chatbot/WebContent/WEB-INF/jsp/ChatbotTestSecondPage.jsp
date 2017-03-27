<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.chatbot.util.ChatBotList" %>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<!--  <script src="jquery/jquery-1.11.1.min.js"></script> -->
		<!-- <link rel="stylesheet" href="css/HSAutocomplete.css">
		<script src="bootstrap/js/bootstrap.min.js"></script> -->
		<!-- <script src="jquery/ui/1.11.4/jquery-ui.js"></script> 		 -->
		
		<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
 -->
		
		
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<link href="datatables/css/jquery.dataTables.css" rel="stylesheet">
<link href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link href="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.css" rel="stylesheet">
		
		
		
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>chat Bot</title>
<!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->
<style>
body
{
background-color:#D3D3D3;
padding:0;
font-family:Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
margin:0px auto auto auto;
color:#514c48;
}
a{
text-decoration:underline;
color:#D86200;
}
p{
text-align:justify;
line-height:15px;
padding:5px 0 5px 0;
font-size:11px;
margin:0px;
}

th {
   white-space: nowrap;
   overflow: hidden;
}

span{
color:#FF9900;
}
p.clear{
clear:both;
}
p.news{
clear:both;
border-bottom:1px #CCCCCC dashed;
font-size:10px;
margin:5px 0 5px 0;
}
img.left_img{
float:left;
padding:5px 12px 0 0;
}
img.left_img_border{
float:left;
margin:5px 12px 0 0;
border:3px #b1cee0 solid;
}
h1{
font-size:18px;
color:#514c48;
font-family:Arial, Helvetica, sans-serif;
font-weight:bold;
padding:5px 0 5px 0;
margin:0px;
}
#main_container{
width:877px;
height:auto;
margin:auto;
padding:0px;
position:relative;
}
.top_illustration{
position:absolute;
top:0px;
left:-90px;
}
/* #header{
width:677px;
height:62px;
margin:auto;
} */
.logo{
padding:15px 0 0 70px;
}

/*---------------- menu tab----------------------*/
#menu_tab{
width:850px;
height:42px;
font-family:Arial, Helvetica, sans-serif;
padding:0px;
/* background:url(images/menu_bg.gif) no-repeat center; */

}

ul.menu {
list-style-type:none; display:block; width:610px; 
 margin: auto; padding:0px; background:none;}

ul.menu li {
display:inline;
font-size:13px;
font-weight:bold;
line-height:42px;}

ul.menu li.divider {
display:block;
float:left;
width:1px;
height:42px;
padding:0px ;
margin:0px;
background:url(images/divider.gif) no-repeat center;
}

a.nav:link, a.nav:visited {
display:block; float:left; padding:0px; margin:0;width: auto; margin:0px 14px 0px 14px; text-align:center;
text-decoration:none; background:none; color:#534848;}

a.nav_selected:link, a.nav_selected:visited {
display:block; float:left; padding:0px; margin:0;width: auto;margin:0px 14px 0px 14px;text-align:center;
text-decoration:none; color: #FF6600;}

a.nav:hover {
color: #FF6600; text-decoration:none;}


/*----------------main_content----------------*/
#main_content{
width:auto;
clear:both;
background-color:#FFFFFF;
height:600px;
}
#middle_banner{
width:951px;
height:55px;
margin:auto;
padding:20px 0 0 0;

}
.middle_banner_content{
padding:10px 0 0 0;
}

#left_content{
width:390px;
float:left;
height:auto;
padding:10px 0 0 20px;
}
#right_content{
width:225px;
float:left;
height:auto;
padding:10px 0 0 20px;
}
#answers_content{
width:225px;
float:left;
height:auto;
padding:10px 0 0 20px;
}

.answer_response{
width:410px;
height:188px;
padding:10px 0 0 10px;
background-color: #E6E6E6;
}

#wide_content{
width:635px;
padding:10px 10px 0 20px;
}
.members_login{
width:410px;
height:188px;
padding:10px 0 0 10px;
background-color: #E6E6E6;
/* background:url(images/login_bg.gif) no-repeat center; */
}
.login_row{
width:300px;
float:left;
padding:4px 0 4px 0;
}
label.login{
width:60px;
float:left;
text-align:right;
padding:4px 8px 0 0;
}
input.login_input{
width:120px;
height:16px;
background-color:#FFFFFF;
border:1px #CCCCCC solid;
float:left;
}
a.login_submit{
width:66px;
height:22px;
float:right;
margin:10px;
background:url(images/login_bt.gif) no-repeat center;
display:block;
line-height:22px;
color:#FFFFFF;
text-decoration:none;
text-align:center;
}
#projects_box{
width:566px;
height:185px;
margin:auto;
background:url(images/projects_bg.gif) no-repeat center;
}
.projects_navigation{
width:566px;
height:25px;
margin:auto;
padding:10px 0 0 0;
}
.left_nav a{
float:left;
background:url(images/left_arrow.gif) no-repeat left;
padding:0 0 0 30px;
font-size:12px;
color:#3e2510;
text-decoration:none;
}
.right_nav a{
float:right;
background:url(images/right_arrow.gif) no-repeat right;
padding:0 30px 0 0;
font-size:12px;
color:#3e2510;
text-decoration:none;
}
.project_container{
float:left;
padding:10px 20px 0 40px;
}
.project_title{
font-size:12px;
color: #999999;
padding:0 0 5px 0;
}

/*------contact form------*/
#contact_form{
float:left;
width:300px;
padding:10px 10px 0 30px;
color:#666666;
}
.contact_input{
width:290px;
height:17px;
font-size:10px;
float:left;
background-color:#fff8dc;
border:1px #f0e9cf solid;
}
label.contact_form{
width:200px;
padding:0 0 5px 0;
font-size:12px;
}
.contact_textarea{
width:290px;
height:80px;
font-size:10px;
float:left;
background-color:#fff8dc;
border:1px #f0e9cf solid;
}
input.contact_submit{
float:right;
padding:10px;
}
.cleardiv {
clear:both;
overflow:hidden;
height:4px;
}

/*----footer---------*/
#footer{
width:auto;
clear:both;
padding:15px 0 10px 0;
text-align:center;
color:#999999;
}

.createNewTable{
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 2; /* Sit on top */
    padding-top: 10px; /* Location of the box */
    left: 0;
    top: 90px;
    
    margin-left:350px;
    width: 38%; /* Full width */
    height: 600px; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    
}
                  
/* Modal Content */
.createNewTable-content{
/*    top: 90px; */
   
   padding-top: -25px;
   position: relative;
   background-color: #fefefe;
   /* margin: auto; */
   padding: 0;
   border: 1px solid #888;
   width: 100%;
   box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
   -webkit-animation-name: animatetop;
   -webkit-animation-duration: 0.4s;
   animation-name: animatetop;
   animation-duration: 0.4s;
   
}
                  
/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}
            
@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}
                  
/* The Close Button */
.createNewTable-reportClose{
    color: red;
    float: right;
    font-size: 28px;
    font-weight: bold;
    line-height: 20px;
}
            
.createNewTable-reportClose:hover,
.createNewTable-reportClose:focus {
    color: white;
    text-decoration: none;
    cursor: pointer;
}
      
.createNewTable-header {
    padding: 2px;
    background-color: #3fadb5;
    color: white;
    height:22px;   
    line-height: 12px;     
}
            
.createNewTable-body {
      padding: 2px 16px;
      overflow: auto;
}

.createNewTable-footer {
    padding: 2px 16px;
    background-color: #3fadb5;
    color: white;
    height:22px;
}
 #reAdmission {
  position: relative;
  background-color: #09f;
  margin: 120px auto;
  width: 200px;
  height: 200px;
  border-radius: 200px;
  margin-left: 90px;
}
#reAdmissionScore {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: #fff;
  font-weight: bold;
}
.tab-content {
width: 660px;
padding: 20px;
display: none;
}
#tabReadmit {
display: block;   
}
            
</style>
</head>
<body onload="bodyOnLoad();">

<div id="main_container">
	<div class="top_illustration"><img src="images/beeens.png" alt="" title=""  width="106" height="103"/></div>
	<div id="header">
		<div class="logo">
			<a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a>
		</div> 
	</div>
   
	<div id="main_content">
		<div id="header" align="center" style="height:40px;font-size:18px;background-color:#78C0F0;border-bottom:1px solid black;">Analyzed Results</div>		
			<div id="middle_banner">
				<div>  
					<table>
						<tr style="width:80px">Member Deatails:</tr>
    					<tr>
    						<td style="width:40px"></td>
    						<td>Member Id :</td>
    						<td style="width:10px"></td>
   							<td><span style="color: black" id='memberIdVal'></span></td>
   						</tr>
    					<tr>
							<td style="width:10px"></td>	
							<td>Demography</td> 
	  						<td style="width:10px"></td>
							<td><span style="color: black" id='demographyId'></span></td>
						</tr>
						<tr>
							<td style="width:10px"></td>	
							<td>Gender</td> 
	  						<td style="width:10px"></td>
							<td><span style="color: black" id='ageRange'></span></td>
						</tr>
	 					<tr>
    						<td style="width:40px"></td>
    						<td>Member Age :</td>
    						<td style="width:10px"></td>
    						<td><span style="color: black" id='genderId'></span></td>
    					</tr>
					</table>
				</div>
				
				<div>  
  					<table>
    					<tr>
    						<td style="width:40px"></td>
   							<td><div> possible diagnoses for the symptoms you've entered :</div></td>
   							<td style="width:10px"></td>
						    <td><span style="border: 1px solid #ffffff;" id='diagDiseaseName'></span></td>
							<td style="width:100px"></td>	
							<td> Other possible diagnosis</td> 
						  	<td style="width:10px"></td>
							<td><!-- <select id="OtherDiagDiseaseList" style="width:170px;margin-right:40px;"></select> -->
							    <select id="subjectArea" name="diseaseList" onchange="doSubjectAreaSelect();">
									<option value="">----select----</option>
									<c:forEach items="${diseaseList}" var="diseaseList">
									<option value='<c:out value="${diseaseList}"/>'>${diseaseList}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
				</div>
	<!-- 			    <div id="main_content">
    		<div id="header" align="center" style="height:40px;font-size:18px;background-color:#78C0F0;border-bottom:1px solid black;">Knowledge based Diagnostics
    		</div>	 -->
             <!--    <div>
				<p style="float:left;height:15px;width:92%;position:relative;margin-top:10px;padding-top:2px;font-size:10px;color:black;background:#78C0F0;">Disease Description and Sympthoms</p>
				</div> -->
				<div style="float:left;height:25px;width:92%;position:relative;margin-top:10px;padding-top:2px;">
				<div>
				<p style="float:left;height:23px;width:22.5%;position:relative;margin-top:0px;padding-top:2px;font-size:10px;color:black;background:#78C0F0;">Description</p>
				</div>
				<div>
				<marquee id="marqueeDiseaseDesc"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="float:left;height:25px;width:76%;position:relative;margin-left: 10px;margin-top:0px;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
				</div></div>
              <div style="float:left;height:25px;width:92%;position:relative;margin-top:10px;padding-top:2px;">
				<div>
				<p style="float:left;height:23px;width:22.5%;position:relative;margin-top:0px;padding-top:2px;font-size:10px;color:black;background:#78C0F0;">Symptoms</p>
				</div>
				<div>
				<marquee id="symptoms"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="float:left;height:25px;width:76%;position:relative;margin-left: 10px;margin-top:0px;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
				</div></div>
			<!-- 	<div>
				<marquee id="symptoms"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="float:left;height:25px;width:92%;position:relative;margin-top:10px;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
				</div> -->
         
        
        		<div id="menu_tab">                                     
					<ul class="menu">                                                                               
                    	<li class="one" id="tab_c"><a href="#tabReadmit" class="nav"> Re-admission </a></li>
                        <li class="divider"></li>
                        <li class="two"><a href="#tabHist" class="nav"> History</a></li>
                        <li class="divider"></li>
                        <li><a href="#tab-1" class="nav"> Symptoms</a></li>
                        <li class="divider"></li>
                        <li><a href="#tab-2" class="nav"> Causes</a></li>
                        <li class="divider"></li>
                        <li><a href="#tab-3" class="nav"> Treatment </a></li>
                        <li class="divider"></li>
                        <li><a href="#tab-4" class="nav"> Prevention</a></li>
                        <li class="divider"></li>
					</ul>
            	</div><br>
				<div style="width:100px; height: 100px;">
					<div class="tab">
                    	<div id="tabReadmit" class="tab-content">
                        	<input type="hidden" onChange="'reAdmission';" /><br/>
                            <!-- <img id="reAdmission" src="images/Heart_Attack_Symptom.jpg" width="600" height="350" /> -->
                            	<div id="reAdmission">
                                	<div style="float:left;">Re-admission Score</div>
                                   		<div id="reAdmissionScore"></div>
                                </div>
                        </div>
					</div>
					
                    <div id="tabHist" class="tab-content">
						<ul class="secondMenu">
							<li><a href="#events">Events</a></li>
						  	<li><a href="#icuStays">ICU Stays</a></li>
						  	<li><a href="#microbiologyEvent">Microbiology Event</a></li>
						  	<li><a href="#patientsList">Patients List</a></li>
						   	<li><a href="#DICDProceduresList">D_ICD Procedures</a></li>
						</ul>
					</div>
                             
					<div id="tab-1" class="tab-content" style="margin-left: 50%;">
						<input type="hidden" onChange="'symptom';" /><br/>
						<img id="symptom" src="images/heartsimtoms.png" width="500" height="250" />
					</div>
 					<div id="tab-2" class="tab-content" style="margin-left: 50%;">
						<input type="hidden" onChange="'cause';" /><br/>
						<img id="cause" src="images/Heart_Attack_Cause.jpg" width="500" height="250" />
					</div>
					<div id="tab-3" class="tab-content" style="margin-left: 50%;">
						<input type="hidden" onChange="'treatment';" /><br/>
						<img id="treatment" src="images/Heart_Attack_Treatment.jpg" width="500" height="250" />
 					</div>
					<div id="tab-4" class="tab-content" style="margin-left: 50%;">
						<input type="hidden" onChange="'prevention';" /><br/>
						<img id="prevention" src="images/Heart_Attack_Prevention.jpg" width="500" height="250" />
					</div>

					<div id="events" class="tab-content">
					 <div id="firstSec" style="width:90%;border: 1px solid black;float:left;margin-left: 25%">
	                 <div id="topHeader" align="center" style="border-bottom:1px solid black;background-color: #5499C7;font-weight: bold;color:white;">Events Data</div>
 
						<table id="eventTable" class="display table table-bordered" cellspacing="0"  style="font-size:11px; width: 7%;">
							<thead>
								<tr>
									<th class="center" >Sno</th>
									<th class="center" >Start Time</th>
									<th class="center" >End Time</th>
									<th class="center" >Value</th>
									<th class="center" >Valueuom</th>
									<th class="center" >Store Time</th>
									<th class="center" >Category Name</th>
									<th class="center" >Category Description</th>
									<th class="center" >Is Open Bag</th>
									<th class="center" >Next Dept</th>
									<th class="center" >Cancel Reason</th>
									<th class="center" >Status</th>
									
									
								</tr>
							</thead>
							<tbody>
								<%
				      				List<ChatBotList> eventsMoveList =null;
								if(request.getAttribute("eventsMoveList")!=null){
									eventsMoveList =(List<ChatBotList>)request.getAttribute("eventsMoveList");
									for(ChatBotList ChatBotListDetails:eventsMoveList){
								%>
								<tr>
									<td class="sorting_1"></td>
									<td class="sorting_1"><%=ChatBotListDetails.getStartTime()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getEndTime()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getValue()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getValueoum()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getStoreTime()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getOrderCatname()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getOrderCatDesc()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getIsopenbag()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getContinueinnextdept()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getCancelreason()%></td>
									<td class="sorting_1"><%=ChatBotListDetails.getStatusDescription()%></td>
								</tr>  
									<%}
									}
									%> 
		    				</tbody>
						</table>   
					</div></div>
					
					
    				<div id="icuStays" class="tab-content">
    				 <div id="secsec" style="width:70%;border: 1px solid black;float:left;margin-left: 25%">
	                <div id="topHeader" align="center" style="border-bottom:1px solid black;background-color: #5499C7;font-weight: bold;color:white;">ICU Data</div>
 
		            <table id="icuTable" class="display table table-bordered" cellspacing="0" width="70%" style="font-size:11px;">
			 			<thead>
				    		<tr>
				    	    <th class="center" >S.No</th>
			    			<th class="center" >DB Source</th>
				        	<th class="center" >first Care Unit</th>
				            <th class="center">Last Care Unit</th>
				            <th class="center" >In Time</th>
    				
    				
    			
						</thead>
						<tbody>
							<%
								List<ChatBotList> icuStayesList =null;
								if(request.getAttribute("icuStayesList")!=null){
								icuStayesList =(List<ChatBotList>)request.getAttribute("icuStayesList");
								for(ChatBotList icuStayesListDetails:icuStayesList){
							%>
							<tr>
								<td class="sorting_1"></td>
								<td class="sorting_1"><%=icuStayesListDetails.getDbSource()%></td>
								<td class="sorting_1"><%=icuStayesListDetails.getFirstCareunit()%></td>
								<td class="sorting_1"><%=icuStayesListDetails.getLastCareunit()%></td>
								<td class="sorting_1"><%=icuStayesListDetails.getIntime()%></td>
							</tr>  
								<%}
								}
								%> 
		    			</tbody>
		 			</table>   
         		</div></div>

             	<div id="microbiologyEvent" class="tab-content">
             		 <div id="thirdSec" style="width:50%;border: 1px solid black;float:left;margin-left: 25%">
	                <div id="topHeader" align="center" style="border-bottom:1px solid black;background-color: #5499C7;font-weight: bold;color:white;">Micro BiologyEvent Data</div>
 
        			<table id="microbiologyEventTable" class="display table table-bordered" cellspacing="0" width="5%" style="font-size:11px;">
						<thead>
							<tr>
								<th class="center" >Sno</th>
								<th class="center" >Chat Date</th>
								<th class="center" >Chat Time</th>
								<th class="center" >Type Description</th>
							</tr>
						</thead>
					<tbody>
						<%
							List<ChatBotList> microBiologyEventList =null;
							if(request.getAttribute("microBiologyEventList")!=null){
							microBiologyEventList =(List<ChatBotList>)request.getAttribute("microBiologyEventList");
							for(ChatBotList microBiologyEventListDetails:microBiologyEventList){
						%>
				
						<tr>
							<td class="sorting_1"></td>
							<td class="sorting_1"><%=microBiologyEventListDetails.getChartDate()%></td>
							<td class="sorting_1"><%=microBiologyEventListDetails.getChartTime()%></td>
							<td class="sorting_1"><%=microBiologyEventListDetails.getSpecTypeDesc()%></td>
						</tr>  
							<%}
							}
							%> 
		    		</tbody>
		 		</table>    
         	</div></div>
 			<div id="patientsList" class="tab-content">
 					 <div id="forthSec" style="width:50%;border: 1px solid black;float:left;margin-left: 25%">
	                <div id="topHeader" align="center" style="border-bottom:1px solid black;background-color: #5499C7;font-weight: bold;color:white;">patients List Data</div>
 
				<table id="patientsListTable" class="display table table-bordered" cellspacing="0" width="10%" style="font-size:11px;">
					<thead>
						<tr>
							<th class="center" >Sno</th>
							<th class="center" >Gender</th>
							<th class="center" >Date Of Birth</th>
							<th class="center" >Date Of Death</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<ChatBotList> patientsList =null;
							if(request.getAttribute("patientsList")!=null){
							patientsList =(List<ChatBotList>)request.getAttribute("patientsList");
							for(ChatBotList patientsListDetails:patientsList){
						%>
						<tr>
							<td class="sorting_1"></td>
							<td class="sorting_1"><%=patientsListDetails.getGender()%></td>
							<td class="sorting_1"><%=patientsListDetails.getDob()%></td>
							<td class="sorting_1"><%=patientsListDetails.getDod()%></td>
						</tr>  
							<%}
							}
							%> 
					</tbody>
				</table>   
			</div></div>
	
	
			<div id="DICDProceduresList" class="tab-content">
			 <div id="fifthSec" style="width:60%;border: 1px solid black;float:left;margin-left: 25%">
	                <div id="topHeader" align="center" style="border-bottom:1px solid black;background-color: #5499C7;font-weight: bold;color:white;">CB_D_ICD ListData</div>
 
				<table id="DICDProceduresListTable" class="display table table-bordered" cellspacing="0" width="10%" style="font-size:11px;">
					<thead>
						<tr>
							<th class="center" >Sno</th>
							<th class="center" >ICD Code</th>
							<th class="center" >Short Title</th>
							<th class="center" >Long Title</th>
							<th class="center" >Seq Number</th>
						</tr>
					</thead>
					<tbody>
						<%
						      	List<ChatBotList> DICDProceduresList =null;
						if(request.getAttribute("DICDProceduresList")!=null){
							DICDProceduresList =(List<ChatBotList>)request.getAttribute("DICDProceduresList");
						for(ChatBotList DICDProceduresListDetails:DICDProceduresList){
						%>
						<tr>
							<td class="sorting_1"></td>
							<td class="sorting_1"><%=DICDProceduresListDetails.getIcdCode()%></td>
							<td class="sorting_1"><%=DICDProceduresListDetails.getShortTitle()%></td>
							<td class="sorting_1"><%=DICDProceduresListDetails.getLong_Title()%></td>
							<td class="sorting_1"><%=DICDProceduresListDetails.getSeq_num()%></td>
						</tr>  
							<%}
							}
							%> 
		    		</tbody>
		 		</table>  </div> 
			</div>
		</div>		
 	</div>
</div>
	<div id="footer"><img src="images/beensss.png"  width="28" height="23" alt="" title="" /> chat bot 2017</div>
</div>


<script src="datatables/js/jquery-1.11.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/plug-ins/1.10.7/integration/jqueryui/dataTables.jqueryui.js"></script>   



<script>
function bodyOnLoad(){
	var diseaseName = "<%=request.getAttribute("diseaseName") %>";
	document.getElementById('diagDiseaseName').innerHTML = diseaseName; 
	var diseaseList = "<%=request.getAttribute("diseaseList") %>";
	var diseaseDesc = "<%=request.getAttribute("diseaseDesc") %>";
	var symptoms = "<%=request.getAttribute("symptoms") %>";
	document.getElementById("marqueeDiseaseDesc").innerText = diseaseDesc;
	document.getElementById("symptoms").innerText = symptoms;
	var memberId = "<%=request.getAttribute("memberId") %>";
	document.getElementById('memberIdVal').innerHTML = memberId; 
	var demographyVal = "<%=request.getAttribute("demographyVal") %>";
	document.getElementById('demographyId').innerHTML = demographyVal; 
	var ageRangeVal = "<%=request.getAttribute("ageRangeVal") %>";
	document.getElementById('ageRange').innerHTML = ageRangeVal; 
	var gender = "<%=request.getAttribute("gender") %>";
	document.getElementById('genderId').innerHTML = gender; 
	
	
	

}

$(document).ready(function() {
	var flag = "n";
	if(flag = "y"){
		alert(flag);
		//document.getElementById("tab_c").style.enabled = false;
		$('.one').hide();
		$('.two').hide();
		$('.tab-content').hide();
		
		//document.getElementById("tab_c").childNodes[0].onclick = function() {return false;};
	}
	
});

$(document).ready(function() {
    $(".secondMenu a").click(function(event) {
        event.preventDefault();
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
       $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
});


$(document).ready(function() {
    $(".menu a").click(function(event) {
        event.preventDefault();
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
});


var eventdataTable ="";
$(document).ready(function() {
	eventdataTable = $('#eventTable').DataTable({
	    "scrollY": 300,
	    "sScrollY": "180px",
	    "scrollX": "100%",
	    "order": [[1, 'asc' ]],
	    /* "aLengthMenu":[100], */
	    "bAutoWidth": false, // Disable the auto width calculation 
	    "aoColumns": [
	                  { "sWidth": "10%" }, // SNO column width 
	                  { "sWidth": "40%" }, 
	                  { "sWidth": "40%" }, 
	                  { "sWidth": "20%" },
	                  { "sWidth": "20%" },
	                  { "sWidth": "20%" }, 
	                  { "sWidth": "20%" }, 
	                  { "sWidth": "20%" },
	                  { "sWidth": "20%" },
	                  { "sWidth": "20%" },
	                  { "sWidth": "20%" },
	                  { "sWidth": "20%" },
	                  ]	      
	});

	$(window).bind('resize', function () {
		eventdataTable.fnAdjustColumnSizing();
	  } );

	eventdataTable.on( 'order.dt search.dt', function () {
		eventdataTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();   

	$('#eventTable tbody').on( 'click', 'tr', function () {
	    if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
	    }
	    else {
	    	eventdataTable.$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	    }
	}); 
});
	




$(document).ready(function() {

	targetTable = $('#icuTable').DataTable({
	    "scrollY": 300,
	    "sScrollY": "100px",
	    "scrollX": "250%",
	    "order": [[1, 'asc' ]],
	    /* "aLengthMenu":[100], */
	    "bAutoWidth": false, // Disable the auto width calculation 
	    "aoColumns": [
	                  { "sWidth": "1%" }, // SNO column width 
	                  { "sWidth": "3%" }, 
	                  { "sWidth": "3%" }, 
	                  { "sWidth": "3%" }, 
	                  { "sWidth": "6%" },
	                  ]	      
	});

	$(window).bind('resize', function () {
		targetTable.fnAdjustColumnSizing();
	  } );

	targetTable.on( 'order.dt search.dt', function () {
		targetTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();   

	$('#icuTable tbody').on( 'click', 'tr', function () {
	    if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
	    }
	    else {
	    	targetTable.$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	    }
	}); 



	});


$(document).ready(function() {

	targetTable = $('#microbiologyEventTable').DataTable({
	    "scrollY": 300,
	    "sScrollY": "100px",
	    "scrollX": "250%",
	    "order": [[1, 'asc' ]],
	    /* "aLengthMenu":[100], */
	    "bAutoWidth": false, // Disable the auto width calculation 
	    "aoColumns": [
	                  { "sWidth": "1%" }, // SNO column width 
	                  { "sWidth": "1%" }, 
	                  { "sWidth": "6%" }, // EmployeeName column width
	                  { "sWidth": "5%" },
	                  ]	      
	});

	$(window).bind('resize', function () {
		targetTable.fnAdjustColumnSizing();
	  } );

	targetTable.on( 'order.dt search.dt', function () {
		targetTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();   

	$('#microbiologyEventTable tbody').on( 'click', 'tr', function () {
	    if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
	    }
	    else {
	    	targetTable.$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	    }
	}); 



	});


	
$(document).ready(function() {

	targetTable = $('#patientsListTable').DataTable({
	    "scrollY": 300,
	    "sScrollY": "100px",
	    "scrollX": "250%",
	    "order": [[1, 'asc' ]],
	    /* "aLengthMenu":[100], */
	    "bAutoWidth": false, // Disable the auto width calculation 
	    "aoColumns": [
	                  { "sWidth": "1%" }, // SNO column width 
	                  { "sWidth": "1%" }, 
	                  { "sWidth": "6%" }, // EmployeeName column width
	                  { "sWidth": "5%" }, 
	                  ]	      
	});

	$(window).bind('resize', function () {
		targetTable.fnAdjustColumnSizing();
	  } );

	targetTable.on( 'order.dt search.dt', function () {
		targetTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();   

	$('#patientsListTable tbody').on( 'click', 'tr', function () {
	    if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
	    }
	    else {
	    	targetTable.$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	    }
	}); 



	});



$(document).ready(function() {

	targetTable = $('#DICDProceduresListTable').DataTable({
	    "scrollY": 300,
	    "sScrollY": "100px",
	    "scrollX": "250%",
	    "order": [[1, 'asc' ]],
	    /* "aLengthMenu":[100], */
	    "bAutoWidth": false, // Disable the auto width calculation 
	    "aoColumns": [
	                  { "sWidth": "1%" }, // SNO column width 
	                  { "sWidth": "1%" }, 
	                  { "sWidth": "6%" }, // EmployeeName column width
	                  { "sWidth": "5%" }, // GpfOrCpsNo column width
	                  { "sWidth": "5%" }, 
	                  ]	      
	});

	$(window).bind('resize', function () {
		targetTable.fnAdjustColumnSizing();
	  } );

	targetTable.on( 'order.dt search.dt', function () {
		targetTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();   

	$('#DICDProceduresListTable tbody').on( 'click', 'tr', function () {
	    if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
	    }
	    else {
	    	targetTable.$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	    }
	}); 



	});



</script>
</body>
</html>