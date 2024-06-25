package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import servletpack.DBConnection;

public class Services implements Serializable{
	private String serviceName;
	private int serviceId;
	private String servicePic;
	public Services() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Services(String serviceName, int serviceId, String servicePic) {
		super();
		this.serviceName = serviceName;
		this.serviceId = serviceId;
		this.servicePic = servicePic;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServicePic() {
		return servicePic;
	}
	public void setServicePic(String servicePic) {
		this.servicePic = servicePic;
	}
	
	

	//Add  Service
	public int addServices() {
	    int n = 0;
	    DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();

	    if (conn == null) {
	        n = 0;
	    } else {
	        try {
	            String qry = "insert into services (serviceName,servicePic) VALUES (?,?)";
	            PreparedStatement pst = conn.prepareStatement(qry);
	           
	            pst.setString(1, this.serviceName);
	            pst.setString(2, this.servicePic);

	            System.out.println("qry11="+pst.toString());
	            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE
	            
	            
	        } catch (Exception e) {
	        	System.out.println("Error:"+e);
	            n=0;
	        } 
	    
	    
	}
		return n;

}
	
	
	//view
	public List<Services> getAllServices(){
		List<Services> serviceList=new ArrayList<Services>();
	
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select serviceId, serviceName, servicePic from services order by serviceId";
		    Statement st=(Statement) conn.createStatement();
		    ResultSet rs=st.executeQuery(qry);
		    
		    while(rs.next()) {
		    	Services service= new Services();
		    	service.setServiceId(rs.getInt("serviceId"));
		    	service.setServiceName(rs.getString("ServiceName"));
		    	service.setServicePic(rs.getString("ServicePic"));
		    	serviceList.add(service);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllServices..:" +e);
			
		}
		return serviceList;
	}
	
	
	
	//delete
	public boolean deleteServiceById() {
		boolean flag=false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from services where serviceId=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.serviceId);
		    
		    int n=pst.executeUpdate();
		    
		    if(n==0) {
		    	flag=false;
		    }else {
		    	flag=true;
		    }
		}catch(Exception e){
			flag=false;
			
		}
		return flag;
	}
	
	//get all services by Name
			public List<String> getAllServicesByName() {
				List<String> serviceList = new ArrayList<String>();
				int n = 0;

				try {
					DBConnection db = new DBConnection();
					Connection conn = db.getConnection();

					String qry = "SELECT  serviceName FROM services ORDER BY serviceName";
					Statement st = (Statement) conn.createStatement();

					ResultSet rs = st.executeQuery(qry);
					System.out.println("worker"+st.toString());
					
					// You might want to process the ResultSet here
					while (rs.next()) {
						
						serviceList.add(rs.getString("serviceName"));
						
					}

				} catch (Exception e) {
					e.printStackTrace(); // Handle the exception properly, e.g., log it
				}

				return serviceList;
			}
			
			public Services getServiceById() {
				Services serviceRow =new Services();
				try {
					DBConnection db=new DBConnection();
					Connection conn=db.getConnection();
					String qry="select serviceId, serviceName from services where serviceId=?";
					PreparedStatement pst=conn.prepareStatement(qry);
					pst.setInt(1, this.serviceId);
					
					
					ResultSet rs=pst.executeQuery();
					System.out.println("qry11:"+pst.toString());
					if(rs.next()) {
						serviceRow.setServiceId(rs.getInt("serviceId"));
						serviceRow.setServiceName(rs.getString("serviceName"));
					}else {
						serviceRow=null;
					}
					
				}catch(Exception e) {
					System.out.println("Error: "+e);
				}
				return serviceRow;
			}
			
			
			
			
			//update category table  by id
			public int UpdateServiceById() {
			    int n = 0;
			    try {
			    DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();

			       String qry = "update services set serviceName=? where serviceId=?";
			            PreparedStatement pst = conn.prepareStatement(qry);
			           
			            pst.setString(1, this.serviceName);
			            pst.setInt(2, this.serviceId);

			            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

			        } catch (Exception e) {
			            n=0;
			        } 
			    return n;
			    
			}
			
			
	
}
