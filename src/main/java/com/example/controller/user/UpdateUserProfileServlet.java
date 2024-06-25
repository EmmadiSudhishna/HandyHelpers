package com.example.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Users;
import com.example.model.Workers;

import servletpack.Cryptography;

/**
 * Servlet implementation class UpdateUserProfileServlet
 */
@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfileServlet() {
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
		
		String userId = request.getParameter("userId");
		String fullName = request.getParameter("fullName");
		String registrationDate=request.getParameter("registrationDate");
		String mobile=request.getParameter("mobile");
		
		String password=request.getParameter("password");
		
		 String encodedMobile = Cryptography.encode(mobile);
	        String encodedPassword = Cryptography.encode(password);
	        
		
		System.out.println("userId="+userId);
		System.out.println("fullname="+fullName);
		System.out.println("registrationDate="+registrationDate);
		System.out.println("mobile="+mobile);
		System.out.println("password="+password);
		
		Users user=new Users();
		user.setUserId(Integer.parseInt(userId));
		user.setFullName(fullName);
		user.setRegistrationDate(registrationDate);
		user.setMobile(encodedMobile );
		user.setPassword(encodedPassword);
		
		
		//taking the method
		int n=	user.updateUserByUserId();
		System.out.println("n    ="+n);
		if(n==0) {//record added
			   response.sendRedirect("/HandyHelpers/User/ViewUserProfile.jsp?res=1");//?res=1 for added record for displaying the msg 
			                                                            //that displaying on add category.jsp
		   }else {//record not added
			   response.sendRedirect("/HandyHelpers/User/ViewUserProfile.jsp?res=0");
		   }
		   pw.close();
		
	///////response.sendRedirect("Customer/Profile.jsp?res="+n);

	}
		
}
		
