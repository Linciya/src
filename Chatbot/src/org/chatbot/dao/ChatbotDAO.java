package org.chatbot.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.chatbot.util.ChatBotList;
import org.chatbot.util.ChatbotQueryList;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;



@Service
public class ChatbotDAO{	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<String> getRegionList(){
		List<String> regionList=null;
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet =null;
		try {
			regionList=new ArrayList<String>();
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.REGION_LIST);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {	
	        	String regionName = resultSet.getString(1);
	        	regionList.add(regionName);	        	
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
				try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                	connection.close();
	                }	
	            } catch (SQLException ex) {
	            }	
			}	        
		return regionList;
	}
	
	public List<String> getAgeRangeList(){
		List<String> ageRangeList=null;
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet =null;
		try {
			ageRangeList=new ArrayList<String>();
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.AGE_RANGE_LIST);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {	
	        	String ageRange = resultSet.getString(1);
	        	ageRangeList.add(ageRange);	        	
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
				try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                	connection.close();
	                }	
	            } catch (SQLException ex) {
	            }	
			}	        
		return ageRangeList;
	}
	
	public List<String> getSymptomList(String gender, String ageRange){
		List<String> symptomList=null;
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet =null;
		try {
			symptomList=new ArrayList<String>();
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.SYMPTOM_LIST);
			preparedStatement.setString(1, gender);
			preparedStatement.setString(2, ageRange);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {	
	        	String symptom = resultSet.getString(1);
	        	symptomList.add(symptom);	        	
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception json){
			
		}
		finally{
				try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                	connection.close();
	                }	
	            } catch (SQLException ex) {
	            }	
			}	        
		return symptomList;
	}
	
	public List<String> getDiseaseList(String symptoms){
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet =null;
		List<String> diseaseList = null;
		try {
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.DISEASE_LIST);
			Array array=preparedStatement.getConnection().createArrayOf("text", symptoms.split(","));
			preparedStatement.setArray(1, array);
			resultSet = preparedStatement.executeQuery();
			diseaseList = new ArrayList<String>();
	        while (resultSet.next()) {	
	        	String diseaseName = resultSet.getString(1);
	        	diseaseList.add(diseaseName);
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
				try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                	connection.close();
	                }	
	            } catch (SQLException ex) {
	            }	
			}	        
		return diseaseList;
	}
	
	public String getDiseaseDesc(String diseaseName){
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet =null;
		String diseaseDesc = null;
		try {
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.DISEASE_DESCRIPTION);
			preparedStatement.setString(1, diseaseName);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {	
	        	diseaseDesc = resultSet.getString(1);
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
				try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                	connection.close();
	                }	
	            } catch (SQLException ex) {
	            }	
			}	        
		return diseaseDesc;
	}

	public List<ChatBotList> getEventsMoveList(String subjectId,
			String admissionId) {
		ChatBotList chatBotList=null;
		Connection connection = null;
	    PreparedStatement preparedStatement =null;
	    ResultSet resultSet =null;
	    List<ChatBotList> chatBotDetailsList =new ArrayList<ChatBotList>();
	    
		try {
			//log.debug(this.getClass().getName() + "- Entering ");
			chatBotDetailsList = new ArrayList<ChatBotList>();
			
			
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.PROCEDURE_EVENT_LIST);
			preparedStatement.setString(1, subjectId);
			preparedStatement.setString(2, admissionId);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	        	chatBotList =new ChatBotList();
	        	chatBotList.setStartTime(resultSet.getString(1));
	        	chatBotList.setEndTime(resultSet.getString(2));
	        	chatBotList.setValue(resultSet.getString(3));
	        	chatBotList.setValueoum(resultSet.getString(4));
	        	chatBotList.setStoreTime(resultSet.getString(7));
	        	chatBotList.setOrderCatname(resultSet.getString(8));
	        	chatBotList.setOrderCatDesc(resultSet.getString(10));
	        	chatBotList.setIsopenbag(resultSet.getString(11));
	        	chatBotList.setContinueinnextdept(resultSet.getString(12));
	        	chatBotList.setCancelreason(resultSet.getString(13));
	        	chatBotList.setStatusDescription(resultSet.getString(14));
	        	chatBotDetailsList.add(chatBotList);
	        }
		} catch (SQLException e) {
			
			System.out.println("- chatBotDetailsList "+e);
		}
	    
	    
		finally{
			try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	            	connection.close();
	            }

	        } catch (SQLException ex) {
	        }

		}
		System.out.println("chatBotDetailsList"+chatBotDetailsList);
		return chatBotDetailsList;
	}

	public List<ChatBotList> getIcuStayesList(String subjectId,
			String admissionId) {
		ChatBotList chatBotList=null;
		Connection connection = null;
	    PreparedStatement preparedStatement =null;
	    ResultSet resultSet =null;
	    List<ChatBotList> chatBotDetailsList =new ArrayList<ChatBotList>();
	    
		try {
			//log.debug(this.getClass().getName() + "- Entering ");
			chatBotDetailsList = new ArrayList<ChatBotList>();
			
			
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.ICU_STAYES_LIST);
			preparedStatement.setString(1, subjectId);
			preparedStatement.setString(2, admissionId);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	        	chatBotList =new ChatBotList();
	        	chatBotList.setDbSource(resultSet.getString(1));
	        	chatBotList.setFirstCareunit(resultSet.getString(2));
	        	chatBotList.setLastCareunit(resultSet.getString(3));
	        	chatBotList.setIntime(resultSet.getString(4));
	        	chatBotList.setOuttime(resultSet.getString(5));
	        	chatBotList.setLostext(resultSet.getString(6));
	        	chatBotDetailsList.add(chatBotList);
	        }
		} catch (SQLException e) {
			
			System.out.println("- chatBotDetailsList "+e);
		}
	    
	    
		finally{
			try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	            	connection.close();
	            }

	        } catch (SQLException ex) {
	        }

		}
		System.out.println("chatBotDetailsList"+chatBotDetailsList);
		return chatBotDetailsList;
	}

	public List<ChatBotList> getMicroBiologyEventList(String subjectId,
			String admissionId) {
		ChatBotList chatBotList=null;
		Connection connection = null;
	    PreparedStatement preparedStatement =null;
	    ResultSet resultSet =null;
	    List<ChatBotList> chatBotDetailsList =new ArrayList<ChatBotList>();
	    
		try {
			//log.debug(this.getClass().getName() + "- Entering ");
			chatBotDetailsList = new ArrayList<ChatBotList>();
			
			
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.MICRO_BIOLOGY_EVENT_LIST);
			preparedStatement.setString(1, subjectId);
			preparedStatement.setString(2, admissionId);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	        	chatBotList =new ChatBotList();
	        	chatBotList.setChartDate(resultSet.getString(1));
	        	chatBotList.setChartTime(resultSet.getString(2));
	        	chatBotList.setSpecTypeDesc(resultSet.getString(3));
	        	chatBotDetailsList.add(chatBotList);
	        }
		} catch (SQLException e) {
			
			System.out.println("- chatBotDetailsList "+e);
		}
	    
	    
		finally{
			try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	            	connection.close();
	            }

	        } catch (SQLException ex) {
	        }

		}
		System.out.println("chatBotDetailsList"+chatBotDetailsList);
		return chatBotDetailsList;
	}

	public List<ChatBotList> getPatientsList(String subjectId) {
		ChatBotList chatBotList=null;
		Connection connection = null;
	    PreparedStatement preparedStatement =null;
	    ResultSet resultSet =null;
	    List<ChatBotList> chatBotDetailsList =new ArrayList<ChatBotList>();
	    
		try {
			//log.debug(this.getClass().getName() + "- Entering ");
			chatBotDetailsList = new ArrayList<ChatBotList>();
			
			
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.PATIENT_LIST);
			preparedStatement.setString(1, subjectId);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	        	chatBotList =new ChatBotList();
	        	chatBotList.setGender(resultSet.getString(1));
	        	chatBotList.setDob(resultSet.getString(2));
	        	chatBotList.setDod(resultSet.getString(3));
	        	chatBotDetailsList.add(chatBotList);
	        }
		} catch (SQLException e) {
			
			System.out.println("- chatBotDetailsList "+e);
		}
	    
	    
		finally{
			try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	            	connection.close();
	            }

	        } catch (SQLException ex) {
	        }

		}
		System.out.println("chatBotDetailsList"+chatBotDetailsList);
		return chatBotDetailsList;
	}

	public List<ChatBotList> getDICDProceduresList(String subjectId,
			String admissionId) {
		ChatBotList chatBotList=null;
		Connection connection = null;
	    PreparedStatement preparedStatement =null;
	    ResultSet resultSet =null;
	    List<ChatBotList> chatBotDetailsList =new ArrayList<ChatBotList>();
	    
		try {
			//log.debug(this.getClass().getName() + "- Entering ");
			chatBotDetailsList = new ArrayList<ChatBotList>();
			
			
			connection=jdbcTemplate.getDataSource().getConnection();
			preparedStatement = connection.prepareStatement(ChatbotQueryList.D_ICD_LIST);
			preparedStatement.setString(1, subjectId);
			preparedStatement.setString(2, admissionId);
			resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	        	chatBotList =new ChatBotList();
	        	chatBotList.setIcdCode(resultSet.getString(1));
	        	chatBotList.setShortTitle(resultSet.getString(2));
	        	chatBotList.setLong_Title(resultSet.getString(3));
	        	chatBotList.setSeq_num(resultSet.getString(4));

	        	chatBotDetailsList.add(chatBotList);
	        }
		} catch (SQLException e) {
			
			System.out.println("- chatBotDetailsList "+e);
		}
	    
	    
		finally{
			try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	            	connection.close();
	            }

	        } catch (SQLException ex) {
	        }

		}
		System.out.println("chatBotDetailsList"+chatBotDetailsList);
		return chatBotDetailsList;
	}
	
	
	

	
	
}
