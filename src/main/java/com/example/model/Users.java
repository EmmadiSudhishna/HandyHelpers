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

import servletpack.DBConnection;

public class Users implements Serializable {
	private int userId;
	private String fullName;
	private String registrationDate;
	private String mobile;
	private String password;
	private String profilePic;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(int userId, String fullName, String registrationDate, String mobile, String password,
			String profilePic) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.registrationDate = registrationDate;
		this.mobile = mobile;
		this.password = password;
		this.profilePic = profilePic;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	
	public int addUser() {
		int n=0;
		try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();
				String qry = "Insert into users(fullName, registrationDate,mobile,password, profilePic) values(?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				
				pst.setString(1,fullName);
				pst.setDate(2,Date.valueOf(LocalDate.now()));
				pst.setString(3,mobile);
				
				pst.setString(4,password);
				pst.setString(5, profilePic);
				n = pst.executeUpdate();
				System.out.println("worker qry= "+pst.toString());
		}catch(Exception e) {
			System.out.println(e);
		}
		return n;
	}
	
	public boolean validateLogin() {
		boolean flag = false;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();
		if (conn == null) {
			flag = false;
		} else {
			try {
				String qry = "Select * from users where mobile=? and password=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.mobile);
				pst.setString(2, this.password);
				ResultSet rs = pst.executeQuery();

				if (rs.next()) {
					this.userId=rs.getInt("userId");
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
	//view
			public List<Users> getAllUsers(){
				List<Users> userList=new ArrayList<Users>();
			
				try {
					DBConnection db = new DBConnection();
				    Connection conn = db.getConnection();
				    
				    String qry="select userId, fullName,registrationDate,mobile,password,profilePic from users order by userId";
				    Statement st=conn.createStatement();
				    ResultSet rs=st.executeQuery(qry);
				    
				    while(rs.next()) {
				    	Users user= new Users();
				    	 user.setUserId(rs.getInt("userId"));
				    	 user.setFullName(rs.getString("fullName"));
				    	 user.setRegistrationDate(rs.getString("registrationDate"));
				    	
				    	 user.setMobile(rs.getString("mobile"));
				    	 
				    	 user.setPassword(rs.getString("password"));
				    	 user.setProfilePic(rs.getString("profilePic"));
				    	 userList.add(user);
				    }
				}catch(Exception e) {
					System.out.println("Error:getAllUsers..:" +e);
					
				}
				return userList;
			}
			
			public boolean deleteServiceById() {
				boolean flag=false;
				try {
					DBConnection db = new DBConnection();
				    Connection conn = db.getConnection();
					
				    String qry="delete from users where userId=?";
				    PreparedStatement pst=conn.prepareStatement(qry);
				    pst.setInt(1,  this.userId);
				    
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
			
			public List<Users> getUserById(int userId) {
				List<Users> userList = new ArrayList<Users>();

				try {
					DBConnection db = new DBConnection();
					Connection conn = db.getConnection();

					String qry = "select userId,fullName,mobile,registrationDate,password,profilePic from users where userId=?";

					PreparedStatement pst = conn.prepareStatement(qry);
					pst.setInt(1, userId);
					ResultSet rs = pst.executeQuery();
					System.out.println("qryy =" + pst.toString());

					while (rs.next()) {
						Users user = new Users();
						user.setUserId(rs.getInt("userId"));
						user.setFullName(rs.getString("fullName"));
						user.setRegistrationDate(rs.getString("registrationDate"));
						user.setMobile(rs.getString("mobile"));
						user.setPassword(rs.getString("password"));
						user.setProfilePic(rs.getString("profilePic"));
						userList.add(user);
					}

				} catch (Exception e) {
					System.out.println("Eroor at getmethod=" + e);

				}
				return userList;

			}
			
			
			 public Users getUserProfileById() {
			    	Users user=new Users();
			    	try {
			    		DBConnection db=new DBConnection();
			    		Connection conn=db.getConnection();
			    		
			    		String qry="select userId,fullName,registrationDate,mobile,password from users where userId=?";
			    		PreparedStatement pst=conn.prepareStatement(qry);
			    		
			    		
			    		
			    		pst.setInt(1,  this.userId);
			    		
			    		System.out.println("qry="+toString());
			    		ResultSet rs=pst.executeQuery();
			    		
			    		if(rs.next()) {
			    			user.setUserId(rs.getInt("userId"));
			    			user.setFullName(rs.getString("fullName"));
							user.setRegistrationDate(rs.getString("registrationDate"));
							
							user.setMobile(rs.getString("mobile"));
							
							user.setPassword(rs.getString("password"));
							//worker.setStatus(rs.getString("status"));




						} else {
							user = null;
						}

					} catch (Exception e) {
						System.out.println("Error" + e);
					}
					return user;
				}
			 
			 
			 
			 public int updateUserByUserId() {
			        int n = 0;

			        try {
			            DBConnection db = new DBConnection();
			            Connection conn = db.getConnection();

			            if (conn != null) {
			                String query = "UPDATE users SET fullName=?, registrationDate=?, mobile=?,"
			                             + "password=? WHERE userId=?";
			                PreparedStatement pst = conn.prepareStatement(query);
			                System.out.println("query=" + query);
			                pst.setString(1, this.fullName);
			                pst.setString(2, this.registrationDate);
			                pst.setString(3, this.mobile);
			               
			                pst.setString(4, this.password);
			                pst.setInt(5, this.userId);// Assuming registerDate is a string, adjust if it's a date
			                //pst.setString(7, this.status);

			                	System.out.println("query1="+pst.toString());
			                n = pst.executeUpdate();
			            }
			        } catch (Exception e) {
			            System.out.println("Error:"+e);
			        }

			        return n;
			    }
			 
			    		
			    	}


			    
			 
			 

			
			
	
		
		
		
		


