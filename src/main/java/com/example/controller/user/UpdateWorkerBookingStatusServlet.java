package com.example.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.model.Bookings;


/**
 * Servlet implementation class UpdateWorkerBookingStatusServlet
 */
@WebServlet("/UpdateWorkerBookingStatusServlet")
public class UpdateWorkerBookingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerBookingStatusServlet() {
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
        
        String bookingId=request.getParameter("bookingId");
        String Status=request.getParameter("Status");
        
       
        
        System.out.println("bookingId="+bookingId);
        System.out.println("bookingStatus="+Status);
        
        Bookings borders =new Bookings();
        borders.setBookingId(Integer.parseInt(bookingId));
        borders.setStatus(Status);
        int n=borders.WorkerStatusUpdate(Integer.parseInt(bookingId), Status);
        
        //int m=Integer.parseInt(request.getParameter("n"));
        if(n==1) {//customer
        response.sendRedirect("/HandyHelpers/User/ViewBookings.jsp?res="+n);
        }
        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
