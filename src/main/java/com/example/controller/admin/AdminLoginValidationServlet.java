package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Admin;

import servletpack.Cryptography;

/**
 * Servlet implementation class AdminLoginValidationServlet
 */
@WebServlet("/AdminLoginValidationServlet")
public class AdminLoginValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidationServlet() {
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
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		
		
		Admin admin=new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		
		boolean flag=admin.validateAdminLogin();
		if(flag==true) {
			HttpSession session=request.getSession();
			response.sendRedirect("/HandyHelpers/Admin/AdminHome.jsp");
			
		}else {
			response.sendRedirect("AdminLogin.jsp?res=0");
		}
			//out.println("<script language='javascript'>alert('Invalid user');window.location='AdminLogin.jsp?res=0';</script>");
			out.close();
		}
		
	}


