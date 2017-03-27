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
		
		<style>
			.carousel-inner > .item > img,
			  .carousel-inner > .item > a > img {
			      width: 10%;
			      height:2%;
			      margin-left: 150px;
			  }
			.carousel-indicators {
			    bottom: -5px;
			    
			}
			
			#menu ul li.selected {
                background: #910000;
                color:#FFFFFF;
            }
            #menu ul {
                margin: 0;
                padding: 25px 0 0 20px;
                list-style: none;
                line-height: normal;
            }
            #menu li {
                display: block;
                float: left;
                background: black;
            }
            #menu a {
                display: block;
                float: left;
                margin-right: 17px;
                padding: 5px 8px;
                text-decoration: none;
                font: 20px Georgia, "Times New Roman", Times, serif;
                color: #FFFFFF;
            }
            #menu a:hover {
                text-decoration: underline;
                background: #910000;
                color:#FFFFFF;
            }
            #menu a:active {
                background: #910000;
                color:black;
            }
            .body {
                   padding: 20px;
                   font-family: Arial, Helvetica, sans-serif;
                   line-height: 1.5;
                   font-size: 14px;        
                   }
                   
            .tabs-menu {
                height: 30px;
                float: left;
                clear: both;
            }
            
            .tabs-menu li {
                height: 30px;
                line-height: 30px;
                float: left;
                margin-right: 10px;
                background-color: #ccc;
                border-top: 1px solid #d4d4d1;
                border-right: 1px solid #d4d4d1;
                border-left: 1px solid #d4d4d1;
            }
            
            .tabs-menu li.current {
                position: relative;
                background-color: #fff;
                border-bottom: 1px solid #fff;
                z-index: 5;
            }
            
            .tabs-menu li a {
                padding: 10px;
                text-transform: uppercase;
                color: #fff;
                text-decoration: none; 
            }
            
            .tabs-menu .current a {
                color: #2e7da3;
            }
            
            .tab {
                border: 1px solid #d4d4d1;
                background-color: #fff;
                /* float: left; */
                margin-bottom: 20px;
                width: auto;
            }
            
            .tab-content {
                width: 660px;
                padding: 20px;
                display: none;
            }
            
            #tabReadmit {
            display: block;   
            }
            
            #reAdmission {
			  position: relative;
			  background-color: #09f;
			  margin: 120px auto;
			  width: 200px;
			  height: 200px;
			  border-radius: 200px;
			}
			#reAdmissionScore {
			  position: absolute;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  color: #fff;
			  font-weight: bold;
			}
			
		</style>
	</head>
	
	<body onload="bodyOnLoad();">
		<div style="width:100%;">
			<div style="width:40%;float:left">
				<div id="header" align="center" style="height:40px;font-weight:bold;background-color:#78C0F0;border:1px solid black;">Knowledge based Diagnostics
				</div>
				<div id="basicDetails" style="height:590px;border:1px solid black;overflow: auto;">
					<table>
						<tr>
							<td style="width:140px;padding: 4px;"><b>Member Id</b></td>
							<td style="width:180px;padding: 4px;">
								<input type="text" id="memberId">
							</td>
						</tr>
						<tr>
							<td style="width:140px;padding: 4px;"><b>Demography</b></td>
							<td style="width:180px;padding: 4px;">
								<select id="demography" name="demography">
										<option value=''>--Select Region--</option>
									<c:forEach var="demography" items="${regionsList}">
										<option value='<c:out value="${demography}"/>'>${demography} </option>
									</c:forEach> 
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:140px;padding: 4px;"><b>Gender</b></td>
							<td style="width:180px;padding: 4px;">
								<input type="radio" name="gender" value="Male" onchange="getSymptomsList();"/>Male
					            <input type="radio" name="gender" value="Female" />Female
					            <!-- <input type="radio" name="gender" value="TG" />TG -->
					         </td>
					    </tr>
					    <tr>
							<td style="width:140px;padding: 4px;"><b>Age Range</b></td>
							<td style="width:180px;padding: 4px;">
								<select id="ageRange" name="ageRange" onchange="getSymptomsList();">
										<option value=''>--Select Age Range--</option>
									<c:forEach var="ageRange" items="${ageRangeList}">
										<option value='<c:out value="${ageRange}"/>'>${ageRange} </option>
									</c:forEach> 
								</select>
							</td>
						</tr>
						<!-- <tr>
							<td style="width:140px;padding: 4px;"><b>Marital Status</b></td>
							<td style="width:180px;padding: 4px;">
								<input type="radio" name="marital" value="Married" />Married
					            <input type="radio" name="marital" value="Unmarried" />Unmarried
					    	</td>
					    </tr> -->
					    <tr>
							<td colspan="2" style="width:140px;padding: 4px;"><b>Enter the symptoms realized</b></td>
						</tr>
					</table>
					<table id="symptom_table" border="1" style="color:black;">
					 	
						<tr>
				 			<td>
				 				<input  id="tb_1" type="text" style="width:290px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_1');">×</button> 
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_2" type="text" style="width: 290px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_2');">×</button>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_3" type="text" style="width: 290px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_3');">×</button>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_4" type="text" style="width: 290px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_4');">×</button>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
				 				<input id="tb_5" type="text" style="width: 290px;background-color: #ecf2f8;">
				 				<button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow('tb_5');">×</button>
				 			</td>
				 		</tr>					 		
					</table>
					<button style="width:30px;color: black;font-weight:bold;font-size: 20px;line-height: 16px;" onclick="addRow();">+</button>
					<button style="width:130px;color: black;font-size: 10px;" onclick="getResults();">Go for analysis
					<i id="zoomIcon" class="fa fa-stethoscope" style="font-size:12px;padding-left: 10px;"></i></button>
					
					<div id="questionnaire"></div>
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
			<!-- <select id="OtherDiagDiseaseList" style="width:140px;">
						<option value=''>--Select Disease--</option>		 
							</select> -->
		</div>
		
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
			    objNewDiv.innerHTML = '<td><input type="text" id="tb_' + intTextBox + '" name="tb_' + intTextBox + '" style="width: 290px;background-color: #ecf2f8;"/><button style="width:22px;color: red;float: right;font-size: 20px;line-height: 16px;" onclick="resetRow(\''+td_id+'\');">×</button></td>' ;
			    document.getElementById('symptom_table').appendChild(objNewDiv);
			    
			    $("#tb_" + intTextBox).autocomplete({
	        		source: function(request, response) {
	        	           var results = $.ui.autocomplete.filter(symptomAutoCompleteList, request.term);
	        			   response(results.slice(0, 10));
	        	       }
	        	});
			}
			
			function getResults(){
				var symptoms;
				for(var i=1;i<intTextBox;i++){
					var rowSymptom = document.getElementById('tb_'+i).value;
					if(rowSymptom!=""){
						if (typeof symptoms != 'undefined'){
							symptoms = symptoms +","+ rowSymptom;
						}
						else{
							symptoms = rowSymptom;
						}
					}					
				}
				$.ajax({
					type:"POST",
					url:'chatbotGetResults.do',
					'data':{
						symptoms:symptoms
					},
					success: function(result){
						var jsonData = JSON.parse(result);
						document.getElementById("results").style.display="inline";
						
						var diseaseList = jsonData.diseaseList;
						var diseaseName = jsonData.diseaseName;
						var diseaseDesc = jsonData.diseaseDesc;
						var readmissionScore = jsonData.readmissionScore;
						
						document.getElementById("reAdmissionScore").innerText = readmissionScore; 
												
						document.getElementById("scroll_image1").src = "images/ha.jpg";
						document.getElementById("scroll_image2").src = "images/ha_2.jpg";
						document.getElementById("scroll_image3").src = "images/ha_3.jpg";
						document.getElementById("scroll_image4").src = "images/ha_4.jpg";
						document.getElementById("diagDiseaseName").innerHTML=diseaseName;
						document.getElementById("marqueeDiseaseDesc").innerText = diseaseDesc;
						
			               $.each(diseaseList, function(k, v) {
			            	   /* ('#OtherDiagDiseaseList').find('option').remove(); */   
			            	    $('<option>').val(v).text(v).appendTo('#OtherDiagDiseaseList');
			            	});
					    
					 },
					 error: function (xhr, status, error) {
			                alert("Internal Error Occured-Please Contact System Administrator");
					 }});
			}
			
			/* FusionCharts.ready(function () {
			    var cSatScoreChart = new FusionCharts({
			        type: 'angulargauge',
			        renderAt: 'reAdmission',
			        width: '600',
			        height: '350',
			        dataFormat: 'json',
			        dataSource: {
			            "chart": {
			                "caption": "Customer Satisfaction Score",
			                "subcaption": "Last week",
			                "lowerLimit": "0",
			                "upperLimit": "100",
			                "gaugeFillMix": "{dark-30},{light-60},{dark-10}",
			                "gaugeFillRatio": "15",
			                "theme": "fint"
			            },
			            "colorRange": {
			                "color": [
			                    {
			                        "minValue": "0",
			                        "maxValue": "50",
			                        "code": "#e44a00"
			                    },
			                    {
			                        "minValue": "50",
			                        "maxValue": "75",
			                        "code": "#f8bd19"
			                    },
			                    {
			                        "minValue": "75",
			                        "maxValue": "100",
			                        "code": "#6baa01"
			                    }
			                ]
			            },
			            "dials": {
			                "dial": [{
			                    "value": "67"
			                }]
			            }
			        }
			    }).render();
			}); */
			
			/* function getSymptomsList(){
				
			} */
		</script>
	</body>
</html>