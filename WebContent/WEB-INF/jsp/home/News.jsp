
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="gov.shdrc.util.CommonStringList"%>
<%@page import="gov.shdrc.util.News"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<% response.addHeader( "X-FRAME-OPTIONS", "SAMEORIGIN" );%>
		<title>SHDRC News Portal</title>
		
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!--Loading Handsontable (full distribution that includes all dependencies apart from jQuery)-->
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/lib/jquery.min.js"></script>
		<script data-jsfiddle="common" src="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.js"></script>
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/dist/jquery.handsontable.full.css">
		
		<!--Loading demo dependencies. They are used here only to enhance the examples on this page-->
		<link data-jsfiddle="common" rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/css/samples.css">
		<script src="jquery/jquery-handsontable-master/demo/js/samples.js"></script>
		<script src="jquery/jquery-handsontable-master/demo/js/highlight/highlight.pack.js"></script>
		<link rel="stylesheet" media="screen" href="jquery/jquery-handsontable-master/demo/js/highlight/styles/github.css">
		<link rel="stylesheet" href="jquery/jquery-handsontable-master/demo/css/font-awesome/css/font-awesome.min.css">
		
		<link rel="stylesheet" href="jquery/ui/1.11.4/themes/smoothness/jquery-ui.css">
		
		<script src="js/script.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css"  />	
		<style type="text/css">
		</style>
		
			<%
				News news=null;
				List<CommonStringList> newsList=null;
				if(request.getAttribute("newsObj")!=null){
					news=(News)request.getAttribute("newsObj");
				}
				if(request.getAttribute("newsList")!=null){
					newsList=(List<CommonStringList>)request.getAttribute("newsList");
				}
			%>
		<script type="text/javascript">			
			function onSubmit(messageId){
				 var contextpath = '<%=request.getContextPath()%>';
				document.location.href = contextpath+"/News.do?messageId="+messageId;
			}
		</script>	
	</head>

	<body>
		<form name="newsForm" method="POST" action="newsFormServlet" id="newsForm">
			<div style="height:40px;background: #6699CC;">
				<iframe src="scrolling.html" style="border: none;height:40px;overflow-y:auto;overflow-x:auto;width: 1600px;"></iframe>
  			</div>
  			</br>
			<div class="container-fluid">
					<div align="left" style="height:35px;border:solid 2px;background: linear-gradient(to bottom, #007297 49%,#005e7c 100%);border-top-left-radius:25px;border-top-right-radius: 25px;">
						<h4 style="padding-left:35px; color:white;"><b>SHDRC News Portal</b></h4>
					</div>
					<div id="left" style="float: left; background-color: #777; width: 70%;" >
						<div align="right" style = "background: #82BACC; padding-top:4px;padding-left:10px;padding-right:10px;padding-bottom:2px;border-left:solid 2px #007297;border-bottom:solid 2px #007297;border-right:solid 2px #007297;">
							<%if(news!=null){ %>
								<h6 style="padding-left:35px;color:white;">Added by : <%=news.getAddedBy() %> &nbsp;&nbsp; Added On : <%=news.getAddedOn() %></h6>
							<%} %>	
						</div>
						<div style = "font:12; color: #007297;font-family: sans-serif;background: #CCE2EA;padding-top:10px;padding-bottom:25px;padding-left:25px;padding-right:10px;padding-bottom:10px;border-left:solid 2px #007297;border-right:solid 2px #007297;">
							<b><%=news.getMessageHeader()%></b>
						</div>
						<div style = "background: #F0F8FF;padding-top:15px;padding-left:15px;padding-right:15px;padding-bottom:15px; height=650px;border-left:solid 2px #007297;border-bottom:solid 2px #007297;border-right:solid 2px #007297;border-bottom-left-radius: 2em;border-bottom-right-radius: 2em;">
							<%if(news!=null){ %>
								<p style="font-size: 12;text-align:justify;text-indent: 1cm;color: #007297; height:280px;line-height:25px; font-family: sans-serif;">
									<%=news.getMessage() %>	
								</p>
							<%} %>	
							
						<button id="close" type="button" class="btn btn-primary" value="Close" onclick="doClose('<%=request.getContextPath()%>');">Back</button>	
					    </div>
				   </div>
				   <div style="background: #82BACC;float: right;width:29% ;height: 100% ;border-right:solid 2px #007297;border-left:solid 2px #007297;" >
				   		<h4 style="padding-left:25px;color:white;"><b>Latest News</b><img src="images/new.gif" style="padding-left:7px;"></h4>
				   </div>
				   <div id="right" style="float: right; border:solid 2px #007297;background: #F0F8FF;border-bottom-left-radius:25px;padding-top:25px;padding-left:25px;padding-right:25px;padding-bottom:25px;border-bottom-right-radius: 25px; width: 25.8%">
				   		<marquee style="padding-left:15px;padding-right:5px;height:360px;" onmouseover="stop();"onmouseout="start();"scrollAmount="2" direction="up">
				   			<%if(newsList!=null){ 
				   				for(CommonStringList newsObj:newsList){%>
				   				<p style="font-size: 12;color: #007297;font-family: sans-serif; padding-top: 10px;"><a id="linkId" href=# onclick="onSubmit('<%=newsObj.getId() %>')"><%=newsObj.getName() %></a></p>
				   			<%}}%>									
						</marquee>   
				   </div>
			</div>	    		
		</form>
	</body>
</html>