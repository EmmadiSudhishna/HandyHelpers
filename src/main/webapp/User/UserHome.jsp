<%@page import="java.util.ArrayList"%>
<%@page import="servletpack.Cryptography"%>
<%@page import="com.example.controller.worker.WorkerLoginValidationServlet"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@page import="com.example.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>User Menu</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../Css/userHome.css">
<script>
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    document.getElementById("latitude").value = latitude;
    document.getElementById("longitude").value = longitude;
}

function bookService(workerId, serviceName, status) {
    var latitude = document.getElementById("latitude").value;
    var longitude = document.getElementById("longitude").value;
    window.location = "/HandyHelpers/BookNowServlet?workerId=" + workerId + "&serviceName=" + serviceName + "&workerLatitude=" + latitude + "&workerLongitude=" + longitude +"&status=" +status;
}

// Call getLocation() when the page loads
window.onload = function() {
    alert("The website wants to allow your location to book the services and get work done!!.");
    getLocation();
};
</script>
</head>
<body>
<jsp:include page="UserMenu.jsp"></jsp:include>
<br/>
<div>
    <label for="latitude" class="fw-bold"></label>
    <input type="hidden" id="latitude" name="latitude" style="width: 100px;" readonly>
</div>&nbsp;&nbsp;
<div>
    <label for="longitude" class="fw-bold"></label>
    <input type="hidden" id="longitude" name="longitude" style="width: 100px;" readonly>
</div>

<div class="container mt-2">
    <h3 class="text-center" style="background: linear-gradient(to right, #d9b3ff, #33ccff); color: #000000;">Available Workers</h3>

    <div class="row">
        <% 
        Workers worker = new Workers();
        List<Workers> workerList = new ArrayList<Workers>();
        String search = request.getParameter("search");
        if (search == null) {
            // without search
            workerList = worker.getAllWorkers(null);
            System.out.println("workerList");
        } else {
            // with search
            System.out.print("search:" + search);
            workerList = worker.getAllWorkers(search);
        }
        for (Workers workerOb : workerList) {
        %>
        <div class="col-sm-4 mt-2">
            <div class="card" style="height: 89%; display: flex; flex-direction: column;background: linear-gradient(to bottom, #d3c8ff, #e0d1ff);">
                <img src="../uploads/<%= workerOb.getWorkerPic() %>"
                     class="img-centered mx-auto d-block" alt="Worker Image"
                     style="width: 150px; height: 200px; object-fit: contain;">
                <div class="card-body" style="flex-grow: 1;">
                    <h3 class="card-title"
                        style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin-bottom: 0;"><%= workerOb.getServiceName() %></h3>
                    <p class='card-text' style="margin-top: 0.5em; margin-bottom: 0.5em; overflow: hidden; text-overflow: ellipsis;"><strong>Worker ID:</strong> <%= workerOb.getWorkerId() %></p>
                    <p class='card-text' style="margin-top: 0.5em; margin-bottom: 0.5em; overflow: hidden; text-overflow: ellipsis;"><strong>Name:</strong> <%= workerOb.getFullName() %></p>
                    <p class='card-text' style="margin-top: 0.5em; margin-bottom: 0.5em; overflow: hidden; text-overflow: ellipsis;"><strong>Mobile:</strong> <%= Cryptography.decode(workerOb.getMobile()) %></p>
                    <p class='card-text' style="margin-top: 0.5em; margin-bottom: 0.5em; overflow: hidden; text-overflow: ellipsis;"><strong>Address:</strong> <%= workerOb.getCurrentAddress() %></p>
                    <p class='card-text' style="margin-top: 0.5em; margin-bottom: 0.5em; overflow: hidden; text-overflow: ellipsis;"><strong>Cities:</strong> <%= workerOb.getCities() %></p>
                    <p class='card-text' style="margin-top: 0.5em; margin-bottom: 0.5em; overflow: hidden; text-overflow: ellipsis;"><strong>Status:</strong> <%= workerOb.getStatus() %></p>
                    <div class="text-center mt-auto"> 
   <a onclick="bookService('<%= workerOb.getWorkerId() %>', '<%= workerOb.getServiceName() %>', '<%= workerOb.getStatus() %>')" id="bookNowIcon"><i class="fas fa-calendar-check fa-2x" style="color: black;"></i></a>

</div>

                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
