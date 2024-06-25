package com.example.controller.worker;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Workers;

import servletpack.Cryptography;

/**
 * Servlet implementation class WorkerLoginValidationServlet
 */
@WebServlet("/WorkerLoginValidationServlet")
public class WorkerLoginValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkerLoginValidationServlet() {
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
		
		Workers worker = new Workers();
		worker.setMobile(encodedMobile);
		worker.setPassword(encodedPassword);
		
		
		
		
		boolean flag = worker.validateLogin();
		if(flag==true) {//admin is exits
			HttpSession session=request.getSession();
			session.setAttribute("workerId", worker.getWorkerId());
			response.sendRedirect("./Worker/WorkerHome.jsp");
		}else {// admin doesn't exits
			response.sendRedirect("WorkerLogin.jsp?res=0");
		}
		out.close();
	}

}