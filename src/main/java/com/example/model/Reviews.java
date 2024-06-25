package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import servletpack.DBConnection;

public class Reviews implements Serializable {
	private int reviewId;
	private int userId;
	private int workerId;
	private String reviewDate;
	private String serviceName;
	private int rating;
	private String comments;
	public Reviews() {
		super();
	}
	public Reviews(int reviewId, int userId, int workerId, String reviewDate, String serviceName, int rating,
			String comments) {
		super();
		this.reviewId = reviewId;
		this.userId = userId;
		this.workerId = workerId;
		this.reviewDate = reviewDate;
		this.serviceName = serviceName;
		this.rating = rating;
		this.comments = comments;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "Reviews [reviewId=" + reviewId + ", userId=" + userId + ", workerId=" + workerId + ", reviewDate="
				+ reviewDate + ", serviceName=" + serviceName + ", rating=" + rating + ", comments=" + comments + "]";
	}
	
	
	
	//add rating
		public int addRatings() {
			int n=0;
			try{
				DBConnection db=new DBConnection();
				Connection conn=db.getConnection();
				
				

				String qry = "insert into reviews (reviewId,userId,workerId,reviewDate,serviceName,rating,comments) values(?,?,?,?,?,?,?)";

				PreparedStatement pst = conn.prepareStatement(qry);
				//pst.setInt(1, this.ratingId);
				pst.setInt(1, this.reviewId);
				pst.setInt(2, this.userId);
				pst.setInt(3, this.workerId);
				pst.setDate(4,Date.valueOf(LocalDate.now()));
				pst.setString(5, this.serviceName);
				pst.setInt(6, this.rating);
				pst.setString(7, this.comments);
				
				System.out.println("qry="+pst.toString());
				n = pst.executeUpdate();

			
			}catch(Exception e) {
				System.out.println("error: "+e);
			}
			return n;
		}
		
		/////
		public boolean isRatingGiven(int userId,int workerId) {
			boolean found=false;
			try{
				DBConnection db=new DBConnection();
				Connection conn=db.getConnection();
			
			String qry="select reviewId from reviews where userId=? and workerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, userId);
			pst.setInt(2, workerId);
			System.out.println("isRatingGiven qry="+pst.toString());
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				found=true;	
			}
		}catch(Exception e) {
			System.out.println("Error in Rating.isRatingGiven():"+e);
		}
			System.out.println("found="+found);
			return found;

		}

		
		
		///
		public List<Reviews> getAllRatingsByUserId(int userId){
			List<Reviews> reviewList=new ArrayList<>();
			
			try{
				DBConnection db=new DBConnection();
				Connection conn=db.getConnection();
			
				String qry="select reviewId,userId,workerId,reviewDate,serviceName,rating,comments from reviews where userId=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setInt(1, userId);
				ResultSet rs=pst.executeQuery();
				System.out.println("review= "+pst.toString());
				while(rs.next()) {
					Reviews review= new Reviews();
					review.setReviewId(rs.getInt("reviewId"));
					review.setUserId(rs.getInt("userId"));
					review.setWorkerId(rs.getInt("workerId"));
					review.setRating(rs.getInt("rating"));
					review.setReviewDate(rs.getString("reviewDate"));
					review.setServiceName(rs.getString("serviceName"));
					review.setComments(rs.getString("comments"));
					
					reviewList.add(review);
				}
				
			
			
		}catch(Exception e) {
			System.out.println("Where: "+e);
		}
			return reviewList;
	
		

		}
		
		
	////deleting///
		public static boolean deleteRating(int reviewId) {
	        boolean deleted = false;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "DELETE FROM reviews WHERE reviewId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setInt(1, reviewId);

	            int n = pst.executeUpdate();
	            if (n > 0) {
	                deleted = true;
	            }
	            conn.close();
	        } catch (Exception e) {
	           System.out.println("Error:");
	        }
	        return deleted;
	    }
		
		
		public static Reviews getRatingById(int reviewId) {
	        Reviews review = null;
	        try {
	            DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query = "SELECT * FROM reviews WHERE reviewId=?";
	            PreparedStatement pst = conn.prepareStatement(query);
	            pst.setInt(1, reviewId);
	            
	            System.out.println("ratingbyId="+pst.toString());
	            ResultSet rs = pst.executeQuery();

	            if (rs.next()) {
	                review = new Reviews();
	                review.setReviewId(rs.getInt("reviewId"));
	                review.setUserId(rs.getInt("userId"));
	                review.setWorkerId(rs.getInt("workerId"));
	                review.setRating(rs.getInt("rating"));
	                review.setReviewDate(rs.getString("reviewDate"));
					review.setServiceName(rs.getString("serviceName"));
	                review.setComments(rs.getString("comments"));
	                
	            }
	            conn.close();
	        } catch (Exception e) {
	            System.out.println("Error: "+e);
	        }
	        return review;
	    }

		///update//
		public int updateRating() {
		    int n = 0;
		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();

		        String query = "UPDATE reviews SET rating=?, comments=? WHERE reviewId=?";
		        System.out.println("Query: " + query);

		        PreparedStatement pst = conn.prepareStatement(query);
		        pst.setInt(1, this.rating);
		        pst.setString(2, this.comments);
	 // Set serviceName at index 3
		        pst.setInt(3, this.reviewId); // Set reviewId at index 4

		        System.out.println("Executing query: " + pst.toString());

		        n = pst.executeUpdate();
		    } catch (Exception e) {
		       System.out.println("Error: " + e);
		    }
		    return n;
		}

		public List<Reviews> getAllRatings(){
			List<Reviews> reviewList=new ArrayList<>();
			try {
				DBConnection db = new DBConnection();
	            Connection conn = db.getConnection();

	            String query="select * from reviews";
	            PreparedStatement pst=conn.prepareStatement(query);
	            ResultSet rs=pst.executeQuery();
	            
	            while(rs.next()) {
	            	Reviews review=new Reviews();
	            	review.setRating(rs.getInt("rating"));
	            	review.setReviewId(rs.getInt("reviewId"));
	            	review.setComments(rs.getString("comments"));
	            	review.setWorkerId(rs.getInt("workerId"));
	            	review.setUserId(rs.getInt("userId"));
	            	review.setServiceName(rs.getString("serviceName"));
	            	review.setReviewDate(rs.getString("reviewDate"));
	            	reviewList.add(review);
	            }
	            conn.close();
			}catch(Exception e) {
				System.out.println("Error:" +e);
			}
			return reviewList;
		}
		
		
		public List<Reviews> getReviewsByWorkerId(int workerId) {
		    List<Reviews> reviewsList = new ArrayList<>();
		    try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();

		        String query = "SELECT * FROM reviews WHERE workerId=?";
		        PreparedStatement pst = conn.prepareStatement(query);
		        pst.setInt(1, workerId);

		        System.out.println("ratingbyworkerId=" + pst.toString());
		        ResultSet rs = pst.executeQuery();

		        while (rs.next()) {
		            Reviews review = new Reviews();
		            review.setReviewId(rs.getInt("reviewId"));
		            review.setUserId(rs.getInt("userId"));
		            review.setWorkerId(rs.getInt("workerId"));
		            review.setRating(rs.getInt("rating"));
		            review.setReviewDate(rs.getString("reviewDate"));
		            review.setServiceName(rs.getString("serviceName"));
		            review.setComments(rs.getString("comments"));
		            reviewsList.add(review);
		        }
		        conn.close();
		    } catch (Exception e) {
		        System.out.println("Error: " + e);
		    }
		    return reviewsList;
		}

}
