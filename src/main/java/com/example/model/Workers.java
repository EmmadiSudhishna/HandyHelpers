
package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import servletpack.Cryptography;
import servletpack.DBConnection;

public class Workers implements Serializable {
	private int workerId;
	private String fullName;
	private String registrationDate;
	private String serviceName;
	private String mobile;
	private String currentAddress;
	private String cities;
	private String workerPic;
	private String aadhaarPic;
	private String password;
	private String status;

	public Workers() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Workers(int workerId, String fullName, String registrationDate, String serviceName, String mobile,
			String currentAddress, String cities, String workerPic, String aadhaarPic, String password, String status) {
		super();
		this.workerId = workerId;
		this.fullName = fullName;
		this.registrationDate = registrationDate;
		this.serviceName = serviceName;
		this.mobile = mobile;
		this.currentAddress = currentAddress;
		this.cities = cities;
		this.workerPic = workerPic;
		this.aadhaarPic = aadhaarPic;
		this.password = password;
		this.status = status;
	}

	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCurrentAddress() {
		return currentAddress;
	}

	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}

	public String getCities() {
		return cities;
	}

	public void setCities(String cities) {
		this.cities = cities;
	}

	public String getWorkerPic() {
		return workerPic;
	}

	public void setWorkerPic(String workerPic) {
		this.workerPic = workerPic;
	}

	public String getAadhaarPic() {
		return aadhaarPic;
	}

	public void setAadhaarPic(String aadharPic) {
		this.aadhaarPic = aadharPic;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int addWorker() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			String qry = "Insert into workers(fullName, registrationDate, serviceName, mobile, currentAddress, cities, workerPic, aadhaarPic, password, status) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, fullName);
			pst.setDate(2, Date.valueOf(LocalDate.now()));
			pst.setString(3, serviceName);
			pst.setString(4, mobile);
			pst.setString(5, currentAddress);
			pst.setString(6, cities);
			pst.setString(7, workerPic);
			pst.setString(8, aadhaarPic);
			pst.setString(9, password);
			pst.setString(10, status);
			n = pst.executeUpdate();
			System.out.println("worker qry= " + pst.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
		return n;
	}

	///
	public boolean validateLogin() {
		boolean flag = false;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();
		if (conn == null) {
			flag = false;
		} else {
			try {
				String qry = "Select * from workers where mobile=? and password=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.mobile);
				pst.setString(2, this.password);
				ResultSet rs = pst.executeQuery();

				if (rs.next()) {
					this.workerId=rs.getInt("workerId");
					flag = true;
				} else {
					flag = false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	// view
	public List<Workers> getAllWorkers(String search) {
	    List<Workers> workerList = new ArrayList<Workers>();
	    
	    try {
	        DBConnection db = new DBConnection();
	        Connection conn = db.getConnection();
	        
	        String qry = "";
	        if (search == null) {
	            qry = "select workerId, fullName, registrationDate, serviceName, mobile, currentAddress,cities, workerPic,aadhaarPic, status from workers order by workerId";
	        } else {
	            search = search.toLowerCase();
	            String words[]= search.split(" ");
	            String columnNames[]= {"fullName", "serviceName", "mobile", "cities"};
	            qry = "select workerId, fullName, registrationDate, serviceName, mobile, currentAddress,cities, workerPic, aadhaarPic, status from workers where ";
	            
	            for(String word: words) {
	            	for(String colName: columnNames) {
	            		qry+="lower("+colName+")like '%" + word + "%' or ";
	            	}
	            }
	            qry=qry.substring(0,qry.length()-3);
	            qry+="order by serviceName, cities";
	            System.out.println("qry="+qry);
	        }
	        
	        Statement st = conn.createStatement();
	        ResultSet rs = st.executeQuery(qry);
	        
	        while (rs.next()) {
	            Workers worker = new Workers();
	            worker.setWorkerId(rs.getInt("workerId"));
	            worker.setFullName(rs.getString("fullName"));
	            worker.setRegistrationDate(rs.getString("registrationDate"));
	            worker.setServiceName(rs.getString("serviceName"));
	            worker.setMobile(rs.getString("mobile"));
	            worker.setCurrentAddress(rs.getString("currentAddress"));
	            worker.setCities(rs.getString("cities"));
	            worker.setWorkerPic(rs.getString("workerPic"));
	            worker.setAadhaarPic(rs.getString("AadhaarPic"));
	            worker.setStatus(rs.getString("status"));
	            workerList.add(worker);
	        }
	    } catch (Exception e) {
	        System.out.println("Error: getAllWorkers..:" + e);
	    }
	    return workerList;
	}
	///
	
	public boolean deleteServiceById() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from workers where workerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.workerId);

			int n = pst.executeUpdate();

			if (n == 0) {
				flag = false;
			} else {
				flag = true;
			}
		} catch (Exception e) {
			flag = false;

		}
		return flag;
	}

	// viewing worker details in card in customerProfile
/////////////////////////////

	public List<Workers> getWorkerById(int workerId) {
		List<Workers> workerList = new ArrayList<Workers>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select workerId,fullName,serviceName,mobile,currentAddress,cities,workerPic,password from workers where workerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, workerId);
			ResultSet rs = pst.executeQuery();
			System.out.println("qryy =" + pst.toString());

			while (rs.next()) {
				Workers workers = new Workers();
				workers.setWorkerId(rs.getInt("workerId"));
				workers.setFullName(rs.getString("fullName"));
				workers.setServiceName(rs.getString("serviceName"));
				workers.setMobile(rs.getString("mobile"));
				workers.setCurrentAddress(rs.getString("currentAddress"));
				workers.setCities(rs.getString("cities"));
				workers.setWorkerPic(rs.getString("workerPic"));
				workers.setPassword(rs.getString("password"));
				workerList.add(workers);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return workerList;

	}
	
	///
	 public Workers getWorkerProfileById() {
	    	Workers worker=new Workers();
	    	try {
	    		DBConnection db=new DBConnection();
	    		Connection conn=db.getConnection();
	    		
	    		String qry="select workerId,fullName,serviceName,mobile,currentAddress,cities,workerPic,aadhaarPic,password from workers where workerId=?";
	    		PreparedStatement pst=conn.prepareStatement(qry);
	    		
	    		
	    		
	    		pst.setInt(1,  this.workerId);
	    		
	    		System.out.println("qry="+toString());
	    		ResultSet rs=pst.executeQuery();
	    		
	    		if(rs.next()) {
	    			worker.setWorkerId(rs.getInt("workerId"));
	    			worker.setFullName(rs.getString("fullName"));
					//worker.setRegistrationDate(rs.getString("registrationDate"));
					worker.setServiceName(rs.getString("serviceName"));
					worker.setMobile(rs.getString("mobile"));
					worker.setCurrentAddress(rs.getString("currentAddress"));
					worker.setCities(rs.getString("cities"));
					worker.setWorkerPic(rs.getString("workerPic"));
					worker.setAadhaarPic(rs.getString("aadhaarPic"));
					worker.setPassword(rs.getString("password"));
					//worker.setStatus(rs.getString("status"));
				} else {
					worker = null;
				}

			} catch (Exception e) {
				System.out.println("Error" + e);
			}
			return worker;
		}
	 
	 ////
	 public int updateWorkerByWorkerId() {
	        int n = 0;

	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            if (conn != null) {
	                String query = "UPDATE workers SET fullName=?, serviceName=?, mobile=?, currentAddress=?, "
	                             + "cities=?, password=? WHERE workerId=?";
	                PreparedStatement pst = conn.prepareStatement(query);
	                System.out.println("query=" + query);
	                pst.setString(1, this.fullName);
	                pst.setString(2, this.serviceName);
	                pst.setString(3, this.mobile);
	                pst.setString(4, this.currentAddress);
	                pst.setString(5, this.cities);
	                pst.setString(6, this.password);
	                pst.setInt(7, this.workerId);// Assuming registerDate is a string, adjust if it's a date
	                //pst.setString(7, this.status);

	                	System.out.println("query1="+pst.toString());
	                n = pst.executeUpdate();
	            }
	        } catch (Exception e) {
	            System.out.println("Error:"+e);
	        }

	        return n;
	    }
	 
	 
	 
	 public int statusUpdate() {
			int n = 0;
			try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();

				String qry = "update workers set status=? where workerId=?";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setString(1, status);
				pst.setInt(2, workerId);

				n = pst.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e);
			}
			return n;
	 
	    		
	    	}
	 
	 
	 public Workers getWorkerById() {
		    Workers workerRow = new Workers();
		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();
		        String qry = "select fullName, registrationDate, serviceName, mobile, currentAddress, cities, workerPic, password, status from workers where workerId=?";
		        PreparedStatement pst = conn.prepareStatement(qry);
		        pst.setInt(1, this.workerId);
		        ResultSet rs = pst.executeQuery();
		        
		        if (rs.next()) {
		            workerRow.setWorkerId(workerId);
		            workerRow.setFullName(rs.getString("fullName"));
		            workerRow.setRegistrationDate(rs.getString("registrationDate"));
		            workerRow.setServiceName(rs.getString("serviceName"));
		            workerRow.setMobile(rs.getString("mobile"));
		            workerRow.setCurrentAddress(rs.getString("currentAddress"));
		            workerRow.setCities(rs.getString("cities"));
		            workerRow.setWorkerPic(rs.getString("workerPic"));
		            
		            workerRow.setPassword(rs.getString("password"));
		            workerRow.setStatus(rs.getString("status"));
		            //.add(workerRow);
		        }
		    } catch (Exception e) {
		        System.out.println("Error: " + e);
		    }
		    return workerRow;
		}

	 
	
	 
	 
	 
}
	 


	    


