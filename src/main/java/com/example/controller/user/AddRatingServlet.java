package com.example.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Reviews;

/**
 * Servlet implementation class AddRatingServlet
 */
@WebServlet("/AddRatingServlet")
public class AddRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		//int userId=Integer.parseInt(request.getParameter("userId"));
		String workerId=request.getParameter("workerId");
		//String reviewDate=request.getParameter("reviewDate");
		String serviceName=request.getParameter("serviceName");
		int rating=Integer.parseInt(request.getParameter("rating"));
		String comments=request.getParameter("comments");
		
		HttpSession session=request.getSession();
		int userId=Integer.parseInt(session.getAttribute("userId").toString());
		
		Reviews review=new Reviews();
		
		review.setUserId(userId);
        review.setWorkerId(Integer.parseInt(workerId));
        //review.setReviewDate(reviewDate);
        review.setServiceName(serviceName);
        review.setRating(rating);
        review.setComments(comments);
        
        int n=review.addRatings();
        
        	response.sendRedirect("/HandyHelpers/User/ViewBookings.jsp?res="+n);
        	pw.close();
        
	}

}
