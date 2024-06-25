package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Users;
import com.example.model.Workers;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
	    PrintWriter pw = response.getWriter();

	    String userId = request.getParameter("userId");
	    //use model to insert
	    Users user = new Users();
	    user.setUserId(Integer.parseInt(userId));
	   // service.setServiceId(Integer.parseInt(serviceId));
	    boolean flag = user. deleteServiceById();
	    int n=0;
	    if (flag) {
	    	n=1;
	        
	        response.sendRedirect("/HandyHelpers/Admin/ViewCustomer.jsp");      // OR  response.sendRedirect("/Admin/addcategory.jsp?res="+n);
	    } else {
	       n=0;
	    }
	}

}	

	
