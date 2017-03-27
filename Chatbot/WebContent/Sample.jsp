<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div id="home">
			<div id="header" align="center" style="width:50%;height:40px;background-color: #78C0F0;border: 1px solid black;">Knowledge based Diagnostics
			</div>
			<div id="questionnaire" style="width:50%;height:590px;border: 1px solid black;overflow: auto;"></div>
			<button onclick="alertRadioValue();">Submit</button>
		</div>
		
		<script>
			var radio_home = document.getElementById("questionnaire");
			
			radio_home.append("Select category: Disease/Disorder");
			linebreak = document.createElement("br");
			radio_home.appendChild(linebreak); 
			
			function makeRadioButton(name, value, text,flag) {
				var label = document.createElement("label");
			    var radio = document.createElement("input");
			    if(flag=="y"){
			    	radio.type = "radio"; 
			    }
			    else{
			    	radio.type = "checkbox";
			    }
			    radio.name = name;
			    radio.value = value;
	
			    label.appendChild(radio);
	
			    label.appendChild(document.createTextNode(text));
			    return label;
			  }
	
			  var yes_button = makeRadioButton("yesbutton", "yes", "Oh yea! do it!","y");
			  radio_home.appendChild(yes_button);
			  var no_button = makeRadioButton("yesbutton", "No", "Oh yea! do it!","y");
			  radio_home.appendChild(no_button);
			  var no_button1 = makeRadioButton("yesbutton", "No", "Oh yea! do it!","y");
			  radio_home.appendChild(no_button1);
			  
			  function alertRadioValue(){
				   var radio_home1 = document.getElementsByName("yesbutton");
				   /* var analyzerChecked;
				  var i;
				    for (i = 0; i < radio_home.length; i++) {
				        if (radio_home[i].checked) {
				        		analyzerChecked =  radio_home[i].value ;
				        	
				        }
				    }*/
				    if ( ( radio_home1[0].checked == false ) && ( radio_home1[1].checked == false ) && ( radio_home1[2].checked == false ) ) {
						alert ( "Please select the option" ); 
						document.getElementsByName('yesbutton').focus();
						return false;
					}
				    /*  alert(analyzerChecked); */
				    else{
				    	for (var i = 0; i< radio_home1.length;  i++){
				    		radio_home1[i].disabled = true;
				    	}
				    	
				    	radio_home.append("Select disease name");
						linebreak = document.createElement("br");
						radio_home.appendChild(linebreak); 
				    	var yes_button = makeRadioButton("yesbutton1", "yes", "hi","n");
						  radio_home.appendChild(yes_button);
						  var no_button = makeRadioButton("yesbutton1", "No", "how r u","n");
						  radio_home.appendChild(no_button);
						  var no_button1 = makeRadioButton("yesbutton1", "No", "fine","n");
						  radio_home.appendChild(no_button1);
				    }
			  }
		</script>
	</body>
</html>