<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<script src="jquery/jquery-1.11.1.min.js"></script>
		<link rel="stylesheet" href="css/HSAutocomplete.css">
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="jquery/ui/1.11.4/jquery-ui.js"></script> 		
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
		<script src="js/fusioncharts.js"></script>
		<script src="js/fusioncharts.charts.js"></script>
		<script src="js/fusioncharts.theme.fint.js"></script>
		<script src="js/fusioncharts.widgets.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>chat Bot</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<style>
body
{
background:url(images/bg.gif) repeat-x top #fff;
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
line-height:5px;
padding:5px 0 5px 0;
font-size:11px;
margin:0px;
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
#header{
width:877px;
height:62px;
margin:auto;
}
.logo{
padding:15px 0 0 70px;
}

/*---------------- menu tab----------------------*/
#menu_tab{
width:677px;
height:52px;
font-family:Arial, Helvetica, sans-serif;
padding:0px;
background:url(images/menu_bg.gif) no-repeat center;
}

ul.menu {
list-style-type:none; display:block; width:410px; 
 margin: auto; padding:0px; background:none;}

ul.menu li {
display:inline;
font-size:13px;
font-weight:bold;
line-height:52px;}

ul.menu li.divider {
display:block;
float:left;
width:1px;
height:52px;
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
height:auto;
}
#middle_banner{
width:651px;
height:55px;
margin:auto;
padding:20px 0 0 0;
background:url(images/aa.jpg) no-repeat center;
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
height:70px;
padding:10px 0 0 10px;
background-color: #E6E6E6;
}

#wide_content{
width:635px;
padding:10px 10px 0 20px;
}
.members_login{
width:410px;
height:150px;
padding:10px 0 0 10px;
background-color: #E6E6E6;
overflow: auto;
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
#rcorners {
    border-radius: 25px;
   /*  background: #73AD21; */
     border: 2px solid black;
    padding: 10px; 
    width: 390px;
    height: 0px;    
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
    		<div id="header" align="center" style="height:40px;font-size:18px;background-color:#78C0F0;border-bottom:1px solid black;">Knowledge based Diagnostics
    		</div>		
    
    <!-- 	<div id="middle_banner">
        	<div class="middle_banner_content">
       			<p>Knowledge based Diagnostics</p>
            </div>
            
        </div> -->
        
        
        <div id="left_content">
       <div id="basicDetails" style="overflow: auto; height: 340px;">
					<table>
						<tr>
							<td style="width:140px;padding: 4px; height: 10px;"><b>Member Id</b></td>
							<td style="width:180px;padding: 4px;">
								<input type="text" id="memberId">
							</td>
						</tr>
						<tr>
							<td style="width:140px;padding: 4px; height: 10px;"><b>Demography</b></td>
							<td style="width:180px;padding: 4px;">
								<select id="demography" name="demography">
										<option value='0'>--Select--</option>
									<c:forEach var="demography" items="${regionsList}">
										<option value='<c:out value="${demography}"/>'>${demography} </option>
									</c:forEach> 
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:140px;padding: 4px; height: 10px;"><b>Gender</b></td>
							<td style="width:180px;padding: 4px;">
								<input type="radio" id="gender" name="gender" value="Male" onchange="getSymptomsList();"/>Male
					            <input type="radio" id="gender" name="gender" value="Female" />Female
					            <!-- <input type="radio" name="gender" value="TG" />TG -->
					         </td>
					    </tr>
					    <tr>
							<td style="width:140px;padding: 4px; height: 10px;"><b>Age Range</b></td>
							<td style="width:180px;padding: 4px;">
								<select id="ageRange" name="ageRange" onchange="getSymptomsList();">
										<option value=''>--Select Age Range--</option>
									<c:forEach var="ageRange" items="${ageRangeList}">
										<option value='<c:out value="${ageRange}"/>'>${ageRange} </option>
									</c:forEach> 
								</select>
							</td>
							
						</tr>
					
					   
						    <tr>
							<td colspan="2" style="width:140px;padding: 4px;"><b>Enter the symptoms realized</b></td>
						</tr>
					</table>
					<table id="symptom_table" border="1" style="color:black;margin-left: 30px;">
					 	
						<tr>
				 			<td>
				 				<input  id="tb_1" type="text" style="width:200px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_1');">×</button> 
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_2" type="text" style="width: 200px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_2');">×</button>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_3" type="text" style="width: 200px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_3');">×</button>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_4" type="text" style="width: 200px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_4');">×</button>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_5" type="text" style="width: 200px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_5');">×</button>
				 			</td>
				 		</tr>					 		
					</table>
					<button style="width:30px;color: black;font-weight:bold;font-size: 20px;line-height: 16px; margin-left: 30px;" onclick="addRow();">+</button>
					
					<button style="width:130px;color: black;font-size: 10px;" onclick="showleftquestions();">click Next
					<i id="zoomIcon" class="fa fa-stethoscope" style="font-size:12px;padding-left: 10px;"></i></button>
					<!-- <button style="width:130px;color: black;font-size: 10px;" onclick="showCaseDetails();">Go for analysis
					<i id="zoomIcon" class="fa fa-stethoscope" style="font-size:12px;padding-left: 10px;"></i></button> -->
					
					
					
				</div>
         
        
        </div>
    
     <div id="right_content"> 
                 <p id="rcorners" style="font-size:14px;background-color:#78C0F0;">Detailed Analysis</p>
     
        	<div class="members_login">
            
            
           <div id="questionnaire" class="login_row">
              <!-- <label>1.do you have any medical history before?</label><br>
               <input type="text" id="order" size="50">
              <label>1.do you have before?</label><br> -->
            </div>
   
        </div></div>
        
         <div id="answers_content"> 
        	<div id="answer_response" class="answer_response">
           <!--  <h1>heading</h1>
            
           <div class="login_row">
              <label>1.do you have any medical history before?</label><br>
            </div>
         
          <form>
          
             <input type="radio" name="medicalHistory" value="yes" onclick="myFunction()">yes
            <input type="radio" name="medicalHistory" value="no" onclick="myFunction()">no<br>
              <br>
          </form> -->
  
        </div></div>
        
           
    <div id="footer"><img src="images/beensss.png"  width="28" height="23" alt="" title="" /> chat bot 2017
    
    </div>
    </div>

</div>

<!-- POP-UP -->   
<div id="createNewTable" class="createNewTable">
	<div class="createNewTable-content">
		<div class="createNewTable-header">
			<span class="createNewTable-reportClose">×</span>
				<label  id="createNewTablePopUpHeading" style="margin-top: 4px; margin-bottom:20px;">Enter the symptoms realized</label>
		</div>
		<div class="createNewTable-body">
        	<div id="firstSec" style="width:68%;border: 1px solid black;float:left;">
				<div id="topHeader" align="center" style="border-bottom:1px solid black;background-color: #008080;font-weight: bold;color:white;">Summary @Source</div>
        			<table id="popUpId" class="display table table-bordered" cellspacing="0" width="5%" style="font-size:11px;">
						<thead>
		    				<tr>
					    		<th class="center" >Sno</th>
					        	<th class="center" >Column Name</th>
					            <th class="center">Result</th>
		       				</tr>
		   				</thead>
		   				<tbody>
					   		 <tr><td>22</td>
							<td>sds</td>
							<td>vbvbv</td></tr>
						      
					</tbody>
		 		</table>   
			</div>
           
		</div>                             
	</div>
	
</div>

<div id="results" style="width:55%;height:632px;float:left;border:1px solid black;border-left: none;">
				<div id="header" align="center" style="height:40px;font-weight:bold;background-color:#78C0F0;border-bottom:1px solid black;">Analyzed Results</div>		
				<div> possible diagnoses for the symptoms you've entered</div>
								
				<div style="height:50px;">
					<div class="container" id="ScrollingTab">
				  	<br>
				  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner"  style="float:left;width:11%;">
						<img class="item active" id="scroll_image1" width="129" height="115" >
						<img class="item" id="scroll_image2" width="129" height="115" >
						<img class="item" id="scroll_image3" width="129" height="115" >
						<img class="item" id="scroll_image4" width="129" height="115" >
					</div>					
					
					<div style="float:left;width:46%;background: grey;">
						<div id="diagDiseaseName" align="center" style="color:white;font-weight: bold;"></div>
					</div>
					<marquee id="marqueeDiseaseDesc"  scrollAmount="5" onmouseover="stop();"  onmouseout="start();" style="float:left;height:25px;width:46%;position:relative;margin-top:10px;border: 1px solid black;padding-top:2px;font-size:10px;color:black;background:-webkit-linear-gradient(#ffe6e6,#ffb3b3);"></marquee>
					<div align="right" style="float:left;width:46%;margin-top:10px;">Other possible diagnosis
						<!-- <i class="fa fa-caret-down" style="color:black;font-size:15px;padding-left: 10px;margin-right:20px;margin-top:10px;"></i> -->
							<select id="OtherDiagDiseaseList" style="width:170px;margin-right:40px;">
						<!-- <option value=''>--Select Disease--</option> -->		 
							</select> 
					</div>
					
				</div>
				</div></div>
				<div id="tabs-container">
                         <ul class="tabs-menu">
                         	 <li class="current"><a href="#tabReadmit">Re-admission</a></li>
                             <li><a href="#tabHist">History</a></li>
                             <li><a href="#tab-1">Symptoms</a></li>
                             <li><a href="#tab-2">Causes</a></li>
                             <li><a href="#tab-3">Treatment</a></li>
                             <li><a href="#tab-4">Prevention</a></li>
                         </ul>
                         <div class="tab">
                         	 <div id="tabReadmit" class="tab-content">
                                   <input type="hidden" onChange="'reAdmission';" /><br/>
                                   <!-- <img id="reAdmission" src="images/Heart_Attack_Symptom.jpg" width="600" height="350" /> -->
                                   <div id="reAdmission">
                                   	<div style="float:left;">Re-admission Score</div>
                                   	  <div id="reAdmissionScore"></div>
                                   </div>
                             </div>
                             <div id="tabHist" class="tab-content">
                                   <input type="hidden" onChange="'history';" /><br/>
                                   <!-- <img id="history" src="images/Heart_Attack_Symptom.jpg" width="600" height="350" /> -->
                             </div>
                             <div id="tab-1" class="tab-content">
                                   <input type="hidden" onChange="'symptom';" /><br/>
                                   <img id="symptom" src="images/Heart_Attack_Symptom.jpg" width="600" height="350" />
                             </div>
                             <div id="tab-2" class="tab-content">
                                 <input type="hidden" onChange="'cause';" /><br/>
                                   <img id="cause" src="images/Heart_Attack_Cause.jpg" width="600" height="350" />
                             </div>
                             <div id="tab-3" class="tab-content">
                                   <input type="hidden" onChange="'treatment';" /><br/>
                                   <img id="treatment" src="images/Heart_Attack_Treatment.jpg" width="600" height="350" />
                             </div>
                             <div id="tab-4" class="tab-content">
                                 <input type="hidden" onChange="'prevention';" /><br/>
                                   <img id="prevention" src="images/Heart_Attack_Prevention.jpg" width="600" height="350" />
                             </div>
                         </div>
                     </div>
				
			</div>

<script>



function myFunction() {
	
    var medicalHistory ="yes";
   
    var txt = "";
    var i;
    for (i = 0; i < medicalHistory.length; i++) {
        if (medicalHistory[i].checked) {
            txt = txt + medicalHistory[i].value + " ";
        }
    }
    document.getElementById("order").value = "You entered: " + txt;
}	
			var intTextBox = 5;
			var symptomAutoCompleteList = ${symptomList};
			
			  $(document).ready(function() {
                  $(".tabs-menu a").click(function(event) {
                      event.preventDefault();
                      $(this).parent().addClass("current");
                      $(this).parent().siblings().removeClass("current");
                      var tab = $(this).attr("href");
                      $(".tab-content").not(tab).css("display", "none");
                      $(tab).fadeIn();
                  });
              });

			
			
			
			  function showCaseDetails(){
				  alert("Sdsd");
					var createNewTable = document.getElementById('createNewTable');				
					createNewTable.style.display = "block";		
					  

			}
			
			  $(document).ready(function() {
		
			  createNewTable.style.display = "none";
			  $('.createNewTable-reportClose').click(function() {
			 	
			 		
			 		createNewTable.style.display = "none";
			 		
			 		$("#createNewTablePopTbody").empty();
			 	});		
			   });
			
			
		
		</script>
		
		<script>
			var intTextBox = 5;
			var symptomAutoCompleteList = ${symptomList};
			
			  $(document).ready(function() {
                  $(".tabs-menu a").click(function(event) {
                      event.preventDefault();
                      $(this).parent().addClass("current");
                      $(this).parent().siblings().removeClass("current");
                      var tab = $(this).attr("href");
                      $(".tab-content").not(tab).css("display", "none");
                      $(tab).fadeIn();
                  });
              });

			
			function bodyOnLoad(){
				document.getElementById("results").style.display="none"; 
				/* document.getElementById("reAdmissionScore").innerText = ; */
			}
			
			$("#tb_1,#tb_2,#tb_3,#tb_4,#tb_5").autocomplete({
        		source: function(request, response) {
        	           var results = $.ui.autocomplete.filter(symptomAutoCompleteList, request.term);
        			   response(results.slice(0, 10));
        	       }
        	});
			
			function resetRow(rowId)
			{
				document.getElementById(rowId).value="";
			}
			
			function addRow(){
				intTextBox++;
				var td_id = 'tb_' + intTextBox;
			    var objNewDiv = document.createElement('tr');
			    objNewDiv.innerHTML = '<td><input type="text" id="tb_' + intTextBox + '" name="tb_' + intTextBox + '" style="width: 200px;background-color: #ecf2f8;"/><button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow(\''+td_id+'\');">×</button></td>' ;
			    document.getElementById('symptom_table').appendChild(objNewDiv);
			    
			    $("#tb_" + intTextBox).autocomplete({
	        		source: function(request, response) {
	        	           var results = $.ui.autocomplete.filter(symptomAutoCompleteList, request.term);
	        			   response(results.slice(0, 10));
	        	       }
	        	});
			}
			
		function showleftquestions(){
		
			var memberId=document.getElementById('memberId').value;
			
			if(memberId === null || memberId === ""){
				alert("please Enter The MemberId");
				return false;
			}
			 var demographyVal=demography.options[demography.selectedIndex].text;
			 if(demographyVal == "--Select--"){
					alert("Please Select the Demography")
					return false;
			 	} 
			 
			 var ageRangeVal=ageRange.options[ageRange.selectedIndex].text;
			 if(ageRangeVal == "--Select Age Range--"){
					alert("Please Select the Age Range")
					return false;
			 	} 
			 
			 
			 var radios = document.getElementsByName("gender");
			    var formValid = false;

			    var i = 0;
			    while (!formValid && i < radios.length) {
			        if (radios[i].checked) formValid = true;
			        i++;        
			    }

			    if (!formValid){ 
			    	alert("Please Select the Gender");
			    return formValid;
			    }
		
				
			
			    $('#answer_response').empty();
			document.getElementById("questionnaire").innerText = "1.do you have any medical history before?";
			$('#answer_response').append("<input type=radio name=medicalHistory value=yes onclick=radioBtnClicked();>Yes");
			$('#answer_response').append("<input type=radio name=medicalHistory value=no onclick=radioBtnClicked();>no");
		}
		
		function radioBtnClicked(){
			var medicalHistory = document.getElementsByName('medicalHistory');
			var i;
			var checkedRadioBtn;
		    for (i = 0; i < medicalHistory.length; i++) {
		        if (medicalHistory[i].checked) {
		        	checkedRadioBtn = medicalHistory[i].value ;
		        }
		    }
		    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
		    $('#answer_response').empty();
		    
		    if(checkedRadioBtn=="yes"){
		    	$('#questionnaire').append("<br><label>2.Enter Admission Id</label>");
		    	$('#answer_response').append("<input type=text; onkeypress=EnterEvent(event,this);> ");
		    	
		    }
		    else if(checkedRadioBtn=="no"){
		    	$('#questionnaire').append("<br><label><button onclick=getResults();>Submit</button></label>");
		    }
		}
		
		function EnterEvent(e,textfieldVal) {
	        if (e.keyCode == 13) {
		            $('#questionnaire').append("<br><label>"+textfieldVal.value+"</label>"); 
		            $('#answer_response').empty();
		            $('#questionnaire').append("<br><label>3.Enter Subject Id</label>");
		            $('#answer_response').append("<input type=textarea; onkeypress=EnterEventPN(event,this);> ");
		            
		     /*        $('#questionnaire').append("<br><label>3.Enter Progress Notes</label>");
		            $('#answer_response').append("<input type=textarea; onkeypress=EnterEventTA(event,this);> "); */
		            return false; // prevent the button click from happening
		        }
		}
		
		function EnterEventPN(e,textfieldVal) {
	        if (e.keyCode == 13) {
		            $('#questionnaire').append("<br><label>"+textfieldVal.value+"</label>"); 
		            $('#answer_response').empty();
		            $('#questionnaire').append("<br><label>4.Enter Progress Notes</label>");
		            $('#answer_response').append("<input type=textarea; onkeypress=EnterEventTA(event,this);>");
		            
		     /*        $('#questionnaire').append("<br><label>3.Enter Progress Notes</label>");
		            $('#answer_response').append("<input type=textarea; onkeypress=EnterEventTA(event,this);> "); */
		            return false; // prevent the button click from happening
		        }
		}
		
		function EnterEventTA(e,textfieldVal) {
	        if (e.keyCode == 13) {
		            $('#questionnaire').append("<br><label>"+textfieldVal.value+"</label>"); 
		            $('#answer_response').empty();
		            $('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
		            $('#answer_response').append("<br><label><button onclick=getExtraResults();>another questions</button></label>");
		            return false; // prevent the button click from happening
		        }
		}
		
	function getExtraResults(){
		 
          $('#answer_response').empty();
          $('#questionnaire').append("<br><label>5.Do you feel severe chest pain (tightness, heaviness, pain or a burning feeling in your chest)?</label>");
          $('#answer_response').append("<input type=radio name=severeChestPain value=yes onclick=radioBtnseClicked();>Yes");
			$('#answer_response').append("<input type=radio name=severeChestPain value=no onclick=radioBtnseClicked();>no");
		
	}
	function radioBtnseClicked(){
		var severeChestPain = document.getElementsByName('severeChestPain');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < severeChestPain.length; i++) {
	        if (severeChestPain[i].checked) {
	        	checkedRadioBtn = severeChestPain[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>6.Do you feel pain in arms, neck, jaw, back or stomach?</label>");
	    	 $('#answer_response').append("<input type=radio name=severeArmsPain value=yes onclick=armsPainClicked();>Yes");
				$('#answer_response').append("<input type=radio name=severeArmsPain value=no onclick=armsPainClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	function armsPainClicked(){
		var severeArmsPain = document.getElementsByName('severeArmsPain');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < severeArmsPain.length; i++) {
	        if (severeArmsPain[i].checked) {
	        	checkedRadioBtn = severeArmsPain[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>7.Do you feel excessive sweating?</label>");
	    	 $('#answer_response').append("<input type=radio name=sweating value=yes onclick=sweatingClicked();>Yes");
				$('#answer_response').append("<input type=radio name=sweating value=no onclick=sweatingClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	function sweatingClicked(){
		var sweating = document.getElementsByName('sweating');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < sweating.length; i++) {
	        if (sweating[i].checked) {
	        	checkedRadioBtn = sweating[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>8.Do you feel nauseous or vomiting?</label>");
	    	 $('#answer_response').append("<input type=radio name=vomiting value=yes onclick=vomitingClicked();>Yes");
				$('#answer_response').append("<input type=radio name=vomiting value=no onclick=vomitingClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	function vomitingClicked(){
		var vomiting = document.getElementsByName('vomiting');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < vomiting.length; i++) {
	        if (vomiting[i].checked) {
	        	checkedRadioBtn = vomiting[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>9.Do you feel light-headed?</label>");
	    	 $('#answer_response').append("<input type=radio name=lightHeaded value=yes onclick=lightHeadClicked();>Yes");
				$('#answer_response').append("<input type=radio name=lightHeaded value=no onclick=lightHeadClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	function lightHeadClicked(){
		var lightHeaded = document.getElementsByName('lightHeaded');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < lightHeaded.length; i++) {
	        if (lightHeaded[i].checked) {
	        	checkedRadioBtn = lightHeaded[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>10.Do you have High blood pressure?</label>");
	    	 $('#answer_response').append("<input type=radio name=bp value=yes onclick=bPClicked();>Yes");
				$('#answer_response').append("<input type=radio name=bp value=no onclick=bPClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	function bPClicked(){
		var bp = document.getElementsByName('bp');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < bp.length; i++) {
	        if (bp[i].checked) {
	        	checkedRadioBtn = bp[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>11.Do you have High blood cholesterol?</label>");
	    	 $('#answer_response').append("<input type=radio name=cholesterol value=yes onclick=cholesterolClicked();>Yes");
				$('#answer_response').append("<input type=radio name=cholesterol value=no onclick=cholesterolClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	function cholesterolClicked(){
		var cholesterol = document.getElementsByName('cholesterol');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < cholesterol.length; i++) {
	        if (cholesterol[i].checked) {
	        	checkedRadioBtn = cholesterol[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#questionnaire').append("<br><label>11.Do you have High blood sugar due to insulin resistance or diabetes?</label>");
	    	 $('#answer_response').append("<input type=radio name=diabetes value=yes onclick=diabetesClicked();>Yes");
				$('#answer_response').append("<input type=radio name=diabetes value=no onclick=diabetesClicked();>no");
	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	
	
	function diabetesClicked(){
		var diabetes = document.getElementsByName('diabetes');
		var i;
		var checkedRadioBtn;
	    for (i = 0; i < diabetes.length; i++) {
	        if (diabetes[i].checked) {
	        	checkedRadioBtn = diabetes[i].value ;
	        }
	    }
	    $('#questionnaire').append("<br><label>"+checkedRadioBtn+"</label>");
	    $('#answer_response').empty();
	    
	    if(checkedRadioBtn=="yes"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");

	    	
	    }
	    else if(checkedRadioBtn=="no"){
	    	$('#answer_response').append("<br><label><button onclick=getResults();>Submit</button></label>");
	    }
	}
	
	
		function getResults(){
			var medicalHistory = document.getElementsByName('medicalHistory');
			var i;
			var checkedRadioBtn;
		    for (i = 0; i < medicalHistory.length; i++) {
		        if (medicalHistory[i].checked) {
		        	checkedRadioBtn = medicalHistory[i].value ;
		        }
		    }
			alert(checkedRadioBtn);
			
			var memberId=document.getElementById('memberId').value;
			 var demographyVal=demography.options[demography.selectedIndex].text;
			 var ageRangeVal=ageRange.options[ageRange.selectedIndex].text;
			  var gender = document.getElementById("gender").value;
			// var radios = document.getElementsByName("gender").value;
			
			var contextPath='<%=request.getContextPath()%>';
			var symptoms = "headaches,chest pain,shortness of breath,diarrhoea";
			document.location.href=contextPath+'/chatbotGetResultsforResult.do?symptoms='+symptoms+'&memberId='+memberId+'&demographyVal='+demographyVal+'&ageRangeVal='+ageRangeVal+'&gender='+gender; 
			}

			<%-- <% String requestURL=request.getRequestURL().toString();
					String contextPath=request.getContextPath();
					int urlIndex = requestURL.lastIndexOf(contextPath);
					String hostName=requestURL.substring(0,urlIndex);
					String webUrl =hostName+contextPath+"/";
				%>
				var webUrl='<%=webUrl%>';
				var contextPath='<%=contextPath%>';
				var hostName='<%=hostName%>';  --%>


			
		</script>
</body>
</html>