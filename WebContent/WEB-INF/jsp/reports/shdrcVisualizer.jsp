<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SHDRC Visualizer</title>
	   <script type='text/javascript' src='jquery/jquery-1.11.1.min.js'></script> 
		<script src="js/d3.v3.min.js"></script>
				
		<style>		
		path {
		  stroke: #fff;
		  fill-rule: evenodd;
		}
		
		text {
		  font-family: Arial, sans-serif;
		  font-size: 12px;
		}
		
		.dropDown{
			width: 150px;
		}
		.node {
		  cursor: pointer;
		  }
		
		.node circle {
		  fill: #fff;
		  stroke: steelblue;
		  stroke-width: 1.5px;
		}
		.node text {
		  font: 10px sans-serif;
		  }
		
		.link {
		  fill: none;
		  stroke: #ccc;
		  stroke-width: 1.5px;
		  }
		  .pictureNames{
		  margin-top:23px;
		  maring-left:10px;
		  }
		  .graphsDiv{
		  margin-left:-5px;		
		  }
		  #overAllFlow svg{
		  height:470px;
		  }
		</style>
	</head>

<body style="width:100%;" onload="bodyOnLoad();">
<form id="visualizerForm" name="visualizerForm"><!-- action="TreeLevelServlet"   method="POST" -->

<div id="pictureNames" class="pictureNames">
<label style="margin-left:200px;">108 View</label>
		
</div><br>
 <div id="graphsDiv" class="graphsDiv" style="width:100%;margin-top: -30px;">
<div id="overAllFlow"  style="float:left;overflow:auto;width:51%;overflow-x:none;"></div>
<div id="overAllFlowSun"  style="float:right;overflow:auto;width:49%;overflow-x:none;"></div>
</div> 

</form>	

<!-- <script type='text/javascript' src="js/collapsibleintentend.js"></script>-->
<script type='text/javascript' src="js/overAllView.js"></script> 
<%-- <input type="hidden" id="treeLevelData" name="treeLevelData" value=<%=request.getAttribute("jsonData") %>> --%>
	
<!-- <script src="js/commonHandsontable.js"></script>	
<script src="jquery/jquery-handsontable-master/lib/jquery-ui/js/jquery-ui.custom.js"></script>
<script src="bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<link href="bootstrap-3.2.0-dist/css/bootstrap.min.css" rel="stylesheet"> -->
	
<script>	

<% String requestURL=request.getRequestURL().toString();
String contextPath=request.getContextPath();
int urlIndex = requestURL.lastIndexOf(contextPath);
String hostName=requestURL.substring(0,urlIndex);
String webUrl =hostName+contextPath+"/";

%>
var webUrl='<%=webUrl%>';
var filePath='/temp/../tables/';
var fileExtension='.html';



function bodyOnLoad(){
var data = <%=request.getAttribute("jsonData") %>;
getSunburstChart();
overAllView(data,webUrl,filePath,fileExtension);
}

function getSunburstChart(){
	var width1 = 600,
    height1 = 500,
    radius = Math.min(width1, height1) / 2;

var x = d3.scale.linear()
    .range([0, 2 * Math.PI]);

var y = d3.scale.linear()
    .range([0, radius]);

var color = d3.scale.category20c();

var svg1 = d3.select("#overAllFlowSun").append("svg")
    .attr("width", width1)
    .attr("height", height1)
  .append("g")
    .attr("transform", "translate(" + width1 / 2 + "," + (height1 / 2 + 10) + ")");

var partition = d3.layout.partition()
    .value(function(d) { return d.size; });

var arc = d3.svg.arc()
    .startAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))); })
    .endAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))); })
    .innerRadius(function(d) { return Math.max(0, y(d.y)); })
    .outerRadius(function(d) { return Math.max(0, y(d.y + d.dy)); });

/*d3.json(jsonData, function(error, root) {*/

var root =  constructData();

  var g = svg1.selectAll("g")
     .data(partition.nodes(root))
    .enter().append("g");

  var path = g.append("path")
    .attr("d", arc)
    .style("fill", function(d) { return color((d.children ? d : d.parent).name); })
    .on("click",  function(d){
    	  click(d);
    	  alertNodeText(d);
    	}); 

  var text = g.append("text")   
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + computeTextRotation(d) + ")"; })
        .attr('text-anchor', function (d) { return computeTextRotation(d) >90 ? "end" : "start"; })
        .attr('text-anchor', "middle")
        .attr('marign-left', "auto")
        .attr("dx", "7") // margin
        .attr("dy", ".50em") // vertical-align        
        .text(function(d) { return d.name; });

  function click(d) {
    // fade out all text elements
    text.transition().attr("opacity", 0);

    path.transition()
      .duration(750)
      .attrTween("d", arcTween(d))
      .each("end", function(e, i) {
          // check if the animated element's data e lies within the visible angle span given in d
          if (e.x >= d.x && e.x < (d.x + d.dx)) {
            // get a selection of the associated text element
            var arcText = d3.select(this.parentNode).select("text");
            // fade in the text element and recalculate positions
            arcText.transition().duration(750)
              .attr("opacity", 1)
             /* .attr("transform", function() { return "rotate(" + computeTextRotation(e) + ")" })*/
              /*.attr("x", function(d) { return y(d.y); });*/
               .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + computeTextRotation(d) + ")"; })
               .attr('text-anchor', function (d) { return computeTextRotation(d) > 180 ? "end" : "start"; })
          }
      });
  };

d3.select(self.frameElement).style("height", height1 + "px");

// Interpolate the scales!
function arcTween(d) {
  var xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx]),
      yd = d3.interpolate(y.domain(), [d.y, 1]),
      yr = d3.interpolate(y.range(), [d.y ? 20 : 0, radius]);
  return function(d, i) {
    return i
        ? function(t) { return arc(d); }
        : function(t) { x.domain(xd(t)); y.domain(yd(t)).range(yr(t)); return arc(d); };
  };
}

function computeTextRotation(d) {
/*  return (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;*/
	 var ang = (x(d.x + d.dx / 2) - Math.PI / 2) / Math.PI * 180;
     return (ang > 90) ? 180 + ang : ang;
}

function constructData(){		
	var data = <%=request.getAttribute("jsonData") %>;
	var dataMap = data.reduce(function(map, node) {
	    map[node.name] = node;
	    return map;
	}, {});

	// create the tree array
	var treearray = [];
	data.forEach(function(node) {
	    // add to parent
	    var parent = dataMap[node.parent];
	    delete node.parent;
	    if (parent) {
	        // create child array if it doesn't exist
	        (parent.children || (parent.children = []))
	            // add node to child array
	            .push(node);
	    } else {
	        // parent is null or missing
	        treearray.push(node);
	    }
	});
		var finaltreemap = {"name":"TamilNadu","children":treearray}
	/*  d3.json("json/flare.json", function(error, flare) {   */
		var flare = finaltreemap;
	
	
	return flare	
};

function alertNodeText(d){
	alert(d.name);
	}
	
	}

</script>
</body>	
</html>