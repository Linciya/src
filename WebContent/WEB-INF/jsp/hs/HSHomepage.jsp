<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HS Home Page</title>
<style type="text/css">
html, body {
   height: 90%;
   margin: 0px;
}
div#test{
	padding-left: 50px;
	padding-right: 100px;	
}	 
.floating-box:hover {
	text-decoration: none;
	background: #cce6ff;
	<!--  background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e); -->
}
.floating-box-image {
    float: left;
    width: 80px;
    height: 78px;
    border: 1px solid #e6f3ff; 
   /*  background-image: url("pic_mountain.jpg");
    background-size: 100px 100px; */
   /*  border-top-left-radius: 1em;
    border-bottom-left-radius: 1em; */
    margin-left: 25px;
    margin-top: 25px;
    box-shadow: 0 0 1em olive;
}
.floating-box-text,.inside {
    float: left;
	display: table-cell;
    text-align: center;
    width: 150px;
    /* background: #e6f3ff; */
    background: #e6f2ff;
    border-top-right-radius: 1em;
    border-bottom-right-radius: 1em;
    height: 80px;
    vertical-align:middle;
    display:table-cell;
    margin-top: 25px;
    font-family: sans-serif;
    color: #0047b3;
    box-shadow: 0 0 1em olive;   
}
.containerdivNewLine { 
	clear: both; 
	float: left; 
	display: block;	
	/* position: relative;  */
} 
.inside { 
    float:none;
    border:none;
    margin:0;
}
.floating-box-text,.inside:hover {
	text-decoration: none;
	background: #cce6ff;
	/* background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);  */
}		
#directorateNameHeader{
	padding-left:10px;
	font-family: Verdana;
	font-size: 12px;
	font-size:14px;
	width:99.3%;
	color:black;
	height:30px;
	padding-top:6px;
	background-image: linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -o-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -moz-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -webkit-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
	background-image: -ms-linear-gradient(bottom, #EDFB6E 10%, #85BF32 90%);
}
</style>
</head>
<body>
<div class="mainDiv">
<div id="directorateNameHeader"><spring:message code="shdrc_hsdashboard_header_name"/></div>
<div id="test" style="">
	<div>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Chickunguniya Cases"><div class="floating-box-image"><img alt="" src="images/hs/chikungunya.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Chickunguniya Cases</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Deliveries Conducted"><div class="floating-box-image"><img alt="" src="images/hs/Deliveries conducted.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Deliveries Conducted</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Dengue Cases"><div class="floating-box-image"><img alt="" src="images/hs/Dengue.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Dengue Cases</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Disease Outbreak Alert"><div class="floating-box-image"><img alt="" src="images/hs/Outbreak.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Disease Outbreak Alert</div></div></a>
	</div>
	<div class="containerdivNewLine" >
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Dysfunctional Equipment Indicator"><div class="floating-box-image"><img alt="" src="images/hs/Dysfunctional Equipment.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Dysfunctional Equipment Indicator</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Dysfunctional Operation Theatre Indicator"><div class="floating-box-image"><img alt="" src="images/hs/Dys-Functional OT.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Dysfunctional Operation Theatre Indicator</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Excess of Average Length of Stay"><div class="floating-box-image"><img alt="" src="images/hs/aver length of stay.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Excess of Average Length of Stay</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Fever Cases"><div class="floating-box-image"><img alt="" src="images/hs/Fever Disease.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Fever Cases</div></div></a>	
	</div>
	<div class="containerdivNewLine">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Hospital Death Rate"><div class="floating-box-image"><img alt="" src="images/hs/Hospital Death Rate.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Hospital Death Rate</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Infant Mortality Rate"><div class="floating-box-image"><img alt="" src="images/hs/Infant mortality.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Infant Mortality Rate</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Inpatients Treated"><div class="floating-box-image"><img alt="" src="images/hs/Inpatients treated.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Inpatients Treated</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Maternal Mortality Rate"><div class="floating-box-image"><img alt="" src="images/hs/Materal Mortality.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Maternal Mortality Rate</div></div></a>	
	</div>
	<div class="containerdivNewLine">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Non Availability of Drugs"><div class="floating-box-image"><img alt="" src="images/hs/Non Availability of drugs.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Non Availability of Drugs</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Number of Lab Tests done per 1000 patients"><div class="floating-box-image"><img alt="" src="images/hs/Lab Test.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Number of Lab Tests done per 1000 patients</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Operation Theatre Utilization / Underutilized Operation Theatres"><div class="floating-box-image"><img alt="" src="images/hs/Dys-Functional OT.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Operation Theatre Utilization / Underutilized Operation Theatres</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Outpatients Treated"><div class="floating-box-image"><img alt="" src="images/hs/Outpatient.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Outpatients Treated</div></div></a>	
	</div>
	<div class="containerdivNewLine">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Assisted Deliveries"><div class="floating-box-image"><img alt="" src="images/hs/Assisted Deliveries1.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of Assisted Deliveries</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Beds Vacant / Underutilized Bed Occupancy"><div class="floating-box-image"><img alt="" src="images/hs/Beds Vacant.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of Beds Vacant / Underutilized Bed Occupancy</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Cesarian Deliveries"><div class="floating-box-image"><img alt="" src="images/hs/cesarian Deliveries.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of Cesarian Deliveries</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Deaths among Accident and Emergency Cases"><div class="floating-box-image"><img alt="" src="images/hs/Accident Emergency.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of Deaths among Accident and Emergency Cases</div></div></a>	
	</div>
	<div class="containerdivNewLine">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of High Risk Pregnancies among ANCs registered"><div class="floating-box-image"><img alt="" src="images/hs/Highrisk pregnancy.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of High Risk Pregnancies among ANCs registered</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Neonatal Deaths among Live Births"><div class="floating-box-image"><img alt="" src="images/hs/Neonatal death.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of Neonatal Deaths among Live Births</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Percentage of Referral among inpatients treated"><div class="floating-box-image"><img alt="" src="images/hs/icon-referral.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Percentage of Referral among inpatients treated</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Short Supply of Drugs"><div class="floating-box-image"><img alt="" src="images/hs/Drugs Short supply.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Short Supply of Drugs</div></div></a>	
	</div>
	<div class="containerdivNewLine">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Staff Deficiency"><div class="floating-box-image"><img alt="" src="images/hs/Staff deficiency.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Staff Deficiency</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Surgical Load of Surgeons"><div class="floating-box-image"><img alt="" src="images/hs/Surgical load.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Surgical Load of Surgeons</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Swine Flu Cases"><div class="floating-box-image"><img alt="" src="images/hs/Swineflu.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Swine Flu Cases</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Deaths reported due to TB"><div class="floating-box-image"><img alt="" src="images/hs/TB Death.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Deaths reported due to TB</div></div></a>	
	</div >
	<div class="containerdivNewLine">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Infant Deaths"><div class="floating-box-image"><img alt="" src="images/hs/Infant Death.jpg" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Infant Deaths</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Maternal Deaths"><div class="floating-box-image"><img alt="" src="images/hs/Maternal death.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Maternal Deaths</div></div></a>
	    <a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Mothers referred out"><div class="floating-box-image"><img alt="" src="images/hs/Referred Out.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Mothers referred out</div></div></a>
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Neonatal Cases Referred out"><div class="floating-box-image"><img alt="" src="images/hs/NeoNatal Case Referral.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Neonatal Cases Referred out</div></div></a>	
	</div>
	<div class="containerdivNewLine" style="padding-bottom:15px;">
		<a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Organ Transplants done"><div class="floating-box-image"><img alt="" src="images/hs/organ transplant.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Organ Transplants done</div></div></a>
	    <a href="<%=request.getContextPath()%>/hsDashboard.do?indicatorName=Total Number of Vehicles Off-road"><div class="floating-box-image"><img alt="" src="images/hs/Vehicles off road.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Number of Vehicles Off-road</div></div></a>
	</div>
</div>
	<%-- <div>
		<table>
			<tr>
				<td>
						<a class="btn btn-default" href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Deliveries Conducted" role="button"><img alt="" src="images/hs/Deliveries conducted.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a class="btn btn-default" href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Deliveries Conducted" role="button">Deliveries Conducted</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Disease Outbreak Alert"><img alt="" src="images/hs/Outbreak.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Disease Outbreak Alert">Disease Outbreak Alert</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Dysfunctional Equipment Indicator"><img alt="" src="images/hs/Dysfunctional Equipment.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Dysfunctional Equipment Indicator">Dysfunctional Equipment Indicator</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Dysfunctional Operation Theatre Indicator"><img alt="" src="images/hs/Dys-Functional OT.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Dysfunctional Operation Theatre Indicator">Dysfunctional Operation Theatre Indicator</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Excess of Average Length of Stay"><img alt="" src="images/hs/aver length of stay.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Excess of Average Length of Stay">Excess of Average Length of Stay</a>
				</td>
				
			</tr>
			<tr>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Fever and Diseases"><img alt="" src="images/hs/Fever Disease.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Fever and Diseases">Fever and Diseases</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Fever Incidence"><img alt="" src="images/hs/Fever incidence.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Fever Incidence">Fever Incidence</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Hospital Death Rate"><img alt="" src="images/hs/Death Rate.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Hospital Death Rate">Hospital Death Rate</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Infant Mortality Rate"><img alt="" src="images/hs/Infant Death.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Infant Mortality Rate">Infant Mortality Rate</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Inpatients Treated"><img alt="" src="images/hs/Inpatient treated.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Inpatients Treated">Inpatients Treated</a>
				</td>
				
			</tr>
			<tr>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Maternal Mortality Rate"><img alt="" src="images/hs/Materal Mortality.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Maternal Mortality Rate">Maternal Mortality Rate</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Non Availability of Drugs"><img alt="" src="images/hs/Non Availability of drugs.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Non Availability of Drugs">Non Availability of Drugs</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Number of Lab Tests done per 1000 patients"><img alt="" src="images/hs/Lab Test.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Number of Lab Tests done per 1000 patients">Number of Lab Tests done per 1000 patients</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Operation Theatre Utilization / Underutilized Operation Theatres"><img alt="" src="images/hs/Dys-Functional OT.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Operation Theatre Utilization / Underutilized Operation Theatres">Operation Theatre Utilization / Underutilized Operation Theatres</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Outpatients Treated"><img alt="" src="images/hs/Outpatient.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Outpatients Treated">Outpatients Treated</a>
				</td>
				
			</tr>
			<tr>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Assisted Deliveries"><img alt="" src="images/hs/Assisted Deliveries1.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Assisted Deliveries">Percentage of Assisted Deliveries</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Beds Vacant / Underutilized Bed Occupancy"><img alt="" src="images/hs/Beds Vacant.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Beds Vacant / Underutilized Bed Occupancy">Percentage of Beds Vacant / Underutilized Bed Occupancy</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Cesarian Deliveries"><img alt="" src="images/hs/cesarian Deliveries.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Cesarian Deliveries">Percentage of Cesarian Deliveries</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Deaths among Accident and Emergency Cases"><img alt="" src="images/hs/Accident Emergency.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Deaths among Accident and Emergency Cases">Percentage of Deaths among Accident and Emergency Cases</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of High Risk Pregnancies among ANCs registered"><img alt="" src="images/hs/Highrisk pregnancy.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of High Risk Pregnancies among ANCs registered">Percentage of High Risk Pregnancies among ANCs registered</a>
				</td>
				
			</tr>
			<tr>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Neonatal Deaths among Live Births"><img alt="" src="images/hs/Neonatal death.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Neonatal Deaths among Live Births">Percentage of Neonatal Deaths among Live Births</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Referral among inpatients treated"><img alt="" src="images/hs/Referred Out.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Percentage of Referral among inpatients treated">Percentage of Referral among inpatients treated</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Short Supply of Drugs"><img alt="" src="images/hs/Drugs Short supply.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Short Supply of Drugs">Short Supply of Drugs</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Staff Deficiency"><img alt="" src="images/hs/Staff deficiency.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Staff Deficiency">Staff Deficiency</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Surgical Load of Surgeons"><img alt="" src="images/hs/Surgical load.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Surgical Load of Surgeons">Surgical Load of Surgeons</a>
				</td>
				
			</tr>			
			<tr>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Deaths reported due to TB"><img alt="" src="images/hs/TB Death.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Deaths reported due to TB">Total Number of Deaths reported due to TB</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Infant Deaths"><img alt="" src="images/hs/Infant Death.jpg" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Infant Deaths">Total Number of Infant Deaths</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Maternal Deaths"><img alt="" src="images/hs/Maternal death.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Maternal Deaths">Total Number of Maternal Deaths</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Mothers referred out"><img alt="" src="images/hs/Referred Out.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Mothers referred out">Total Number of Mothers referred out</a>
				</td>
				<td>
						<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Neonatal Cases Referred out"><img alt="" src="images/hs/NeoNatal Case Referral.png" width="50px;" height="50px;"></a>			
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/hsDashboardServlet?indicatorName=Total Number of Neonatal Cases Referred out">Total Number of Neonatal Cases Referred out</a>
				</td>
				
			</tr>
		</table>
	</div> --%>
</div>
</body>
</html>