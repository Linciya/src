
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.Demographic"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
<title>DFW View Employee Form</title>
<!-- Bootstrap -->
<link href="bootstrap-3.2.0-dist/css/bootstrap.min.css" rel="stylesheet">
<!--Loading Handsontable (full distribution that includes all dependencies apart from jQuery) -->
<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css">
<!--Loading demo dependencies. They are used here only to enhance the examples on this page-->
<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css">
<script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>

<script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script>
<link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">
<link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
  
<script src="js/script.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"  />
<style type="text/css">
</style>
<script type="text/javascript">
function OnLoad(){
	var frequency='<%= request.getAttribute("frequency") %>';
	/* $( ".datepicker" ).datepicker({
	dateFormat: 'dd-mm-yy',	
	//defaultDate: new Date(),
	showOn: "both",
	buttonImageOnly: true,
	buttonImage: "images/cal_icon.gif",
	//buttonText: 'Open calendar'
	
	}); */

}
  function closeWindow(){
	  window.close();
  }
  </script>
 	
</head>
<body onload="OnLoad();">
<form name="dfwEmployeeForm" method="POST" action="dfwEmployeeFormServlet" id="dfwEmployeeForm">
<div class="container" style="width:70%;border: solid 3px #007297">
  <h2>Employee Form</h2>
  <ul class="nav nav-tabs nav-pills" style="border: solid 3px #007297">
    <li class="active"><a data-toggle="tab" href="#home">Basic Details</a></li>
   <!--  <li><a data-toggle="tab" href="#menu1">Education</a></li>
    <li><a data-toggle="tab" href="#menu2">Promotion</a></li> -->
    <li><a data-toggle="tab" href="#menu3">Leave</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active" style="height: 520px;background:  #F0F6FF;padding-top: 8px;padding-left: 8px;">
      <table border="0">
			<tr>
				<td style="width:300px" class="required" ><b>Employee Name</b></td>
				<td style="width:250px"><input type="text" name="employeeName" name="employeeName" class="inputText" disabled="disabled"/></td>
				<td style="width:300px" class="required"><b>GPF/CPS No</b></td>
				<td style="width:250px"><input type="text" name="gpfOrCpsNo" name="gpfOrCpsNo" class="inputText"/ disabled="disabled"></td>
			</tr>
			<tr>
				<td class="required"><b>Gender</b></td>
				<td>
					<input type="radio" name="gender" value="M" disabled="disabled"/>Male
		            <input type="radio" name="gender" value="F" disabled="disabled" />Female
		            <input type="radio" name="gender" value="TG" disabled="disabled" />Transgender
		         </td>
				<td class="required"><b>Designation</b></td>
				<td>
					<select name="designation" id="designation" size="1" disabled="disabled" class="dropDown">
						 <option value="">--Select--</option>
					     <c:forEach var="designation" items="${postList}">
						     <option value='<c:out value="${designation.id}"/>'>${designation.name} </option>
						 </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="required"><b>Pay band</b></td>
				<td><input type="text" name="payBand" name="payBand" disabled="disabled" class="inputText"/></td>
				<td class="required"><b>Group/Category</b></td>
				<td>
					<select name="groupCategory" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="A">A</option>
					    <option value="B">B</option>
					    <option value="C">C</option>
					    <option value="D">D</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td class="required"><b>Duty Pay</b></td>
				<td><input type="text" name="dutyPay" name="dutyPay" class="inputText" disabled="disabled"/></td>
				<td class="required"><b>Recruited by</b></td>
				<td>
					<select name="recruitedBy" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="TNPSC">TNPSC</option>
					    <option value="MRB">MRB</option>
					    <option value="Compassionate Grounds">Compassionate Grounds</option>
					    <option value="Emploment Office">Emploment Office</option>
					    <option value="Others">Others</option>
					</select>
				</td>	
			</tr>
			<tr>	
				<td class="required"><b>Grade pay</b></td>
				<td><input type="text" name="gradePay" name="gradePay" class="inputText" disabled="disabled"/></td>
				<td class="required"><b>Community</b></td>
				<td>
					<select name="community" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="SC/ST">SC/ST</option>
					    <option value="MBC">MBC</option>
					    <option value="DNC">DNC</option>
					    <option value="BC muslim">BC muslim</option>
					    <option value="BC Others">BC Others</option>
					    <option value="OC">OC</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td class="required"><b>Date of Birth</b></td>
				<td colspan="3"><input type="text" id="dobDate" name="dobDate" disabled="disabled" class="datepicker inputText"></td>
			</tr>
			<tr>
				<td class="required"><b>Qualification</b></td>
				<td colspan="3">
					<select name="qualification" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="SSLC">SSLC</option>
					    <option value="HSC">HSC</option>
					    <option value="UG Deg">UG Deg</option>
					    <option value="PG Deg">PG Deg</option>
					    <option value="Diploma">Diploma</option>
					    <option value="Others">Others</option>
					</select>
				</td>	
			</tr>
			<tr>
				<td class="required"><b>UG Major</b></td>
				<td><input type="text" id="ugMajor" name="ugMajor" class="inputText" disabled="disabled"></td>	
				<td class="required"><b>PG Major</b></td>
				<td><input type="text" id="pgMajor" name="pgMajor" class="inputText" disabled="disabled"></td>
			</tr>
			<tr>	
				<td class="required"><b>First Appointment Post</b></td>
				<td><select name="firstAppointmentPost" id="firstAppointmentPost" size="1" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					     <c:forEach var="firstAppointmentPost" items="${postList}">
						     <option value='<c:out value="${firstAppointmentPost.id}"/>'>${firstAppointmentPost.name} </option>
						 </c:forEach>
					</select></td>
				<td class="required"><b>First Appointment DOJ</b></td>
				<td><input type="text" id="firstAppointmentDOJ" name="firstAppointmentDOJ" readonly="true" disabled="disabled" class="datepicker inputText">
				</td>
			</tr>
			<tr>	
				<td class="required"><b>Date of Regularisation</b></td>
				<td><input type="text" id="dateOfRegularisation" name="dateOfRegularisation" readonly="true" disabled="disabled" class="datepicker inputText"></td>
				<td class="required"><b>Date of Probation Decleration</b></td>
				<td><input type="text" id="dateOfProbationDecleration" name="dateOfProbationDecleration" readonly="true" disabled="disabled" class="datepicker inputText">
				</td>
			</tr>
			<tr>	
				<td class="required"><b>Date of Retirement</b></td>
				<td><input type="text" id="dateOfRetirement" name="dateOfRetirement" readonly="true" disabled="disabled" class="datepicker inputText"></td>
				<td class="required"><b>Increment Due Month</b></td>
				<td><select name="incrementDueMonth" id="incrementDueMonth" size="1" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="1st January">1st January</option>
					    <option value="1st April">1st April</option>
					    <option value="UG Deg">1st July</option>
					    <option value="1st October">1st October</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td class="required"><b>SLS Due Date</b></td>
				<td><input type="text" id="slsDueDate" name="slsDueDate" readonly="true"  disabled="disabled" class="datepicker inputText"></td>
				<td class="required"><b>Physical Status</b></td>
				<td><select name="physicalStatus" id="physicalStatus" size="1" disabled="disabled" class="dropDown">
						<option value="">--Select--</option>
					    <option value="None">None</option>
					    <option value="PH">PH</option>
					    <option value="Widow">Widow</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td style="width:250px" class="required"><b>Promotion Type</b></td>
				<td style="width:200px" colspan="3"><select name="promotionType" id="promotionType" disabled="disabled" size="1" class="dropDown">
						<option value="">--Select--</option>
						<option value="">Promotion1</option>
						<option value="">Promotion2</option>
						<option value="">Promotion3</option>
						<option value="">Promotion4</option>
						<option value="">Promotion5</option>
					</select></td>
			</tr>
	      	<tr>	
				<td style="width:250px" class="required"><b>Recent Promotion</b></td>
				<td style="width:200px" colspan="3"><select name="promotion1" id="promotion1" size="1" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					     <c:forEach var="post" items="${postList}">
						     <option value='<c:out value="${post.id}"/>'>${post.name} </option>
						 </c:forEach>
					</select></td>
			</tr>
			<tr>	
				<td style="width:250px" class="required"><b>Recent Promotion - DOJ</b></td>
				<td style="width:200px" colspan="3"><input type="text" id="promotion1DOJ" name="promotion1DOJ" disabled="disabled" readonly="true" class="datepicker inputText">
				</td>
			</tr>
			<tr>	
				<td class="required"><b>Punishments</b></td>
				<td><select name="punishments" id="punishments" size="1" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="Censure">Censure</option>
					    <option value="Stoppage of inc. with cumulative">Stoppage of inc. with cumulative</option>
					    <option value="Stoppage of inc.without cumulative">Stoppage of inc.without cumulative</option>
					    <option value="Suspention">Suspention</option>
					    <option value="Termination/Removal/Dismissed">Termination/Removal/Dismissed</option>
					    <option value="None">None</option>
					</select></td>
				<td></td>
				<td>
				</td>
			</tr>
			<tr>	
				<td class="required"><b>Whether nominee details submitted or not</b></td>
				<td colspan="3"><select name="nomineeDetails" id="" size="1" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="Yes">Yes</option>
					    <option value="No">No</option>
					</select></td>
			</tr>
		</table>	
    </div>
    <div id="menu1" class="tab-pane fade" style="height: 380px;background:  #F0F6FF">
	    <table border="0">
	    	<tr>
				<td >Qualification</td>
				<td colspan="3">
					<select name="qualification" class="dropDown" disabled="disabled">
						<option value="">--Select--</option>
					    <option value="SSLC">SSLC</option>
					    <option value="HSC">HSC</option>
					    <option value="UG Deg">UG Deg</option>
					    <option value="PG Deg">PG Deg</option>
					    <option value="Diploma">Diploma</option>
					    <option value="Others">Others</option>
					</select>
				</td>	
			</tr>
			<tr>
				<td style="width:250px">UG Major</td>
				<td style="width:200px"><input type="text" id="ugMajor" name="ugMajor" disabled="disabled" class="inputText"></td>	
				<td style="width:250px">PG Major</td>
				<td style="width:200px"><input type="text" id="pgMajor" name="pgMajor" class="inputText" disabled="disabled"></td>
			</tr>
	    </table>
    </div>
    <div id="menu2" class="tab-pane fade" style="height: 380px;background:  #F0F6FF">
      <table border="0" >
      	<tr>	
			<td style="width:250px">Promotion Type</td>
			<td style="width:200px"><select name="promotionType" id="promotionType" size="1" class="dropDown" disabled="disabled">
					<option value="">--Select--</option>
					<option value="">Promotion</option>
					<option value="">Promotion2</option>
					<option value="">Promotion3</option>
					<option value="">Promotion4</option>
					<option value="">Promotion5</option>
				</select></td>
		</tr>
      	<tr>	
			<td style="width:250px">Promotion I</td>
			<td style="width:200px"><select name="promotion1" id="promotion1" size="1" class="dropDown" disabled="disabled">
					<option value="">--Select--</option>
				     <c:forEach var="post" items="${postList}">
					     <option value='<c:out value="${post.id}"/>'>${post.name} </option>
					 </c:forEach>
				</select></td>
		</tr>
		<tr>	
			<td style="width:250px">Promotion - DOJ</td>
			<td style="width:200px"><input type="text" id="promotion1DOJ" name="promotion1DOJ" readonly="true" disabled="disabled" class="datepicker inputText">
			</td>
		</tr>
      </table>
    </div>
    <div id="menu3" class="tab-pane fade" style="height: 380px;background:  #F0F6FF ;padding-top: 20px;padding-left: 8px;">
      <table>
      	<tr>	
			<td style="width:250px;height: 50px;"><b>Recent E.L taken - From</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="ELTakenFrom" name="ELTakenFrom" readonly="true" disabled="disabled" class="datepicker inputText"></td>
			<td style="width:250px;height: 50px;"><b>Recent E.L taken - To</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="ELTakenTo" name="ELTakenTo" readonly="true" disabled="disabled" class="datepicker inputText">
			</td>
		</tr>
		<tr><td style="width:250px;height: 50px;"><b>Recent E.L taken - Days</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="ELTakenDays" name="ELTakenDays" readonly="true" disabled="disabled" class="inputText"></td>	
			<td style="width:250px;height: 50px;"><b>Bal E.L as in SR</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="balanceEL" name="balanceEL" class="inputText" disabled="disabled"></td>
		</tr>
		<tr>	
			<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) taken From</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="MLTakenFrom" name="MLTakenFrom" readonly="true" disabled="disabled" class="datepicker inputText"></td>
			<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) taken -To</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="MLTakenTo" name="MLTakenTo" readonly="true" disabled="disabled" class="datepicker inputText">
			</td>
		</tr>
		<tr>
			<td style="width:250px;height: 50px;"><b>Recent M.L (UEL) - Days</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="MLTakenDays" name="MLTakenDays" readonly="true" disabled="disabled" class="inputText"></td>	
			<td style="width:250px;height: 50px;"><b>Bal M.L (UEL) as in SR</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="balanceML" name="balanceML" class="inputText" disabled="disabled"></td>
		</tr>
		<tr>	
			<td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken From</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="UELTakenFrom" name="UELTakenFrom" readonly="true" disabled="disabled" class="datepicker inputText"></td>
			<td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken - To</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="UELTakenTo" name="UELTakenTo" readonly="true" disabled="disabled" class="datepicker inputText">
			</td>
		</tr>
		<tr><td style="width:250px;height: 50px;"><b>Recent U.E.L on P.A taken - Days</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="UELTakenDays" name="UELTakenDays" readonly="true" disabled="disabled" class="inputText"></td>	
			<td style="width:250px;height: 50px;"><b>Bal U.E.L as in SR</b></td>
			<td style="width:200px;height: 50px;"><input type="text" id="balanceUEL" name="balanceUEL" class="inputText" disabled="disabled"></td>
		</tr>
      </table>
    </div>
    <table border="0">
	  	<tr>
			<td align="center" colspan="5" style="width:1100px;padding-bottom: 10px;">		
				<button id="submit" type="button" class="btn btn-primary"  onclick="doSubmit();"/>Submit</button>&nbsp;
				<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');"/>Close</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
  </div>
</div>
</form>

<script>
</script>	
<script src="js/commonHandsontable.js"></script>
<script src="jquery/jquery-handsontable-master/lib/jquery-1.10.2.js"></script>
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<link rel="stylesheet" href="jquery/jquery-handsontable-master/lib/jquery-ui/css/smoothness/jquery-ui.custom.css">
<script src="bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</body>
</html>