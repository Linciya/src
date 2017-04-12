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
	padding-left: 100px;
	padding-right: 100px;	
}	 
div#tes{
	padding-left: 100px;
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
    width: 110px;
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
.space {
    float: left;
    width: 110px;
    height: 78px;
    border: 1px solid white; 
   /*  background-image: url("pic_mountain.jpg");
    background-size: 100px 100px; */
   /*  border-top-left-radius: 1em;
    border-bottom-left-radius: 1em; */
    margin-left: 25px;
    margin-top: 25px;
   
}
.floating-box-text,.inside {
    float: left;
	display: table-cell;
    text-align: center;
    width: 110px;
    /*background: #e6f3ff; */
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
<div id="directorateNameHeader"></div> 
<div id="test">
<fieldset>
<legend style="color:blue;font-weight: bold;">108 Dash Board Indicators</legend>
	<div>
		<a href="<%=request.getContextPath()%>/108GPSStatus.do"><div class="floating-box-image" ><img alt="" src="images/108/GPS track.png" width="80px;" height="70px;" style="margin-left:13px;margin-top:5px;"></div>
		<div class="floating-box-text"><div class="inside">GPS Status</div></div></a>
		<a href="<%=request.getContextPath()%>/totalCaseAvailed.do"><div class="floating-box-image"><img alt="" src="images/108/Total Cases Availed small.JPG" width="100px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Cases Availed</div></div></a>
		<a href="<%=request.getContextPath()%>/108TotalTrips.do"><div class="floating-box-image"><img alt="" src="images/108/Round Trip.png" width="100px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Total Trips</div></div></a>
		<!--<a href="#"><div class="floating-box-image"><img alt="" src="images/108/Hot Spot Alert.png" width="80px;" height="78px;"></div>
		 <div class="floating-box-text"><div class="inside">Hot Spot Alert</div></div></a> -->
	</div>
		<!-- <div>
		<a href="#"><div class="floating-box-image"><img alt="" src="images/108/Vehicles @ base.png" width="90px;" height="78px;" style="margin-left:10px;"></div>
		<div class="floating-box-text"><div class="inside">Ambulance @Base Location</div></div></a>
		<a href="#"><div class="floating-box-image"><img alt="" src="images/108/Ambulance_on_case.png" width="120px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Ambulance on Case</div></div></a>
		<a href="#"><div class="floating-box-image"><img alt="" src="images/108/Hot Spot.png" width="80px;" height="78px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Ambulance @ Hot Spot</div></div></a>
		<a href="#"><div class="floating-box-image"><img alt="" src="images/108/Vehicles Down.png" width="80px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Vehicles Down</div></div></a>
	</div> -->
	<div>
		<!-- <a href="#"><div class="floating-box-image"><img alt="" src="images/108/idle time.jpg" width="90px;" height="78px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Idle Time</div></div></a> -->
		<a href="<%=request.getContextPath()%>/108cycleTime.do"><div class="floating-box-image"><img alt="" src="images/108/Cycle Time.jpg" width="90px;" height="78px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Cycle Time</div></div></a>
		
		<a href="<%=request.getContextPath()%>/kilometersCovered.do"><div class="floating-box-image"><img alt="" src="images/108/kilometers.jpg" width="110px;" height="78px;" style="margin-left:1px;"></div>
		<div class="floating-box-text"><div class="inside">Kilometers Covered</div></div></a> 
		<a href="<%=request.getContextPath()%>/ambulanceReport.do"><div class="floating-box-image"><img alt="" src="images/108/360-view.jpg" width="110px;" height="78px;" style="margin-left:1px;"></div>
		<div class="floating-box-text"><div class="inside">360 View</div></div></a>
	</div>

</fieldset>
</div>
</div>
<div>
<div id="tes">
<fieldset>
<legend style="color:blue;font-weight: bold;">108 Dash Board Emergency Types</legend>
		<div >
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Trauma (Vehicular)"><div class="floating-box-image"><img alt="" src="images/108/Trauma Emergency.jpg" width="90px;" height="78px; " style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Trauma Emergency</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Pregnancy related"><div class="floating-box-image"><img alt="" src="images/108/Pregnancy.png" width="80px;" height="78px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Pregnancy</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Fire/Burns"><div class="floating-box-image"><img alt="" src="images/108/Fire Burn.png" width="90px;" height="78px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Fire Burn</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Neonatal(upto 1 month)"><div class="floating-box-image"><img alt="" src="images/108/Neonatal.png" width="80px;" height="78px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Neonatal</div></div></a>
	</div>

		<div>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Accidental Poisoning"><div class="floating-box-image"><img alt="" src="images/108/poison.jpg" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Poison</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Allergic Reactions"><div class="floating-box-image"><img alt="" src="images/108/allergy alert.jpg" width="90px;" height="70px;" style="margin-left:12px;"></div>
		<div class="floating-box-text"><div class="inside">Allergy Alert</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Disasters due to Natural elements"><div class="floating-box-image"><img alt="" src="images/108/Natural Disaster.jpg" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Natural Disaster</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Animal Attack"><div class="floating-box-image"><img alt="" src="images/108/Animal bite.png" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Animal Bite</div></div></a>
	
	</div>
	<div>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Epilepsy"><div class="floating-box-image"><img alt="" src="images/108/Epilepsy.jpg" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Epilepsy</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Paediatric(1-12years)"><div class="floating-box-image"><img alt="" src="images/108/Paediatric-Emergencies.png" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Paediatric-Emergencies</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Diabetes"><div class="floating-box-image"><img alt="" src="images/108/Diabetes.JPG" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Diabetes</div></div></a>
		<a href="<%=request.getContextPath()%>/108EmergencyType.do?emergencyType=Fevers / Infections"><div class="floating-box-image"><img alt="" src="images/108/Fever.png" width="110px;" height="78px;"></div>
		<div class="floating-box-text"><div class="inside">Fever</div></div></a>


</div>
</fieldset>
</div>
</div>
</body>
</html>