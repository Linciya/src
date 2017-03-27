package org.chatbot.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ChatbotQueryList {
	public static String REGION_LIST = null;
	public static String AGE_RANGE_LIST = null;
	public static String DISEASE_DESCRIPTION = null;
	public static String SYMPTOM_LIST = null;
	public static String DISEASE_LIST = null;
	public static String PROCEDURE_EVENT_LIST = null;
	public static String ICU_STAYES_LIST = null;
	public static String MICRO_BIOLOGY_EVENT_LIST = null;
	public static String PATIENT_LIST = null;
	public static String D_ICD_LIST = null;
	
	
	
	
	
	
	
	
	public static void loadParameters() {
		Properties properties = null;
		try {
			properties = new Properties();
			InputStream inputStream = ChatbotQueryList.class.getClassLoader()
					.getResourceAsStream("chatbotquery.properties");
			properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (properties != null) {
			REGION_LIST = properties.getProperty("REGION_LIST");			
			AGE_RANGE_LIST = properties.getProperty("AGE_RANGE_LIST");
			DISEASE_DESCRIPTION = properties.getProperty("DISEASE_DESCRIPTION");
			SYMPTOM_LIST = properties.getProperty("SYMPTOM_LIST");
			DISEASE_LIST = properties.getProperty("DISEASE_LIST");
			PROCEDURE_EVENT_LIST = properties.getProperty("PROCEDURE_EVENT_LIST");
			ICU_STAYES_LIST = properties.getProperty("ICU_STAYES_LIST");
			MICRO_BIOLOGY_EVENT_LIST = properties.getProperty("MICRO_BIOLOGY_EVENT_LIST");
			PATIENT_LIST = properties.getProperty("PATIENT_LIST");
			D_ICD_LIST = properties.getProperty("D_ICD_LIST");

			
		}
	}

}
