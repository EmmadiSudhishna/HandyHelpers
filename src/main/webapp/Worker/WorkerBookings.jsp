<%@page import="java.util.List"%>
<%@page import="com.example.model.Bookings"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>WorkerBookings</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="WorkerMenu.jsp"></jsp:include>


<style>
    .blue-marker {
        color: blue; /* Set the color to blue */
    }
</style>
</head>
<body>
<div class="container-fluid">
<%
Bookings bookings = new Bookings();
int workerId = (int) session.getAttribute("workerId");
List<Bookings> booking = bookings.getBookingsByWorkerId(workerId);
System.out.println("booking size = " + booking.size());
%>
<h2 class="text-center text-danger">
    <u>Worker Bookings</u>
</h2>
<div class="table-responsive">
    <table class="table table-bordered table-secondary table-hover" id="table_id">

        <thead class="table-dark">
            <tr class="text-center">
              <th>SINo</th>
                <th>BookingId</th>
                <th>BookingDate</th>
                <th>UserId</th>
                <th>WorkerId</th>
                <th>ServiceName</th>
                <th>WorkerLatitude</th>
                <th>WorkerLongitude</th>
                <th>Status</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody class="table table-primary">
         <% 
            int slno=0;
            for (Bookings bookingOb : booking) {
                slno++;
        %>
        <tr>
                <td><%=slno%></td>
                <td><%=bookingOb.getBookingId()%></td>
                <td><%=bookingOb.getBookingDate()%></td>
                <td><%=bookingOb.getUserId()%></td>
                 <td><%=bookingOb.getWorkerId()%></td>
                <td><%=bookingOb.getServiceName()%></td>
                <td><%=bookingOb.getWorkerLatitude()%></td>
                <td><%=bookingOb.getWorkerLongitude()%></td>
                <td><%=bookingOb.getStatus()%></td>
                  <td>
                    <a href="https://www.google.com/maps/search/?api=1&query=<%= bookingOb.getWorkerLatitude() %>,<%= bookingOb.getWorkerLongitude() %>" target="_blank">
                        <i class="fas fa-map-marker-alt"></i> <!-- Font Awesome map marker icon -->
                    </a>
                </td>
            </tr>
        <% } %>
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
