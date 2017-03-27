package org.chatbot.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;













import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.chatbot.service.ChatbotManager;
import org.chatbot.util.ChatBotList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ChatbotController {
	@Autowired(required=true)
	ChatbotManager chatbotManager;
		
	@RequestMapping(value="/chatBot", method=RequestMethod.GET)
	public ModelAndView onLoadChatBot(HttpServletRequest request)
	{	
		ModelAndView modelView=null;
		
		try{
			modelView = new ModelAndView();
			modelView.setViewName("chatBot");				
		    
		    List<String> regionsList= chatbotManager.getRegionList();
	        modelView.addObject("regionsList", regionsList);
	        
	        List<String> ageRangeList= chatbotManager.getAgeRangeList();
	        modelView.addObject("ageRangeList", ageRangeList);
	        
	        List<String> symptomList= chatbotManager.getSymptomList(null,null);
	        modelView.addObject("symptomList", new JSONArray(symptomList));
					        
		}finally{			
			
		}
		return modelView;
	}
	
	
	@RequestMapping(value="/chatBotPage", method=RequestMethod.GET)
	public ModelAndView onLoadChatBotPage(HttpServletRequest request)
	{	
		ModelAndView modelView=null;
		
		try{
			modelView = new ModelAndView();
			modelView.setViewName("chatBotPage");				
		    
		    List<String> regionsList= chatbotManager.getRegionList();
	        modelView.addObject("regionsList", regionsList);
	        
	        List<String> ageRangeList= chatbotManager.getAgeRangeList();
	        modelView.addObject("ageRangeList", ageRangeList);
	        
	        List<String> symptomList= chatbotManager.getSymptomList(null,null);
	        modelView.addObject("symptomList", new JSONArray(symptomList));
					        
		}finally{			
			
		}
		return modelView;
	}
	
/*	@RequestMapping(value="/chatbotGetResultsforResult", method=RequestMethod.POST)
	public ModelAndView chatbotGetResultsforResult(HttpServletRequest request)
	{	
		ModelAndView modelView=null;
		
		try{
			modelView = new ModelAndView();
			modelView.setViewName("chatbotGetResultsforResult");				
		    
		  
					        
		}finally{			
			
		}
		return modelView;
	}*/
	
	@RequestMapping(value="/chatbotGetResultsforResult", method=RequestMethod.GET)
	public ModelAndView getChatbotGetResultsforResult(HttpServletRequest request) throws IOException, JSONException{			
		ModelAndView modelView = new ModelAndView();
		String diseaseName = null;
		List<String> diseaseList = null;
		String diseaseDesc = null;
		
		try{			
			modelView.setViewName("chatbotGetResultsforResult");	
			
			//String symptoms="headaches,chest pain,shortness of breath,diarrhoea";
			String symptoms=request.getParameter("symptoms");	
			String memberId=request.getParameter("memberId");
			String demographyVal=request.getParameter("demographyVal");
			String ageRangeVal=request.getParameter("ageRangeVal");
			String gender=request.getParameter("gender");
			modelView.addObject("memberId", memberId);
			modelView.addObject("demographyVal", demographyVal);
			modelView.addObject("ageRangeVal", ageRangeVal);
			modelView.addObject("gender", gender);
			modelView.addObject("symptoms", symptoms);
			diseaseList = chatbotManager.getDiseaseList(symptoms);
			modelView.addObject("diseaseList", diseaseList);
			/*diseaseName = diseaseList.getString(0);*/
			diseaseName = diseaseList.get(0);
			modelView.addObject("diseaseName", diseaseName);
			diseaseDesc = chatbotManager.getDiseaseDesc("Heart Attack");
			modelView.addObject("diseaseDesc", diseaseDesc);
			/*String jsonFile = "C:/Users/sandhiya.sekar/Desktop/RamPrasad/jsonFile.json";
	         String apiFile = "C:/Users/sandhiya.sekar/Desktop/RamPrasad/apiInfo.txt";
            readApiInfo(apiFile);
	        readJson(jsonFile);
	        String readmissionScore = rrsHttpPost();
	        modelView.addObject("readmissionScore", readmissionScore);*/
			String subjectId="23";
			String admissionId="124321";
			
			List<ChatBotList> eventsMoveList=chatbotManager.getEventsMoveList(subjectId,admissionId);
            modelView.addObject("eventsMoveList",eventsMoveList);
            List<ChatBotList> icuStayesList=chatbotManager.getIcuStayesList(subjectId,admissionId);
            modelView.addObject("icuStayesList",icuStayesList);
            List<ChatBotList> microBiologyEventList=chatbotManager.getMicroBiologyEventList(subjectId,admissionId);
            modelView.addObject("microBiologyEventList",microBiologyEventList);
            List<ChatBotList> patientsList=chatbotManager.getPatientsList(subjectId);
            modelView.addObject("patientsList",patientsList);
            List<ChatBotList> DICDProceduresList=chatbotManager.getDICDProceduresList(subjectId,admissionId);
            modelView.addObject("DICDProceduresList",DICDProceduresList);
            
            
            
		}
		finally{} 	
		return modelView;
	}
	
	@RequestMapping(value="/chatbotGetResults", method=RequestMethod.POST)
	public @ResponseBody void getEmergencyType(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException{			
		PrintWriter out = response.getWriter();
		String diseaseName = null;
		List<String> diseaseList = null;
		String diseaseDesc = null;
		JSONObject data = null;
		try{				
			String symptoms=request.getParameter("symptoms");			
			diseaseList = chatbotManager.getDiseaseList(symptoms);
			/*diseaseName = diseaseList.getString(0);*/
			diseaseName = diseaseList.get(0);
			diseaseDesc = chatbotManager.getDiseaseDesc("Heart Attack");
			
			String jsonFile = "C:/Users/sandhiya.sekar/Desktop/RamPrasad/jsonFile.json";
	         String apiFile = "C:/Users/sandhiya.sekar/Desktop/RamPrasad/apiInfo.txt";
            readApiInfo(apiFile);
	        readJson(jsonFile);
	        String readmissionScore = rrsHttpPost();
			
			data = new JSONObject();
			data.put("diseaseList", diseaseList);
			data.put("diseaseName", diseaseName);
			data.put("diseaseDesc", diseaseDesc);
			data.put("readmissionScore", readmissionScore);
			out.println(data);
		}
		finally{} 				 
	}	
	
	public static String apikey;
    public static String apiurl;
    public static String jsonBody;
    public static void readJson(String filename) {
        try {
            File apiFile = new File(filename);
            Scanner sc = new Scanner(apiFile);
            jsonBody = "";
            while (sc.hasNext()) {
                jsonBody += sc.nextLine()+"\n";
            }
        }
        catch (Exception e){
            System.out.println(e.toString());
        }
    }	    
    public static void readApiInfo(String filename) {
        
        try {
            File apiFile = new File(filename);
            Scanner sc = new Scanner(apiFile);
            
            apiurl = sc.nextLine();
            apikey = sc.nextLine();
            
        }
        catch (Exception e){
            System.out.println(e.toString());
        }
        
    }	   
    public static String rrsHttpPost() {
        
        HttpPost post;
        HttpClient client;
        StringEntity entity;
        
        try {	           
            post = new HttpPost(apiurl);
            client = HttpClientBuilder.create().build();
            entity = new StringEntity(jsonBody, HTTP.UTF_8);
            entity.setContentEncoding(HTTP.UTF_8);
            entity.setContentType("text/json");

            // add HTTP headers
            post.setHeader("Accept", "text/json");
            post.setHeader("Accept-Charset", "UTF-8");
        
            // set Authorization header based on the API key
            post.setHeader("Authorization", ("Bearer "+apikey));
            post.setEntity(entity);

            // Call REST API and retrieve response content
            HttpResponse authResponse = client.execute(post);
            
            /*return EntityUtils.toString(authResponse.getEntity());*/
            
            String data = EntityUtils.toString(authResponse.getEntity());
            JSONObject jsonObj = new JSONObject(data);
            JSONObject Results = jsonObj.getJSONObject("Results");
            JSONObject output1 = Results.getJSONObject("output1");
            JSONObject value = output1.getJSONObject("value");
            JSONArray Values = value.getJSONArray("Values");
            JSONArray reAdmission = Values.getJSONArray(0);
            String readmissionScore = reAdmission.getString(1);
            Double readmissionScore1 = reAdmission.getDouble(1);
            
            String myNumber = new BigDecimal(readmissionScore).toPlainString();
            
            BigDecimal score = BigDecimal.valueOf(readmissionScore1);
            
           String message = NumberFormat.getPercentInstance().format(score);
            
           /*BigDecimal myNumber1 = new BigDecimal(readmissionScore);
           myDouble = myNumber.doubleValue();
           
           double value1 = Math.floor(value1 * 100) / 100; 
           NumberFormat.getPercentInstance().format(value);*/

           /*int myInt = myNumber.intValue();*/
            // or
           /* myDouble = myNumber.doubleValue();*/
            return (myNumber + "," + message);
           
        }
        catch (Exception e) {
            return e.toString();
        	/* e.printStackTrace();*/
        }
       
    }
}