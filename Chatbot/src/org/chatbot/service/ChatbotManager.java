package org.chatbot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.chatbot.dao.ChatbotDAO;
import org.chatbot.util.ChatBotList;
import org.json.JSONArray;

@Service
public class ChatbotManager{
	@Autowired
	ChatbotDAO ChatbotDAO;
	
	public List<String> getRegionList() {
		return ChatbotDAO.getRegionList();
	}
	public List<String> getAgeRangeList() {
		return ChatbotDAO.getAgeRangeList();
	}
	public String getDiseaseDesc(String diseaseName){
		return ChatbotDAO.getDiseaseDesc(diseaseName);
	}
	public List<String> getSymptomList(String gender, String ageRange){
		return ChatbotDAO.getSymptomList(gender,ageRange);
	}
	public List<String> getDiseaseList(String symptoms){
		return ChatbotDAO.getDiseaseList(symptoms);
	}
	public List<ChatBotList> getEventsMoveList(String subjectId, String admissionId) {
		return ChatbotDAO.getEventsMoveList(subjectId,admissionId);
	}
	public List<ChatBotList> getIcuStayesList(String subjectId, String admissionId) {
		return ChatbotDAO.getIcuStayesList(subjectId,admissionId);
	}
	public List<ChatBotList> getMicroBiologyEventList(String subjectId, String admissionId) {
		return ChatbotDAO.getMicroBiologyEventList(subjectId,admissionId);

	}
	public List<ChatBotList> getPatientsList(String subjectId) {
		return ChatbotDAO.getPatientsList(subjectId);
	}
	public List<ChatBotList> getDICDProceduresList(String subjectId, String admissionId) {
		return ChatbotDAO.getDICDProceduresList(subjectId,admissionId);
	}
}
