package com.example.controller.worker;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Workers;

/**
 * Servlet implementation class UpdateWorkerStatus
 */
@WebServlet("/UpdateWorkerStatus")
public class UpdateWorkerStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String workerId = request.getParameter("workerId");
		String status = request.getParameter("status");
	   
		//use model to insert
		Workers worker = new Workers();
		worker.setWorkerId(Integer.parseInt(workerId));
		if(status.equalsIgnoreCase("Inactive")) {
		worker.setStatus("Inactive");
		}else {
			worker.setStatus("Active");
		}
		
		int n = worker.statusUpdate();
		
		response.sendRedirect("/HandyHelpers/Admin/ViewWorkers.jsp");
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
