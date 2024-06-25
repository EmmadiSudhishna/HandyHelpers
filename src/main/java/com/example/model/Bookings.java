package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import servletpack.DBConnection;

public class Bookings {
	private int bookingId;
	private String bookingDate;
	private int userId;
	private int workerId;
	private String serviceName;
	private String workerLatitude;
	private String workerLongitude;
	private String status;
	public Bookings() {
		super();
	}
	public Bookings(int bookingId, String bookingDate, int userId, int workerId, String serviceName,
			String workerLatitude, String workerLongitude, String status) {
		super();
		this.bookingId = bookingId;
		this.bookingDate = bookingDate;
		this.userId = userId;
		this.workerId = workerId;
		this.serviceName = serviceName;
		this.workerLatitude = workerLatitude;
		this.workerLongitude = workerLongitude;
		this.status = status;
	}
	
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getWorkerId() {
		return workerId;
	}
	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	
	public String getWorkerLatitude() {
		return workerLatitude;
	}
	public void setWorkerLatitude(String workerLatitude) {
		this.workerLatitude = workerLatitude;
	}
	public String getWorkerLongitude() {
		return workerLongitude;
	}
	public void setWorkerLongitude(String workerLongitude) {
		this.workerLongitude = workerLongitude;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	// Add Bookings
		public int addBookings() {
		
	int n = 0;
	DBConnection db = new DBConnection();
	Connection conn = db.getConnection();

	if (conn == null) {
		n = 0;
	} else {
		try {
			String qry = "insert into bookings(bookingId,bookingDate,userId,workerId,serviceName,WorkerLatitude,WorkerLongitude,status)values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setInt(1, this.bookingId);
			pst.setString(2, this.bookingDate);
			pst.setInt(3, this.userId);
			// pst.setString(4, this.productName);
			pst.setInt(4, this.workerId);
			pst.setString(5, this.serviceName);
			pst.setString(6, this.workerLatitude);

			pst.setString(7, this.workerLongitude);
			pst.setString(8, this.status);
				
			System.out.println("qry=" + pst.toString());
			n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

		} catch (Exception e) {
			n = 0;
		}

	}
	return n;
		}
		
		/// view
		public List<Bookings> getAllBookings() {
		    List<Bookings> bookingsList = new ArrayList<>();

		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();

		        String qry = "SELECT bookingId, bookingDate, userId, workerId, serviceName, workerLatitude, workerLongitude, status FROM bookings ORDER BY bookingId";
		        Statement st = (Statement) conn.createStatement();
		        ResultSet rs = st.executeQuery(qry);

		        while (rs.next()) {
		            Bookings bookings = new Bookings();
		            bookings.setBookingId(rs.getInt("bookingId"));
		            bookings.setBookingDate(rs.getString("bookingDate"));
		            bookings.setUserId(rs.getInt("userId"));
		            bookings.setWorkerId(rs.getInt("workerId"));
		            bookings.setServiceName(rs.getString("serviceName"));
		            bookings.setWorkerLatitude(rs.getString("workerLatitude"));
		            bookings.setWorkerLongitude(rs.getString("workerLongitude"));
		            bookings.setStatus(rs.getString("status"));

		            bookingsList.add(bookings);
		        }
		    } catch (Exception e) {
		        System.out.println("Error: " + e.getMessage());
		    }
		    return bookingsList;
		}
		
		public int WorkerStatusUpdate(int bookingId, String Status) {
			int n = 0;
			try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();

				String qry = "update bookings set Status=? where bookingId=?";
				PreparedStatement pst = conn.prepareStatement(qry);

				pst.setString(1, Status);
				pst.setLong(2, bookingId);

				n = pst.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e);
			}
			return n;
		}
		
		
		public List<Bookings> getAllBookingsByUserId(int userId) {
		    List<Bookings> bookingsList = new ArrayList<>();

		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();

		        String qry = "SELECT bookingId, bookingDate, userId, workerId, serviceName, workerLatitude, workerLongitude, status FROM bookings where userId=?";
		        PreparedStatement pst = conn.prepareStatement(qry);
		        pst.setInt(1, userId); // Set the user ID parameter

		        ResultSet rs = pst.executeQuery();

		        while (rs.next()) {
		            Bookings bookings = new Bookings();
		            bookings.setBookingId(rs.getInt("bookingId"));
		            bookings.setBookingDate(rs.getString("bookingDate"));
		            bookings.setUserId(rs.getInt("userId"));
		            bookings.setWorkerId(rs.getInt("workerId"));
		            bookings.setServiceName(rs.getString("serviceName"));
		            bookings.setWorkerLatitude(rs.getString("workerLatitude"));
		            bookings.setWorkerLongitude(rs.getString("workerLongitude"));
		            bookings.setStatus(rs.getString("status"));

		            bookingsList.add(bookings);
		        }
		    } catch (Exception e) {
		        System.out.println("Error: " + e.getMessage());
		    }
		    return bookingsList;
		}
		
		
		public Bookings getBookingById(int bookingId) {
		    Bookings bookings = new Bookings(); // Initialize to null initially

		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();

		        String qry = "SELECT bookingId, bookingDate, userId, workerId, serviceName, workerLatitude, workerLongitude, status FROM bookings WHERE bookingId=?";
		        PreparedStatement pst = conn.prepareStatement(qry);
		        pst.setInt(1, bookingId); // Set the bookingId parameter

		        ResultSet rs = pst.executeQuery();

		        if (rs.next()) {
		           
		            bookings.setBookingId(rs.getInt("bookingId"));
		            bookings.setBookingDate(rs.getString("bookingDate"));
		            bookings.setUserId(rs.getInt("userId"));
		            bookings.setWorkerId(rs.getInt("workerId"));
		            bookings.setServiceName(rs.getString("serviceName"));
		            
		           
		            bookings.setWorkerLatitude(rs.getString("workerLatitude"));
		            bookings.setWorkerLongitude(rs.getString("workerLongitude"));
		            bookings.setStatus(rs.getString("status"));
		        }
		    } catch (Exception e) {
		        System.out.println("Error: " + e.getMessage());
		        // Log or handle the exception appropriately
		    }

		    return bookings; // Return the bookings object, which could be null if no record was found
		}
		
		
		public List<Bookings> getBookingsByWorkerId(int workerId) {
	        List<Bookings> bookings = new ArrayList<>();
	        try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();
 
	           
	            String query = "SELECT * FROM bookings WHERE workerId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setInt(1, workerId);
	            ResultSet rs = pst.executeQuery();
	            
	            
	            while (rs.next()) {
	                Bookings booking = new Bookings();
	                booking.setBookingId(rs.getInt("bookingId"));
	                booking.setBookingDate(rs.getString("bookingDate"));
	                booking.setUserId(rs.getInt("userId"));
	                booking.setWorkerId(rs.getInt("workerId"));
	                booking.setServiceName(rs.getString("serviceName"));
	                booking.setWorkerLatitude(rs.getString("workerLatitude"));
	                booking.setWorkerLongitude(rs.getString("workerLongitude"));
	                booking.setStatus(rs.getString("status"));
	                bookings.add(booking);
	            }
	            conn.close();
	        } catch (Exception e) {
	           System.out.println("Error:"+e);
	            
	        }
	        return bookings;
	    }


}
