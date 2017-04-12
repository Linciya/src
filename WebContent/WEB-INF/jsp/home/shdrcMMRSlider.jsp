<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.UserInfo"%>
<html>
<head>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
 


  
  <!-- These styles are only used for this page, not required for the slider -->
  <style>
  body { font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; }
  [class^=slider] { display: margin-bottom: 30px; } 
  .output { color: black; font-size: 12px; padding-top: 0px; margin-left: 300px; vertical-align: top;
  border:1px solid #c0c0c0;
	border-radius:3px;}
  h1 { font-size: 10px; }
  h2 { clear: both; margin: 0; margin-bottom: 2px; font-size: 12px; }
  p { font-size: 12px; margin-bottom: 13px;padding: 1px; padding-bottom: 1px;}
  h2:first-of-type { margin-top: 0; }
  label{padding-top: 0px;
  padding: 1px;
  padding-bottom: 1px;
  }
  
 

  td:nth-of-type(1) {

   padding-right: 75px;
}

  
  
  
  .slider-volume {
  width: 300px;
  margin-left: 1cm;
}

.slider-volume > .dragger {
	width: 16px;
	height: 16px;
	margin: 0 auto;
  border: 1px solid rgba(255,255,255,0.6);

  -moz-box-shadow: 0 0px 2px 1px rgba(0,0,0,0.5), 0 2px 5px 2px rgba(0,0,0,0.2);
  -webkit-box-shadow: 0 0px 2px 1px rgba(0,0,0,0.5), 0 2px 5px 2px rgba(0,0,0,0.2);
  box-shadow: 0 0px 2px 1px rgba(0,0,0,0.5), 0 2px 5px 2px rgba(0,0,0,0.2);

	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;

  background: #c5c5c5;
  background: -moz-linear-gradient(90deg, rgba(180,180,180,1) 20%, rgba(230,230,230,1) 50%, rgba(180,180,180,1) 80%);
	background:	-webkit-radial-gradient(  50%   0%,  12% 50%, hsla(0,0%,100%,1) 0%, hsla(0,0%,100%,0) 100%),
  	          -webkit-radial-gradient(  50% 100%, 12% 50%, hsla(0,0%,100%,.6) 0%, hsla(0,0%,100%,0) 100%),
              -webkit-radial-gradient(	50% 50%, 200% 50%, hsla(0,0%,90%,1) 5%, hsla(0,0%,85%,1) 30%, hsla(0,0%,60%,1) 100%);
margin-left: 1cm;


}

.slider-volume > .track, .slider-volume > .highlight-track {
  height: 11px;

  background: #787878;
  background: -moz-linear-gradient(top, #787878, #a2a2a2);
  background: -webkit-linear-gradient(top, #787878, #a2a2a2);
  background: linear-gradient(top, #787878, #a2a2a2);

  -moz-box-shadow: inset 0 2px 5px 1px rgba(0,0,0,0.15), 0 1px 0px 0px rgba(230,230,230,0.9), inset 0 0 1px 1px rgba(0,0,0,0.2);
  -webkit-box-shadow: inset 0 2px 5px 1px rgba(0,0,0,0.15), 0 1px 0px 0px rgba(230,230,230,0.9), inset 0 0 1px 1px rgba(0,0,0,0.2);
  box-shadow: inset 0 2px 5px 1px rgba(0,0,0,0.15), 0 1px 0px 0px rgba(230,230,230,0.9), inset 0 0 1px 1px rgba(0,0,0,0.2);

  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  margin-left: 1cm;
}

.slider-volume > .highlight-track {
  background-color: #c5c5c5;
  background: -moz-linear-gradient(top, #c5c5c5, #a2a2a2);
  background: -webkit-linear-gradient(top, #c5c5c5, #a2a2a2);
  background: linear-gradient(top, #c5c5c5, #a2a2a2);
  margin-left: 1cm;
}
  div.dragger.dragging{
  margin-left: 2cm;
  }
  .slider {
  width: 300px;
  margin-left: 1cm;
}

.slider > .dragger {
  background: #8DCA09;
  background: -webkit-linear-gradient(top, #8DCA09, #72A307);
  background: -moz-linear-gradient(top, #8DCA09, #72A307);
  background: linear-gradient(top, #8DCA09, #72A307);

  -webkit-box-shadow: inset 0 2px 2px rgba(255,255,255,0.5), 0 2px 8px rgba(0,0,0,0.2);
  -moz-box-shadow: inset 0 2px 2px rgba(255,255,255,0.5), 0 2px 8px rgba(0,0,0,0.2);
  box-shadow: inset 0 2px 2px rgba(255,255,255,0.5), 0 2px 8px rgba(0,0,0,0.2);

  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;

  border: 1px solid #496805;
  width: 16px;
  height: 16px;
      margin-left: 1cm;
}

.slider > .dragger:hover {
  background: -webkit-linear-gradient(top, #8DCA09, #8DCA09);
      margin-left: 1cm;
      
}


.slider > .track, .slider > .highlight-track {
  background: #ccc;
  background: -webkit-linear-gradient(top, #bbb, #ddd);
  background: -moz-linear-gradient(top, #bbb, #ddd);
  background: linear-gradient(top, #bbb, #ddd);

  -webkit-box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
  -moz-box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
  box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);

  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;
  border-radius: 8px;

  border: 1px solid #aaa;
  height: 8px;
      margin-left:1cm ;
}

.slider > .highlight-track {
	background-color: #8DCA09;
	background: -webkit-linear-gradient(top, #8DCA09, #72A307);
	background: -moz-linear-gradient(top, #8DCA09, #72A307);
	background: linear-gradient(top, #8DCA09, #72A307);
	margin-left: 1cm;
	border-color: #496805;
}
   .content3 {

    width: 850px;
     left: 0px;

     border: 1px solid #ccc; 
     border-radius: 5px; 
     background-color: rgba(230,230,230,0.9);
     margin-top: -792px;
      height: 20px;
      text-align: left;
      font-size: 10px;
    
  
} 
  .content1 {

    width: 850px;
     left: 0px;

     border: 1px solid #ccc; 
     border-radius: 5px; 
     background-color: rgba(230,230,230,0.9);
     margin-top: 2px;
      height: 770px;
     overflow:auto;
  
}
  .content2 {

     width: 30%;
 	 margin-left: 860px;

     border: 1px solid #ccc; 
     border-radius: 5px; 
     background-color: rgba(230,230,230,0.9);
     height: 790px;
     overflow:auto;
    
   
    
  
}  
   /*   $('.range-slider').jRange({
                from: 1,
                to: 100,
                step: 1,
                scale: [1,25,50,75,100],
                format: '%s',
                width: 300,
                showLabels: true,
                isRange : true
            }); */
            .btn-primary {
  background-image: -webkit-linear-gradient(top, #428bca 0%, #2d6ca2 100%);
  background-image:      -o-linear-gradient(top, #428bca 0%, #2d6ca2 100%);
  background-image: -webkit-gradient(linear, left top, left bottom, from(#428bca), to(#2d6ca2));
  background-image:         linear-gradient(to bottom, #428bca 0%, #2d6ca2 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff2d6ca2', GradientType=0);
  filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
  background-repeat: repeat-x;
  border-color: #2b669a;
}





.styled-select {
  
   height: 29px;
   overflow: hidden;
   width: 220px;
}

.styled-select select {
   background: transparent;
   border: none;
   font-size: 14px;
   height: 29px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 220px;
}

.styled-select.slate {
   background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
   height: 34px;
   width: 240px;
}

.styled-select.slate select {
   border: 1px solid #ccc;
   font-size: 16px;
   height: 34px;
   width: 268px;
}



.semi-square {
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

/* -------------------- Colors: Background */

.blue    { background-color: #bbb; }


/* -------------------- Colors: Text */

.blue select    { color: #333; }








  </style>
</head>

<body>
 <div class="content2" id="content2" >
   <p style="margin-left: 1cm; color: blue;">Results Of Prediction </p>
   
 
 <p style="margin-left: 2px;font-size: 11px;">You entered district - <b><span style="border: 1px solid #c0c0c0;" id='district'></span></b></p>
  
  
 
 <p style="margin-left: 2px;font-size: 11px;">Month - <b><span style="border: 1px solid #c0c0c0;" id='monthval'></span></b></p>
 
  
 <p style="margin-left: 2px;font-size: 11px;">Number of AN mothers Given visits -<b><span style="border: 1px solid #c0c0c0;" id='displayfirst'></span></b></p>
 

 <p style="margin-left: 2px;font-size: 11px;">Number of AN mothers With HB It 7grams -<b><span style="border: 1px solid #c0c0c0;" id='displaysecond'></span></b></p>
 
 
 <p style="margin-left: 2px;font-size: 11px;">No of AN mothers With HB Iess than 7 grams Referred to CEmoNC - <b><span style="border: 1px solid #c0c0c0;" id='displaythird'></span></b></p>
 
 <p style="margin-left: 2px;font-size: 11px;">Number of AN mothers With HB Iess than 7 grams Attended PHCs - <b><span style="border: 1px solid #c0c0c0;" id='displayforth'></span></b></p>
 
 <p style="margin-left: 2px;font-size: 11px;">Number of High Risk AN Cases Detected - <b><span style="border: 1px solid #c0c0c0;" id='displayfifth'></span></b></p>
  
 <p style="margin-left: 2px;font-size: 11px;">No of High Risk An Cases Referred to CEmoNC Higher Medical | - <b><span style="border: 1px solid #c0c0c0;" id='displaysix'></span></b></p>

 <p style="margin-left: 2px;font-size: 11px;">Number of AN Mothers Given IFA Large - <b><span style="border: 1px solid #c0c0c0;" id='displayseven'></span></b></p>

 <p style="margin-left: 2px;font-size: 11px;">No of PostNatal Mothers given IFA large tablets - <b><span style="border: 1px solid #c0c0c0;" id='displayeight'></span></b></p>
 
 <p style="margin-left: 2px;font-size: 11px;">Total Numbe of Normal Deliveries - <b><span style="border: 1px solid #c0c0c0;" id='displaynine'></span></b></p>
 
 <p style="margin-left: 2px;font-size: 11px;">Total Numbe of Assisted Deliveries - <b><span style="border: 1px solid #c0c0c0;" id='displayten'></span></b></p>
   
 <p style="margin-left: 2px;font-size: 11px;">Total Numbe of Caesarian Deliveries - <b><span style="border: 1px solid #c0c0c0;" id='displayeleven'></span></b></p>
  
 <p style="margin-left: 2px;font-size: 11px;">Number of Deliveries Occurred HSC - <b><span style="border: 1px solid #c0c0c0;" id='displaytwelve'></span></b></p>
  
 <p style="margin-left: 2px;font-size: 11px;">Number of Deliveries Occurred PHC - <b><span style="border: 1px solid #c0c0c0;" id='displaythirteen'></span></b></p>

 <p style="margin-left: 2px;font-size: 11px;">Number of Deliveries Occurred GH - <b><span style="border: 1px solid #c0c0c0;" id='displayfourteen'></span></b></p>
   
 <p style="margin-left: 2px;font-size: 11px;">Number of Deliveries Occurred Private NH - <b><span style="border: 1px solid #c0c0c0;" id='displayfifteen'></span></b></p>
  
 <p style="margin-left: 2px;font-size: 11px;">Number of Deliveries Occurred Home - <b><span style="border: 1px solid #c0c0c0;" id='displaysixteen'></span></b></p>
 
  
 <p style="margin-left: 2px;font-size: 11px;">PerCapita Income - <b><span style="border: 1px solid #c0c0c0;" id='displayseventeen'></span></b></p>
  
 <p style="margin-left: 2px;font-size: 11px;">Female Literacy - <b><span style="border: 1px solid #c0c0c0;" id='displayeighteen'></span></b></p>

 <p style="margin-left: 2px;font-size: 11px;">Agricultural Labour - <b><span style="border: 1px solid #c0c0c0;" id='displaynineteen'></span></b></p>
  
   

  <label style="margin-left: 2px;font-size: 13px; height: 2px;  color: red;"> Prediction calculated as</label>
 <!-- <p style="margin-left: 2px;font-size: 13px;"><span style="border: 1px solid #c0c0c0; width: 200px;" id='displayresult'></span></p>
   -->
  
   <p style="margin-left: 2px;"><b><span style="display: block;border: 1px solid #c0c0c0; width:200px;height:30px; background-color: #ddd; border-radius: 10px;" id='displayresult'></span></b></p>
 
</div> 
<div class="content3" id="content3">
<form>
 <input type="radio" name="mmr" value="mmr" onclick="mmrcheck();"> Prediction Of MMR&nbsp;&nbsp;
   <input type="radio" name="imr" value="imr" onclick="imrcheck();">  Prediction Of Infant Deaths
  
<!--   <h3 style="background-color:#4682B4; font-size: 12px; height: 25px;margin-top: 0cm;  font-size: 15px; color:white; text-align: center;">
Prediction Of MMR <input type="radio" name="imr" value="imr" onclick="check();"> Prediction Of Infant Deaths</h3> -->
 
 
</form>
</div>
<div class="content1" id="content1">
<h3 style="background-color:#4682B4; font-size: 12px; height: 25px;margin-top: 0cm;  font-size: 15px; color:white; text-align: center; line-height: 25px;">
Prediction Of MMR</h3>
<table border="0"  style="margin-left: 1cm;">
	<tr>
	<td align="left" class="required" width="50px;">	
			District
		</td>
		
		<td width="100px;">	<div class="styled-select blue semi-square">
			<select id="districtName" name="districtName" class="dropDown" >
				 <c:forEach var="district" items="${districts}">
				     <option value='<c:out value="${district.name}"/>'>${district.name} </option>
				 </c:forEach>
			</select></div>
		</td>
		<td width="10%;"></td>
		
		<td  align="left" width="50px;">
			<label id="lblMonth">Month</label>
		</td><td width="7%;"></td>
		<td  colspan="3" width="100px;">	
		<div class="styled-select blue semi-square">
			<select name="month" id="month" class="dropDown" size="1">
				<option value="-1">--Select--</option>
			    <c:forEach var="month" items="${monthsList}">
			     	<option value='<c:out value="${month.name}"/>'>${month.name} </option>
			 	</c:forEach>
			</select></div></td></tr>
	
	
	
</table> 
<table>
<tr>
  <td>
  <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of AN mothers Given visits</p>
  <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   7000</label>
  <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" value="0" data-slider-range="0,7000" data-slider-highlight="true" id="motherVisits" >
 </td>

  <td>
  <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of AN Mothers With HB lt 7grams</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   400</label>
   <input  style=" height: 1px; margin-top: 0px;"type="text" data-slider="true" data-slider-range="1,400" value="1" data-slider-highlight="true" id="HBLtSevengms" >
 </td>
 </tr>
  
  
  
  <tr>
  <td>
   <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">No of mothers With HBIt 7grams Referred to CEMONC</p>
   <label style="margin-left: 1cm;height: 1px; font-size: 14px;"> &nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   900</label>
  <input  style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,900" value="0" data-slider-highlight="true" id="HBLtSevengmsRefCEMONC">
  </td>
  <td>
     <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of AN Mothers With HB It 7grams Attended PHCs</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   300</label>
    <input  style=" height: 1px;margin-top: 0px;" type="text" data-slider="true" value="0" data-slider-range="0,300" data-slider-highlight="true" id="HBLtSevengmsAttendedPHCs">
  </td>
  </tr>
  
  
  
  
  
  <tr>
 <td>
   <p style="margin-left: 1cm;  height: 1px; margin-top: 0px; font-size: 12px;">Number of High Risk AN Cases Detected</p>
   <label style="margin-left: 1cm;height:1px; font-size: 14px;"> &nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   1000</label>
   <input type="text"  style=" height: 1px;" data-slider="true" data-slider-range="0,1000" value="0" data-slider-highlight="true" id="highRiskCasesDetected">
</td>
 <td>
  <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;" >N0 of High Risk Cases Ref to CEMONC Higher Medical</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   1000</label>
   <input type="text" style=" height: 1px;margin-top: 0px" data-slider="true" data-slider-range="0,1000" value="0" data-slider-highlight="true" id="refCEMONCMedical">
 </td>
  </tr>
  
  
  
  
 
 <tr>

 <td>
   <p  style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of AN Mothers Given IFA Large</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   40000</label>
  <input type="text" style=" height: 1px; margin-top: 0px;" data-slider="true" data-slider-range="0,40000" value="0" data-slider-highlight="true" id="IFALarge">
</td>  <td>
 <p  style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of PostNatal Mothers given IFA large tablets</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   5000</label>
  <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,5000" value="0" data-slider-highlight="true" id="ifaLargeTablets">
</td>
 </tr>
 
 
 
 <tr>

 <td>   <p  style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px; ">Total Number of Normal Deliveries</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   5000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,5000" value="0" data-slider-highlight="true" id="normalDeliveries">
</td> <td> <p  style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Total Number of Assisted Deliveries</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   200</label>
  <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,200" value="0" data-slider-highlight="true" id="assistDeliveries">
 
  </td>
 </tr>
 
  <tr>
  
 
  <td><p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 13px;">Total Number of Caesarians Deliveries</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   2000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,2000" value="0" data-slider-highlight="true" id="caesarianDeliveries">
   
  </td><td>    <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 13px;">Number of Deliveries Occurred Hsc</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  1000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,1000" value="0" data-slider-highlight="true" id="deliveriesOccuredHsc">
   
   </td></tr>
  
  
  
   <tr>
   <td>    <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of Deliveries Occurred PHC</p>
   <label style="margin-left: 1cm; height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   2500</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,2500" value="0" data-slider-highlight="true" id="deliveriesOccuredPHC">
   
   </td><td>    <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of Deliveries Occurred GH</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   3000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,3000" value="0" data-slider-highlight="true" id="deliveriesOccurredGH">
   
   </td>
  </tr>


<tr>
 
    <td> <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of Deliveries Occurred Private NH</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   2000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,2000" value="0" data-slider-highlight="true" id="deliveriesOccurredNH">
   
 </td><td><p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Number of Deliveries Occurred Home</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   500</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,500" value="0" data-slider-highlight="true" id="deliveriesOccurredHome">
   
 </td>
</tr>
 
 
 <tr>

 <td>    <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Percapita</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   85000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,85000" value="0" data-slider-highlight="true" id="percapita">
   
 </td><td>
<p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 10px; font-size: 12px;">Fem Lit</p>
   <label style=" margin-left: 1cm;height: 1px; font-size: 14px;">&nbsp; &nbsp;  0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   1900000</label>
   <input style=" height: 1px; margin-top: 0px;" type="text" data-slider="true" data-slider-range="0,1900000" value="0" data-slider-highlight="true" id="femLit">
   
</td>
 </tr>

 
<tr>

<td>
   <p style="margin-left: 1cm; height: 1px; margin-top: 0px; font-size: 12px;">Agri Labour</p>
   <label style=" margin-left: 1cm; height: 1px; font-size: 14px;">  &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;    850000</label>
   <input type="text" style=" height: 1px; margin-top: 0px;" data-slider="true" data-slider-range="0,850000" value="0" data-slider-highlight="true" id="agriLabour">
   
</td>
<td>
<button style="width: 90px; height: 20px; align:center;margin-left:50px;"     id="reviewChanges" type="button" class="btn btn-primary"  onclick="reviewChanges();">Submit</button>&nbsp;

</td>
</tr>
</table>
</div>

	</body>
 <script>
 function mmrcheck(){
	
		window.location.href = "shdrcSlider.do";
 }
function imrcheck(){

	window.location.href = "shdrcPredictionSlider.do";
		/*  $.ajax({		
				 type: "POST",
				 url: "shdrcPredictionSlider.do",
				 async: false,
				 dataType: 'text',
				 //data: jQuery.param({IndicatorCategory:indicatorCategory,IndicatorName:selectedIndicatorNames,DirectorateId:directorateId}),		 
				 success: function(result){  
					 
				 },
				 error: function () {
			    	  $("#errorMessage").text("Save Error");
			      }
		 }); */

	/*  $.ajax({
			url: 'shdrcPredictionSlider.do',
				type: "GET",	
				
				    
				      error: function () {
				    	  $("#errorMessage").text("Save Error");
				      }}); */
}
 

 function reviewChanges(){
	 
	 var month = document.getElementById("month").value;
	 var district = document.getElementById("districtName").value;
	
		if(district =='State Level' ){
			alert("Please Select district");
			return false;
		}
		
		if(month == '-1'){
			alert("Please Select month");
			return false;
		}
	 var motherVisits = document.getElementById("motherVisits").value;
	 var HBLtSevengms = document.getElementById("HBLtSevengms").value;
	 var HBLtSevengmsRefCEMONC = document.getElementById("HBLtSevengmsRefCEMONC").value;
	 var HBLtSevengmsAttendedPHCs = document.getElementById("HBLtSevengmsAttendedPHCs").value;
	 var highRiskCasesDetected = document.getElementById("highRiskCasesDetected").value;
	 var refCEMONCMedical = document.getElementById("refCEMONCMedical").value;
	 var IFALarge = document.getElementById("IFALarge").value;
	 var ifaLargeTablets = document.getElementById("ifaLargeTablets").value;
	 var normalDeliveries = document.getElementById("normalDeliveries").value;
	 var assistDeliveries = document.getElementById("assistDeliveries").value;
	 var caesarianDeliveries = document.getElementById("caesarianDeliveries").value;
	 var deliveriesOccuredHsc = document.getElementById("deliveriesOccuredHsc").value;
	 var deliveriesOccuredPHC = document.getElementById("deliveriesOccuredPHC").value;
	 var deliveriesOccurredGH = document.getElementById("deliveriesOccurredGH").value;
	 var deliveriesOccurredNH = document.getElementById("deliveriesOccurredNH").value;
	 var deliveriesOccurredHome = document.getElementById("deliveriesOccurredHome").value;
     var percapita = document.getElementById("percapita").value;
     var femLit = document.getElementById("femLit").value;
	 var agriLabour = document.getElementById("agriLabour").value; 
	
	
	
	document.getElementById('monthval').innerHTML = document.getElementById("month").value;
	document.getElementById('district').innerHTML = document.getElementById("districtName").value;
	document.getElementById('displayfirst').innerHTML = parseInt(motherVisits); 
	document.getElementById('displaysecond').innerHTML = parseInt(HBLtSevengms);
	document.getElementById('displaythird').innerHTML = parseInt(HBLtSevengmsRefCEMONC); 
	document.getElementById('displayforth').innerHTML = parseInt(HBLtSevengmsAttendedPHCs);
	document.getElementById('displayfifth').innerHTML = parseInt(highRiskCasesDetected);
	document.getElementById('displaysix').innerHTML = parseInt(refCEMONCMedical); 
	document.getElementById('displayseven').innerHTML = parseInt(IFALarge); 
	document.getElementById('displayeight').innerHTML = parseInt(ifaLargeTablets); 
	document.getElementById('displaynine').innerHTML = parseInt(normalDeliveries); 
	document.getElementById('displayten').innerHTML = parseInt(assistDeliveries); 
	document.getElementById('displayeleven').innerHTML = parseInt(caesarianDeliveries); 
	document.getElementById('displaytwelve').innerHTML = parseInt(deliveriesOccuredHsc); 
	document.getElementById('displaythirteen').innerHTML = parseInt(deliveriesOccuredPHC); 
	document.getElementById('displayfourteen').innerHTML = parseInt(deliveriesOccurredGH); 
	document.getElementById('displayfifteen').innerHTML = parseInt(deliveriesOccurredNH);
	document.getElementById('displaysixteen').innerHTML = parseInt(deliveriesOccurredHome); 
	document.getElementById('displayseventeen').innerHTML = parseInt(percapita); 
	document.getElementById('displayeighteen').innerHTML = parseInt(femLit); 
	document.getElementById('displaynineteen').innerHTML = parseInt(agriLabour); 

	
	

	/*  
	 alert("month"+month);
	 alert("districtName"+district);
	 alert("idfirst"+displayfirst);
	 alert("idsecond"+displaysecond);
	 alert("idthird"+displaythird); */
	 
	  $.ajax({
		url: 'shdrcSliderpost.do',
			type: "POST",	
			'data':  { 
				 motherVisits: motherVisits,HBLtSevengms: HBLtSevengms,HBLtSevengmsRefCEMONC: HBLtSevengmsRefCEMONC,HBLtSevengmsAttendedPHCs: HBLtSevengmsAttendedPHCs,highRiskCasesDetected: highRiskCasesDetected,refCEMONCMedical: refCEMONCMedical,IFALarge: IFALarge,ifaLargeTablets: ifaLargeTablets,normalDeliveries: normalDeliveries,assistDeliveries: assistDeliveries,caesarianDeliveries: caesarianDeliveries,deliveriesOccuredHsc: deliveriesOccuredHsc,deliveriesOccuredPHC: deliveriesOccuredPHC,deliveriesOccurredGH: deliveriesOccurredGH,deliveriesOccurredNH: deliveriesOccurredNH,deliveriesOccurredHome: deliveriesOccurredHome,percapita: percapita,femLit: femLit,agriLabour: agriLabour
				 },
			    success: function (result) {			    	
			    	 document.getElementById('displayresult').innerHTML = result; 
			    	
			    	},
			      error: function () {
			    	  $("#errorMessage").text("Save Error");
			      }});

/* 	 $.ajax({
			
		  url: 'shdrcSliderpost.do',
			type: "POST",	
			'data':  { 
				 
				
					month: month,district: district,displayfirst: displayfirst,displaysecond:displaysecond,displaythird:displaythird
				},
			    success: function (result) {
			    	alert(result);
			      },
			      error: function () {
			    	  $("#errorMessage").text("Save Error");
			      }});  */
	
	
	/* document.getElementById('displayforth').innerHTML = document.getElementById("idforth").value;
	document.getElementById('displayfifth').innerHTML = document.getElementById("idfifth").value; */
	
 }

	
 </script>


  <script>
  $("[data-slider]")
    .each(function () {
      var input = $(this);
      $("<span>")
        .addClass("output")
        .insertAfter($(this));
    })
    .bind("slider:ready slider:changed", function (event, data) {
      $(this)
        .nextAll(".output:first")
          .html(data.value.toFixed(0));
    });
  </script>
  <script>
  /*
  jQuery Simple Slider

  Copyright (c) 2012 James Smith (http://loopj.com)

  Licensed under the MIT license (http://mit-license.org/)
 */

 var __slice = [].slice,
   __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

 (function($, window) {
   var SimpleSlider;
   SimpleSlider = (function() {

     function SimpleSlider(input, options) {
       var ratio,
         _this = this;
       this.input = input;
       this.defaultOptions = {
         animate: true,
         snapMid: false,
         classPrefix: null,
         classSuffix: null,
         theme: null,
         highlight: false
       };
       this.settings = $.extend({}, this.defaultOptions, options);
       if (this.settings.theme) {
         this.settings.classSuffix = "-" + this.settings.theme;
       }
       this.input.hide();
       this.slider = $("<div>").addClass("slider" + (this.settings.classSuffix || "")).css({
         position: "relative",
         userSelect: "none",
         boxSizing: "border-box"
      
       }).insertBefore(this.input);
       if (this.input.attr("id")) {
         this.slider.attr("id", this.input.attr("id") + "-slider");
       }
       this.track = this.createDivElement("track").css({
         width: "100%"
       });
       if (this.settings.highlight) {
         this.highlightTrack = this.createDivElement("highlight-track").css({
           width: "0"
         });
       }
       this.dragger = this.createDivElement("dragger");
       this.slider.css({
         minHeight: this.dragger.outerHeight(),
         marginLeft: this.dragger.outerWidth() / 2,
         marginRight: this.dragger.outerWidth() / 2
       });
       this.track.css({
         marginTop: this.track.outerHeight() / -2
       });
       if (this.settings.highlight) {
         this.highlightTrack.css({
           marginTop: this.track.outerHeight() / -2
         });
       }
       this.dragger.css({
         marginTop: this.dragger.outerHeight() / -2,
         marginLeft: "24px"/* this.dragger.outerWidth() / -2 */
       });
       this.track.mousedown(function(e) {
         return _this.trackEvent(e);
       });
       if (this.settings.highlight) {
         this.highlightTrack.mousedown(function(e) {
           return _this.trackEvent(e);
         });
       }
       this.dragger.mousedown(function(e) {
         if (e.which !== 1) {
           return;
         }
         _this.dragging = true;
         _this.dragger.addClass("dragging");
         _this.domDrag(e.pageX, e.pageY);
         return false;
       });
       $("body").mousemove(function(e) {
         if (_this.dragging) {
           _this.domDrag(e.pageX, e.pageY);
           return $("body").css({
             cursor: "pointer"
           });
         }
       }).mouseup(function(e) {
         if (_this.dragging) {
           _this.dragging = false;
           _this.dragger.removeClass("dragging");
           return $("body").css({
             cursor: "auto"
           });
         }
       });
       this.pagePos = 0;
       if (this.input.val() === "") {
         this.value = this.getRange().min;
         this.input.val(this.value);
       } else {
         this.value = this.nearestValidValue(this.input.val());
       }
       this.setSliderPositionFromValue(this.value);
       ratio = this.valueToRatio(this.value);
       this.input.trigger("slider:ready", {
         value: this.value,
         ratio: ratio,
         position: ratio * this.slider.outerWidth(),
         el: this.slider
       });
     }

     SimpleSlider.prototype.createDivElement = function(classname) {
       var item;
       item = $("<div>").addClass(classname).css({
         position: "absolute",
         top: "50%",
         userSelect: "none",
         cursor: "pointer"
       }).appendTo(this.slider);
       return item;
     };

     SimpleSlider.prototype.setRatio = function(ratio) {
       var value;
       ratio = Math.min(1, ratio);
       ratio = Math.max(0, ratio);
       value = this.ratioToValue(ratio);
       this.setSliderPositionFromValue(value);
       return this.valueChanged(value, ratio, "setRatio");
     };

     SimpleSlider.prototype.setValue = function(value) {
       var ratio;
       value = this.nearestValidValue(value);
       ratio = this.valueToRatio(value);
       this.setSliderPositionFromValue(value);
       return this.valueChanged(value, ratio, "setValue");
     };

     SimpleSlider.prototype.trackEvent = function(e) {
       if (e.which !== 1) {
         return;
       }
       this.domDrag(e.pageX, e.pageY, true);
       this.dragging = true;
       return false;
     };

     SimpleSlider.prototype.domDrag = function(pageX, pageY, animate) {
       var pagePos, ratio, value;
       if (animate == null) {
         animate = false;
       }
       pagePos = pageX - this.slider.offset().left;
       pagePos = Math.min(this.slider.outerWidth(), pagePos);
       pagePos = Math.max(0, pagePos);
       if (this.pagePos !== pagePos) {
         this.pagePos = pagePos;
         ratio = pagePos / this.slider.outerWidth();
         value = this.ratioToValue(ratio);
         this.valueChanged(value, ratio, "domDrag");
         if (this.settings.snap) {
           return this.setSliderPositionFromValue(value, animate);
         } else {
           return this.setSliderPosition(pagePos, animate);
         }
       }
     };

     SimpleSlider.prototype.setSliderPosition = function(position, animate) {
       if (animate == null) {
         animate = false;
       }
       if (animate && this.settings.animate) {
         this.dragger.animate({
           left: position
         }, 200);
         if (this.settings.highlight) {
           return this.highlightTrack.animate({
             width: position
           }, 200);
         }
       } else {
         this.dragger.css({
           left: position
         });
         if (this.settings.highlight) {
           return this.highlightTrack.css({
             width: position
           });
         }
       }
     };

     SimpleSlider.prototype.setSliderPositionFromValue = function(value, animate) {
       var ratio;
       if (animate == null) {
         animate = false;
       }
       ratio = this.valueToRatio(value);
       return this.setSliderPosition(ratio * this.slider.outerWidth(), animate);
     };

     SimpleSlider.prototype.getRange = function() {
       if (this.settings.allowedValues) {
         return {
           min: Math.min.apply(Math, this.settings.allowedValues),
           max: Math.max.apply(Math, this.settings.allowedValues)
         };
       } else if (this.settings.range) {
         return {
           min: parseFloat(this.settings.range[0]),
           max: parseFloat(this.settings.range[1])
         };
       } else {
         return {
           min: 0,
           max: 1
         };
       }
     };

     SimpleSlider.prototype.nearestValidValue = function(rawValue) {
       var closest, maxSteps, range, steps;
       range = this.getRange();
       rawValue = Math.min(range.max, rawValue);
       rawValue = Math.max(range.min, rawValue);
       if (this.settings.allowedValues) {
         closest = null;
         $.each(this.settings.allowedValues, function() {
           if (closest === null || Math.abs(this - rawValue) < Math.abs(closest - rawValue)) {
             return closest = this;
           }
         });
         return closest;
       } else if (this.settings.step) {
         maxSteps = (range.max - range.min) / this.settings.step;
         steps = Math.floor((rawValue - range.min) / this.settings.step);
         if ((rawValue - range.min) % this.settings.step > this.settings.step / 2 && steps < maxSteps) {
           steps += 1;
         }
         return steps * this.settings.step + range.min;
       } else {
         return rawValue;
       }
     };

     SimpleSlider.prototype.valueToRatio = function(value) {
       var allowedVal, closest, closestIdx, idx, range, _i, _len, _ref;
       if (this.settings.equalSteps) {
         _ref = this.settings.allowedValues;
         for (idx = _i = 0, _len = _ref.length; _i < _len; idx = ++_i) {
           allowedVal = _ref[idx];
           if (!(typeof closest !== "undefined" && closest !== null) || Math.abs(allowedVal - value) < Math.abs(closest - value)) {
             closest = allowedVal;
             closestIdx = idx;
           }
         }
         if (this.settings.snapMid) {
           return (closestIdx + 0.5) / this.settings.allowedValues.length;
         } else {
           return closestIdx / (this.settings.allowedValues.length - 1);
         }
       } else {
         range = this.getRange();
         return (value - range.min) / (range.max - range.min);
       }
     };

     SimpleSlider.prototype.ratioToValue = function(ratio) {
       var idx, range, rawValue, step, steps;
       if (this.settings.equalSteps) {
         steps = this.settings.allowedValues.length;
         step = Math.round(ratio * steps - 0.5);
         idx = Math.min(step, this.settings.allowedValues.length - 1);
         return this.settings.allowedValues[idx];
       } else {
         range = this.getRange();
         rawValue = ratio * (range.max - range.min) + range.min;
         return this.nearestValidValue(rawValue);
       }
     };

     SimpleSlider.prototype.valueChanged = function(value, ratio, trigger) {
       var eventData;
       if (value.toString() === this.value.toString()) {
         return;
       }
       this.value = value;
       eventData = {
         value: value,
         ratio: ratio,
         position: ratio * this.slider.outerWidth(),
         trigger: trigger,
         el: this.slider
       };
       return this.input.val(value).trigger($.Event("change", eventData)).trigger("slider:changed", eventData);
     };

     return SimpleSlider;

   })();
   $.extend($.fn, {
     simpleSlider: function() {
       var params, publicMethods, settingsOrMethod;
       settingsOrMethod = arguments[0], params = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
       publicMethods = ["setRatio", "setValue"];
       return $(this).each(function() {
         var obj, settings;
         if (settingsOrMethod && __indexOf.call(publicMethods, settingsOrMethod) >= 0) {
           obj = $(this).data("slider-object");
           return obj[settingsOrMethod].apply(obj, params);
         } else {
           settings = settingsOrMethod;
           return $(this).data("slider-object", new SimpleSlider($(this), settings));
         }
       });
     }
   });
   return $(function() {
     return $("[data-slider]").each(function() {
       var $el, allowedValues, settings, x;
       $el = $(this);
       settings = {};
       allowedValues = $el.data("slider-values");
       if (allowedValues) {
         settings.allowedValues = (function() {
           var _i, _len, _ref, _results;
           _ref = allowedValues.split(",");
           _results = [];
           for (_i = 0, _len = _ref.length; _i < _len; _i++) {
             x = _ref[_i];
             _results.push(parseFloat(x));
           }
           return _results;
         })();
       }
       if ($el.data("slider-range")) {
         settings.range = $el.data("slider-range").split(",");
       }
       if ($el.data("slider-step")) {
         settings.step = $el.data("slider-step");
       }
       settings.snap = $el.data("slider-snap");
       settings.equalSteps = $el.data("slider-equal-steps");
       if ($el.data("slider-theme")) {
         settings.theme = $el.data("slider-theme");
       }
       if ($el.attr("data-slider-highlight")) {
         settings.highlight = $el.data("slider-highlight");
       }
       if ($el.data("slider-animate") != null) {
         settings.animate = $el.data("slider-animate");
       }
       return $el.simpleSlider(settings);
     });
   });
 })(this.jQuery || this.Zepto, this);
 
</script>

</html>
