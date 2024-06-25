<%@page import="com.example.model.Reviews"%>
<%@page import="com.example.model.Bookings"%>
<%@page import="com.example.model.Workers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Bookings</title>
    <jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="../Css/userHome.css">
    <script>
        function confirmDelete(bookingId) {
            let ans = confirm("Want to Cancel this booking?");
            if (ans) {
                window.location = "/HandyHelpers/UpdateWorkerBookingStatusServlet?bookingId=" + bookingId + "&Status=Cancelled";
            }
        }

        function redirectToRating(bookingId) {
            let ans = confirm("Do you want to rate this service?");
            if (ans) {
                window.location = "/HandyHelpers/User/Ratings.jsp?bookingId=" + bookingId;
            }
        }
    </script>
    <style>
       body{
    background-image=none;
    }
    </style>
</head>
<body>
    
    <jsp:include page="UserMenu.jsp"></jsp:include>

    <%
        Bookings bookings = new Bookings();
        int userId = (int) session.getAttribute("userId");
        List<Bookings> bookingsList = bookings.getAllBookingsByUserId(userId);
        System.out.println("bookingsList size = " + bookingsList.size());
    %>
    
    
    <%
        String res = request.getParameter("res");
        if (res != null) {
            if (res.equals("1")) {
        %>
        <div class="alert alert-success alert-dismissible fade show">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Success!</strong> Service Cancelled.
        </div>
        <%
            } else if (res.equals("0")) {
        %>
        <div class="alert alert-danger alert-dismissible fade show">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Yup!</strong> Service not Cancelled.
        </div>
        <%
            }
        }
    %>
	<div class="container">
    <h2 class="text-center"><u>View User Bookings</u></h2><br/>
    <div class="table-responsive">
        <table class="table table-striped table-info table-hover" id="table_id">
            <thead class="table-dark">
                <tr class="text-center">
                    <th>Slno</th>
                    <th>Booking Id</th>
                    <th>Booking Date</th>
                    <th>UserId</th>
                    <th>Worker Id</th>
                    <th>Worker Pic</th>
                    <th>Service Name</th>
                    <th>Status</th>
                    <th>Operation</th>
                    <th>Operation</th>
                    <!--  <th>Location</th>-->
                </tr>
            </thead>
            <tbody>
                <%
                    int slno = 0;
                    for (Bookings bookingOb : bookingsList) {
                        slno++;
                        Workers workers = new Workers(); // Initialize Workers object inside the loop
                        workers.setWorkerId(bookingOb.getWorkerId()); // Set worker ID
                        Workers workerOb = workers.getWorkerById(); // Retrieve worker details
                %>
                <tr>
                    <td><%=slno%></td>
                    <td><%=bookingOb.getBookingId()%></td>
                    <td><%=bookingOb.getBookingDate()%></td>
                    <td><%=bookingOb.getUserId()%></td>
                    <td><%=bookingOb.getWorkerId()%></td>
                    <td><img src="../uploads/<%=workerOb.getWorkerPic()%>" class="rounded-circle" style="width: 100px; height: 100px; object-fit: contain;"></td>
                    <td><%=bookingOb.getServiceName()%></td>
                    <td><%=bookingOb.getStatus()%></td>
                    <td>
                        <%
                            if (bookingOb.getStatus().equalsIgnoreCase("active")) {
                        %>
                            <input type="button" class="btn btn-sm btn-warning" value="Cancel" onclick="confirmDelete('<%=bookingOb.getBookingId()%>')">
                        <%
                            }
                        %>
                    </td>
                     <td>
                     
                       <%
                     	Reviews rating=new Reviews();
                     boolean found=rating.isRatingGiven((int) session.getAttribute("userId"),bookingOb.getWorkerId());
                     if(found==false){
                    	 
                     
                     %>
                        <input type="button" class="btn btn-sm btn-success" value="Rating" onclick="redirectToRating('<%=bookingOb.getBookingId()%>')">
                        <%
                     }
                    %>
                    </td>
                    <!--   <td>
    <a href="https://www.google.com/maps/search/?api=1&query=<%= bookingOb.getWorkerLatitude() %>,<%= bookingOb.getWorkerLongitude() %>" target="_blank">
        <i class="fas fa-map-marker-alt"></i>
    </a>
</td>-->

                    
                </tr>
                <%
                    }
                %>
                
            </tbody>
        </table>
    </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#table_id').DataTable();
            $('#success_id').slideUp(3000);
        });
    </script>
</body>
</html>
