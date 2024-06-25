<%@page import="servletpack.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
    <jsp:include page="WorkerMenu.jsp"></jsp:include> 
   <link rel="stylesheet" type="text/css" href="../Css/workerProfile.css"> 
    


   
</head>
<body>
    <div class="container";>
        <% 
            Workers worker = new Workers();
            List<Workers> workerList = worker.getWorkerById((int) session.getAttribute("workerId"));
            for (Workers workerObj : workerList) {
        %>
        <div class="card w-75">
            <div class="header-section">
                <h2 class="card-title">Worker Profile</h2>
                <div class="profile-container">
                    <div class="profile-image-container">
                        <img src='../uploads/<%=workerObj.getWorkerPic()%>' alt="Profile Picture">
                    </div>
                     
                </div><a
							href='/HandyHelpers/Worker/WorkerProfilePicEdit.jsp?tableName=workers&setColName=workerPic&whereColName=workerId&conditionValue=<%=workerObj.getWorkerId()%>&colName=workerPic'>
							<i class="fas fa-edit edit-icon"></i>
						</a>
            </div>
            <div class="body-section">
                <div class="row">
                    <div class="col-md-6">
                        <h6 class="fw-bold">Worker ID</h6>
                        <p><%=workerObj.getWorkerId()%></p>
                    </div>
                    <div class="col-md-6">
                        <h6 class="fw-bold">Full Name</h6>
                        <p><%=workerObj.getFullName()%></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h6 class="fw-bold">Service Name</h6>
                        <p><%=workerObj.getServiceName()%></p>
                    </div>
                    <div class="col-md-6">
                        <h6 class="fw-bold">Mobile Number</h6>
                        <p><%=Cryptography.decode(workerObj.getMobile())%></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h6 class="fw-bold">Current Address</h6>
                        <p><%=workerObj.getCurrentAddress()%></p>
                    </div>
                    <div class="col-md-6">
                        <h6 class="fw-bold">Cities</h6>
                        <p><%=workerObj.getCities()%></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h6 class="fw-bold">Password</h6>
                        <p><%=Cryptography.decode(workerObj.getPassword())%></p>
                    </div>
                    
                </div>
                <div class="text-center">
                   <a href="/HandyHelpers/Worker/EditWorkerProfile.jsp?workerId=<%=workerObj.getWorkerId()%>">
										<button type="submit" class="btn btn-info">Edit</button>
									</a>
                </div>
            </div>
        </div>
        <% 
            } 
        %>
    </div>
</body>
</html>