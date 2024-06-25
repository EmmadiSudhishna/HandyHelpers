<%@page import="com.example.model.Bookings"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Ratings</title>
<jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="../Css/userHome.css">
    
    <style>
  .rating {
    unicode-bidi: bidi-override;
    direction: rtl;
    text-align: center;
  }
  .rating input {
    display: none;
  }
  .rating label {
    display: inline-block;
    padding: 5px;
    font-size: 24px;
    cursor: pointer;
  }
  .rating label:before {
    content: '\2605'; /* Unicode character for a star */
    color: #ccc;
  }
  .rating input:checked ~ label:before {
    color: #ffcc00; /* Color for filled stars */
  }
  .custom-card-width {
    max-width: 650px; /* Adjust the width as needed */
    margin: auto; /* Center the card horizontally */
}
</style>      
</head>
<body>
 <jsp:include page="UserMenu.jsp"></jsp:include>
 <% 
  String bookingId= request.getParameter("bookingId");
 Bookings booking= new Bookings();
 booking = booking.getBookingById(Integer.parseInt(bookingId));
	System.out.println("bookingId= "+booking.getWorkerId());
	
	Workers worker = new Workers(); // Initialize Workers object
	 worker.setWorkerId(booking.getWorkerId()); // Set worker ID
	 worker = worker.getWorkerById(); // Retrieve worker details
 %>

<div class="container mt-5">
    <div class="card custom-card-width">
        <form action="/HandyHelpers/AddRatingServlet" method="post">
            <h2 class="card-header text-center" style="background: linear-gradient(to right, #8a4fff, #ec87f8); color: white;">
                <i class="fas fa-thumbs-up"></i> Rate Your Experience
            </h2>
            <div class="card-body" style="background: linear-gradient(to right, #ff7e5f, #feb47b);">
                <div class="row">
                    <div class="col-md-3 text-center">
                        <img src="../uploads/<%=worker.getWorkerPic()%>" class="rounded-circle" style="width: 150px; height: 150px; object-fit: cover;" alt="Worker Image">
                    </div>
                    <div class="col-md-9">
                        <input type="hidden" name="workerId" value="<%=booking.getWorkerId() %>">
                        <div class="form-group">
                            <label for="serviceName" class="fw-bold">Service Name:</label>
                            <span><%=booking.getServiceName() %></span>
                        </div>
                        <div class="form-group">
                        <input type="hidden" name="serviceName" value="<%=booking.getServiceName() %>">
                        
                            <label for="workerId" class="fw-bold">Worker ID:</label>
                            <span><%=booking.getWorkerId() %></span>
                        </div>
                        <div class="form-group">
                            <label for="rating" class="fw-bold">Rate Your Experience:</label>
                            <div class="rating">
                                <input type="radio" id="star5" name="rating" value="5">
                                <label for="star5"></label>
                                <input type="radio" id="star4" name="rating" value="4">
                                <label for="star4"></label>
                                <input type="radio" id="star3" name="rating" value="3">
                                <label for="star3"></label>
                                <input type="radio" id="star2" name="rating" value="2">
                                <label for="star2"></label>
                                <input type="radio" id="star1" name="rating" value="1">
                                <label for="star1"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comments" class="fw-bold">Comments:</label>
                            <textarea class="form-control" rows="3" placeholder="Write a Review" name="comments"></textarea>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-3">
    <input type="submit" class="btn btn-primary" value="Submit Rating">
</div>

            </div>
        </form>
    </div>
</div>

<script>
  // Add event listener to each star rating input
  const starInputs = document.querySelectorAll('.rating input');
  starInputs.forEach(input => {
    input.addEventListener('click', () => {
      // Get the selected rating value
      const ratingValue = input.value;
      console.log('Selected rating:', ratingValue);
      // You can perform additional actions here, such as sending the rating to a server
    });
  });
</script>

</body>
</html>