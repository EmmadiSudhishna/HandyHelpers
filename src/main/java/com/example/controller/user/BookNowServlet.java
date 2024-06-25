package com.example.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.model.Bookings;
import com.example.model.Workers;

/**
 * Servlet implementation class BookNowServlet
 */
@WebServlet("/BookNowServlet")
public class BookNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookNowServlet() {
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
		
		String workerId=request.getParameter("workerId");
	    System.out.println("workerId="+workerId);
	    
	    
	    String serviceName=request.getParameter("serviceName");
	    System.out.println("serviceName="+serviceName);
	    
	    String workerLatitude=request.getParameter("workerLatitude");
	    System.out.println("Latitude="+workerLatitude);
	    
	    String workerLongitude=request.getParameter("workerLongitude");
	    System.out.println("Longitude="+workerLongitude);
	    
	    String status=request.getParameter("status");
	    System.out.println("status");

	    Calendar calendar = Calendar.getInstance();
	    String bookingDate = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
	            + calendar.get(Calendar.DAY_OF_MONTH);
	    
	   HttpSession session=request.getSession();
	    int userId=(Integer) session.getAttribute("userId");
	    System.out.println("User id="+userId);
	    
	    Bookings booking=new Bookings();
	    booking.setBookingDate(bookingDate);
	    booking.setUserId(userId);
	    booking.setWorkerId(Integer.parseInt(workerId));
	    booking.setServiceName(serviceName); // Set the serviceName
	    booking.setWorkerLatitude(workerLatitude); // Set the workerLatitude
	    booking.setWorkerLongitude(workerLongitude);
	    booking.setStatus(status);
	    
	    int n=booking.addBookings();
	    response.sendRedirect("/HandyHelpers/User/UserHome.jsp?res="+n);
	    pw.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
