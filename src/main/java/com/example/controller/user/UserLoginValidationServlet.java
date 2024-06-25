package com.example.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Users;
import com.example.model.Workers;

import servletpack.Cryptography;

/**
 * Servlet implementation class UserLoginValidationServlet
 */
@WebServlet("/UserLoginValidationServlet")
public class UserLoginValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginValidationServlet() {
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
		PrintWriter out=response.getWriter();
		
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		 
		        String encodedMobile = Cryptography.encode(mobile);
		        String encodedPassword = Cryptography.encode(password);
		        
		        Users user = new Users();
		        user.setMobile(encodedMobile);
		        user.setPassword(encodedPassword);
		        
		        boolean flag = user.validateLogin();
		        if (flag) {
		        	HttpSession session=request.getSession();
					session.setAttribute("userId", user.getUserId());
		            // User exists, redirect to UserHome.jsp
		            response.sendRedirect("./User/UserHome.jsp");
		        } else {
		            // User doesn't exist, redirect to UserLogin.jsp with error message
		            response.sendRedirect("/HandyHelpers/UserLogin.jsp?res=0");
		        }
		    
		    out.close();
		}
}