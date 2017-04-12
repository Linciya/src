package gov.shdrc.reports.service.impl;

import java.util.List;

import gov.shdrc.reports.dao.ICommonReportDAO;
import gov.shdrc.reports.dao.IMAReportDAO;
import gov.shdrc.reports.service.IMAReportManager;
import gov.shdrc.util.CommonStringList;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MAReportManagerImpl implements IMAReportManager {
	@Autowired
	ICommonReportDAO commonReportDAO;
	@Autowired
	IMAReportDAO maReportDAO;
	
	@Override
	public JSONArray getMAIndicatorList(int directorateId,
			String indicatorCategory, int year, String month, String loggedUser) {		
		return maReportDAO.getMAIndicatorList(directorateId, indicatorCategory, year, month, loggedUser);
	}
	@Override
	public JSONArray getDistrictwiseIndicaotrDetails(int directorateID,
			String indicatorCategory, String indicatorName, int year,
			String month, String loggedUser) {		
		return maReportDAO.getDistrictwiseIndicaotrDetails(directorateID, indicatorCategory, indicatorName, year, month, loggedUser);
	}
	@Override
	public JSONArray getInstitutionwiseIndicaotrDetails(int directorateID,
			String indicatorCategory, String indicatorName,
			String districtName, int year, String month, String loggedUser) {		
		return maReportDAO.getInstitutionwiseIndicaotrDetails(directorateID, indicatorCategory, indicatorName, districtName, year, month, loggedUser);
	}
	public CommonStringList getDashboardIntMaxMonthAndYear(int directorateId,String indicatorCategory){
		return maReportDAO.getDashboardIntMaxMonthAndYear(directorateId, indicatorCategory);
	}
	public JSONArray getFreeHandZoneData(int directorate,String category,String indName,int year){
		return maReportDAO.getFreeHandZoneData(directorate,category,indName,year);
	}
	public List getFreeHandZoneIndCategory(int directorateId){
		return maReportDAO.getFreeHandZoneIndCategory(directorateId);
	}
	@Override
	public List<CommonStringList> getFreeHandZoneIndNamesByCategory(int directorateId,String category) {
		// TODO Auto-generated method stub
		return maReportDAO.getFreeHandZoneIndNamesByCategory(directorateId,category);
	}
	@Override
	public List getIndYearByNameandCategory(int directorate,String indCategory,String indName) {
		// TODO Auto-generated method stub
		return maReportDAO.getIndYearByNameandCategory(directorate,indCategory,indName);
	}
	//Reports Zone
	@Override
	public JSONArray getReportZoneData(Integer directorateId,String reportName,Integer fromYear,String fromMonth,Integer toYear,String toMonth,String userName){
		return maReportDAO.getReportZoneData(directorateId,reportName,fromYear,fromMonth,toYear,toMonth,userName);
	}
	
	//Analysis Zone
	@Override
	public JSONArray getAnalysisZoneData(Integer directorateId,String analysisReportName,Integer year,String month,String userName,String regionName){
		return maReportDAO.getAnalysisZoneData(directorateId,analysisReportName,year,month,userName,regionName);
	}
	//Indicator Zone	
	public List<String> getIndicatorCategories(int directorateId) {
		return commonReportDAO.getIndicatorCategories(directorateId);
	}

	public JSONArray getIndicatorPvtStateData(int directorateId, String category,
			String fromMonth, int fromYear, String toMonth, int toYear,
			String username) {
		return commonReportDAO.getIndicatorPvtStateData(directorateId, category, fromMonth, fromYear, toMonth, toYear, username);
	}

	public JSONArray getIndicatorPvtDistrictData(int directorateId, String category,
			String indicator, String generalCategory, String fromMonth, int fromYear, String toMonth,
			int toYear, String username) {
		return commonReportDAO.getIndicatorPvtDistrictData(directorateId, category, indicator, generalCategory, 
				fromMonth, fromYear, toMonth, toYear, username);
	}

	public List<String> getGeneralCategory(int directorateId,String indicator) {
		return commonReportDAO.getGeneralCategory(directorateId,indicator);
	}
	
	public JSONArray getIndicatorPvtInstitutionData(int directorateId,String indicatorCategory, String indicator, String generalCategory,
			String district, String fromMonth, int fromYear, String toMonth,int toYear, String userName) {
		return commonReportDAO.getIndicatorPvtInstitutionData(directorateId,indicatorCategory,indicator,generalCategory,
				district,fromMonth,fromYear,toMonth,toYear,userName);
	}
}
