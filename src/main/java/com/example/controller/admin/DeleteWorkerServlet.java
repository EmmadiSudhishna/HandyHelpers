package com.example.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Services;
import com.example.model.Workers;

/**
 * Servlet implementation class DeleteWorkerServlet
 */
@WebServlet("/DeleteWorkerServlet")
public class DeleteWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWorkerServlet() {
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

	    String workerId = request.getParameter("workerId");
	    //use model to insert
	    Workers worker = new Workers();
	    worker.setWorkerId(Integer.parseInt(workerId));
	   // service.setServiceId(Integer.parseInt(serviceId));
	    boolean flag = worker. deleteServiceById();
	    int n=0;
	    if (flag) {
	    	n=1;
	        
	        response.sendRedirect("/HandyHelpers/Worker/ViewWorkers.jsp");      // OR  response.sendRedirect("/Admin/addcategory.jsp?res="+n);
	    } else {
	       n=0;
	    }
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
