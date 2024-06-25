package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.example.model.Services;

/**
 * Servlet implementation class UpdateServiceServlet
 */
@WebServlet("/UpdateServiceServlet")
public class UpdateServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServiceServlet() {
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
    	
        // Retrieve parameters from the view
        String serviceName = request.getParameter("serviceName");
        String serviceId = request.getParameter("serviceId");
        
        //use model to insert category
       Services service = new Services();
        service.setServiceName(serviceName);
        service.setServiceId(Integer.parseInt(serviceId));
        
        int n=service.UpdateServiceById();
        /*if(n==0) {
        	out.println("category not updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=0");
        }else {
        	out.println("category Updated");
        	response.sendRedirect("/EcommerceProject/admin/EditCategory.jsp?res=1");
        }*/
        response.sendRedirect("/HandyHelpers/Admin/ViewServices.jsp?res=" +n);
        out.close();

	}



	}


