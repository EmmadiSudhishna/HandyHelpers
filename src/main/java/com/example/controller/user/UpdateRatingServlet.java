package com.example.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.example.model.Reviews;

/**
 * Servlet implementation class UpdateRatingServlet
 */
@WebServlet("/UpdateRatingServlet")
public class UpdateRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRatingServlet() {
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
	        PrintWriter out = response.getWriter();

	        int reviewId = Integer.parseInt(request.getParameter("reviewId"));
	        int rating = Integer.parseInt(request.getParameter("rating"));
	        String comments = request.getParameter("comments");
	       // String serviceName = request.getParameter("serviceName"); 

	        Reviews review = new Reviews();
	        review.setReviewId(reviewId);
	        review.setRating(rating);
	        review.setComments(comments);
	        //review.setServiceName(serviceName); 

	        int n = review.updateRating();

	        if (n > 0) {
	            response.sendRedirect("/HandyHelpers/User/Review.jsp?res=" + n);
	        } else {
	            // Handle the case when update fails
	            // You may redirect to an error page or display a message
	            response.sendRedirect("/error.jsp");
	        }
	    }
	}
	

