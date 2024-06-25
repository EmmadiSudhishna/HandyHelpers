package com.example.controller.worker;

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
 * Servlet implementation class UpdateWorkerProfileServlet
 */
@WebServlet("/UpdateWorkerProfileServlet")
public class UpdateWorkerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerProfileServlet() {
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
		
		String workerId = request.getParameter("workerId");
		String fullName = request.getParameter("fullName");
		String serviceName=request.getParameter("serviceName");
		String mobile=request.getParameter("mobile");
		String currentAddress=request.getParameter("currentAddress");
		String cities=request.getParameter("cities");
		String password=request.getParameter("password");
		//String status=request.getParameter("status");
		
		 String encodedMobile = Cryptography.encode(mobile);
	        String encodedPassword = Cryptography.encode(password);
	        
		
		
		System.out.println("fullname="+fullName);
		System.out.println("servicename="+serviceName);
		System.out.println("mobile="+mobile);
		System.out.println("currentAddress="+currentAddress);
		System.out.println("cities="+cities);
		System.out.println("password="+password);
		//System.out.println("status="+status);
		
		
		
		Workers worker=new Workers();
		worker.setWorkerId(Integer.parseInt(workerId));
		worker.setFullName(fullName);
		worker.setServiceName(serviceName);
		worker.setMobile(encodedMobile);
		worker.setCurrentAddress(currentAddress);
		worker.setCities(cities);
		worker.setPassword(encodedPassword);
		//worker.setStatus(status);
		
		//taking the method
		int n=	worker.updateWorkerByWorkerId();
		System.out.println("n    ="+n);
		if(n==0) {//record added
			   response.sendRedirect("/HandyHelpers/Worker/Profile.jsp?res=1");//?res=1 for added record for displaying the msg 
			                                                            //that displaying on add category.jsp
		   }else {//record not added
			   response.sendRedirect("/HandyHelpers/Worker/Profile.jsp?res=0");
		   }
		   pw.close();
		
	///////response.sendRedirect("Customer/Profile.jsp?res="+n);

	}
		
}